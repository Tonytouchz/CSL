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

        'If Not Request.Cookies("utilisateur") Is Nothing Then

        '    Dim leCookie As HttpCookie = Request.Cookies("utilisateur")
        '    Session("nomUtilisateur") = leCookie("nomUtilisateur")
        '    Session("typeUtilisateur") = leCookie("typeUtilisateur")

        'End If

        If Session("nomUtilisateur") IsNot Nothing Then
            MultiViewConnection.ActiveViewIndex = 1
            lblUtilisateur.Text = Session("nomUtilisateur")
        End If

    End Sub


    '    Public Function GetAllUsers() As DataSet
    '        Dim connection As New SqlConnection("data source=mcurie.cegepgranby.qc.ca; initial catalog=ProjetRegulier2012_02 ; user id=UserProjetRegulier2012_02; password=projreg1579")
    '        Dim command As SqlCommand = New SqlCommand("GetUsers", connection)
    '        command.CommandType = CommandType.StoredProcedure
    '        Dim da As SqlDataAdapter = New SqlDataAdapter(command)
    '        Try
    '            Dim ds As DataSet = New DataSet
    '            da.Fill(ds)
    '            Return ds
    '        Finally
    '            connection.Dispose()
    '            command.Dispose()
    '            da.Dispose()
    '        End Try
    '    End Function

    '    Public Class User
    '#Region "Fields and Properties"
    '        Private _noUser As Integer
    '        Private _userName As String
    '        Private _password As String
    '        Private _typeUser As String
    '        Public Property NoUser() As Integer
    '            Get
    '                Return _noUser
    '            End Get
    '            Set(ByVal Value As Integer)
    '                _noUser = Value
    '            End Set
    '        End Property
    '        Public Property UserName() As String
    '            Get
    '                Return _userName
    '            End Get
    '            Set(ByVal Value As String)
    '                _userName = Value
    '            End Set
    '        End Property
    '        Public Property Password() As String
    '            Get
    '                Return _password
    '            End Get
    '            Set(ByVal Value As String)
    '                _password = Value
    '            End Set
    '        End Property
    '        Public Property TypeUser() As String
    '            Get
    '                Return _typeUser
    '            End Get
    '            Set(ByVal Value As String)
    '                _typeUser = Value
    '            End Set
    '        End Property
    '#End Region

    '#Region "Constructors"
    '        Public Sub New()
    '        End Sub
    '        Public Sub New(ByVal id As Integer, ByVal name As String, ByVal password As String, ByVal type As String)
    '            Me.NoUser = id
    '            Me.UserName = name
    '            Me.Password = password
    '            Me.TypeUser = type
    '        End Sub
    '#End Region

    '    End Class

    '    Public Class Role
    '        Protected Sub New()
    '        End Sub
    '        Private m_NoRole As Integer
    '        Private m_Nom As String
    '        Public Sub New(ByVal noRole As Integer, ByVal nomRole As String)
    '            ID = noRole
    '            nom = nomRole
    '        End Sub
    '        Public Overridable Property ID() As Integer
    '            Get
    '                Return m_NoRole
    '            End Get
    '            Set(ByVal value As Integer)
    '                m_NoRole = value
    '            End Set
    '        End Property

    '        Public Overridable Property nom() As String
    '            Get
    '                Return m_Nom
    '            End Get
    '            Set(ByVal value As String)
    '                m_Nom = value
    '            End Set
    '        End Property

    '        Public Function GetUser(ByVal noUser As Integer) As User
    '            Dim connection As New SqlConnection("data source=mcurie.cegepgranby.qc.ca; initial catalog=ProjetRegulier2012_02 ; user id=UserProjetRegulier2012_02; password=projreg1579")
    '            Dim command As New SqlCommand("GetUserByNo", connection)
    '            command.Parameters.Add("@NoUser", SqlDbType.Int).Value = noUser
    '            Dim dr As SqlDataReader = Nothing
    '            Try
    '                connection.Open()
    '                dr = command.ExecuteReader(CommandBehavior.SingleRow)
    '                If dr.Read Then
    '                    Dim user As New User
    '                    user.NoUser = Convert.ToInt32(dr("NoUser"))
    '                    user.UserName = Convert.ToString(dr("UserName"))
    '                    user.Password = Convert.ToString(dr("Password"))
    '                    user.TypeUser = Convert.ToString(dr("TypeUser"))
    '                    Return user
    '                End If
    '                Return Nothing
    '            Finally
    '                If Not dr Is Nothing AndAlso Not dr.IsClosed Then
    '                    dr.Close()
    '                End If
    '                connection.Dispose()
    '                command.Dispose()
    '            End Try
    '        End Function
    '    End Class

    Protected Sub btnConnecter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConnecter.Click
        Dim verifierUser = From Model In leContexte.dossiersJeu Where Model.username = txtLogin.Text And txtMotPasse.Text = Model.password

        If verifierUser.Count = 0 Then

            Response.Redirect("Connexion.aspx", True)

        Else

            Dim utilisateur = (From Model In leContexte.dossiersJeu Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.username).First
            Dim leTypeUtilisateur = (From Model In leContexte.dossiersJeu Where (Model.username = txtLogin.Text And txtMotPasse.Text = Model.password) Select Model.typeUtilisateur).First
            Session("nomUtilisateur") = utilisateur
            Session("typeUtilisateur") = leTypeUtilisateur

            MultiViewConnection.ActiveViewIndex = 1
            lblUtilisateur.Text = utilisateur


            Response.Redirect("Historique.aspx", True)

        End If

    End Sub

    'If chkBoxSessionActive.Checked = True Then

    '    Dim cookieUtilisateur As New HttpCookie("utilisateur")
    '    cookieUtilisateur.Values("nomUtilisateur") = utilisateur
    '    cookieUtilisateur.Values("typeUtilisateur") = leTypeUtilisateur
    '    cookieUtilisateur.Expires = DateTime.Now.AddYears(5)
    '    Response.Cookies.Add(cookieUtilisateur)

    'End If

    Protected Sub lnkDeconnecter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDeconnecter.Click

        Response.Cookies("nomUtilisateur").Value = Nothing
        Response.Cookies("typeUtilisateur").Value = Nothing
        Session("nomUtilisateur") = Nothing
        Session("typeUtilisateur") = Nothing
        MultiViewConnection.ActiveViewIndex = 0

    End Sub

End Class

