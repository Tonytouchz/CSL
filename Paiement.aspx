<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="Paiement.aspx.vb" Inherits="Paiement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="mvPaiment" runat="server" ActiveViewIndex="0">
        <asp:View ID="vChampSaisie" runat="server">
            <table style='height: 30px; width: 700px; background-color: Gray;'>
                <tr bgcolor="#0583AD" style="border-bottom-style: solid; border-bottom-width: 3px; 
                    border-bottom-color: #025570;">
                    <td style='width: 300px; height: 25px; text-decoration: underline; font-weight: bold;
                        padding-left: 10px'>
                        Nom Cours
                    </td>
                    <td style='width: 300px; text-decoration: underline; font-weight: bold; padding-left: 10px'>
                        Personne Inscrite
                    </td>
                    <td style='width: 100px; text-decoration: underline; font-weight: bold; padding-left: 10px'>
                        Prix
                    </td>
                </tr> 
                </table>
            <asp:ListView ID="lvPanier" runat="server" DataKeyNames="noPanier" DataSourceID="dsPanier">
                <EmptyDataTemplate>
                    Le panier est vide
                </EmptyDataTemplate>
                <ItemTemplate>
                        <table style='height: 40px; width: 700px; background-color: Gray;''>
                        <tr bgcolor="#0583AD" align="right" style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #025570;">
                            <td style='width: 300px; padding-right: 10px;'>
                                <asp:Label ID="lblNomActivite" runat="server" Text='<%#Eval("groupes.activites.nomActivite") %>' />
                            </td>
                            <td style='width: 300px; padding-right: 10px'>
                                <asp:Label ID="lblNomClient" runat="server" Text='<%#Eval("clients.nomComplet") %>' />
                            </td>
                            <td style='width: 100px; padding-right: 10px'>
                                <asp:Label ID="lblPrix" runat="server" Text='<%#Eval("groupes.Prix") %>' />$
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:ListView>
            <table bgcolor="#0583AD" style='height: 20px; width: 700px;'>
                <tr bgcolor="#0583AD" style="border-bottom-style: solid; border-bottom-width: 3px; 
                    border-bottom-color: #025570; border-color:Gray">
                    <td align="left" style="width: 600px; padding-left:525px">
                        <asp:Label ID="lblTaxeTPS" runat="server" Text="TPS 9,5%"></asp:Label>
                        <br /> 
                        <asp:Label ID="lblTaxeTVQ" runat="server" Text="TVQ 5%"></asp:Label>
                        <br />
                        <asp:Label ID="lblPrixTotal" runat="server" Text="Total"></asp:Label>
                    </td>
                    <td align="right" style='padding-right: 10px; width: 96px'>
                        <asp:Label ID="lblTPS" runat="server"/>$
                        <br />
                        <asp:Label ID="lblTVQ" runat="server"/>$
                        <br />
                        <asp:Label ID="lblTotal" runat="server"/>$
                        </td>
                    </tr>
            </table>
            <br />
            <table style="width: 100%">
                <tr style="height: 30px; text-decoration: underline; font-weight: bold">
                    <td style="width: 187px;">
                        <asp:Label ID="lblNoCarte" runat="server" Text="Numéro de Carte" />
                    </td>
                    <td>
                        <asp:Label ID="lblSorte" runat="server" Text="Sorte" />
                    </td>
                    <td>
                        <asp:Label ID="lblDateExpiration" runat="server" Text="Date d'expiration" />
                    </td>
                    <td>
                        <asp:Label ID="lblNoSecurite" runat="server" Text="Numéro de sécurité" />
                    </td>
                </tr>
                <tr style="height: 55px;">
                    <td style="width: 187px">
                        <asp:TextBox ID="txtNoCarte" runat="server" Height="20px" MaxLength="16" Width="125px" />
                        <br />
                        <asp:RequiredFieldValidator ID="reqValNoCarte" runat="server" ControlToValidate="txtNoCarte"
                            CssClass="controleValidation" Display="Dynamic" ValidationGroup="paiement"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le champ est obligatoire</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="customValNoCarte" runat="server" ControlToValidate="txtNoCarte"
                            CssClass="controleValidation" Display="Dynamic" OnServerValidate="validerNoCarte"
                            ValidationGroup="paiement"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le champ n&#39;est pas valide</asp:CustomValidator>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSorte" runat="server">
                            <asp:ListItem Selected="True">Visa</asp:ListItem>
                            <asp:ListItem>MasterCard</asp:ListItem>
                            <asp:ListItem>Discover</asp:ListItem>
                            <asp:ListItem>Amex</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td>
                        <asp:TextBox ID="txtDateExpiration" runat="server" Enabled="True" Height="16px" MaxLength="6"
                            TabIndex="5" Width="50px" />
                        <asp:TextBoxWatermarkExtender ID="txtDateExpiration_TextBoxWatermarkExtender" runat="server"
                            TargetControlID="txtDateExpiration" WatermarkCssClass="waterMark" WatermarkText="mmaaaa">
                        </asp:TextBoxWatermarkExtender>
                        <br />
                        <asp:RequiredFieldValidator ID="reqValDateExpiration" runat="server" ControlToValidate="txtDateExpiration"
                            CssClass="controleValidation" Display="Dynamic" ValidationGroup="paiement"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">La date est requise</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="compValDateExpiration" runat="server" ControlToValidate="txtDateExpiration"
                            CssClass="controleValidation" Display="Dynamic" OnServerValidate="ValiderDateExpiration"
                            ValidationGroup="paiement"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">La date n&#39;est pas valide</asp:CustomValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoSecurite" runat="server" Height="16px" MaxLength="4" Width="30px" />
                        <br />
                        <asp:RequiredFieldValidator ID="reqValNoSecurite" runat="server" ControlToValidate="txtNoSecurite"
                            CssClass="controleValidation" ValidationGroup="paiement"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le numéro est obligatoire</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="custValNoSecurite" runat="server" ControlToValidate="txtNoSecurite"
                            CssClass="controleValidation" Display="Dynamic" OnServerValidate="validerNoSecurite"
                            ValidationGroup="paiement"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le numéro n&#39;est pas valide</asp:CustomValidator>
                    </td>
                </tr>
            </table>
            <asp:Repeater ID="repeaterInformationsPersonnel" runat="server" DataSourceID="dsClient">
                <ItemTemplate>
                    <asp:HiddenField ID="hiddenFieldNom" runat="server" Value='<%#Eval("nom") %>' />
                    <asp:HiddenField ID="hiddenFieldPrenom" runat="server" Value='<%#Eval("prenom") %>' />
                    <asp:HiddenField ID="hiddenFieldAdresse" runat="server" Value='<%#Eval("dossiers.adresse") %>' />
                    <asp:HiddenField ID="hiddenFieldVille" runat="server" Value='<%#Eval("dossiers.ville") %>' />
                    <asp:HiddenField ID="hiddenFieldProvince" runat="server" Value='<%#Eval("dossiers.province") %>' />
                    <asp:HiddenField ID="hiddenFieldCodeZip" runat="server" Value='<%#Eval("dossiers.codePostal") %>' />
                    <asp:HiddenField ID="hiddenFieldEmail" runat="server" Value='<%#Eval("dossiers.Email") %>' />
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <asp:ImageButton ID="imgPayPal" runat="server" ImageUrl="~/App_Themes/Default/images/Paypal.gif"
                ValidationGroup="paiement" />
        </asp:View>
        <asp:View ID="vPaiementSucces" runat="server">
            <asp:Label ID="lblSucces" runat="server" />
        </asp:View>
        <asp:View ID="vPaiementEchec" runat="server">
            <asp:Label ID="lblErreurPaiement" runat="server" Text="Il a eu une erreur lors de votre paiement" />
        </asp:View>
    </asp:MultiView>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true">
    </asp:ScriptManager>
    <asp:EntityDataSource ID="dsClient" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="clients"
        Include="dossiers" Where="@leNoClient = it.noClient">
        <WhereParameters>
            <asp:Parameter Name="leNoClient" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsPanier" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EntitySetName="panier"
        Include="groupes, clients, groupes.activites" Where="@leNoDossier = it.noDossier">
        <WhereParameters>
            <asp:Parameter Name="leNoDossier" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsTransaction" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EnableInsert="True"
        EntitySetName="inscription">
    </asp:EntityDataSource>
</asp:Content>
