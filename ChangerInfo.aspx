<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="ChangerInfo.aspx.vb" Inherits="CreerDossier" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contenu" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="mltClientDossier" runat="server" ActiveViewIndex="0">
        <asp:View runat="server">
            <asp:DataPager ID="datePagerlvClient" runat="server" PagedControlID="lvClient" PageSize="4" style="margin-left: 210px">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
            <table>
                <tr>
                    <td style="width: 240px; height: 45px;">
                        <asp:Label ID="lblNom" runat="server" Text="Nom" />
                    </td>
                    <td style="width: 240px; height: 45px;">
                        <asp:Label ID="lblPrenom" runat="server" Text="Prénom" />
                    </td>
                    <td style="width: 240px; height: 45px;">
                        <asp:Label ID="lblDateNaissance" runat="server" Text="Date de Naissance" />
                    </td>
                </tr>
            </table>
            <asp:ListView ID="lvClient" runat="server" DataSourceID="dsClient" DataKeyNames="noClient"
                InsertItemPosition="LastItem">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtNom" runat="server" Width="170px" Text='<%# Eval("nom") %>' />
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtPrenom" runat="server" Width="170px" Text='<%# Eval("prenom")%>' />
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtDateNaissance" runat="server" Text='<%# Eval("dateNaissance") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 20px;">
                                <asp:Button ID="btnEditerUtilisateur" runat="server" Text="Editer" CommandName="Edit" />
                                <asp:Button ID="btnSupprimerUtilisateur" runat="server" Text="Supprimer" CommandName="Delete" />
                            </td>
                        </tr>
                </ItemTemplate>
                <InsertItemTemplate>
                    <table style="width: 100%">
                        <h2>
                            Ajouter un nouvel utilisateur</h2>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblNom" runat="server" Text="Nom*" />
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtInsertNom" runat="server" Width="170px" MaxLength="20" ValidationGroup="creerUtilisateur"
                                    TabIndex="3" Text='<%# Bind("nom") %>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValNom" runat="server" ControlToValidate="txtInsertNom"
                                    ValidationGroup="creerUtilisateur" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Nom est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblPrenom" runat="server" Text="Prénom*" />
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtInsertPrenom" runat="server" Width="170px" MaxLength="20" ValidationGroup="creerUtilisateur"
                                    TabIndex="4" Text='<%# Bind("prenom") %>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValPrenom" runat="server" ControlToValidate="txtInsertPrenom"
                                    ValidationGroup="creerUtilisateur" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Prénom est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 225px; height: 45px;">
                                <asp:Label ID="lblDateNaissance" runat="server" Text="Date de Naissance*" />
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtInsertDateNaissance" runat="server" MaxLength="10" Height="16px"
                                    TabIndex="5" Width="67px" Enabled="True" Text='<%# Bind("dateNaissance") %>' />
                                <asp:TextBoxWatermarkExtender ID="txtInsertDateNaissance_TextBoxWatermarkExtender"
                                    runat="server" TargetControlID="txtInsertDateNaissance" WatermarkCssClass="waterMark"
                                    WatermarkText="jj/mm/aaaa">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtInsertDateNaissance"
                                    DefaultView="Years" TodaysDateFormat="dd MMMM yyyy">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValDateNaissance" runat="server" ValidationGroup="creerUtilisateur"
                                    ControlToValidate="txtInsertDateNaissance" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Date de Naissance est requise</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rangeValDateNaissanceMax" runat="server" ValidationGroup="creerUtilisateur"
                                    ControlToValidate="txtInsertDateNaissance" CssClass="controleValidation" MinimumValue="12/12/1900"
                                    MaximumValue='<%# DateTime.Today.ToShortDateString() %>' Type="Date"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Date de Naissance n'est pas valide</asp:RangeValidator>
                                <asp:HiddenField ID="hiddenFieldnoDossierClient" runat="server" Value='<%# Bind("noDossier") %>' />
                            </td>
                        </tr>
                    </table>
                    <table style="width: 100%; padding-top: 20px">
                        <tr>
                            <td>
                                <asp:Button ID="btnAjouterUser" runat="server" Text="Créer un nouveau usagé" ValidationGroup="creerUtilisateur"
                                    Style="float: left" CommandName="Insert" />
                                <asp:Button ID="btnRetablir" runat="server" Text="Rétablir" CausesValidation="False"
                                    ValidationGroup="creerUtilisateur" CommandName="Cancel" Style="float: left; margin-left: 10px" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table>
                        <tr style="width:100%;">
                            <td style="width: 240px;">
                                <asp:TextBox ID="txtInsertNom" runat="server" Width="150px" MaxLength="20" ValidationGroup="creerUtilisateur"
                                    TabIndex="3" Text='<%# Bind("nom") %>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValNom" runat="server" ControlToValidate="txtInsertNom"
                                    ValidationGroup="modifierUtilisateur" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Nom est requis</asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 240px;">
                                <asp:TextBox ID="txtInsertPrenom" runat="server" Width="150px" MaxLength="20" ValidationGroup="modifierUtilisateur"
                                    TabIndex="4" Text='<%# Bind("prenom") %>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValPrenom" runat="server" ControlToValidate="txtInsertPrenom"
                                    ValidationGroup="modifierUtilisateur" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Prénom est requis</asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 240px;">
                                <asp:TextBox ID="txtInsertDateNaissance" runat="server" MaxLength="10" TabIndex="5"
                                    Width="67px" Enabled="True" Text='<%# Bind("dateNaissance") %>' />
                                <asp:TextBoxWatermarkExtender ID="txtInsertDateNaissance_TextBoxWatermarkExtender"
                                    runat="server" TargetControlID="txtInsertDateNaissance" WatermarkCssClass="waterMark"
                                    WatermarkText="jj/mm/aaaa">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtInsertDateNaissance"
                                    DefaultView="Years" TodaysDateFormat="dd MMMM yyyy">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValDateNaissance" runat="server" ValidationGroup="modifierUtilisateur"
                                    ControlToValidate="txtInsertDateNaissance" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Date de Naissance est requise</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rangeValDateNaissanceMax" runat="server" ValidationGroup="modifierUtilisateur"
                                    ControlToValidate="txtInsertDateNaissance" CssClass="controleValidation" MinimumValue="12/12/1900"
                                    MaximumValue='<%# DateTime.Today.ToShortDateString() %>' Type="Date"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Date de Naissance n'est pas valide</asp:RangeValidator>
                            </td>
                        </tr>
                        </table>
                        <table>
                        <tr align="right">
                            <td style="height: 45px; width:100%; padding-top: 10px;">
                                <asp:Button ID="btnAjouterUser" runat="server" Text="Enregistrer les modifications"
                                    ValidationGroup="modifierUtilisateur" Style="float: left" CommandName="Update" />
                                <asp:Button ID="btnRetablir" runat="server" Text="Cancel" CausesValidation="False"
                                    ValidationGroup="modifierUtilisateur" CommandName="Cancel" Style="float: left;" />          
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField ID="hiddenFieldnoDossierClient" runat="server" Value='<%# Bind("noDossier") %>' />
                </EditItemTemplate>
            </asp:ListView>
            <asp:Button ID="btnInfoDossier" runat="server" Text="Consulter le dossier" />
        </asp:View>
        <asp:View runat="server">
            <asp:ListView ID="lvDossier" runat="server" DataSourceID="dsDossier" DataKeyNames="noDossier">
                <ItemTemplate>
                    <table>
                        <h2>
                            Informations personnels</h2>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblAdresse" runat="server" Text="Adresse :"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtAdresse" runat="server" Width="200px" MaxLength="30" ValidationGroup="creerCompte"
                                    TabIndex="6" Text='<%# Eval("adresse")%>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblVille" runat="server" Text="Ville :"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtVille" runat="server" Width="120px" MaxLength="20" ValidationGroup="creerCompte"
                                    TabIndex="7" Text='<%# Eval("ville")%>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblProvince" runat="server" Text="Province :"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="ddlProvince" runat="server" Width="175px" ValidationGroup="creerCompte"
                                    TabIndex="8" Text='<%# Eval("province")%>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal :" />
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtCodePostal" runat="server" Width="60px" MaxLength="7" ValidationGroup="creerCompte"
                                    TabIndex="9" Height="21px" Text='<%# Eval("codePostal")%>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblTelephone" runat="server" Text="Numéro de Téléphone :"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtNoTelephone" runat="server" Width="150px" MaxLength="13" ValidationGroup="creerCompte"
                                    TabIndex="10" Height="19px" Text='<%# Eval("noTelephone")%>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblEmail" runat="server" Text="Adresse Courriel :"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtEmail" runat="server" Width="200px" MaxLength="50" ValidationGroup="creerCompte"
                                    TabIndex="11" Text='<%# Eval("email")%>' />
                            </td>
                        </tr>
                    </table>
                    <h2>
                        Informations sur l'authentification</h2>
                    <table>
                        <tr>
                            <td style="width: 225px; height: 45px;">
                                <asp:Label ID="lblNomUtilisateur" runat="server" Text="Nom d'utilisateur :"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:Label ID="txtNomUtilisateur" runat="server" Width="200px" ValidationGroup="creerCompte"
                                    MaxLength="15" TabIndex="12" Height="21px" Text='<%# Eval("username")%>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 20px">
                                <asp:Button runat="server" ID="btnEditInfoDossier" Text="Éditer les information"
                                    CommandName="Edit" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table>
                        <h2>
                            Informations personnels</h2>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblAdresse" runat="server" Text="Adresse*"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtAdresse" runat="server" Width="200px" MaxLength="30" ValidationGroup="creerCompte"
                                    TabIndex="6" Text='<%# Bind("adresse")%>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValAdresse" runat="server" ControlToValidate="txtAdresse"
                                    ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> L'adresse est requise</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblVille" runat="server" Text="Ville*"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtVille" runat="server" Width="120px" MaxLength="20" ValidationGroup="creerCompte"
                                    TabIndex="7" Text='<%# Bind("ville")%>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValVille" runat="server" ControlToValidate="txtVille"
                                    ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Ville est requise</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblProvince" runat="server" Text="Province*"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:DropDownList ID="ddlProvince" runat="server" Width="175px" ValidationGroup="creerCompte"
                                    TabIndex="8" SelectedValue='<%# Bind("province")%>'>
                                    <asp:ListItem Value="Québec">Québec</asp:ListItem>
                                    <asp:ListItem Value="Alberta">Alberta</asp:ListItem>
                                    <asp:ListItem Value="Colombie Britannique">Colombie Britannique</asp:ListItem>
                                    <asp:ListItem Value="Île-du-Prince-Édouard">Île-du-Prince-Édouard</asp:ListItem>
                                    <asp:ListItem Value="Manitoba">Manitoba</asp:ListItem>
                                    <asp:ListItem Value="Nouveau Brunswick">Nouveau Brunswick</asp:ListItem>
                                    <asp:ListItem Value="Nouvelle-Écosee">Nouvelle-Écosse</asp:ListItem>
                                    <asp:ListItem Value="Nunavut">Nunavut</asp:ListItem>
                                    <asp:ListItem Value="Ontario">Ontario</asp:ListItem>
                                    <asp:ListItem Value="Saskatchewan">Saskatchewan</asp:ListItem>
                                    <asp:ListItem Value="Terre-Neuve-et-Labrador">Terre-Neuve-et-Labrador</asp:ListItem>
                                    <asp:ListItem Value="Territoires du Nord-Ouest">Territoires du Nord-Ouest</asp:ListItem>
                                    <asp:ListItem Value="Yukon">Yukon</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal*" />
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtCodePostal" runat="server" Width="60px" MaxLength="7" ValidationGroup="creerCompte"
                                    TabIndex="9" Height="21px" Text='<%# Bind("codePostal")%>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValCodePostal" runat="server" ControlToValidate="txtCodePostal"
                                    ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Code Postal est requis</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExpValCodePostal" runat="server" ControlToValidate="txtCodePostal"
                                    ErrorMessage="" ValidationExpression="^[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}(\-| |){1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}$"
                                    ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Code Postal doit être valide</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblTelephone" runat="server" Text="Numéro de Téléphone*"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtNoTelephone" runat="server" Width="90px" MaxLength="13" ValidationGroup="creerCompte"
                                    TabIndex="10" Height="19px" Text='<%# Bind("noTelephone")%>' />
                                <asp:TextBoxWatermarkExtender ID="txtNoTelephone_TextBoxWatermarkExtender" runat="server"
                                    TargetControlID="txtNoTelephone" WatermarkCssClass="waterMark" WatermarkText="(450)555-5555">
                                </asp:TextBoxWatermarkExtender>
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValNoTelephone" runat="server" ControlToValidate="txtNoTelephone"
                                    ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Numéro Téléphone est requis</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExpValNoTelephone" runat="server" ControlToValidate="txtNoTelephone"
                                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="creerCompte"
                                    Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Numéro Téléphone n'est pas valide</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 224px; height: 45px;">
                                <asp:Label ID="lblEmail" runat="server" Text="Adresse Courriel*"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="50" ValidationGroup="creerCompte"
                                    TabIndex="11" Text='<%# Bind("email")%>' />
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValAdresseCourriel" runat="server" ControlToValidate="txtEmail"
                                    ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> L'adresse Courriel est requise</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExpValEmail" runat="server" ControlToValidate="txtEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="creerCompte"
                                    Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> L'adresse Courriel n'est pas valide</asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="custValEmail" runat="server" ControlToValidate="txtEmail"
                                    OnServerValidate="chercherEmail" ValidationGroup="creerCompte" Display="Dynamic"
                                    CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le email est déjà utilisé</asp:CustomValidator>
                            </td>
                        </tr>
                    </table>
                    <h2>
                        Informations sur l'authentification</h2>
                    <table>
                        <tr>
                            <td style="width: 225px; height: 45px;">
                                <asp:Label ID="lblNomUtilisateur" runat="server" Text="Nom d'utilisateur*"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtNomUtilisateur" runat="server" Width="200px" ValidationGroup="creerCompte"
                                    MaxLength="15" TabIndex="12" Height="21px" Text='<%# Bind("username")%>' />
                                <asp:TextBoxWatermarkExtender ID="txtNomUtilisateur_TextBoxWatermarkExtender" runat="server"
                                    TargetControlID="txtNomUtilisateur" WatermarkCssClass="waterMark" WatermarkText="Permet de se connecter au site">
                                </asp:TextBoxWatermarkExtender>
                                <br />
                                <asp:RequiredFieldValidator ID="ReqValNomUtilisateur" runat="server" ControlToValidate="txtNomUtilisateur"
                                    ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Nom d'utilisateur est requis</asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="custValNomUtilisateur" runat="server" ControlToValidate="txtNomUtilisateur"
                                    OnServerValidate="chercherUsername" ValidationGroup="creerCompte" Display="Dynamic"
                                    CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le nom d'utilisateur existe déjà</asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 225px; height: 45px;">
                                <asp:Label ID="lblMotPasse" runat="server" Text="Nouveau mot de passe"></asp:Label>
                            </td>
                            <td style="height: 45px; width: 240px;">
                                <asp:TextBox ID="txtMotPasse" runat="server" Width="200px" TextMode="Password" ValidationGroup="creerCompte"
                                    MaxLength="15" TabIndex="13" Height="21px" />
                            </td>
                        </tr>
                        <td style="width: 225px; height: 45px;">
                            <asp:Label ID="lblMotPasseRessaisir" runat="server" Text="Saisir le mot de passe de nouveau"></asp:Label>
                        </td>
                        <td style="height: 45px; width: 240px;">
                            <asp:TextBox ID="txtMotPasseRessaisir" runat="server" Width="200px" TextMode="Password"
                                ValidationGroup="creerCompte" MaxLength="15" TabIndex="14" Height="22px"></asp:TextBox>
                            <br />
                            <asp:CompareValidator ID="compValMotPasseRessaisir" runat="server" ControlToCompare="txtMotPasse"
                                ControlToValidate="txtMotPasseRessaisir" ValidationGroup="creerCompte" Display="Dynamic"
                                CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Mot de passe doit être le même</asp:CompareValidator>
                        </td>
                        <tr>
                            <td style="padding-top: 20px">
                                <asp:Button runat="server" ID="btnSauvegardeInfoDossier" Text="Éditer les information"
                                    CommandName="Update" ValidationGroup="creerCompte" />
                            </td>
                        </tr>
                    </table>
                    <asp:HiddenField ID="hiddenFieldPassword" runat="server" Value='<%# Bind("password")%>' />
                </EditItemTemplate>
            </asp:ListView>
            <asp:Button ID="btnInfoClient" runat="server" Text="Consulter les clients" />
        </asp:View>
    </asp:MultiView>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true">
    </asp:ScriptManager>
    <asp:EntityDataSource ID="dsClient" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableInsert="True" EntitySetName="clients"
        EnableDelete="True" EnableUpdate="True" Where="(@noDossierClient = it.noDossier)">
        <WhereParameters>
            <asp:ControlParameter ControlID="hiddenFieldnoDossier" Name="noDossierClient" PropertyName="Value"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsDossier" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EnableUpdate="True"
        EntitySetName="dossiers" Where="(@noDossierClient = it.noDossier)">
        <WhereParameters>
            <asp:ControlParameter ControlID="hiddenFieldnoDossier" Name="noDossierClient" PropertyName="Value"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:HiddenField ID="hiddenFieldnoDossier" runat="server" />
</asp:Content>
