Imports System.IO
Imports Model

Partial Class Paiement
    Inherits System.Web.UI.Page

    Private Shared leContexte As ModelContainer1 = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        leContexte = New ModelContainer1()

        Dim unNoDossier As Integer = CType(Session("noDossier"), Integer)

        Try

            Dim numeroClient As clients = (From d In leContexte.clients Where d.noDossier = unNoDossier).First

            dsClient.WhereParameters("leNoClient").DefaultValue = numeroClient.noClient

        Catch

        End Try


    End Sub

    Protected Sub dsClientCreating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextCreatingEventArgs) _
      Handles dsClient.ContextCreating

        If Not leContexte Is Nothing Then

            e.Context = leContexte

        End If

    End Sub

    Protected Sub dsClient_ContextDisposing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.EntityDataSourceContextDisposingEventArgs) _
        Handles dsClient.ContextDisposing

        e.Cancel = True

    End Sub


    Protected Sub imgPayPal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles imgPayPal.Click

        If Me.IsValid Then

            doTransaction(txtNoCarte.Text,
                          ddlSorte.SelectedValue,
                          txtDateExpiration.Text,
                          txtNoSecurite.Text,
                          FindChildControl(Of Label)(repeaterInformationsPersonnel, "lblPaye").Text,
                          FindChildControl(Of TextBox)(repeaterInformationsPersonnel, "txtNom").Text,
                          FindChildControl(Of TextBox)(repeaterInformationsPersonnel, "txtPrenom").Text,
                          FindChildControl(Of TextBox)(repeaterInformationsPersonnel, "txtAdresse").Text,
                          FindChildControl(Of TextBox)(repeaterInformationsPersonnel, "txtVille").Text,
                          FindChildControl(Of TextBox)(repeaterInformationsPersonnel, "txtProvince").Text,
                          FindChildControl(Of TextBox)(repeaterInformationsPersonnel, "txtCodeZip").Text)

        End If

    End Sub

    ' PAYPAL PAYMENTS PRO
    ' DIRECT PAYMENT
    ' IL EST INTERDIT DE STOCKER LE NO DE CARTE DE CRÉDIT

    Protected Sub doTransaction(ByVal ccNumber As String,
                                ByVal ccType As String,
                                ByVal expireDate As String,
                                ByVal cvvNum As String,
                                ByVal amount As String,
                                ByVal lastName As String,
                                ByVal firstName As String,
                                ByVal street As String,
                                ByVal city As String,
                                ByVal state As String,
                                ByVal zip As String)

        'API INFORMATIONS (3)
        Dim strUsername As String = "cghy_1351601141_biz_api1.hotmail.com"
        Dim strPassword As String = "1351601201"
        Dim strSignature As String = "AC2fy6DVwQwFIcIr1FFE5.88FspVAgpap6JFB.6Wa9OBOVbetoH7PbZc"
        Dim strCredentials As String = "USER=" & strUsername & "&PWD=" & strPassword & "&SIGNATURE=" & strSignature
        Dim strNVPSandboxServer As String = "https://api-3t.sandbox.paypal.com/nvp"
        Dim strAPIVersion As String = "2.3"

        'credit card types: 
        'Visa, MasterCard, Discover, Amex
        Dim strNVP = strCredentials & "&METHOD=DoDirectPayment" & _
           "&CREDITCARDTYPE=" & ccType & _
           "&ACCT=" & ccNumber & _
           "&EXPDATE=" & expireDate & _
           "&CVV2=" & cvvNum & _
           "&AMT=" & amount & _
           "&CUSTOM=1234" & _
           "&CURRENCYCODE=CAD" & _
           "&FIRSTNAME=" & firstName & _
           "&LASTNAME=" & lastName & _
           "&STREET=" & street & _
           "&CITY=" & city & _
           "&STATE=" & state & _
           "&ZIP=" & zip & _
           "&COUNTRYCODE=CA" & _
           "&PAYMENTACTION=Sale" & _
           "&VERSION=" & strAPIVersion

        Try

            'Cree la requête
            Dim wrWebRequest As System.Net.HttpWebRequest = DirectCast(System.Net.WebRequest.Create(strNVPSandboxServer), 
                System.Net.HttpWebRequest)
            wrWebRequest.Method = "POST"

            Dim requestWriter As New System.IO.StreamWriter(wrWebRequest.GetRequestStream())
            requestWriter.Write(strNVP)
            requestWriter.Close()

            'Obtient la réponse
            Dim hwrWebResponse As System.Net.HttpWebResponse = DirectCast(wrWebRequest.GetResponse(), System.Net.HttpWebResponse)
            Dim responseReader As New System.IO.StreamReader(wrWebRequest.GetResponse().GetResponseStream())

            ' Lit la réponse
            Dim dataReturned As String = responseReader.ReadToEnd()
            responseReader.Close()
            Dim result As String = Server.UrlDecode(dataReturned)
            Dim arrResult As String() = result.Split("&"c)
            Dim htResponse As New Hashtable()
            Dim arrayReturned As String()
            For Each item As String In arrResult
                arrayReturned = item.Split("="c)
                htResponse.Add(arrayReturned(0), arrayReturned(1))
            Next

            Dim strAck As String = htResponse("ACK").ToString()
            'AFFICHE LA RÉPONSE

            If strAck = "Success" OrElse strAck = "SuccessWithWarning" Then
                Dim strAmt As String = htResponse("AMT").ToString()
                Dim strCcy As String = htResponse("CURRENCYCODE").ToString()
                Dim strTransactionID As String = htResponse("TRANSACTIONID").ToString()
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next

                Dim strSuccess As String = "Merci pour votre commande de : $" & strAmt & " " &
                    strCcy & ", celle-ci a bien été traitée."

                lblSucces.Text = strSuccess

                mvPaiment.ActiveViewIndex = 1

            Else

                Dim strErr As String = "Error: " & htResponse("L_LONGMESSAGE0").ToString()
                Dim strErrcode As String = "Error code: " & htResponse("L_ERRORCODE0").ToString()

                Response.Write(strErr & "&lt;br /&gt;" & strErrcode)
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next

                mvPaiment.ActiveViewIndex = 2

            End If
        Catch

            ' FAITES QQCHOSE

        End Try

    End Sub

    Sub validerNoCarte(ByVal sender As Object, ByVal args As ServerValidateEventArgs)

        Dim noCarte As String = txtNoCarte.Text
        Dim strNumCB As String, strCar As String
        Dim i As Integer, intLongueur As Integer, intRang As Integer
        Dim intAjoute As Integer ' valeur intermédiare
        Dim intSomme As Integer  ' Somme selon algorithme de Luhn

        ' Par défaut la fonction renvoie Faux
        args.IsValid = False
        ' Quitter si l'argument est Null
        If noCarte Is Nothing Then Exit Sub

        ' Force le type de la variante en type String
        noCarte = CStr(noCarte)
        ' Nettoie varNumCB

        For i = 1 To Len(noCarte)
            strCar = Mid(noCarte, i, 1)
            If strCar Like "[0-9]" Then strNumCB &= strCar
        Next

        intLongueur = Len(strNumCB)
        ' Quitter s'il n'y a aucun chiffre 0 à 9
        If intLongueur = 0 Then Exit Sub

        ' Pour chaque caractère ("0" à "9") de la chaîne
        For i = 1 To intLongueur

            strCar = Mid(strNumCB, i, 1)
            '  Numéro de rang du caractère

            intRang = intLongueur + 1 - i
            ' Si rang est impair

            If (intRang Mod 2) = 1 Then

                ' On ajoute à la somme la valeur du chiffre (0 à 9)
                intSomme = intSomme + CInt(strCar)
                ' Sinon (rang est pair)

            Else

                ' On multiplie la valeur du chiffre (0 à 9) par 2
                intAjoute = CInt(strCar) * 2
                ' Si le résultat est à deux chiffres (>9) on fait la somme
                ' des deux chiffres de ce résultat et on l'ajoute à la somme.
                ' (Ça revient à retirer 10 et ajouter 1 puisqu'on ne
                '  dépasse jamais 18)

                If intAjoute > 9 Then intAjoute = intAjoute - 9
                intSomme = intSomme + intAjoute

            End If

        Next

        ' Si la somme est multiple de 10 alors renvoyer Vrai
        If (intSomme Mod 10) = 0 Then

            args.IsValid = True

        Else

            args.IsValid = False

        End If

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