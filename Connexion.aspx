<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="Connexion.aspx.vb" Inherits="Connexion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" Runat="Server">
    <table style="border: 3px solid #025570; width: 100%" cellpadding="10">
            <tr>
                <td colspan="4" bgcolor="#0583AD" style="height: 41px; border-bottom-style: solid; border-bottom-width: 3px; 
                    border-bottom-color: #025570;" align="center">
        <asp:Label ID="lblTitreTableau" runat="server" 
                        Text="Connection"></asp:Label>
                </td>
            </tr>
            <tr>
            <td rowspan="7" style="width: 164px;">
            </td>
            <td align="center" colspan="2">
                &nbsp;</td>
            <td rowspan="7" style="width: 209px">
            </td>
        </tr>
        <tr>
            <td style="width: 160px">
                <asp:Label ID="Label2" runat="server" Text="Utilisateur"></asp:Label>
            </td>
            <td style="width:55px">
                <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtLogin" CssClass="controleValidation" 
                    ForeColor="Red" ValidationGroup="connexion"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Entrer un nom d'utilisateur</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 160px">
                <asp:Label ID="Label3" runat="server" Text="Mot de passe"></asp:Label>
            </td>
            <td style="height:55px">
                <asp:TextBox ID="txtMotPasse" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtMotPasse" CssClass="controleValidation"
                    ForeColor="Red" ValidationGroup="connexion" Display="Dynamic"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le mot de passe est requis</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 160px">
            </td>
            <td>
                    <asp:Button ID="btnConnecter" runat="server" Text="Se Connecter" 
                        ValidationGroup="connexion" />
                    </td>
        </tr>
        <tr>
            <td style="width: 160px">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/OublierMotPasse.aspx">Mot de passe oublié?</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 160px">
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/CreerDossier.aspx">S&#39;inscrire</asp:HyperLink>
            </td>
            <td></td>
        </tr>
        </table>
</asp:Content>

