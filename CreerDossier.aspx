<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="CreerDossier.aspx.vb" Inherits="CreerDossier" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="contenu" ContentPlaceHolderID="placeHolderContenu" runat="Server">
                    <asp:ListView ID="lvDossier" runat="server" DataSourceID="dsDossier" DataKeyNames="noDossier" InsertItemPosition="LastItem">
                <ItemTemplate>           
                </ItemTemplate>
                <InsertItemTemplate>
                <h2>Informations personnels</h2>
                <table style="width: 100%">        
                <tr>
                    <td style="width: 224px; height: 45px;">
                        <asp:Label ID="lblNom" runat="server" Text="Nom*"></asp:Label>
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:TextBox ID="txtNom" runat="server" Width="170px" MaxLength="20" ValidationGroup="creerCompte"
                            TabIndex="4" />
                         
                        <br />
                        <asp:RequiredFieldValidator ID="ReqValNom" runat="server"
                            ControlToValidate="txtNom" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Nom est requis</asp:RequiredFieldValidator> 
                            </td>
                </tr>
                <tr>
                    <td style="width: 224px; height: 45px;">
                        <asp:Label ID="lblPrenom" runat="server" Text="Prénom*"></asp:Label>
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:TextBox ID="txtPrenom" runat="server" Width="170px" MaxLength="20" ValidationGroup="creerCompte"
                            TabIndex="5" />
                        
                        <br />
                        <asp:RequiredFieldValidator ID="ReqValPrenom" runat="server"
                            ControlToValidate="txtPrenom" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Prénom est requis</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 225px; height: 45px;">
                        <asp:Label ID="lblDateNaissance" runat="server" Text="Date de Naissance*"></asp:Label>
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:TextBox ID="txtDateNaissance" runat="server" MaxLength="10" Height="16px" 
                            Width="67px" Enabled="True" />
                        <asp:TextBoxWatermarkExtender ID="txtDateNaissance_TextBoxWatermarkExtender" 
                            runat="server" TargetControlID="txtDateNaissance" WatermarkCssClass="waterMark" 
                            WatermarkText="jj/mm/aaaa">
                        </asp:TextBoxWatermarkExtender>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                            TargetControlID="txtDateNaissance" DefaultView="Years" 
                            TodaysDateFormat="dd MMMM yyyy">
                        </asp:CalendarExtender>
                    
                    <br />
                        <asp:RequiredFieldValidator ID="reqValDateNaissance" runat="server" ValidationGroup="creerCompte" ControlToValidate="txtDateNaissance" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Date de Naissance est requise</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="compValDateNaissance" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateNaissance" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Date de Naissance n'est pas valide</asp:CompareValidator>
                </td> 
                </tr>
                <tr>
                    <td style="width: 224px; height: 45px;">
                        <asp:Label ID="lblAdresse" runat="server" Text="Adresse*"></asp:Label>
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:TextBox ID="txtAdresse" runat="server" Width="200px" MaxLength="30" ValidationGroup="creerCompte"
                            TabIndex="6" />
                        
                        <br />
                        <asp:RequiredFieldValidator ID="ReqValAdresse" runat="server"
                            ControlToValidate="txtAdresse" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> L'adresse est requise</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 224px; height: 45px;">
                        <asp:Label ID="lblVille" runat="server" Text="Ville*"></asp:Label>
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:TextBox ID="txtVille" runat="server" Width="120px" MaxLength="20" ValidationGroup="creerCompte"
                            TabIndex="7" />
                        
                        <br />
                        <asp:RequiredFieldValidator ID="ReqValVille" runat="server"
                            ControlToValidate="txtVille" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> La Ville est requise</asp:RequiredFieldValidator>
                    </td>
                </tr> 
                <tr>
                    <td style="width: 224px; height: 45px;">
                        <asp:Label ID="lblProvince" runat="server" Text="Province*"></asp:Label>
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:DropDownList ID="ddlProvince" runat="server" Width="175px" ValidationGroup="creerCompte"
                            TabIndex="9" >
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
                        <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal" />
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:TextBox ID="txtCodePostal" runat="server" Width="60px" MaxLength="7" ValidationGroup="creerCompte"
                            TabIndex="9" Height="21px" />
                        
                        <br />
                        <asp:RequiredFieldValidator ID="ReqValCodePostal" runat="server"
                            ControlToValidate="txtCodePostal" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Code Postal est requis</asp:RequiredFieldValidator>
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
                            TabIndex="10" Height="19px" />
                        <asp:TextBoxWatermarkExtender ID="txtNoTelephone_TextBoxWatermarkExtender" 
                            runat="server" TargetControlID="txtNoTelephone" WatermarkCssClass="waterMark" 
                            WatermarkText="(450)555-5555">
                        </asp:TextBoxWatermarkExtender>
                     
                     <br />
                     <asp:RequiredFieldValidator ID="ReqValNoTelephone" runat="server"
                            ControlToValidate="txtNoTelephone" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Numéro Téléphone est requis</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExpValNoTelephone" runat="server" ControlToValidate="txtNoTelephone"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Numéro Téléphone n'est pas valide</asp:RegularExpressionValidator> 
                            </td>
                </tr>
                <tr>
                    <td style="width: 224px; height: 45px;">
                        <asp:Label ID="lblEmail" runat="server" Text="Adresse Courriel"></asp:Label>
                    </td>
                    <td style="height: 45px; width: 240px;">
                        <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="50" ValidationGroup="creerCompte"
                            TabIndex="11" />
                        
                        <br />
                        <asp:RequiredFieldValidator ID="ReqValAdresseCourriel" runat="server"
                            ControlToValidate="txtEmail" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> L'adresse Courriel est requise</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExpValEmail" runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> L'adresse Courriel n'est pas valide</asp:RegularExpressionValidator>
                    </td>
                </tr>
                </table>
                <h2>
                    Choissisez votre mot de passe et votre nom d&#39;Utilisateur</h2>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 225px; height: 45px;">
                            <asp:Label ID="lblNomUtilisateur" runat="server" Text="Nom d'utilisateur*"></asp:Label>
                        </td>
                        <td style="height: 45px; width: 240px;">
                            <asp:TextBox ID="txtNomUtilisateur" runat="server" Width="200px" ValidationGroup="creerCompte"
                                MaxLength="15" TabIndex="15" Height="21px" />
                            <asp:TextBoxWatermarkExtender ID="txtNomUtilisateur_TextBoxWatermarkExtender" 
                                runat="server" TargetControlID="txtNomUtilisateur" 
                                WatermarkCssClass="waterMark" WatermarkText="Permet de se connecter au site">
                            </asp:TextBoxWatermarkExtender>
                            
                            <br />
                            <asp:RequiredFieldValidator ID="ReqValNomUtilisateur" runat="server"
                                ControlToValidate="txtNomUtilisateur" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Nom d'utilisateur est requis</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 225px; height: 45px;">
                            <asp:Label ID="lblMotPasse" runat="server" Text="Mot de passe*"></asp:Label>
                        </td>
                        <td style="height: 45px; width: 240px;">
                            <asp:TextBox ID="txtMotPasse" runat="server" Width="200px" TextMode="Password" ValidationGroup="creerCompte"
                                MaxLength="15" TabIndex="16" Height="21px" />
                            
                            <br />
                            <asp:RequiredFieldValidator ID="ReqValMotPasse" runat="server"
                                ControlToValidate="txtMotPasse" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Mot de passe est requis</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                        <td style="width: 225px; height: 45px;">
                            <asp:Label ID="lblMotPasseRessaisir" runat="server" Text="Saisir le mot de passe de nouveau*"></asp:Label>
                        </td>
                        <td style="height: 45px; width: 240px;">
                            <asp:TextBox ID="txtMotPasseRessaisir" runat="server" Width="200px" TextMode="Password"
                                ValidationGroup="creerCompte" MaxLength="15" TabIndex="17" Height="22px"></asp:TextBox>
                            
                            <br />
                            <asp:RequiredFieldValidator ID="ReqValMotPasseRessaisir" runat="server" ErrorMessage=""
                                ControlToValidate="txtMotPasseRessaisir" ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le mot de passe doit être entrer deux fois</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="compValMotPasseRessaisir" runat="server" ControlToCompare="txtMotPasse"
                                ControlToValidate="txtMotPasseRessaisir"
                                ValidationGroup="creerCompte" Display="Dynamic" CssClass="controleValidation"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge"> Le Mot de passe doit être le même</asp:CompareValidator>
                        </td> 
                        <tr>
                        <td style="width: 225px; height: 45px;">
                        <asp:Label ID="lblTypeUtilisateur" runat="server" Text="Type de l'utilisateur" Visible="False"></asp:Label>
                        </td>
                        <td style="height: 45px; width: 240px;">
                            <asp:DropDownList ID="ddlTypeUtilisateur" runat="server" AppendDataBoundItems="true"
                                ValidationGroup="creerCompte" Visible="False" >
                                <asp:ListItem Value="Client">Client</asp:ListItem>
                                <asp:ListItem Value="Administrateur">Administrateur</asp:ListItem>
                                <asp:ListItem Value="Préposé">Préposé</asp:ListItem>
                                <asp:ListItem Value="Professeur">Professeur</asp:ListItem>
                            </asp:DropDownList>
                        </td>               
                        <td> 
                        <asp:Button ID="btnInsertCompte" runat="server" Text="Créer le compte" 
                                ValidationGroup="creerCompte" style="margin-left: 34px" /> 
                        <asp:Button ID="btnCancel" runat="server" Text="Annuler" CausesValidation="False" ValidationGroup="creerCompte" CommandName="Cancel" /> 
                        </td> 
                        </tr>
                        </table>
                </InsertItemTemplate>
                </asp:ListView>   
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization ="true" 
    EnableScriptLocalization ="true">   
    </asp:ScriptManager>
            <asp:EntityDataSource ID="dsDossier" runat="server" 
                ConnectionString="name=ModelContainer1" DefaultContainerName="ModelContainer1" 
                EnableFlattening="False" EntitySetName="dossiersJeu" Include="clients" 
                EnableUpdate="True" EnableInsert="True" />
</asp:Content>
