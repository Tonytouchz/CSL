Imports Model
Imports System.IO

Partial Class AfficheCoursClient
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

    Protected Sub lvListeActivite_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvListeActivite.ItemCommand

        If e.CommandSource.id = "lnknomActivite" Then

            Dim noAct = e.CommandArgument
            dsGroupe.WhereParameters("noActivite").DefaultValue = noAct

            mvAfficherCours.ActiveViewIndex = 1

        End If

    End Sub

    Protected Sub btnAfficherActivite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAfficherActivite.Click

        txtRechercheActivite.Text = ""
        mvAfficherCours.ActiveViewIndex = 0

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

    Protected Sub btnRechercherActivite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRechercherActivite.Click

        mvAfficherCours.DataBind()

    End Sub

End Class
