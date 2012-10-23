Imports System.IO
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.Control
Imports System.Configuration
Imports Model
Imports System.Security.Principal
Imports System.Security.Cryptography
Imports System.Text
Imports System.Object
Imports System.Web
Imports System.Web.Security

Partial Class CreerDossier
    Inherits System.Web.UI.Page

    Protected Shared leContexte As ModelContainer1 = New ModelContainer1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub dsDossier_ContextCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) Handles dsDossier.ContextCreating

        If Not leContexte Is Nothing Then
            e.Context = leContexte
        End If

    End Sub

    Protected Sub dsDossier_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) Handles dsDossier.ContextDisposing

        e.Cancel = True

    End Sub

    Protected Sub dsDossier_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsDossier.Inserted

        If e.Exception IsNot Nothing Then
            Session("quoiErreur") = sender.name & ".Selected"
            Session("erreur") = e.Exception
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), "ERREUR " & Now.ToLongDateString & ControlChars.CrLf)
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), e.Exception.ToString() & ControlChars.CrLf & ControlChars.CrLf)
            Response.Redirect("erreur.aspx", True)

            e.ExceptionHandled = True

        Else

            Dim nom As String = FindChildControl(Of TextBox)(lvDossier, "txtNom").Text
            Dim prenom As String = FindChildControl(Of TextBox)(lvDossier, "txtPrenom").Text
            Dim dateNaissance As String = FindChildControl(Of TextBox)(lvDossier, "txtDateNaissance").Text
            Dim username As String = FindChildControl(Of TextBox)(lvDossier, "txtNomUtilisateur").Text

            Dim leDossier As dossiers = (From d In leContexte.dossiers
                                  Where d.username = username
                                  Select d).First

            Dim newClient = New clients With {.nom = nom, .prenom = prenom, .dateNaissance = dateNaissance, .noDossier = leDossier.noDossier}
            newClient.dossiers = leDossier

            leContexte.AddObject("clients", newClient)
            leContexte.SaveChanges()

            Response.Redirect("CreerDossierSucces.aspx", True)

        End If

    End Sub

    Sub chercherUsername(ByVal sender As Object, ByVal args As ServerValidateEventArgs)

        Dim txtUsername As String = FindChildControl(Of TextBox)(lvDossier, "txtNomUtilisateur").Text
        Dim varUsername As String = ""

        Try

            varUsername = (From d In leContexte.dossiers Where d.username = txtUsername Select d.username).First

        Catch

        End Try

        If varUsername = "" Then

            args.IsValid = True

        Else

            args.IsValid = False

        End If

    End Sub

    Sub chercherEmail(ByVal sender As Object, ByVal args As ServerValidateEventArgs)

        Dim txtEmail As String = FindChildControl(Of TextBox)(lvDossier, "txtEmail").Text
        Dim varEmail As String = ""

        Try

            varEmail = (From d In leContexte.dossiers Where d.email = txtEmail Select d.email).First

        Catch

        End Try

        If varEmail = "" Then

            args.IsValid = True

        Else

            args.IsValid = False

        End If

    End Sub

    Function CreatePasswordHash() As String

        Dim salt As String = "E01BF48LA0W3"
        Dim motPasse As String = FindChildControl(Of TextBox)(lvDossier, "txtMotPasse").Text
        Dim saltAndPwd As String = String.Concat(motPasse, salt)
        Dim hashedPwd As String = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "sha1")

        Return hashedPwd

    End Function

    Public Shared Function FindChildControl(Of T As Control)(ByVal startingControl As Control, ByVal id As String) As T
        Dim found As T = Nothing
        For Each activeControl As Control In startingControl.Controls
            found = TryCast(activeControl, T)
            If found Is Nothing OrElse (String.Compare(id, found.ID, True) <> 0) Then
                found = FindChildControl(Of T)(activeControl, id)
            End If
            If found IsNot Nothing Then
                Exit For
            End If
        Next
        Return found
    End Function

    

End Class
