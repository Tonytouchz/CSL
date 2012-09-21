
Partial Class maMasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub btnConnecter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConnecter.Click

        If Membership.ValidateUser(txtLogin.Text, txtMotPasse.Text) Then

            FormsAuthentication.SetAuthCookie(txtLogin.Text, True)

        End If

    End Sub
End Class

