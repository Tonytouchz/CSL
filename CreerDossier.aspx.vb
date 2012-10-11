Imports System.IO
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.Control
Imports System.Configuration
Imports Model

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

            Response.Redirect("CreerDossierSucces.aspx", True)

        End If

    End Sub

    Protected Sub lvDossier_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvDossier.ItemCommand

        If e.CommandSource.id = "btnInsertCompte" Then

            Dim nom As String = FindChildControl(Of TextBox)(lvDossier, "txtNom").Text
            Dim prenom As String = FindChildControl(Of TextBox)(lvDossier, "txtPrenom").Text
            Dim dateNaissance As String = FindChildControl(Of TextBox)(lvDossier, "txtDateNaissance").Text

            Dim adresse As String = FindChildControl(Of TextBox)(lvDossier, "txtAdresse").Text
            Dim ville As String = FindChildControl(Of TextBox)(lvDossier, "txtVille").Text
            Dim codePostal As String = FindChildControl(Of TextBox)(lvDossier, "txtCodePostal").Text
            Dim province As String = FindChildControl(Of DropDownList)(lvDossier, "ddlProvince").SelectedValue
            Dim noTelephone As String = FindChildControl(Of TextBox)(lvDossier, "txtNoTelephone").Text
            Dim email As String = FindChildControl(Of TextBox)(lvDossier, "txtEmail").Text
            Dim nomUtilisateur As String = FindChildControl(Of TextBox)(lvDossier, "txtNomUtilisateur").Text
            Dim motPasse As String = FindChildControl(Of TextBox)(lvDossier, "txtMotPasse").Text
            Dim typeUtilisateur As String = FindChildControl(Of DropDownList)(lvDossier, "ddlTypeUtilisateur").SelectedValue

            Dim newDossier = New dossiers With {.adresse = adresse, .ville = ville, .codePostal = codePostal, .province = province,
                                                .noTelephone = noTelephone, .email = email, .username = nomUtilisateur, .password = motPasse,
            .typeUtilisateur = typeUtilisateur}

            leContexte.AddObject("dossiersJeu", newDossier)

            Dim newClient = New clients With {.nom = nom, .prenom = prenom, .dateNaissance = dateNaissance, .noDossier = newDossier.noDossier}
            newClient.dossiers = newDossier

            leContexte.AddObject("clientsJeu", newClient)
            leContexte.SaveChanges()

        End If

    End Sub

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

    Public Shared Function CreatePasswordHash(ByVal pwd As String, ByVal salt As String) As String
        Dim saltAndPwd As String = String.Concat(pwd, salt)
        Dim hashedPwd As String = FormsAuthentication.HashPasswordForStoringInConfigFile(saltAndPwd, "sha1")
        Return hashedPwd
    End Function

End Class
