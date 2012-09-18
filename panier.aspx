<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="panier.aspx.vb" Inherits="panier" %>

<asp:Content ID="Content" ContentPlaceHolderID="placeHolderContenu" runat="server">
    <table style="width: 110%; margin-left: 0px;">
        <tr>
            <td style="width: 316px" align="center" bgcolor="#009933">
                &nbsp;</td>
            <td style="width: 1032px" align="center" bgcolor="#009933">
                <asp:Label ID="lblArticle" runat="server" Text="Groupe"></asp:Label>
            </td>
            <td style="width: 387px" align="center" bgcolor="#009933">
                <asp:Label ID="lblActivite" runat="server" Text="Activité"></asp:Label>
            </td>
            <td style="width: 854px" align="center" bgcolor="#009933">
                <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
            </td>
            <td style="width: 1401px" align="center" bgcolor="#009933">
                <asp:Label ID="lblLieu" runat="server" Text="Lieu"></asp:Label>
            </td>
            <td style="width: 1291px" align="center" bgcolor="#009933">
                <asp:Label ID="lblHoraire" runat="server" Text="Horaire"></asp:Label>
            </td>
            <td style="width: 288px" align="center" bgcolor="#009933">
                <asp:Label ID="lblTarif" runat="server" Text="Tarif"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 316px" align="center">
                <asp:CheckBox ID="chkSelection" runat="server" />
            </td>
            <td style="width: 1032px" align="center">
                <asp:Label ID="Label1" runat="server" Text="Battle royal d'echec"></asp:Label>
            </td>
            <td style="width: 387px" align="center">
                Echec</td>
            <td style="width: 854px" align="center">
                60 ans et plus</td>
            <td style="width: 1401px" align="center">
                Bowling Granby</td>
            <td style="width: 1291px" align="center">
                Dim 21:00-23:00</td>
            <td style="width: 288px" align="center">
                20$</td>
        </tr>
        <tr>
            <td style="width: 316px; height: 23px;" align="center">
                <asp:CheckBox ID="chkSelection0" runat="server" />
            </td>
            <td style="width: 1032px; height: 23px;" align="center">
                Patinage artistique pro</td>
            <td style="width: 387px; height: 23px;" align="center">
                patinage</td>
            <td style="width: 854px; height: 23px;" align="center">
                10 ans et plus</td>
            <td style="width: 1401px; height: 23px;" align="center">
                Patinoir St-Jacques</td>
            <td style="width: 1291px; height: 23px;" align="center">
                Dim 8:00-10:00</td>
            <td style="width: 288px; height: 23px;" align="center">
                100$</td>
        </tr>
        <tr>
            <td style="width: 316px; height: 7px;" align="center">
                <asp:CheckBox ID="chkSelection1" runat="server" />
            </td>
            <td style="width: 1032px; height: 7px;" align="center">
                Bricolage crayola</td>
            <td style="width: 387px; height: 7px;" align="center">
                Bricolage</td>
            <td style="width: 854px; height: 7px;" align="center">
                0 à 1 ans</td>
            <td style="width: 1401px; height: 7px;" align="center">
                Maternel des tit-prout</td>
            <td style="width: 1291px; height: 7px;" align="center">
                Lun 4:00-6:00</td>
            <td style="width: 288px; height: 7px;" align="center">
                1$</td>
        </tr>
        <tr>
            <td style="width: 316px" align="center">
                <asp:Button ID="btnSupprimer0" runat="server" Text="Supprimer" Width="80px" />
            </td>
            <td style="width: 1032px" align="center">
                &nbsp;</td>
            <td style="width: 387px" align="center">
                &nbsp;</td>
            <td style="width: 854px" align="center">
                &nbsp;</td>
            <td style="width: 1401px" align="center">
                &nbsp;</td>
            <td style="width: 1291px" align="center">
                &nbsp;</td>
            <td style="width: 288px" align="center" bgcolor="#009933">
                Total</td>
        </tr>
        <tr>
            <td style="width: 316px; height: 25px;" align="center">
                </td>
            <td style="width: 1032px; height: 25px;" align="center">
                </td>
            <td style="width: 387px; height: 25px;" align="center">
                </td>
            <td style="width: 854px; height: 25px;" align="center">
                </td>
            <td style="width: 1401px; height: 25px;" align="center">
                </td>
            <td style="width: 1291px; height: 25px;" align="center">
                </td>
            <td style="width: 288px; height: 25px;" align="center">
                121$</td>
        </tr>
        </table>
</asp:Content>
