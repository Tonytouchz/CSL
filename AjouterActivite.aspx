<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="AjouterActivite.aspx.vb" Inherits="AjouterActivite" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="mvActivite" runat="server">
        <asp:View ID="viewChoix" runat="server">
            <div>
                <asp:Label ID="lblTitreChoix" runat="server" Text="Action à prendre sur les activités"
                    Style="text-decoration: underline"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="btnChoixAjout" runat="server" Text="Ajouter une activité" />
                <br />
                <br />
                <asp:Button ID="btnChoixSupprimer" runat="server" Text="Supprimer une activité" />
            </div>
        </asp:View>
        <asp:View ID="viewAjout" runat="server">

            <asp:Label ID="lblTitreAjoutAct" runat="server" Text="Ajouter une activitée" Style="text-decoration: underline"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblSucces" runat="server" Text="Activité ajoutée avec succès." Visible="false"
                Style="font-weight: bold"></asp:Label>
            <br />
            <br />
            <table style="width: 700px">
                <tr>
                    <td style="width: 201px" height="40px">
                        <asp:Label ID="lblNomActivite" runat="server" Text="Nom de l'activité"></asp:Label>
                    </td>
                    <td style="width: 180px" height="40px">
                        <asp:TextBox ID="txtNomActivite" runat="server" MaxLength="100" Width="170px"></asp:TextBox>
                        
                    </td>
                    <td style="width: 98px" height="40px">
                        <asp:Label ID="Label1" runat="server" Text="* Requis"></asp:Label>
                    </td>
                    <td height="40px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtNomActivite" ErrorMessage="Nom de l'activité requis" 
                            ValidationGroup="ajoutActivite"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 201px" height="40px">
                        <asp:Label ID="lblTypeActivite" runat="server" Text="Type d'activité"></asp:Label>
                    </td>
                    <td style="height: 23px; width: 180px;" height="40px">
                        <asp:DropDownList ID="ddlTypeActivite" runat="server" Width="100px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Culture</asp:ListItem>
                            <asp:ListItem>Sport</asp:ListItem>
                            <asp:ListItem>Loisir</asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                    <td style="height: 23px; width: 98px;" height="40px">
                        <asp:Label ID="Label2" runat="server" Text="* Requis"></asp:Label>
                    </td>
                    <td style="height: 23px" height="40px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="ddlTypeActivite" ErrorMessage="Type de l'activité requis" 
                            ValidationGroup="ajoutActivite" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 201px" height="40px">
                        <asp:Label ID="lblMatReqis" runat="server" Text="Matériel requis"></asp:Label>
                    </td>
                    <td style="width: 180px" height="40px">
                        <asp:TextBox ID="txtMatRequis" runat="server" Width="170px"></asp:TextBox>
                    </td>
                    <td style="width: 98px" height="40px">
                        <asp:Label ID="Label10" runat="server" Text="* Optionnel"></asp:Label>
                    </td>
                    <td height="40px">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 201px" height="40px">
                        <asp:Label ID="lblPrealable" runat="server" Text="Préalable"></asp:Label>
                    </td>
                    <td style="width: 180px" height="40px">
                        
                        <asp:TextBox ID="txtPrealable" runat="server" Width="170px"></asp:TextBox>
                        
                    </td>
                    <td style="width: 98px" height="40px">
                        <asp:Label ID="Label4" runat="server" Text="* Optionnel"></asp:Label>
                    </td>
                    <td height="40px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 201px" height="40px">
                        <asp:Label ID="lblClientele" runat="server" Text="Clientele"></asp:Label>
                    </td>
                    <td style="width: 180px" height="40px">
                        <asp:DropDownList ID="ddlClientele" runat="server" Width="103px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Adulte</asp:ListItem>
                            <asp:ListItem>Enfant</asp:ListItem>
                            <asp:ListItem>Parent</asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                    <td style="width: 98px" height="40px">
                        <asp:Label ID="Label5" runat="server" Text="* Requis"></asp:Label>
                    </td>
                    <td height="40px">
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3" runat="server" ErrorMessage="Clientèle de l'activité requise" 
                            ControlToValidate="ddlClientele" ValidationGroup="ajoutActivite" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 201px" height="40px">
                        &nbsp;
                    </td>
                    <td style="width: 180px" height="40px">
                        &nbsp;
                    </td>
                    <td style="width: 98px" height="40px">
                        &nbsp;
                    </td>
                    <td height="40px">
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Button ID="btnEnregistrer" runat="server" Text="Enregistrer modification" 
                    CausesValidation="true" ValidationGroup="ajoutActivite" />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Réinitialiser" />
            <br />
            <%--<asp:Button ID="Button2" runat="server" Text="" />--%>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Visible="True" ValidationGroup="ajoutActivite" />
        </asp:View>
        <asp:View ID="viewSupprimer" runat="server">
            <asp:Label ID="lblTitreSup" runat="server" Text="Supprimer une activité" Style="text-decoration: underline"></asp:Label>
            <br />
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="noActivite" DataSourceID="dsSupprimer">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSupprimer" runat="server" Text="Supprimer" />
                    <table style="border: thin solid #000000; width: 100%">
                        <tr style="font-size: large; border-bottom-style: solid; border-bottom-width: thin;
                            border-bottom-color: #000000; text-decoration: underline;">
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Nom de l'activité"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Type d'activité"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Clientèle"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Matériel requis"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Préalable"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("nomActivite")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text='<%#Eval("nomActivite")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text='<%#Eval("typeActivite")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("materielRequis")%>'></asp:Label>
                            </td>
                            <td>
                                <%--                                <asp:Label ID="Label10" runat="server" Text='<%#Eval("prealables.description")%>'></asp:Label>                                
                                --%>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>
        </asp:View>
    </asp:MultiView>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:EntityDataSource ID="dsPrealables" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EntitySetName="prealablesJeu">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsActivites" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="activitesJeu"
        Include="prealables" EnableInsert="true">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsSupprimer" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="activitesJeu"
        EntityTypeFilter="activites">
    </asp:EntityDataSource>
</asp:Content>
