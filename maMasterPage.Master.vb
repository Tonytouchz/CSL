Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.UI.Control
Imports System.Configuration
Imports Model

Partial Class maMasterPage
    Inherits System.Web.UI.MasterPage

    Private Shared leContexte As ModelContainer1 = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        leContexte = New ModelContainer1()

        If Session("nomUtilisateur") IsNot Nothing Then
            MultiViewConnection.ActiveViewIndex = 1
            lblUtilisateur.Text = Session("nomUtilisateur")
        End If

    End Sub

    Protected Sub btnConnecter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConnecter.Click
        Dim verifierUser = From Model In leContexte.dossiers Where Model.username = txtLogin.Text And txtMotPasse.Text = Model.password

        If verifierUser.Count = 0 Then

            Response.Redirect("Connexion.aspx", True)

        Else

            Dim utilisateur = (From Model In leContexte.dossiers Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.username).First
            Dim leTypeUtilisateur = (From Model In leContexte.dossiers Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.typeUtilisateur).First
            Dim noDossierClient = (From Model In leContexte.dossiers Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.noDossier).First
            Session("nomUtilisateur") = utilisateur
            Session("noDossier") = noDossierClient

            MultiViewConnection.ActiveViewIndex = 1
            lblUtilisateur.Text = utilisateur


            Response.Redirect("Historique.aspx", True)

        End If

    End Sub

    Protected Sub lnkDeconnecter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDeconnecter.Click

        Response.Cookies("nomUtilisateur").Value = Nothing
        Response.Cookies("typeUtilisateur").Value = Nothing
        Session("nomUtilisateur") = Nothing
        Session("typeUtilisateur") = Nothing
        MultiViewConnection.ActiveViewIndex = 0
        Response.Redirect("Historique.aspx")

    End Sub

End Class

