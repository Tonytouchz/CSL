Imports Model

Partial Class AjouterActivite
    'Inherits ClasseContext
    Inherits System.Web.UI.Page
    Protected Shared leContexte As New ModelContainer1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        mvActivite.ActiveViewIndex = 0
        leContexte = New ModelContainer1()
        If Page.IsPostBack Then
            mvActivite.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub btnEnregistrer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnregistrer.Click

        Dim strNomActivite As String = txtNomActivite.Text
        Dim strMatRequis As String = txtMatRequis.Text
        Dim strPrealable As String = txtPrealable.Text
        'Dim strPrealableDDL As String = ddlPrealable.SelectedValue
        Dim strTypeActivite As String = ddlTypeActivite.SelectedValue
        Dim strClientele As String = ddlClientele.SelectedValue

        'If chkAutre.Checked = True Then

        
        'End If

        Dim activiteAjout = New activites With {.typeActivite = strTypeActivite, .clientele = strClientele,
                                                             .nomActivite = strNomActivite}
        leContexte.AddObject("activitesJeu", activiteAjout)

        'Dim prealableAjout As prealables = New prealables With {.description = strPrealable}

        'prealableAjout.activites = activiteAjout

        'leContexte.AddObject("prealablesJeu", prealableAjout)
        Try
            leContexte.SaveChanges()
        Catch
            lblSucces.Text = "Le cours n'a pas été ajouté"
            lblSucces.Visible = True
        End Try

        lblSucces.Visible = True



    End Sub

    Protected Sub btnChoixAjout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChoixAjout.Click
        mvActivite.ActiveViewIndex = 1
    End Sub

    Protected Sub btnChoixSupprimer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChoixSupprimer.Click
        mvActivite.ActiveViewIndex = 2
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        txtNomActivite.Text = ""
        txtMatRequis.Text = ""
        txtPrealable.Text = ""
        ddlTypeActivite.SelectedIndex = 0
        ddlClientele.SelectedIndex = 0
    End Sub
End Class
