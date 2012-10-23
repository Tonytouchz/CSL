Imports Model


Partial Class OublierMotPasse
    Inherits System.Web.UI.Page


    Private Shared leContexte As ModelContainer1 = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        leContexte = New ModelContainer1()

    End Sub

    Protected Sub btnEnvoyer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnvoyer.Click

        Try

            Dim emailUtilisateur As String = (From Model In leContexte.dossiers Where (Model.username = txtUtilisateur.Text) Select Model.email).First
            Dim motPasseOublie As String = (From Model In leContexte.dossiers Where (Model.username = txtUtilisateur.Text) Select Model.password).First
            Dim leUsername As String = (From Model In leContexte.dossiers Where (Model.username = txtUtilisateur.Text) Select Model.username).First

        Dim toqui As String = emailUtilisateur

        Dim mail As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
        mail.To.Add(toqui)
        mail.From = New System.Net.Mail.MailAddress("donotreply.csl@gmail.com", "CSL inc. Votre mot de passe", System.Text.Encoding.UTF8)
        mail.Subject = "CSL inc. Votre mot de passe"
        mail.SubjectEncoding = System.Text.Encoding.UTF8
        mail.Body = "Bonjour, votre mot de passe est: " + motPasseOublie + " et votre nom d'utilisateur est " + leUsername
        mail.BodyEncoding = System.Text.Encoding.UTF8
        mail.IsBodyHtml = True
        mail.Priority = System.Net.Mail.MailPriority.High
        Dim client As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient()

        client.Credentials = New System.Net.NetworkCredential("donotreply.csl@gmail.com", "133743v3r")

        client.Port = 587 ' Gmail port
        client.Host = "smtp.gmail.com"
            client.EnableSsl = True 'Gmail Secured Layer 
            client.Send(mail)

        Catch

        End Try
    End Sub

    Protected Sub btnEnvoyerEmail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnvoyerEmail.Click

        Try

            Dim emailUtilisateur As String = (From Model In leContexte.dossiers Where (Model.email = txtEmail.Text) Select Model.email).First
            Dim motPasseOublie As String = (From Model In leContexte.dossiers Where (Model.email = txtEmail.Text) Select Model.password).First
            Dim leUsername As String = (From Model In leContexte.dossiers Where (Model.email = txtEmail.Text) Select Model.username).First



            Dim toqui As String = emailUtilisateur

            Dim mail As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
            mail.To.Add(toqui)
            mail.From = New System.Net.Mail.MailAddress("donotreply.csl@gmail.com", "CSL inc. Votre mot de passe", System.Text.Encoding.UTF8)
            mail.Subject = "CSL inc. Votre mot de passe"
            mail.SubjectEncoding = System.Text.Encoding.UTF8
            mail.Body = "Bonjour, votre mot de passe est: " + motPasseOublie + " et votre nom d'utilisateur est " + leUsername
            mail.BodyEncoding = System.Text.Encoding.UTF8
            mail.IsBodyHtml = True
            mail.Priority = System.Net.Mail.MailPriority.High
            Dim client As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient()

            client.Credentials = New System.Net.NetworkCredential("donotreply.csl@gmail.com", "133743v3r")

            client.Port = 587 ' Gmail port
            client.Host = "smtp.gmail.com"
            client.EnableSsl = True 'Gmail Secured Layer

            client.Send(mail)

        Catch

        End Try

    End Sub
End Class
