﻿<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="AjouterActivite.aspx.vb" Inherits="AjouterActivite" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="mvActivite" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewChoix" runat="server">
            <asp:Label ID="lblTitreChoix" runat="server" Text="Actions à prendre sur les activités"
                    Style="text-decoration: underline; font-weight:bold"></asp:Label>
            <br />
            <asp:Button ID="btnChoixAjout" runat="server" Text="Ajouter une activité" />
            <br />
            <asp:Button ID="btnChoixSupprimer" runat="server" Text="Supprimer/Modifier une activité" />
            <br />
            <asp:Button ID="btnAfficher" runat="server" Text="Afficher les activités" />
        </asp:View>
        <asp:View ID="viewAjout" runat="server">
            <asp:ListView ID="lvActivite" runat="server" DataSourceID="dsActivites" DataKeyNames="noActivite"
                InsertItemPosition="LastItem">
                <ItemTemplate>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="lblTitreAjoutAct" runat="server" Text="Ajouter une activitée" Style="text-decoration: underline; font-weight:bold"></asp:Label>
                    <br />
                    <asp:Label ID="lblSucces" runat="server" Text="Activité ajoutée avec succès." Visible="false"
                        Style="font-weight: bold"></asp:Label>
                    <br />
                    <br />
                    <table style="width: 700px">
                        <tr>
                            <td style="width: 201px">
                                <asp:Label ID="lblNomActivite" runat="server" Text="Nom de l'activité *"></asp:Label>
                            </td>
                            <td style="width: 180px" height="55px">
                                <asp:TextBox ID="txtNomActivite" runat="server" MaxLength="100" Width="170px" DataSourceID="dsActivites"
                                    Text='<%# Bind("nomActivite") %>'></asp:TextBox>
                            
                            <br />
                                <asp:RequiredFieldValidator ID="reqValNomActivite" runat="server" ControlToValidate="txtNomActivite" CssClass="controleValidation"
                                    ValidationGroup="ajoutActivite" Display="Dynamic"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le nom de l'activité est requis</asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="reqValTypeActivite" runat="server" ControlToValidate="ddlTypeActivite" CssClass="controleValidation"
                                    ValidationGroup="ajoutActivite"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le type de l'activité est requis</asp:RequiredFieldValidator>
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
                    <asp:Button ID="btnEnregistrer" runat="server" Text="Enregistrer modification" CausesValidation="true"
                        CommandName="Insert" ToolTip="Enregistre l'activité" ValidationGroup="ajoutActivite" />
                    <asp:Button ID="btnReinit" runat="server" Text="Réinitialiser" ToolTip="Réinitialise tous les champs" CommandName="Cancel" />
                </InsertItemTemplate>
            </asp:ListView>   

        </asp:View>


        <asp:View ID="viewModDel" runat="server">
            
            <asp:Label ID="Label2" runat="server" Text="Modifier et supprimer des activités" Font-Underline="True" Font-Bold="True"></asp:Label>
            <br />
            <br />

            <asp:DataPager ID="dtPagerArticles" runat="server" PagedControlID="lvActiviteModDel"
                PageSize="5" style="margin-left: 210px;" Font-Bold="True">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Première Page" LastPageText="Dernière Page"
                        ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField  />
                    <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Première Page" LastPageText="Dernière Page"
                        ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>

            <br />
            <br />

            <asp:ListView ID="lvActiviteModDel" runat="server" DataSourceID="dsActivites" DataKeyNames="noActivite">
                <ItemTemplate>
                    <table style="border-style: ridge; width: 600px; padding-top: 10px; padding-bottom: 10px; margin-top:5px; margin-bottom:5px" align="center">
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
                                <asp:Label ID="lblModNom" runat="server" Text='<%#Eval("nomActivite")%>'></asp:Label>
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
                                &nbsp;
                            </td>
                            <td width="33%" align="center">
                                &nbsp;
                            </td>
                            <td width="33%" align="center">
                                <asp:Button ID="btnAjouterGroupe" runat="server" Text="Ajouter un groupe" />
                                <asp:Button ID="btnModAct" runat="server" Text="Modifier" CommandName="Edit" />
                                <asp:Button ID="btnDelAct" runat="server" Text="Supprimer" CommandName="Delete" OnClientClick='<%# "return confirm(""Voulez-vous supprimer  " + Eval("nomActivite") + "?"")" %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>

                <EditItemTemplate>
                    <table style="border-style: ridge; width: 600px; padding-top: 10px; padding-bottom: 10px; margin-top:5px; margin-bottom:5px" align="center">
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
                            </td>
                            <td width="33%" align="center">
                                <asp:DropDownList ID="ddlClientele" runat="server" Width="103px" SelectedValue='<%# Bind("clientele") %>'>
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="Adulte">Adulte</asp:ListItem>
                                    <asp:ListItem Value="Enfant">Enfant</asp:ListItem>
                                    <asp:ListItem Value="Parent">Parent</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="33%" align="center">
                                <asp:DropDownList ID="ddlTypeActivite" runat="server" Width="100px" SelectedValue='<%# Bind("typeActivite") %>' >
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="Culture">Culture</asp:ListItem>
                                    <asp:ListItem Value="Sport">Sport</asp:ListItem>
                                    <asp:ListItem Value="Loisir">Loisir</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td width="33%" align="center">
                                &nbsp;
                            </td>
                            <td width="33%" align="center">
                                &nbsp;
                            </td>
                            <td width="33%" align="center">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="33%" align="right">
                                <asp:Button ID="btnConfMod" runat="server" Text="Confirmer modification" CommandName="Update" />
                            </td>
                            <td width="33%" align="left">
                                <asp:Button ID="btnModAnn" runat="server" Text="Annuler" CommandName="Cancel" />
                            </td>
                            <td width="33%" align="center">
                                <asp:Button ID="btnModAct" runat="server" Text="Modifier" Enabled="false"/>
                                <asp:Button ID="btnDelAct" runat="server" Text="Supprimer" Enabled="false"/>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>                

            </asp:ListView>

        </asp:View>

        <asp:View ID="viewReussit" runat="server">
            <table style="width: 100%; text-align: center; font-size:larger; padding-top: 100px;">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Default/images/success.png" />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Opération Effectuée avec Succès!" />
                        <br />
                        <br />
                        <asp:Button ID="btnRetour" runat="server" Text="Retour" CommandName="Cancel" />
                    </td>                    
                </tr>
            </table>
        </asp:View>

        <asp:View ID="viewAfficher" runat="server">

            <asp:Label ID="Label3" runat="server" Text="Liste des activités" Font-Underline="True" Font-Bold="True"></asp:Label>
            <br />
            <br />

            <asp:ListView ID="ListView1" runat="server" DataSourceID="dsActivites" DataKeyNames="noActivite">
                <ItemTemplate>

                    <table style="border-style: ridge; width: 600px; padding-top: 10px; padding-bottom: 10px; margin-top:5px; margin-bottom:5px" align="center">
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
                                <asp:Label ID="lblModNom" runat="server" Text='<%#Eval("nomActivite")%>'></asp:Label>
                            </td>
                            <td width="33%" align="center">
                                <asp:Label ID="lblModCli" runat="server" Text='<%#Eval("clientele")%>'></asp:Label>
                            </td>
                            <td width="33%" align="center">
                                <asp:Label ID="lblModType" runat="server" Text='<%#Eval("typeActivite")%>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>

        </asp:View>
        <asp:View ID="ViewListeGroupe" runat="server">
            <asp:DataPager ID="pagerListeGroupe" runat="server" PagedControlID="lvListeGroupes">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False"
                        ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                        ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
            <asp:ListView ID="lvListeGroupes" runat="server" DataKeyNames="noGroupe" DataSourceID="dsListeGroupe">
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
                                <asp:DropDownList ID="ddlModifActivite" runat="server" DataSourceID="dsActivites"
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
                                    Visible="False" />
                                <asp:ImageButton ID="ibtnAjouterPanier" runat="server" ImageUrl="~/App_Themes/Default/images/btnPanier.gif"
                                    ToolTip="Ajouter au panier" />
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
                                <asp:Button ID="btnSupprimer" runat="server" Text="Supprimer" Width="70px" CommandName="Delete"
                                    Visible="False" />
                                <asp:ImageButton ID="ibtnVoirHoraire" runat="server" ImageUrl="~/App_Themes/Default/images/voirHoraire.gif"
                                    ToolTip="Voir horaire" />
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
                <SelectedItemTemplate>
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
                                    Visible="False" />
                                <asp:ImageButton ID="ibtnAjouterPanier" runat="server" ImageUrl="~/App_Themes/Default/images/btnPanier.gif"
                                    ToolTip="Ajouter au panier" />
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
                                <asp:Button ID="btnSupprimer" runat="server" Text="Supprimer" Width="70px" CommandName="Delete"
                                    Visible="False" />
                                <asp:ImageButton ID="ibtnVoirHoraire" runat="server" ImageUrl="~/App_Themes/Default/images/voirHoraire.gif"
                                    ToolTip="Voir horaire" />
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
                </SelectedItemTemplate>
            </asp:ListView>
            <br />
            <asp:Button ID="btnAjouterGroupe" runat="server" Text="Ajouter un groupe" />
        </asp:View>
        <asp:View ID="ViewAjouterGroupe" runat="server">
            <asp:ListView ID="lvAjoutGroupe" runat="server" DataSourceID="dsListeGroupe" InsertItemPosition="LastItem">
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
                                <asp:DropDownList ID="ddlNoActivite" runat="server" DataSourceID="dsActivites" DataTextField="nomActivite"
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
                                <asp:Button ID="btnAfficheGroupe" runat="server" Text="Afficher les groupes" />
                                <asp:Button ID="btnAnnuler" runat="server" Text="Annuler" CommandName="Cancel" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:ListView>
        </asp:View>
    </asp:MultiView>
    
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>

    <%--------------------------------------------------- Datasources ----------------------------------------------------------------%>

    <asp:EntityDataSource ID="dsActivites" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="activites"
        EnableInsert="true" EnableDelete="true" EnableUpdate="true" >
    </asp:EntityDataSource> 

    <asp:EntityDataSource ID="dsListeGroupe" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EntitySetName="groupes" EnableDelete="True"
        EnableUpdate="True" EntityTypeFilter="groupes" Include="activites" 
        EnableFlattening="False">
    </asp:EntityDataSource>

</asp:Content>
