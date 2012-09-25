<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="CreerDossier.aspx.vb" Inherits="CreerDossier" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contenu" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    Information sur le client
    <asp:ListView ID="lvClients" runat="server" DataKeyNames="username,password" DataSourceID="dsClients">
        <LayoutTemplate>
            <table runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse;
                border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </table>
            <div style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;
                color: #333333;">
            </div>
        </LayoutTemplate>
        <AlternatingItemTemplate>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #FFCC66; color: #000080;">
                username:
                <asp:Label ID="usernameLabel1" runat="server" Text='<%# Eval("username") %>' />
                <br />
                password:
                <asp:Label ID="passwordLabel1" runat="server" Text='<%# Eval("password") %>' />
                <br />
                typeUtilisateur:
                <asp:TextBox ID="typeUtilisateurTextBox" runat="server" Text='<%# Bind("typeUtilisateur") %>' />
                <br />
                noClient:
                <asp:TextBox ID="noClientTextBox" runat="server" Text='<%# Bind("noClient") %>' />
                <br />
                noDossier:
                <asp:TextBox ID="noDossierTextBox" runat="server" Text='<%# Bind("noDossier") %>' />
                <br />
                nom:
                <asp:TextBox ID="nomTextBox" runat="server" Text='<%# Bind("nom") %>' />
                <br />
                prenom:
                <asp:TextBox ID="prenomTextBox" runat="server" Text='<%# Bind("prenom") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                dateNaissance:
                <asp:TextBox ID="dateNaissanceTextBox" runat="server" Text='<%# Bind("dateNaissance") %>' />
                <br />
                dossiers:
                <asp:TextBox ID="dossiersTextBox" runat="server" Text='<%# Bind("dossiers") %>' />
                <br />
                dossiers.noDossier:
                <asp:TextBox ID="dossiers_noDossierTextBox" runat="server" Text='<%# Bind("dossiers.noDossier") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999;
                border-style: none; border-width: 1px;">
                <tr>
                    <td>
                        No data was returned.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">
                username:
                <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                <br />
                typeUtilisateur:
                <asp:TextBox ID="typeUtilisateurTextBox" runat="server" Text='<%# Bind("typeUtilisateur") %>' />
                <br />
                noClient:
                <asp:TextBox ID="noClientTextBox" runat="server" Text='<%# Bind("noClient") %>' />
                <br />
                noDossier:
                <asp:TextBox ID="noDossierTextBox" runat="server" Text='<%# Bind("noDossier") %>' />
                <br />
                nom:
                <asp:TextBox ID="nomTextBox" runat="server" Text='<%# Bind("nom") %>' />
                <br />
                prenom:
                <asp:TextBox ID="prenomTextBox" runat="server" Text='<%# Bind("prenom") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                dateNaissance:
                <asp:TextBox ID="dateNaissanceTextBox" runat="server" Text='<%# Bind("dateNaissance") %>' />
                <br />
                dossiers:
                <asp:TextBox ID="dossiersTextBox" runat="server" Text='<%# Bind("dossiers") %>' />
                <br />
                dossiers.noDossier:
                <asp:TextBox ID="dossiers_noDossierTextBox" runat="server" Text='<%# Bind("dossiers.noDossier") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNom" runat="server" Width="170px" MaxLength="20" ValidationGroup="creerCompte"
                    TabIndex="4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqValNom" runat="server" ErrorMessage="Le Nom est requis"
                    ControlToValidate="txtNom" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
                <td style="width: 210px">
                    <asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPrenom" runat="server" Width="170px" MaxLength="20" ValidationGroup="creerCompte"
                        TabIndex="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValPrenom" runat="server" ErrorMessage="Le Prénom est requis"
                        ControlToValidate="txtPrenom" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 210px">
                    <asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdresse" runat="server" Width="200px" MaxLength="30" ValidationGroup="creerCompte"
                        TabIndex="6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValAdresse" runat="server" ErrorMessage="L'adresse est requise"
                        ControlToValidate="txtAdresse" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 210px">
                    <asp:Label ID="lblVille" runat="server" Text="Ville"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtVille" runat="server" Width="120px" MaxLength="20" ValidationGroup="creerCompte"
                        TabIndex="7"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValVille" runat="server" ErrorMessage="La Ville est requise"
                        ControlToValidate="txtVille" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 210px">
                    <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCodePostal" runat="server" Width="90px" MaxLength="6" ValidationGroup="creerCompte"
                        TabIndex="8"></asp:TextBox>
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
                        TabIndex="9">
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
                    <asp:TextBox ID="txtNoTelephone" runat="server" Width="170px" MaxLength="10" ValidationGroup="creerCompte"
                        TabIndex="10" />
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
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="30" ValidationGroup="creerCompte"
                        TabIndex="11"></asp:TextBox>
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
                    <asp:TextBox ID="txtDateNaissance" runat="server" MaxLength="11"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateNaissance">
                    </asp:CalendarExtender>
                </td>
            </tr>
        </ItemTemplate>
        <SelectedItemTemplate>
        </SelectedItemTemplate>
    </asp:ListView>
    <p>
        Créer votre nom d&#39;utilisateur et votre mot de passe pour vous connecter au site</p>
    <table style="width: 100%">
        <tr>
            <td style="width: 210px">
                <asp:Label ID="lblNomUtilisateur" runat="server" Text="Nom d'utilisateur"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNomUtilisateur" runat="server" Width="170px" ValidationGroup="creerCompte"
                    MaxLength="15" TabIndex="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqValNomUtilisateur" runat="server" ErrorMessage="Le Nom d'utilisateur est requis"
                    ControlToValidate="txtNomUtilisateur" ValidationGroup="creerCompte"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 210px">
                <asp:Label ID="lblMotPasse" runat="server" Text="Mot de passe"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtMotPasse" runat="server" Width="170px" TextMode="Password" ValidationGroup="creerCompte"
                    MaxLength="15" TabIndex="16"></asp:TextBox>
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
        </tr>
    </table>
    <p>
        <asp:Button ID="btnCreerCompte" runat="server" Text="Créer Compte" ValidationGroup="creerCompte" />
        <asp:EntityDataSource ID="dsClients" runat="server" ConnectionString="name=ModelContainer"
            DefaultContainerName="ModelContainer" EntitySetName="usersJeu" EntityTypeFilter="clients">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="dsUsers" runat="server" ConnectionString="name=ModelContainer"
            DefaultContainerName="ModelContainer" EnableFlattening="False" EntitySetName="usersJeu">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="dsDossiers" runat="server" ConnectionString="name=ModelContainer"
            DefaultContainerName="ModelContainer" EnableFlattening="False" EntitySetName="dossiersJeu">
        </asp:EntityDataSource>
        <asp:ScriptManager ID="scriptManageDateNaissance" runat="server">
        </asp:ScriptManager>
</asp:Content>
