<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="AfficherLaFacture.aspx.vb" Inherits="AfficherLaFacture" %>

<asp:Content ID="Content2" ContentPlaceHolderID="placeHolderContenu" runat="server">

    <asp:Label ID="lblTitreFacture" runat="server" Text="Facture" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" Font-Underline="true" Font-Size="Larger" />
    <br />
    <br />
    <table style="background-color: #CCCCCC">
        <tr>
            <td style="width: 142px">
                <b>Dossier </b> </td>
            <td style="width: 217px">
                025468</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Facture no.</b></td>
            <td style="width: 217px">
                00321235</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px; font-weight: bold;">
                <strong>Détail</strong></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Nom et prénom</b></td>
            <td style="width: 217px">
                Joe Bloe</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Activitée</b></td>
            <td style="width: 217px">
                Tir à l&#39;arc</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Clientèle</b></td>
            <td style="width: 217px">
                Adulte</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="height: 23px; width: 142px;">
                <b>Session</b></td>
            <td style="height: 23px; width: 217px;">
                Été</td>
            <td style="height: 23px; width: 106px;">
                </td>
            <td style="height: 23px; width: 87px;" align="right">
                </td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Date de début</b></td>
            <td style="width: 217px">
                25/06/2012</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b>Prix</b></td>
            <td style="width: 217px">
                120$</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                &nbsp;</td>
            <td align="right" style="width: 87px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 142px; height: 23px;">
                <b>Total</b></td>
            <td style="width: 217px; height: 23px;">
                </td>
            <td style="width: 106px; height: 23px;">
                </td>
            <td align="right" style="width: 87px">
                </td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                Total</td>
            <td align="right" style="width: 87px">
                120.00$</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                TPS(5%)</td>
            <td align="right" style="width: 87px">
                6.25$</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                TVQ (9.5%)</td>
            <td align="right" style="width: 87px">
                11.99$</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td align="right" style="width: 217px">
                Rabais :</td>
            <td style="width: 106px">
                Conjoint (50%)</td>
            <td align="right" style="width: 87px">
                60.00$</td>
        </tr>
        <tr>
            <td style="height: 23px; width: 142px">
                </td>
            <td align="right" style="height: 23px; width: 217px">
                Frais supplémentaire :</td>
            <td style="width: 106px; height: 23px">
                null</td>
            <td align="right" style="width: 87px; height: 23px">
                0.00$</td>
        </tr>
        <tr>
            <td style="border-bottom: thin solid #000000; width: 142px;">
                <b></b></td>
            <td align="right" style="border-bottom: thin solid #000000; width: 217px;">
                Autre :</td>
            <td style="border-bottom: thin solid #000000; width: 106px;">
                null</td>
            <td align="right" 
                style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #000000">
                0.00$</td>
        </tr>
        <tr>
            <td style="width: 142px">
                <b></b></td>
            <td style="width: 217px">
                &nbsp;</td>
            <td style="width: 106px">
                Grand total :</td>
            <td align="right" style="width: 87px">
                78.24$</td>
        </tr>
        </table>
    <br />


</asp:Content>
