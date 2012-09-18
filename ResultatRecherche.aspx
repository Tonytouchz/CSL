<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="ResultatRecherche.aspx.vb" Inherits="ResultatRecherche" %>

<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" Runat="Server">
    
    <asp:Label ID="Label1" runat="server" Text="Résultat de recherche" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" Font-Underline="true" Font-Size="Larger" />
    <br />
    <br />
    1-
    <br />
    <table style="width: 100%; table-layout: fixed;">
        <tr>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Activitée</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Clientèle</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Session</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Places disponibles</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Séance Hebdomadaire</td>
        </tr>
        <tr>
            <td style="height: 23px">
                Tennis de table</td>
            <td style="height: 23px">
                Parents-enfants</td>
            <td style="height: 23px">
                Automne</td>
            <td style="height: 23px">
                20</td>
            <td style="height: 23px">
                5</td>
        </tr>
        <tr>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Date de début</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Âge minimum</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Âge maximum</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Équipement requis</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Prix</td>
        </tr>
        <tr>
            <td>
                24/09/2012</td>
            <td>
                7</td>
            <td>
                &nbsp;</td>
            <td>
                Aucun</td>
            <td>
                50$</td>
        </tr>
    </table>
    <br />
    2-
    <br />
    <table style="width: 100%; table-layout: fixed;">
        <tr>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Activitée</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Clientèle</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Session</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Places disponibles</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Nombres de séance</td>
        </tr>
        <tr>
            <td style="height: 23px; width: 152px;">
                Trampoline</td>
            <td style="height: 23px">
                Enfants</td>
            <td style="height: 23px">
                Automne</td>
            <td style="height: 23px">
                20</td>
            <td style="height: 23px">
                1</td>
        </tr>
        <tr>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Date de début</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Âge minimum</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Âge maximum</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Équipement requis</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Prix</td>
        </tr>
        <tr>
            <td style="width: 152px; height: 23px">
                15/09/2012</td>
            <td style="height: 23px">
                5</td>
            <td style="height: 23px">
                </td>
            <td style="height: 23px">
                Aucun</td>
            <td style="height: 23px">
                75$</td>
        </tr>
    </table>
    <br />
    3-
    <br />
    <table style="width: 100%; table-layout: fixed;">
        <tr>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Activitée</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Clientèle</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Session</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Places disponibles</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Nombres de séance</td>
        </tr>
        <tr>
            <td style="height: 23px">
                Soin d&#39;urgence</td>
            <td style="height: 23px">
                Adulte</td>
            <td style="height: 23px">
                Automne - Hiver</td>
            <td style="height: 23px">
                À déterminer</td>
            <td style="height: 23px">
                1</td>
        </tr>
        <tr>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Date de début</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Âge minimum</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Âge maximum</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Équipement requis</td>
            <td style="border: thin solid #000000; font-weight: bold; text-align: center;">
                Prix</td>
        </tr>
        <tr>
            <td>
                15/09/2012</td>
            <td>
                14</td>
            <td>
                &nbsp;</td>
            <td>
                Aucun</td>
            <td>
                125$</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" 
                    Font-Size="Large" Font-Underline="true" Text="Recherche avancée" />
    <br />
    
    <br />
    <table>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Clientèle"></asp:Label>
            </td>
            <td style="width: 460px">           
                    <asp:CheckBox ID="CheckBox1" runat="server" text="Adulte" />
                    <asp:CheckBox ID="CheckBox4" runat="server" text="Enfants" />
                    <asp:CheckBox ID="CheckBox5" runat="server" text="Parent-Enfant" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Session</td>
            <td style="width: 460px">
                <asp:CheckBox ID="CheckBox2" runat="server" text="Été"/>
                <asp:CheckBox ID="CheckBox6" runat="server" text="Automne" />
                <asp:CheckBox ID="CheckBox7" runat="server" text="Hiver" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Prix</td>
            <td style="width: 460px">
                <asp:Label ID="Label4" runat="server" Text="De "></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>
&nbsp;À
                <asp:TextBox ID="TextBox2" runat="server" Width="50px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    <br />


</asp:Content>

