<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="aAfficheCours.aspx.vb" Inherits="aAfficheCours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="mvAfficherCours" runat="server" ActiveViewIndex="0">
        <asp:View ID="vAfficheActivite" runat="server">
            <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
            <asp:TextBox ID="txtRechercheActivite" runat="server"></asp:TextBox>
            <asp:AutoCompleteExtender ID="txtRechercheActivite_AutoCompleteExtender" runat="server"
                ContextKey="RechercheActivite" ServiceMethod="GetCompletionList" TargetControlID="txtRechercheActivite"
                UseContextKey="True" />
            <asp:Button ID="btnRechercherActivite" runat="server" Text="Rechercher l'activité" />
            <br />
            <asp:DataPager ID="dtPagerArticles" runat="server" PagedControlID="lvListeActivite"
                PageSize="6" style="margin-left: 210px;" Font-Bold="True">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button"
                        ShowNextPageButton="True" ShowPreviousPageButton="True" />
                    <asp:NumericPagerField />
                </Fields>
            </asp:DataPager>
            <br />
            <asp:ListView ID="lvListeActivite" runat="server" DataSourceID="dsActivite" DataKeyNames="noActivite">
                <EmptyDataTemplate>
                Il n'a pas d'activité 
                <br />
                </EmptyDataTemplate>
                <ItemTemplate>
                    <table style="border-style: ridge; width: 600px; padding-top: 10px; padding-bottom: 10px;
                        margin-top: 5px; margin-bottom: 5px" align="center">
                        <tr>
                            <td width="33%" align="center" style="border-bottom-style: solid; border-bottom-width: thin">
                                <asp:Label ID="lblNom" runat="server" Text="Nom de l'activitée"></asp:Label>
                            </td>
                            <td width="33%" align="center" style="border-bottom-style: solid; border-bottom-width: thin">
                                <asp:Label ID="lblClientele1" runat="server" Text="Clientèle"></asp:Label>
                            </td>
                            <td width="33%" align="center" style="border-bottom-style: solid; border-bottom-width: thin">
                                <asp:Label ID="lblTypeAct" runat="server" Text="Type d'activité"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%" align="center">
                                <asp:LinkButton ID="lnknomActivite" Text='<%#Eval("nomActivite")%>' runat="server"
                                    CommandArgument='<%#Eval("noActivite")%>' />
                            </td>
                            <td width="33%" align="center">
                                <asp:Label ID="lblModCli" runat="server" Text='<%#Eval("clientele")%>'></asp:Label>
                            </td>
                            <td width="33%" align="center">
                                <asp:Label ID="lblModType" runat="server" Text='<%#Eval("typeActivite")%>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%" align="center">
                                
                            </td>
                            <td width="33%" align="center">
                               
                            </td>
                            <td width="33%" align="center">
                                <asp:Button ID="btnModAct" runat="server" Text="Modifier" CommandName="Edit" />
                                <asp:Button ID="btnDelAct" runat="server" Text="Supprimer" CommandName="Delete" OnClientClick='<%# "return confirm(""Voulez-vous supprimer  " + Eval("nomActivite") + "?"")" %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table style="border-style: ridge; width: 600px; padding-top: 10px; padding-bottom: 10px;
                        margin-top: 5px; margin-bottom: 5px" align="center">
                        <tr>
                            <td width="33%" align="center" style="border-bottom-style: solid; border-bottom-width: thin">
                                <asp:Label ID="lblNom" runat="server" Text="Nom de l'activitée *"></asp:Label>
                            </td>
                            <td width="33%" align="center" style="border-bottom-style: solid; border-bottom-width: thin">
                                <asp:Label ID="lblClientele1" runat="server" Text="Clientèle *"></asp:Label>
                            </td>
                            <td width="33%" align="center" style="border-bottom-style: solid; border-bottom-width: thin">
                                <asp:Label ID="lblTypeAct" runat="server" Text="Type d'activité *"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%" align="center">
                                <asp:TextBox ID="txtEditNom" runat="server" Text='<%# Bind("nomActivite")%>'></asp:TextBox>
                                <br />
                            <asp:RequiredFieldValidator ID="reqValNomActivite" runat="server" CssClass="controleValidation" ControlToValidate="txtEditNom"><img alt="Image d'erreur" src="App_Themes/Default/images/imgErreur.png" />Le nom de l'activité est obligatoire</asp:RequiredFieldValidator>
                            </td>
                            <td width="33%" align="center">
                                <asp:DropDownList ID="ddlClientele" runat="server" Width="103px" SelectedValue='<%# Bind("clientele") %>'>
                                    <asp:ListItem Value="Adulte">Adulte</asp:ListItem>
                                    <asp:ListItem Value="Enfant">Enfant</asp:ListItem>
                                    <asp:ListItem Value="Parent">Parent</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="33%" align="center">
                                <asp:DropDownList ID="ddlTypeActivite" runat="server" Width="100px" SelectedValue='<%# Bind("typeActivite") %>'>
                                    <asp:ListItem Value="Culture">Culture</asp:ListItem>
                                    <asp:ListItem Value="Sport">Sport</asp:ListItem>
                                    <asp:ListItem Value="Loisir">Loisir</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                        <td style="width: 33%">
                        </td>
                            <td style="width: 33%;">
                            </td>
                            <td align="center" style=" width:33%;">
                                <asp:Button ID="btnConfMod" runat="server" Text="Enregistrer" CommandName="Update" />
                                <asp:Button ID="btnModAnn" runat="server" Text="Annuler" CommandName="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:ListView>

            <asp:Button ID="btnAjouteActivite" runat="server" Text="Ajouter une activité" />
        
        </asp:View> 

        <%--View 0 - Afficher les activités --%>

        <asp:View ID="vAfficheGroupe" runat="server">
            <asp:TextBox ID="txtRechercheGroupe" runat="server"></asp:TextBox>
            <asp:AutoCompleteExtender ID="autoCompRechercheGroupe" runat="server" ContextKey="RechercheGroupe"
                ServiceMethod="GetCompletionList" TargetControlID="txtRechercheGroupe" UseContextKey="True" />
            <asp:Button ID="btnRechercheGroupe" runat="server" Text="Chercher le groupe" />
            <br />
            <asp:ListView ID="lvListeGroupes" runat="server" DataSourceID="dsGroupe" DataKeyNames="noGroupe">
                <EmptyDataTemplate>
                    Il n'a pas de groupe pour cette activité
                    <br /> 
                </EmptyDataTemplate>
                <EditItemTemplate>
                    <table style="border: medium groove #FFFFFF; width: 100%">
                        <tr>
                            <td style="text-decoration: underline; font-weight: bold; width: 131px;" align="center">
                                Activité
                            </td>
                            <td style="text-decoration: underline; font-weight: bold;" align="center">
                                Nom du Professeur
                            </td>
                            <td style="text-decoration: underline; font-weight: bold; width: 103px;" align="center">
                                Age Minimum
                            </td>
                            <td style="text-decoration: underline; font-weight: bold;" align="center">
                                Age Maximum
                            </td>
                            <td align="center" style="text-decoration: underline; font-weight: bold">
                                Date de Debut
                            </td>
                            <td align="center">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px" align="center">
                                <asp:DropDownList ID="ddlModifActivite" runat="server" DataSourceID="dsActivite"
                                    DataTextField="nomActivite" DataValueField="noActivite" SelectedValue='<%#Bind("noActivite")%>'>
                                </asp:DropDownList>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtModifNomProf" runat="server" Text='<%#Bind("nomProf")%>' Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqValModifNomProf" runat="server" ErrorMessage="!"
                                    ControlToValidate="txtModifNomProf" ToolTip="Nom du prof requis " ValidationGroup="modif"
                                    Text="!" ForeColor="RED"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center" style="width: 103px">
                                <asp:TextBox ID="txtModifAgeMin" runat="server" Text='<%#Bind("ageMin")%>' Width="50px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqValModifAgeMin" runat="server" ErrorMessage="!"
                                    ControlToValidate="txtModifAgeMin" ToolTip="Age min requis " ValidationGroup="modif"
                                    Text="!" ForeColor="RED"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtModifAgeMax" runat="server" Text='<%#Bind("ageMax")%>' Width="50px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqValModifAgeMax" runat="server" ErrorMessage="!"
                                    ControlToValidate="txtModifAgeMax" ToolTip="Age max requis " ValidationGroup="modif"
                                    Text="!" ForeColor="RED"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtModifDateDebut" runat="server" Text='<%#Bind("dateDebut")%>'
                                    Width="70px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="txtModifDateDebut_TextBoxWatermarkExtender" runat="server"
                                    TargetControlID="txtModifDateDebut" WatermarkCssClass="waterMark" WatermarkText="jj/mm/aaaa">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtModifDateDebut"
                                    DefaultView="Years" TodaysDateFormat="dd MMMM yyyy">
                                </asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="reqValModifDateDebut" runat="server" ErrorMessage="!"
                                    ControlToValidate="txtModifDateDebut" ToolTip="Date de debut requis " ValidationGroup="modif"
                                    Text="!" ForeColor="RED" SetFocusOnError="False"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center">
                                <asp:Button ID="btnAccepter" runat="server" Text="Accepter" Width="70px" CommandName="Update"
                                    CommandArgument='<%#eval("noGroupe")%>' ValidationGroup="modif" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-decoration: underline; font-weight: bold; width: 131px;" align="center">
                                Nombre de Places
                            </td>
                            <td style="text-decoration: underline; font-weight: bold" align="center">
                                Préalables
                            </td>
                            <td style="text-decoration: underline; font-weight: bold; width: 103px;" align="center">
                                Session
                            </td>
                            <td style="text-decoration: underline; font-weight: bold" align="center">
                                Materiel Requis
                            </td>
                            <td align="center" style="font-weight: bold; text-decoration: underline">
                                Prix
                            </td>
                            <td align="center">
                                <asp:Button ID="btnAnnuler" runat="server" Text="Annuler" Width="70px" CommandName="Cancel" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; height: 23px;" align="center">
                                <asp:TextBox ID="txtModifNbPlace" runat="server" Text='<%#Bind("nbPlaceDisponible")%>'
                                    Width="50px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqValModifNbPlace" runat="server" ErrorMessage="!"
                                    ControlToValidate="txtModifNbPlace" ToolTip="Nombre de places requis " ValidationGroup="modif"
                                    Text="!" ForeColor="RED"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center" style="height: 23px">
                                <asp:TextBox ID="txtModifPrealable" runat="server" Text='<%#Bind("prealable")%>'
                                    Width="100px"></asp:TextBox>
                            </td>
                            <td align="center" style="width: 103px; height: 23px">
                                <asp:DropDownList ID="ddlModifSession" runat="server" SelectedValue='<%#Bind("session")%>'>
                                    <asp:ListItem Value="Été" Text="Été"></asp:ListItem>
                                    <asp:ListItem Value="Hiver" Text="Hiver"></asp:ListItem>
                                    <asp:ListItem Value="Printemps" Text="Printemps"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="center" style="height: 23px">
                                <asp:TextBox ID="txtModifMateriel" runat="server" Text='<%#Bind("materielRequis")%>'
                                    Width="100px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqValModifMateriel" runat="server" ErrorMessage="!"
                                    ControlToValidate="txtModifMateriel" ToolTip="Materiel requis" ValidationGroup="modif"
                                    Text="!" ForeColor="RED"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center" style="height: 23px">
                                <asp:TextBox ID="txtModifPrix" runat="server" Text='<%#Bind("prix")%>' Width="40px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqValModifPrix" runat="server" ErrorMessage="!"
                                    ControlToValidate="txtModifPrix" ToolTip="Prix requis" ValidationGroup="modif"
                                    Text="!" ForeColor="RED"></asp:RequiredFieldValidator>
                            </td>
                            <td align="center" style="height: 23px">
                            </td>
                        </tr>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table style="border: medium groove #FFFFFF; width: 100%">
                        <tr>
                            <td style="text-decoration: underline; font-weight: bold; width: 131px;" align="center">
                                Activité
                            </td>
                            <td style="text-decoration: underline; font-weight: bold;" align="center">
                                Nom du Professeur
                            </td>
                            <td style="text-decoration: underline; font-weight: bold; width: 103px;" align="center">
                                Age Minimum
                            </td>
                            <td style="text-decoration: underline; font-weight: bold;" align="center">
                                Age Maximum
                            </td>
                            <td align="center" style="text-decoration: underline; font-weight: bold">
                                Date de Debut
                            </td>
                            <td align="center">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px" align="center">
                                <asp:Label ID="lblActivite" runat="server" Text='<%#Eval("activites.nomActivite")%>'></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblNomProf" runat="server" Text='<%#Eval("nomProf")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center" style="width: 103px">
                                <asp:Label ID="lblAgeMin" runat="server" Text='<%#Eval("ageMin")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblAgeMax" runat="server" Text='<%#Eval("ageMax")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center">
                                <asp:Label ID="lblDateDebut" runat="server" Text='<%#Eval("dateDebut")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center">
                                <asp:Button ID="btnModifier" runat="server" Text="Modifier" Width="70px" CommandName="Edit"
                                    Visible="True" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-decoration: underline; font-weight: bold; width: 131px;" align="center">
                                Nombre de Places
                            </td>
                            <td style="text-decoration: underline; font-weight: bold" align="center">
                                Préalables
                            </td>
                            <td style="text-decoration: underline; font-weight: bold; width: 103px;" align="center">
                                Session
                            </td>
                            <td style="text-decoration: underline; font-weight: bold" align="center">
                                Materiel Requis
                            </td>
                            <td align="center" style="font-weight: bold; text-decoration: underline">
                                Prix
                            </td>
                            <td align="center">
                                <asp:Button ID="btnSupprimer" runat="server" Text="Supprimer" Width="70px" CommandName="Delete"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 131px; height: 23px;" align="center">
                                <asp:Label ID="lblNbPLaces" runat="server" Text='<%#Eval("nbPlaceDisponible")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center" style="height: 23px">
                                <asp:Label ID="lblPrealable" runat="server" Text='<%#Eval("prealable")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center" style="width: 103px; height: 23px">
                                <asp:Label ID="lblSession" runat="server" Text='<%#Eval("session")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center" style="height: 23px">
                                <asp:Label ID="lblMateriel" runat="server" Text='<%#Eval("materielRequis")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center" style="height: 23px">
                                <asp:Label ID="lblPrix" runat="server" Text='<%#Eval("prix")%>'></asp:Label>
                            </td>
                            </td>
                            <td align="center" style="height: 23px">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>
            <asp:Button ID="btnAfficherActivite" runat="server" Text="Retour aux activités" />
            <asp:Button ID="btnAjoutGroupe" runat="server" Text="Ajouter un groupe" />
        </asp:View> 

        <%--View 1 - Afficher les groupes --%>

        <asp:View ID="vAjoutActivite" runat="server">
            <asp:ListView ID="lvAjoutActivite" runat="server" DataSourceID="dsActivite" DataKeyNames="noActivite"
                InsertItemPosition="LastItem">
                <ItemTemplate>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="lblTitreAjoutAct" runat="server" Text="Ajouter une activitée" Style="text-decoration: underline;
                        font-weight: bold"></asp:Label>
                    <br />
                    <asp:Label ID="lblSucces" runat="server" Text="Activité ajoutée avec succès." Visible="false"
                        Style="font-weight: bold" />
                    <br />
                    <br />
                    <table style="width: 700px">
                        <tr>
                            <td style="width: 201px">
                                <asp:Label ID="lblNomActivite" runat="server" Text="Nom de l'activité *"></asp:Label>
                            </td>
                            <td style="width: 180px" height="55px">
                                <asp:TextBox ID="txtNomActivite" runat="server" MaxLength="100" Width="170px" Text='<%# Bind("nomActivite") %>'></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValNomActivite" runat="server" ControlToValidate="txtNomActivite"
                                    CssClass="controleValidation" ValidationGroup="ajoutActivite" Display="Dynamic"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le nom de l'activité est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 201px" height="40px">
                                <asp:Label ID="lblTypeActivite" runat="server" Text="Type d'activité *"></asp:Label>
                            </td>
                            <td style="height: 23px; width: 180px;" height="40px">
                                <asp:DropDownList ID="ddlTypeActivite" runat="server" Width="100px" SelectedValue='<%# Bind("typeActivite") %>'>
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="Culture">Culture</asp:ListItem>
                                    <asp:ListItem Value="Sport">Sport</asp:ListItem>
                                    <asp:ListItem Value="Loisir">Loisir</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValTypeActivite" runat="server" ControlToValidate="ddlTypeActivite"
                                    CssClass="controleValidation" ValidationGroup="ajoutActivite"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le type de l'activité est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 201px" height="40px">
                                <asp:Label ID="lblClientele" runat="server" Text="Clientèle *"></asp:Label>
                            </td>
                            <td style="width: 180px" height="55px">
                                <asp:DropDownList ID="ddlClientele" runat="server" Width="103px" SelectedValue='<%# Bind("clientele") %>'>
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="Adulte">Adulte</asp:ListItem>
                                    <asp:ListItem Value="Enfant">Enfant</asp:ListItem>
                                    <asp:ListItem Value="Parent">Parent</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValClientele" runat="server" CssClass="controleValidation"
                                    ControlToValidate="ddlClientele" ValidationGroup="ajoutActivite"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">La clientèle est requise</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnAjoutActivite" runat="server" Text="Ajouter l'activité" CausesValidation="true"
                        CommandName="Insert" ToolTip="Enregistre l'activité" ValidationGroup="ajoutActivite" />
                    <asp:Button ID="btnReinit" runat="server" Text="Réinitialiser" ToolTip="Réinitialise tous les champs"
                        CommandName="Cancel" />
                </InsertItemTemplate>
            </asp:ListView>
        </asp:View> 

        <%--View 2 - Ajouter une activité --%>

        <asp:View ID="vAjoutActiviteSucces" runat="server">
            Le cours a été ajouter avec succès 
            <br />
            <asp:Button runat="server" ID="btnRetourActivite" Text="Retour aux activités" />
        </asp:View> 

        <%--View 3 - Ajouter l'activité Succès --%>

         <asp:View ID="ViewAjouterGroupe" runat="server">
            
            <asp:ListView ID="lvAjoutGroupe" runat="server" DataSourceID="dsGroupe" InsertItemPosition="LastItem">
                <ItemTemplate>
                </ItemTemplate>
                <InsertItemTemplate>
                    <h2>
                        Ajout d&#39;un groupe</h2>
                    <table style="width: 100%">
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Activité*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:DropDownList ID="ddlNoActivite" runat="server" DataSourceID="dsActivite" DataTextField="nomActivite"
                                    DataValueField="noActivite" >
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Nom du Professeur*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:TextBox ID="txtNomProf" runat="server" Width="200px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValNomProf" ValidationGroup="creeCroupe" runat="server"
                                    CssClass="controleValidation" ControlToValidate="txtNomProf"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le nom du professeur est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Session*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:DropDownList ID="ddlSession" runat="server">
                                    <asp:ListItem Value="Été" Text="Été"></asp:ListItem>
                                    <asp:ListItem Value="Hiver" Text="Hiver"></asp:ListItem>
                                    <asp:ListItem Value="Printemps" Text="Printemps"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Date Debut*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:TextBox ID="txtDateDebut" runat="server" Width="67px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="txtDateDebut_TextBoxWatermarkExtender" runat="server"
                                    TargetControlID="txtDateDebut" WatermarkCssClass="waterMark" WatermarkText="jj/mm/aaaa">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateDebut"
                                    DefaultView="Years" TodaysDateFormat="dd MMMM yyyy">
                                </asp:CalendarExtender>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValDateDebut" ValidationGroup="creeCroupe" runat="server"
                                    CssClass="controleValidation" ControlToValidate="txtDateDebut"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">La date de début est requise</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Age Minimum*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:TextBox ID="txtAgeMin" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValAgeMin" ValidationGroup="creeCroupe" runat="server"
                                    CssClass="controleValidation" ControlToValidate="txtAgeMin"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">L'âge minimum est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Age Maximum*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:TextBox ID="txtAgeMax" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="reqVal" ValidationGroup="creeCroupe" runat="server"
                                    CssClass="controleValidation" ControlToValidate="txtAgeMax"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">L'âge maximum est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Nombre de Places*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:TextBox ID="txtNbPlaceDisponible" runat="server" Width="25px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValNbPlaces" ValidationGroup="creeCroupe" runat="server"
                                    CssClass="controleValidation" ControlToValidate="txtNbPlaceDisponible"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le nombre de places disponibles est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Materiel Requis*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:TextBox ID="txtMaterielRequis" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 44px; width: 198px">
                                Préalable(Optionnel)
                            </td>
                            <td style="width: 198px; height: 44px">
                                <asp:TextBox ID="txtPrealable" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                                Prix*
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:TextBox ID="txtPrix" runat="server" Width="50px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="reqValPrix" runat="server" CssClass="controleValidation"
                                    ControlToValidate="txtPrix" ValidationGroup="creeCroupe"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le prix est requis</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 45px; width: 198px">
                            </td>
                            <td style="width: 198px; height: 45px">
                                <asp:Button ID="btnInsertGroupe" runat="server" Text="Ajouter" ValidationGroup="creeCroupe" />
                                <asp:Button ID="btnAnnuler" runat="server" Text="Annuler" CommandName="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:ListView>
            
        </asp:View> 

        <%--View 4 - Ajouter le groupe--%>

        <asp:View ID="vAjoutGroupeSucces" runat="server">
            Le groupe a été créé avec succès 
            <br />
            <asp:Button runat="server" ID="btnRetourGroupe" Text="Retour aux groupes" />
        </asp:View>

        <%--View 5 - Ajouter activité succès--%>

    </asp:MultiView>
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <%--------------------------------------------------- Datasources ----------------------------------------------------------------%>
    <asp:EntityDataSource ID="dsActivite" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="activites"
        EnableInsert="true" EnableDelete="true" EnableUpdate="true" Where="(it.nomActivite like '%'+@leTexte+'%')">
        <WhereParameters>
            <asp:ControlParameter ControlID="txtRechercheActivite" Name="leTexte" ConvertEmptyStringToNull="False"
                PropertyName="Text" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EntitySetName="groupes" EnableDelete="True"
        EnableUpdate="True" EntityTypeFilter="groupes" Include="activites" EnableFlattening="False"
        Where="@noActivite = it.noActivite and it.nomProf like '%'+@leTexte+'%'" EnableInsert="True">
        <WhereParameters>
            <asp:Parameter Name="noActivite" Type="Int32" />
            <asp:ControlParameter ControlID="txtRechercheGroupe" Name="leTexte" ConvertEmptyStringToNull="False"
                PropertyName="Text" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
