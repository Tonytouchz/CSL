<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="AfficheCoursClient.aspx.vb" Inherits="AfficheCoursClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="mvAfficherCours" runat="server" ActiveViewIndex="0">
        <asp:View ID="afficheActivite" runat="server">
            <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
            <asp:TextBox ID="txtRechercheActivite" runat="server"></asp:TextBox>
            <asp:AutoCompleteExtender ID="txtRechercheActivite_AutoCompleteExtender" runat="server" ContextKey="RechercheActivite"
                ServiceMethod="GetCompletionList" TargetControlID="txtRechercheActivite" UseContextKey="True" />
            <asp:Button ID="btnRechercherActivite" runat="server" Text="Rechercher l'activité" />
            <br />
            <asp:DataPager ID="dtPagerArticles" runat="server" PagedControlID="lvListeActivite"
                PageSize="9" style="margin-left: 210px;" Font-Bold="True">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Première Page" LastPageText="Dernière Page"
                        ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Première Page" LastPageText="Dernière Page"
                        ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
            <br />
            <asp:ListView ID="lvListeActivite" runat="server" DataSourceID="dsActivite" DataKeyNames="noActivite">
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
                                <asp:Label ID="lblModCli" runat="server" Text='<%#Eval("clientele")%>' />
                            </td>
                            <td width="33%" align="center">
                                <asp:Label ID="lblModType" runat="server" Text='<%#Eval("typeActivite")%>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>
        </asp:View>
        <asp:View ID="afficheGroupe" runat="server"> 
        <asp:TextBox ID="txtRechercheGroupe" runat="server"></asp:TextBox>
            <asp:AutoCompleteExtender ID="autoCompRechercheGroupe" runat="server" ContextKey="RechercheGroupe"
                ServiceMethod="GetCompletionList" TargetControlID="txtRechercheGroupe" UseContextKey="True" />
            <asp:Button ID="btnRechercheGroupe" runat="server" Text="Chercher le groupe" />

            <br />

            <asp:ListView ID="lvListeGroupes" runat="server" DataSourceID="dsGroupe" DataKeyNames="noGroupe">
                <EmptyDataTemplate>
                Il n'a pas de cours pour cette activité 
                <br />
                </EmptyDataTemplate>
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
            </asp:ListView>
            <asp:Button ID="btnAfficherActivite" runat="server" Text="Retour aux Activités" />
        </asp:View>
    </asp:MultiView>
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <asp:EntityDataSource ID="dsActivite" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="activites"
        EnableInsert="true" EnableDelete="true" EnableUpdate="true" Where="(@leTexte = '' or it.nomActivite like '%'+@leTexte+'%')">
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
