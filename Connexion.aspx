<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="Connexion.aspx.vb" Inherits="Connexion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td rowspan="7" style="width: 164px;">
            </td>
            <td align="center" colspan="2">
                <asp:Label ID="lblConnection" runat="server" Font-Size="X-Large" 
                    Text="Connection"></asp:Label>
            </td>
            <td rowspan="7" style="width: 209px">
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblUtilisateur" runat="server" Text="Utilisateur"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateurUtilisateur" runat="server" 
                    ControlToValidate="txtLogin" ErrorMessage="Champ utilisateur requis" 
                    ForeColor="Red" ValidationGroup="connexion">!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMotPasse" runat="server" Text="Mot de passe"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMotPasse" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validateurMotPasse" runat="server" 
                    ControlToValidate="txtMotPasse" ErrorMessage="Champ mot de passe requis" 
                    ForeColor="Red" ValidationGroup="connexion">!</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                    <asp:Button ID="btnConnecter" runat="server" Text="Se Connecter" 
                        ValidationGroup="connexion" />
                    </td>
        </tr>
        <tr>
            <td align="char" colspan="2">
                <asp:ValidationSummary ID="ValidationSummary" runat="server" 
                    style="margin-left: 15px" />
                <asp:Label ID="lblInvalide" runat="server" ForeColor="Red" 
                    Text="Utilisateur ou Mot de passe invalide" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="lnkOublie" runat="server" 
                    NavigateUrl="~/OublierMotPasse.aspx">Mot de passe oublié?</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="lnkCreerUtilisateur" runat="server" 
                    NavigateUrl="~/CreerDossier.aspx">S&#39;inscrire</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

