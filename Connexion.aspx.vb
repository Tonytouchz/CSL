Imports Model

Partial Class Connexion
    Inherits System.Web.UI.Page

    Private Shared leContexte As ModelContainer1 = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        leContexte = New ModelContainer1()

        If Session("nomUtilisateur") IsNot Nothing Then
            Response.Redirect("Historique.aspx", True)
        End If

    End Sub

    Protected Sub btnConnecter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConnecter.Click

        Dim verifierUser = From Model In leContexte.dossiers Where Model.username = txtLogin.Text And txtMotPasse.Text = Model.password

        If verifierUser.Count = 0 Then



        Else

            Dim utilisateur = (From Model In leContexte.dossiers Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.username).First
            Dim leTypeUtilisateur = (From Model In leContexte.dossiers Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.typeUtilisateur).First
            Dim noClientDossier = (From Model In leContexte.dossiers Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.noDossier).First
            Session("nomUtilisateur") = utilisateur
            Session("typeUtilisateur") = leTypeUtilisateur
            Session("noDossier") = noClientDossier

            Response.Redirect("Historique.aspx", True)

        End If
    End Sub

End Class
