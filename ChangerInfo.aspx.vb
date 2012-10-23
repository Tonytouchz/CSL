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

        leContexte = New ModelContainer1()

        hiddenFieldnoDossier.Value = Session("noDossier")
        FindChildControl(Of HiddenField)(lvClient, "hiddenFieldnoDossierClient").Value = Session("noDossier")

        If hiddenFieldnoDossier.Value = "" Then

            Response.Redirect("Connexion.aspx")

        End If

    End Sub

    Protected Sub dsClient_ContextCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) Handles dsClient.ContextCreating

        If Not leContexte Is Nothing Then

            e.Context = leContexte

        End If

    End Sub

    Protected Sub dsClient_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) Handles dsClient.ContextDisposing

        e.Cancel = True

    End Sub

    Protected Sub dsClient_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsClient.Inserted

        If e.Exception IsNot Nothing Then
            Session("quoiErreur") = sender.name & ".Selected"
            Session("erreur") = e.Exception
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), "ERREUR " & Now.ToLongDateString & ControlChars.CrLf)
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), e.Exception.ToString() & ControlChars.CrLf & ControlChars.CrLf)
            Response.Redirect("erreur.aspx", True)

            e.ExceptionHandled = True

        End If


    End Sub

    Protected Sub dsDossier_ContextCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) Handles dsDossier.ContextCreating

        If Not leContexte Is Nothing Then

            e.Context = leContexte

        End If

    End Sub

    Protected Sub dsDossier_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) Handles dsDossier.ContextDisposing

        e.Cancel = True

    End Sub

    Sub chercherUsername(ByVal sender As Object, ByVal args As ServerValidateEventArgs)

        Dim txtUsername As String = FindChildControl(Of TextBox)(lvDossier, "txtNomUtilisateur").Text
        Dim varUsername As String = ""

        Try

            varUsername = (From d In leContexte.dossiers Where d.username = txtUsername Select d.username).First

        Catch

        End Try

        If varUsername = "" Or varUsername = txtUsername Then

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

        If varEmail = "" Or varEmail = txtEmail Then

            args.IsValid = True

        Else

            args.IsValid = False

        End If

    End Sub

    Protected Sub comparerPassword(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvDossier.ItemCommand

        If e.CommandSource.id = "btnSauvegardeInfoDossier" Then

            Dim valPassword As String = FindChildControl(Of TextBox)(lvDossier, "txtMotPasse").Text


            If valPassword <> "" Then

                FindChildControl(Of HiddenField)(lvDossier, "hiddenFieldPassword").Value = valPassword

            End If

        End If

    End Sub

    Protected Sub btnInfoDossier_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInfoDossier.Click

        mltClientDossier.ActiveViewIndex = 1

    End Sub

    Protected Sub btnInfoClient_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInfoClient.Click

        mltClientDossier.ActiveViewIndex = 0

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
End Class
