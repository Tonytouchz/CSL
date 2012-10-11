<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="OublierMotPasse.aspx.vb" Inherits="OublierMotPasse" %>

<asp:Content ID="Content" ContentPlaceHolderID="placeHolderContenu" runat="server">
    <div id="oublieMotDePasse" style="margin: 60px; padding: 60px">
        <table style="border: 3px solid #025570; width: 100%" cellpadding="10">
            <tr>
                <td colspan="2" bgcolor="#0583AD" 
                    
                    style="height: 41px; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #025570;">
        <asp:Label ID="lblTitreTableau" runat="server" 
                        Text="Mot de passe oublié"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
        <asp:Label ID="lblExplicationMotPassePerdu" runat="server" Text="Votre mot de passe vous sera envoyé à votre adresse courriel."></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 105px">
        <asp:Label ID="lblUtilisateur" runat="server" Text="Utilisateur"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUtilisateur" runat="server" Width="215px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfUser" runat="server" 
                        ControlToValidate="txtUtilisateur" 
                        ErrorMessage="Vous devez d'abord entrer votre adresse courriel." 
                        ForeColor="Red">!</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 105px">
                    <asp:Button ID="btnEnvoyer" runat="server" Text="Envoyer" />
                </td>
                <td>
                    <asp:ValidationSummary ID="vsMotPasseOublie" runat="server" ForeColor="Red" />
                </td>
            </tr>
        </table>
   </div>
</asp:Content>
