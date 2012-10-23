﻿Imports Model
Imports System.IO

Partial Class AjouterActivite

    Inherits System.Web.UI.Page

    Private Shared leContexte As ModelContainer1 = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        leContexte = New ModelContainer1()

        If Session("typeUtilisateur") IsNot Nothing Then

            If Session("typeUtilisateur") = "admin" Then

                FindChildControl(Of Button)(lvListeGroupes, "btnModifier").Visible() = True
                FindChildControl(Of Button)(lvListeGroupes, "btnSupprimer").Visible() = True
                btnAjouterGroupe.Visible = True

            Else

                FindChildControl(Of Button)(lvListeGroupes, "btnModifier").Visible() = False
                FindChildControl(Of Button)(lvListeGroupes, "btnSupprimer").Visible() = False
                btnAjouterGroupe.Visible = False

            End If

        End If

    End Sub

    Protected Sub dsContextCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) _
        Handles dsActivites.ContextCreating

        If Not leContexte Is Nothing Then
            e.Context = leContexte
        End If

    End Sub

    Protected Sub lvActivite_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvActivite.ItemCommand

        If e.CommandSource.id = "btnReinit" Then
            FindChildControl(Of TextBox)(lvActivite, "txtNomActivite").Text = ""
            FindChildControl(Of DropDownList)(lvActivite, "ddlTypeActivite").SelectedIndex = 0
            FindChildControl(Of DropDownList)(lvActivite, "ddlClientele").SelectedIndex = 0
            mvActivite.ActiveViewIndex = 1
        End If

    End Sub

    Protected Sub lvActiviteModDel_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvActiviteModDel.ItemCommand

        If e.CommandSource.id = "btnAjouterGroupe" Then

            mvActivite.ActiveViewIndex = 6

        End If

    End Sub

    Protected Sub dsActivites_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) _
        Handles dsActivites.ContextDisposing
        e.Cancel = True
    End Sub

    Protected Sub dsActivites_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsActivites.Deleted
        lvActiviteModDel.DataBind()
        mvActivite.ActiveViewIndex = 3
    End Sub

    Protected Sub dsActivites_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsActivites.Inserted
        FindChildControl(Of TextBox)(lvActivite, "txtNomActivite").Text = ""
        FindChildControl(Of DropDownList)(lvActivite, "ddlTypeActivite").SelectedIndex = 0
        FindChildControl(Of DropDownList)(lvActivite, "ddlClientele").SelectedIndex = 0
        mvActivite.ActiveViewIndex = 3
    End Sub

    Protected Sub btnChoixAjout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChoixAjout.Click
        mvActivite.ActiveViewIndex = 1
    End Sub

    Protected Sub btnChoixSupprimer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChoixSupprimer.Click
        mvActivite.ActiveViewIndex = 2
    End Sub

    Protected Sub btnRetour_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRetour.Click
        mvActivite.ActiveViewIndex = 0
    End Sub

    Protected Sub btnAfficher_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAfficher.Click
        mvActivite.ActiveViewIndex = 4
    End Sub


    Protected Sub btnAjouterGroupe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAjouterGroupe.Click

        mvActivite.ActiveViewIndex = 6

    End Sub

    'Début code Groupe Antho

    Protected Sub dsListeGroupeCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) _
       Handles dsListeGroupe.ContextCreating

        If Not leContexte Is Nothing Then
            e.Context = leContexte
        End If

    End Sub

    Protected Sub dsListeGroupe_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) _
        Handles dsListeGroupe.ContextDisposing

        e.Cancel = True
    End Sub


    Protected Sub dsListeGroupe_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsListeGroupe.Inserted

        If e.Exception IsNot Nothing Then
            Session("quoiErreur") = sender.name & ".Selected"
            Session("erreur") = e.Exception
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), "ERREUR " & Now.ToLongDateString & ControlChars.CrLf)
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), e.Exception.ToString() & ControlChars.CrLf & ControlChars.CrLf)
            Response.Redirect("erreur.aspx", True)

            e.ExceptionHandled = True

        Else

            mvActivite.ActiveViewIndex = 5

        End If

    End Sub

    Protected Sub lvListeGroupes_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvListeGroupes.ItemCommand

        If e.CommandSource.id = "btnAccepter" Then

            Dim leNoGroupe As Integer = e.CommandArgument

            Dim leGroupe As groupes = (From groupes In leContexte.groupes
                               Where groupes.noGroupe = leNoGroupe Select groupes).First

            Dim leNewNoActivite As String = FindChildControl(Of DropDownList)(lvListeGroupes, "ddlModifActivite").SelectedValue
            Dim uneActivite = (From activites In leContexte.activites Where activites.noActivite = leNewNoActivite Select activites).First

            leGroupe.activites = uneActivite

            leContexte.SaveChanges()
            dsListeGroupe.DataBind()
            lvListeGroupes.DataBind()

        End If

    End Sub

    Protected Sub lvAjoutGroupe_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvAjoutGroupe.ItemCommand

        If e.CommandSource.id = "btnInsertGroupe" Then

            Dim noActivite As String = FindChildControl(Of DropDownList)(lvAjoutGroupe, "ddlNoActivite").SelectedValue
            Dim nomProf As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtNomProf").Text
            Dim prix As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtPrix").Text
            Dim nbPlaceDisponible As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtNbPlaceDisponible").Text
            Dim ageMin As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtAgeMin").Text
            Dim ageMax As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtAgeMax").Text
            Dim materiel As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtMaterielRequis").Text
            Dim session As String = FindChildControl(Of DropDownList)(lvAjoutGroupe, "ddlSession").SelectedValue
            Dim dateDebut As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtDateDebut").Text
            Dim prealable As String = FindChildControl(Of TextBox)(lvAjoutGroupe, "txtPrealable").Text

            Dim uneActivite = (From activites In leContexte.activites Where activites.noActivite = noActivite Select activites).First
            Dim unGroupe = New groupes With {.prealable = prealable, .noActivite = noActivite, .nomProf = nomProf, .prix = prix, .nbPlaceDisponible = nbPlaceDisponible, .ageMin = ageMin, .ageMax = ageMax, .session = session, .dateDebut = dateDebut, .materielRequis = materiel}
            unGroupe.activites = uneActivite

            leContexte.SaveChanges()
            dsListeGroupe.DataBind()
            lvListeGroupes.DataBind()

            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtNomProf").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtPrix").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtNbPlaceDisponible").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtAgeMin").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtAgeMax").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtMaterielRequis").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtDateDebut").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtPrealable").Text = ""

            mvActivite.ActiveViewIndex = 5

        End If

        If e.CommandSource.id = "btnAfficheGroupe" Then

            mvActivite.ActiveViewIndex = 5

        End If

    End Sub

    Public Shared Function FindChildControl(Of T As System.Web.UI.Control)(ByVal startingControl As System.Web.UI.Control, ByVal id As String) As T
        Dim found As T = Nothing
        For Each activeControl As System.Web.UI.Control In startingControl.Controls
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
