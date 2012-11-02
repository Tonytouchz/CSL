Imports Model
Imports System.IO

Partial Class aAfficheCours
    Inherits System.Web.UI.Page

    Private Shared leContexte As ModelContainer1 = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        leContexte = New ModelContainer1()

    End Sub

    Protected Sub dsActiviteCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) _
      Handles dsActivite.ContextCreating

        If Not leContexte Is Nothing Then

            e.Context = leContexte

        End If

    End Sub

    Protected Sub dsActivite_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) _
        Handles dsActivite.ContextDisposing

        e.Cancel = True

    End Sub

    Protected Sub dsActivite_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsActivite.Inserted

        If e.Exception IsNot Nothing Then

            Session("quoiErreur") = sender.name & ".Selected"
            Session("erreur") = e.Exception
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), "ERREUR " & Now.ToLongDateString & ControlChars.CrLf)
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), e.Exception.ToString() & ControlChars.CrLf & ControlChars.CrLf)
            Response.Redirect("erreur.aspx", True)

            e.ExceptionHandled = True

        Else

            mvAfficherCours.ActiveViewIndex = 3

        End If

    End Sub


    Protected Sub dsGroupeCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) _
       Handles dsGroupe.ContextCreating

        If Not leContexte Is Nothing Then
            e.Context = leContexte
        End If

    End Sub

    Protected Sub dsGroupe_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) _
        Handles dsGroupe.ContextDisposing

        e.Cancel = True

    End Sub

    Protected Sub dsGroupe_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsGroupe.Inserted

        If e.Exception IsNot Nothing Then

            Session("quoiErreur") = sender.name & ".Selected"
            Session("erreur") = e.Exception
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), "ERREUR " & Now.ToLongDateString & ControlChars.CrLf)
            File.AppendAllText(Page.Server.MapPath("App_Data\logErreur.txt"), e.Exception.ToString() & ControlChars.CrLf & ControlChars.CrLf)
            Response.Redirect("erreur.aspx", True)

            e.ExceptionHandled = True

        End If

    End Sub

    Protected Sub lvListeActivite_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvListeActivite.ItemCommand

        If e.CommandSource.id = "lnknomActivite" Then

            Dim noAct = e.CommandArgument
            dsGroupe.WhereParameters("noActivite").DefaultValue = noAct

            mvAfficherCours.ActiveViewIndex = 1

        End If

    End Sub

    Protected Sub btnRetourActivite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAfficherActivite.Click, btnRetourActivite.Click

        lvListeActivite.DataBind()
        txtRechercheActivite.Text = ""
        mvAfficherCours.ActiveViewIndex = 0

    End Sub

    Protected Sub BtnRetourGroupe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRetourGroupe.Click

        mvAfficherCours.ActiveViewIndex = 1

    End Sub

    Protected Sub btnAjouteActivite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAjouteActivite.Click

        txtRechercheGroupe.Text = ""
        mvAfficherCours.ActiveViewIndex = 2

    End Sub

    Protected Sub btnAjoutGroupe_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAjoutGroupe.Click

        mvAfficherCours.ActiveViewIndex = 4

    End Sub

    <System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()>
    Public Shared Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()

        Dim unResultat As String() = {""}

        If contextKey = "RechercheActivite" Then

            unResultat = (From activite In leContexte.activites Where activite.nomActivite.Contains(prefixText) Select activite.nomActivite).ToArray

        End If

        If contextKey = "RechercheGroupe" Then

            unResultat = (From groupe In leContexte.groupes Where groupe.nomProf.Contains(prefixText) Select groupe.nomProf).ToArray

        End If

        Return (
        From m In unResultat
        Where m.StartsWith(prefixText, StringComparison.CurrentCultureIgnoreCase)
        Select m).Take(count).ToArray()

    End Function

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
            dsGroupe.DataBind()
            lvListeGroupes.DataBind()

            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtNomProf").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtPrix").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtNbPlaceDisponible").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtAgeMin").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtAgeMax").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtMaterielRequis").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtDateDebut").Text = ""
            FindChildControl(Of TextBox)(lvAjoutGroupe, "txtPrealable").Text = ""

            mvAfficherCours.ActiveViewIndex = 5

        End If

        If e.CommandSource.id = "btnAnnuler" Then
            mvAfficherCours.ActiveViewIndex = 4
        End If

    End Sub
End Class
