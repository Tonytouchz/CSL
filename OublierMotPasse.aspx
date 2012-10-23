<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="OublierMotPasse.aspx.vb" Inherits="OublierMotPasse" %>

<asp:Content ID="Content" ContentPlaceHolderID="placeHolderContenu" runat="server">
    <div id="oublieMotDePasse" style="padding: 60px">
        <table style="border: 3px solid #025570; width: 100%" cellpadding="10">
            <tr>
                <td colspan="4" bgcolor="#0583AD" style="height: 41px; border-bottom-style: solid; border-bottom-width: 3px; 
                    border-bottom-color: #025570;" align="center">
        <asp:Label ID="lblTitreTableau" runat="server" 
                        Text="Vous avez oubliez votre mot de passe?"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
        <asp:Label ID="lblExplicationMotPassePerdu" runat="server" Text="Entrez votre nom d'utilisateur OU bien votre adresse courriel, nous allons vous envoyer votre mot de passe à votre adresse courriel." />
                </td>
            </tr>
            <tr>
                <td style="width: 85px">
        <asp:Label ID="lblUtilisateur" runat="server" Text="Utilisateur"></asp:Label>
                </td>
                <td style="width: 76px; border-right-style: solid; border-right-color: #025570;">
                    <asp:TextBox ID="txtUtilisateur" runat="server" Width="131px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="reqValUsername" runat="server" 
                        ControlToValidate="txtUtilisateur" CSSClass="controleValidation"
                        ValidationGroup="User" Display="Dynamic"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Entrer un nom d'utilisateur</asp:RequiredFieldValidator>
                </td>
                <td style="width: 29px">
        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td style="width: 63px">
                    <asp:TextBox ID="txtEmail" runat="server" Width="160px"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" CssClass="controleValidation"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="Email" Display="Dynamic"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Entrer un Email valide</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtEmail" CssClass="controleValidation"
                        Display="Dynamic" ValidationGroup="Email"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Entrer un email</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 85px">
                    <asp:Button ID="btnEnvoyer" runat="server" Text="Envoyer" 
                        ValidationGroup="User" />
                </td>
                <td style="width: 76px; border-right-style: solid; border-right-color: #025570;">
                    &nbsp;</td>
                <td style="width: 29px">
                    <asp:Button ID="btnEnvoyerEmail" runat="server" Text="Envoyer" 
                        ValidationGroup="Email" />
                </td>
                <td style="width: 63px">
                    &nbsp;</td>
            </tr>
        </table>
   </div>
</asp:Content>
