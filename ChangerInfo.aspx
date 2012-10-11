<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="ChangerInfo.aspx.vb" Inherits="CreerCompte" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contenu" ContentPlaceHolderID="placeHolderContenu" runat="Server">
            <table style="width: 100%">
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNom" runat="server" Text='<%# Bind("clients.nom") %>' Width="170px" MaxLength="20"
                            ValidationGroup="creerCompte" TabIndex="4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValNom" runat="server" ErrorMessage="Le Nom est requis"
                            ControlToValidate="txtNom" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrenom" runat="server" Text='<%# Bind("clients.prenom") %>' Width="170px"
                            MaxLength="20" ValidationGroup="creerCompte" TabIndex="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValPrenom" runat="server" ErrorMessage="Le Prénom est requis"
                            ControlToValidate="txtPrenom" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAdresse" runat="server" Text='<%# Bind("adresse") %>'
                            Width="200px" MaxLength="30" ValidationGroup="creerCompte" TabIndex="6"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValAdresse" runat="server" ErrorMessage="L'adresse est requise"
                            ControlToValidate="txtAdresse" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblVille" runat="server" Text="Ville"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVille" runat="server" Text='<%# Bind("ville") %>' Width="120px"
                            MaxLength="20" ValidationGroup="creerCompte" TabIndex="7"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValVille" runat="server" ErrorMessage="La Ville est requise"
                            ControlToValidate="txtVille" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCodePostal" runat="server" Text='<%# Bind("codePostal") %>'
                            Width="90px" MaxLength="6" ValidationGroup="creerCompte" TabIndex="8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValCodePostal" runat="server" ErrorMessage="Le Code Postal est requis"
                            ControlToValidate="txtCodePostal" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExpValCodePostal" runat="server" ControlToValidate="txtCodePostal"
                            ErrorMessage="Le Code Postal doit être valide" ValidationExpression="^[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}(\-| |){1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}$"
                            ValidationGroup="creerCompte"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblProvince" runat="server" Text="Province"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProvince" runat="server" Width="175px" ValidationGroup="creerCompte"
                            TabIndex="9" SelectedValue='<%# Bind("province") %>'>
                            <asp:ListItem Value="Alberta">Alberta</asp:ListItem>
                            <asp:ListItem Value="Colombie Britannique">Colombie Britannique</asp:ListItem>
                            <asp:ListItem Value="Manitoba">Manitoba</asp:ListItem>
                            <asp:ListItem Value="Nouveau Brunswick">Nouveau Brunswick</asp:ListItem>
                            <asp:ListItem Value="Terre-Neuve-et-Labrador">Terre-Neuve-et-Labrador</asp:ListItem>
                            <asp:ListItem Value="Nouvelle-Écosee">Nouvelle-Écosse</asp:ListItem>
                            <asp:ListItem Value="Nunavut">Nunavut</asp:ListItem>
                            <asp:ListItem Value="Territoires du Nord-Ouest">Territoires du Nord-Ouest</asp:ListItem>
                            <asp:ListItem Value="Ontario">Ontario</asp:ListItem>
                            <asp:ListItem Value="Île-du-Prince-Édouard">Île-du-Prince-Édouard</asp:ListItem>
                            <asp:ListItem Value="Québec">Québec</asp:ListItem>
                            <asp:ListItem Value="Saskatchewan">Saskatchewan</asp:ListItem>
                            <asp:ListItem Value="Yukon">Yukon</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblTelephone" runat="server" Text="Numéro de Téléphone"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoTelephone" runat="server" Text='<%# Bind("noTelephone") %>'
                            Width="170px" MaxLength="10" ValidationGroup="creerCompte" TabIndex="10" />
                        &nbsp;<asp:RequiredFieldValidator ID="ReqValNoTelephone" runat="server" ErrorMessage="Le Numéro Téléhpone est requis"
                            ControlToValidate="txtNoTelephone" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExpValNoTelephone" runat="server" ControlToValidate="txtNoTelephone"
                            ErrorMessage="Le Numéro Téléphone n'est pas valide" ValidationExpression="^[01]?\(?[2-9]\d{2}\)?\d{3}?\d{4}$"
                            ValidationGroup="creerCompte"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblEmail" runat="server" Text="Adresse Courriel"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' Width="200px"
                            MaxLength="30" ValidationGroup="creerCompte" TabIndex="11"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValAdresseCourriel" runat="server" ErrorMessage="L'adresse Courriel est requise"
                            ControlToValidate="txtEmail" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExpValEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="L'adresse Courriel n'est pas valide" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ValidationGroup="creerCompte"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblDateNaissance" runat="server" Text="Date de Naissance"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDateNaissance" runat="server" Text='<%# Bind("clients.dateNaissance") %>'
                            MaxLength="11"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateNaissance">
                        </asp:CalendarExtender>
                    </td>
                </tr>
            </table>
            <h2>
                Choissisez votre mot de passe et votre Utilisateur</h2>
            <table style="width: 100%">
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblNomUtilisateur" runat="server" Text="Nom d'utilisateur"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNomUtilisateur" runat="server" Text='<%# Bind("clients.username") %>'
                            Width="170px" ValidationGroup="creerCompte" MaxLength="15" TabIndex="15"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValNomUtilisateur" runat="server" ErrorMessage="Le Nom d'utilisateur est requis"
                            ControlToValidate="txtNomUtilisateur" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblMotPasse" runat="server" Text="Mot de passe"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMotPasse" runat="server" Text='<%# Bind("clients.password") %>' Width="170px"
                            TextMode="Password" ValidationGroup="creerCompte" MaxLength="15" TabIndex="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValMotPasse" runat="server" ErrorMessage="Le Mot de passe est requis"
                            ControlToValidate="txtMotPasse" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 210px">
                        <asp:Label ID="lblMotPasseRessaisir" runat="server" Text="Saisir le mot de passe de nouveau"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMotPasseRessaisir" runat="server" Width="170px" TextMode="Password"
                            ValidationGroup="creerCompte" MaxLength="15" TabIndex="17"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqValMotPasseRessaisir" runat="server" ErrorMessage="Vous devez saisir le mot de passe à nouveau"
                            ControlToValidate="txtMotPasseRessaisir" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                        &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtMotPasse"
                            ControlToValidate="txtMotPasseRessaisir" ErrorMessage="Le Mot de passe doit être le même"
                            ValidationGroup="creerCompte"></asp:CompareValidator>
                    </td>
                    <%--**************************************À Changer *****************************************--%>
                    <td style="width: 210px">
                        <asp:Label ID="lblUser" runat="server" Text="Type d'utilisateur"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTypeUtilisateur" runat="server" Text='<%# Bind("clients.typeUtilisateur") %>'
                            ValidationGroup="creerCompte"></asp:TextBox>
                    </td>
                    <asp:Button ID="btnInsertComtpe" runat="server" Text="Créer le compte" ValidationGroup="creerCompte"
                        CommandName="Insert" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                </tr>
            </table>
    </asp:ListView>

    <asp:EntityDataSource ID="dsClients" runat="server" ConnectionString="name=ModelContainer"
        DefaultContainerName="ModelContainer" EntitySetName="clientsSet" EnableUpdate="True"
        Where="(@noClient = it.noClient)">
        <WhereParameters>
            <asp:Parameter DefaultValue="3" Name="noClient" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:ScriptManager ID="scriptManageDateNaissance" runat="server">
    </asp:ScriptManager>
</asp:Content>
