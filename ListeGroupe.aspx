<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="ListeGroupe.aspx.vb" Inherits="ListeGroupe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="MultiViewListeGroupe" runat="server" ActiveViewIndex="0">
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
                                <asp:DropDownList ID="ddlNoActivite" runat="server" DataSourceID="dsActivite" DataTextField="nomActivite"
                                    DataValueField="noActivite">
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
                                <asp:TextBox ID="txtAgeMin" runat="server" Width="50px"></asp:TextBox>
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
                                <asp:TextBox ID="txtAgeMax" runat="server" Width="50px"></asp:TextBox>
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
                                <asp:TextBox ID="txtNbPlaceDisponible" runat="server" Width="50px"></asp:TextBox>
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
                                <asp:Button ID="btnAnnuler" runat="server" Text="Annuler" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:ListView>
        </asp:View>
    </asp:MultiView>
    <asp:EntityDataSource ID="dsListeGroupe" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EntitySetName="groupes" EnableDelete="True"
        EnableUpdate="True" EntityTypeFilter="groupes" Include="activites">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsActivite" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="activites"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeFilter="activites">
    </asp:EntityDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
