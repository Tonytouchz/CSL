Imports System.Security.Principal
Imports System.Security.Cryptography
Imports System.Text
Imports System.IO
Imports Model
Imports System

Partial Class Paiement
    Inherits System.Web.UI.Page

    Private Shared leContexte As ModelContainer1 = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        leContexte = New ModelContainer1()

        If Session("noDossier") IsNot Nothing Then

            Dim unNoDossier As Integer = CType(Session("noDossier"), Integer)
            dsPanier.WhereParameters("leNoDossier").DefaultValue = 10

            Try

                Dim numeroClient As clients = (From d In leContexte.clients Where d.noDossier = unNoDossier).First

                dsClient.WhereParameters("leNoClient").DefaultValue = numeroClient.noClient

            Catch

            End Try

        Else

            Response.Redirect("Connexion.aspx")

        End If

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
                          Replace(lblTotal.Text, ",", "."),
                          FindChildControl(Of HiddenField)(repeaterInformationsPersonnel, "hiddenFieldNom").Value,
                          FindChildControl(Of HiddenField)(repeaterInformationsPersonnel, "hiddenFieldPrenom").Value,
                          FindChildControl(Of HiddenField)(repeaterInformationsPersonnel, "hiddenFieldAdresse").Value,
                          FindChildControl(Of HiddenField)(repeaterInformationsPersonnel, "hiddenFieldVille").Value,
                          FindChildControl(Of HiddenField)(repeaterInformationsPersonnel, "hiddenFieldProvince").Value,
                          FindChildControl(Of HiddenField)(repeaterInformationsPersonnel, "hiddenFieldCodeZip").Value)

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
                    strCcy & ", celle-ci a bien été traitée. Un courriel vous sera envoyé sous peu"

            PayerClient()

            InscrireClient()



                envoyeEmail(FindChildControl(Of HiddenField)(repeaterInformationsPersonnel, "hiddenFieldEmail").Value,
                            strAmt,
                            txtNoCarte.Text,
                            ddlSorte.SelectedValue)

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

            ' FAITES QQCHOSE

    End Sub

    Sub validerNoSecurite(ByVal sender As Object, ByVal args As ServerValidateEventArgs)

        args.IsValid = False

        Dim noSecurite As String = txtNoSecurite.Text

        ' Quitter si l'argument est Null
        If noSecurite Is Nothing Then Exit Sub

        If noSecurite <= 999 And noSecurite >= 100 Then

            args.IsValid = True

        End If

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

        End If

    End Sub

    Sub ValiderDateExpiration(ByVal sender As Object, ByVal args As ServerValidateEventArgs)

        args.IsValid = False

        Dim txtDateExpirationCarte As String = txtDateExpiration.Text
        Dim dateNow As Integer = DateTime.Now.Month & DateTime.Now.Year

        Try

            Dim moisExpiration As String = txtDateExpirationCarte.Substring(0, 2)
            Dim anneeExpiration As String = txtDateExpirationCarte.Substring(2, 4)

            If moisExpiration <= 12 And moisExpiration >= 1 Then

                If anneeExpiration >= Date.Now.Year Then

                    args.IsValid = True

                End If

            End If

            If anneeExpiration = DateTime.Now.Year Then

                If moisExpiration >= moisExpiration Then

                    args.IsValid = True

                End If

            End If

        Catch

        End Try

    End Sub

    Private Sub envoyeEmail(ByVal emailUtilisateur As String, ByVal prix As String, ByVal noCarte As String, ByVal sorteCarte As String)

        Try

            Dim unPanier = (From p In leContexte.panier Where p.noDossier = 10)
            Dim noPaiment As Integer = (From t In leContexte.paiements Where t.noDossier = 10 Select t.noPaiement).First
            Dim laPosition As Integer = 0

            Dim strMsg As String = ""
            strMsg &= "<h1>Détail de la commande</h1><br>" &
                "<table style='height: 130px; width: 700px; background-color:Silver'>" &
                "<tr>" &
                "<td style='width: 163px'><div style='font-weight:bold;'>Nom d'utilisateur:<br>Numéro de Commande:<br>Numéro de Carte:<br>Type de Carte:</td>" &
                "<td>BMarley<br>" & noPaiment & "<br>XXXX-XXXX-XXXX-" & noCarte.Substring(12, 4) & "<br>" & sorteCarte & "</td>" &
                "</tr>" &
                "</table>" &
                "<br>" &
                "<table style='height: 144px; width: 700px; background-color:Gray'>" &
                "<tr>" &
                "<td style='width: 349px; font-weight:bold'><div align='center'>Date de l&#39;achat</div></td>" &
                "<td><div align='center' style='font-weight:bold'>Total</div></td>" &
                "</tr>" &
                "<tr style='background-color:Silver'>" &
                "<td style='width: 349px'><div align='center'>" & "Le " & DateTime.Now.ToLongDateString & " à " & DateTime.Now.ToLongTimeString & "</div></td>" &
                "<td><div align='center'>" & lblTotal.Text & "$</div></td>" &
                "</tr>" &
                "</table>" &
                "<br>" &
                "<table style='height: 144px; width: 700px; background-color:Gray;'>" &
                "<tr>" &
                "<td style='width:350px;'><div style='font-weight: bold;font-size: large;'>Détails</div></td>" &
                "<td></td>" &
                "<td></td>" &
                "</tr>" &
                "<tr style='background-color:Silver;'>" &
                "<td style='width:350px; height: 50px; text-decoration: underline; font-weight:bold; padding-left:10px'>Nom Cours</td>" &
                "<td style='width:350px; text-decoration: underline; font-weight:bold; padding-left:10px'>Personne Inscrite</td>" &
                "<td style='width:100px; text-decoration: underline; font-weight:bold; padding-left:10px'>Prix</td>" &
                "</tr>"

            For Each item In unPanier


                strMsg &= "<tr style='background-color:Silver'>" &
                "<td style='height: 50px; padding-left:10px'>" & unPanier.ToArray(laPosition).groupes.activites.nomActivite & "</td>" &
                "<td style='height: 50px; padding-left:10px'>" & unPanier.ToArray(laPosition).clients.nomComplet() & "</td>" &
                "<td style='height: 50px; padding-left:10px'>" & unPanier.ToArray(laPosition).groupes.prix() & "$</td>" &
                "</tr>"
                laPosition += 1

            Next
            
            strMsg &= "</table>" &
                "<br>" &
                "<strong>Cordialement,</strong><br><br>" &
                "<strong>L'équipe CSL Culture, Sport et Loisir</strong>"

            Dim toqui As String = emailUtilisateur
            Dim contenuMessage = String.Format("Prix: {1}{0} Numéro de la carte: {2}{0} Type de carte: {3}{0} Date: {4}{0}", vbCrLf, prix, noCarte, sorteCarte, Date.Now.ToShortDateString)
            '"Bonjour, votre commande de " & prix & "$ a été passé avec succès sur votre carte " & sorteCarte & " xxxx-xxxx-xxxx-" & noCarte.Substring(12, 4) & " le " & DateTime.Now.ToShortDateString

            Dim mail As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
            mail.To.Add(toqui)
            mail.From = New System.Net.Mail.MailAddress("donotreply.csl@gmail.com", "CSL inc. Votre Commande", System.Text.Encoding.UTF8)
            mail.Subject = "CSL inc. Votre Commande"
            mail.SubjectEncoding = System.Text.Encoding.UTF8
            mail.Body = strMsg
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

    Protected Sub lvPanier_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvPanier.ItemDataBound

        Dim TPS As Double = 0.0
        Dim TVQ As Double = 0.0
        Dim prixTotal As Double = 0.0
        Dim laPosition As Integer = 0
        Dim lePanier = (From unPanier In leContexte.panier()
        Where unPanier.noDossier = 10)

        For Each leGroupes In lePanier

            prixTotal += lePanier.ToArray(laPosition).groupes.prix
            laPosition += 1

        Next

        TPS += Math.Round(prixTotal * 0.095000000000000001, 3)
        prixTotal += TPS
        TVQ += Math.Round(prixTotal * 0.050000000000000003, 3)
        prixTotal += TVQ
        lblTPS.Text = FormatNumber(TPS, 2, TriState.True)
        lblTVQ.Text = FormatNumber(TVQ, 2, TriState.True)
        lblTotal.Text = FormatNumber(prixTotal, 2, TriState.True)

    End Sub

    Private Sub PayerClient()

        Dim unPaiement = New paiements With {.noDossier = 10, .datePaiement = DateTime.Now.ToShortDateString, .TPS = lblTPS.Text, .TVQ = lblTVQ.Text, .totalPaiement = lblTotal.Text}

        Dim leDossier As dossiers = (From d In leContexte.dossiers
                                  Where d.noDossier = 10
                                  Select d).First
        unPaiement.dossiers = leDossier

        leContexte.AddObject("paiements", unPaiement)
        leContexte.SaveChanges()

    End Sub

    Private Sub InscrireClient()

        Dim unPaiement As paiements = (From d In leContexte.paiements
                                 Where d.noDossier = 10
                                 Select d).First

        Dim unInscription = New inscription With {.noClient = 20, .dateInscription = DateTime.Now.ToShortDateString, .noGroupe = 49, .noPaiement = unPaiement.noPaiement, .noDossier = 10}

        unInscription.paiements = unPaiement

        Dim leClient As clients = (From d In leContexte.clients
                                  Where d.noClient = 20
                                  Select d).First
        unInscription.clients = leClient

        Dim leGroupe As groupes = (From d In leContexte.groupes
                                 Where d.noGroupe = 49
                                 Select d).First
        unInscription.groupes = leGroupe

        Dim leDossier As dossiers = (From d In leContexte.dossiers
                                  Where d.noDossier = 10
                                  Select d).First
        unInscription.dossiers = leDossier


        leContexte.AddObject("inscription", unInscription)
        leContexte.SaveChanges()

    End Sub

End Class