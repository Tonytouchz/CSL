<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="HorairePerso.aspx.vb" Inherits="HorairePerso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="server">
    <p align="center" style="font-size: xx-large">
        Mon Horaire</p>
    <p align="left" style="font-size: xx-large">
        &nbsp;</p>
    <table style="border-style: solid; border-color: #009933; width: 110%">
        <tr>
            <td align="center" bgcolor="#009933" style="width: 135px; height: 23px">
                Lundi</td>
            <td align="center" bgcolor="#009933" style="height: 23px; width: 122px">
                Mardi</td>
            <td align="center" bgcolor="#009933" style="width: 136px; height: 23px">
                Mercredi</td>
            <td align="center" bgcolor="#009933" style="width: 113px; height: 23px">
                Jeudi</td>
            <td align="center" bgcolor="#009933" style="height: 23px; width: 110px">
                Vendredi</td>
            <td align="center" bgcolor="#009933" style="height: 23px; width: 117px">
                Samedi</td>
            <td align="center" bgcolor="#009933" style="height: 23px">
                Dimanche</td>
        </tr>
        <tr>
            <td align="center" style="border: 3px solid #009933">
                5:00-8:00<br />
                Natation<br />
                Piscine Miner</td>
            <td align="center" style="border: 3px solid #009933">
                &nbsp;</td>
            <td align="center" style="border: 3px solid #009933">
                13:30-15:30<br />
                Bricolage Extreme<br />
                École St-Joseph</td>
            <td align="center" style="border: 3px solid #009933">
                21:00-22:00<br />
                Guitare I<br />
                BoomBoomPow</td>
            <td align="center" style="border: 3px solid #009933">
                &nbsp;</td>
            <td align="center" style="border: 3px solid #009933">
                &nbsp;</td>
            <td align="center" style="border: 3px solid #009933">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="border: 3px solid #009933">
                9:00-10:00<br />
                Échec Ultime<br />
                Bingo St-Jacques</td>
            <td align="center" style="border: 3px solid #009933">
            </td>
            <td align="center" style="border: 3px solid #009933">
            </td>
            <td align="center" style="border: 3px solid #009933">
            </td>
            <td align="center" style="border: 3px solid #009933">
            </td>
            <td align="center" style="border: 3px solid #009933">
            </td>
            <td align="center" style="border: 3px solid #009933">
            </td>
        </tr>
    </table>
    <p align="left" style="font-size: xx-large">
        <asp:Button ID="btnImprimer" runat="server" Text="Imprimer" />
    </p>
    <p align="center" style="font-size: xx-large">
        &nbsp;</p>
</asp:Content>
