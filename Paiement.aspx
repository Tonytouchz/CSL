<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false"
    CodeFile="Paiement.aspx.vb" Inherits="Paiement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="Server">
    <asp:MultiView ID="mvPaiment" runat="server" ActiveViewIndex="0">
        <asp:View ID="vChampSaisie" runat="server">
            <table style="width: 100%">
                <tr style="height: 55px;">
                    <td style="width: 138px">
                        <asp:Label ID="lblNoCarte" runat="server" Text="Numéro de la Carte" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoCarte" runat="server" Width="125px" Height="20px" MaxLength="16" />
                        <br />
                        <asp:RequiredFieldValidator ID="reqValNoCarte" runat="server" CssClass="controleValidation"
                            ValidationGroup="paiement" ControlToValidate="txtNoCarte" Display="Dynamic"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le numéro de carte est obligatoire</asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="customValNoCarte" runat="server" CssClass="controleValidation"
                            OnServerValidate="validerNoCarte" ValidationGroup="paiement" ControlToValidate="txtNoCarte"
                            Display="Dynamic"><img src="App_Themes/Default/images/imgErreur.png" alt="Croix Rouge">Le numéro de carte n'est pas valide</asp:CustomValidator>
                    </td>
                </tr>
                <tr style="height: 55px;">
                    <td style="width: 138px">
                        <asp:Label ID="lblSorte" runat="server" Text="Sorte" />
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
                </tr>
                <tr style="height: 55px;">
                    <td style="width: 138px">
                        <asp:Label ID="lblDateExpiration" runat="server" Text="Date d'expiration" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtDateExpiration" runat="server" MaxLength="6" Height="16px" TabIndex="5"
                            Width="50px" Enabled="True" />
                        <asp:TextBoxWatermarkExtender ID="txtDateExpiration_TextBoxWatermarkExtender" runat="server"
                            TargetControlID="txtDateExpiration" WatermarkCssClass="waterMark" WatermarkText="mmaaaa">
                        </asp:TextBoxWatermarkExtender>
                    </td>
                </tr>
                <tr style="height: 55px;">
                    <td style="width: 138px">
                        <asp:Label ID="lblNumeroSecurite" runat="server" Text="Numéro de sécurité" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoSecurite" runat="server" Width="30px" Height="16px" MaxLength="3" />
                    </td>
                </tr>
                </table>

            <asp:Repeater ID="repeaterInformationsPersonnel" runat="server" DataSourceID="dsClient">
            <ItemTemplate>
            
            <table style="width: 100%">
                            <tr style="height: 55px;">
                                <td style="width: 138px">
                                    <asp:Label ID="lblNom" runat="server" Text="Nom" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNom" runat="server" Height="21px" Width="170" Text='<%#Eval("nom") %>' />
                                </td>
                                </tr>
                                <tr style="height: 55px;">
                                    <td style="width: 138px">
                                        <asp:Label ID="lblPrenom" runat="server" Text="Prénom" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPrenom" runat="server" Height="21px" Width="170" Text='<%#Eval("prenom") %>' />
                                    </td>
                                </tr>
                                <tr style="height: 55px;">
                                    <td style="width: 138px">
                                        <asp:Label ID="lblAdresse" runat="server" Text="Adresse" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAdresse" runat="server" Height="21px" Width="170" Text='<%#Eval("dossiers.adresse") %>' />
                                    </td>
                                </tr>
                                <tr style="height: 55px;">
                                    <td style="width: 138px">
                                        <asp:Label ID="lblVille" runat="server" Text="Ville" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtVille" runat="server" Height="21px" Width="120" Text='<%#Eval("dossiers.ville") %>' />
                                    </td>
                                </tr>
                                <tr style="height: 55px;">
                                    <td style="width: 138px">
                                        <asp:Label ID="lblProvince" runat="server" Text="Province" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProvince" runat="server" Height="21px" Width="120" Text='<%#Eval("dossiers.province") %>' />
                                    </td>
                                </tr>
                                <tr style="height: 55px;">
                                    <td style="width: 138px">
                                        <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCodeZip" runat="server" Height="21px" Width="120" Text='<%#Eval("dossiers.codePostal") %>' />
                                    </td>
                                </tr>
                                <tr style="height: 55px;">
                                    <td style="width: 138px">
                                        <asp:Label ID="lblMontant" runat="server" Text="Montant: " />
                                        <asp:Label ID="lblPaye" runat="server" Text="1.01" />
                                    </td>
                                </tr>
                            </table>

            </ItemTemplate>
            </asp:Repeater>
                    
            <br />
            <asp:ImageButton ID="imgPayPal" runat="server" ImageUrl="~/App_Themes/Default/images/Paypal.gif"
                ValidationGroup="paiement" />
            <asp:Button ID="btnPayPal" runat="server" Text="PayPal" ValidationGroup="paiement" />
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
        DefaultContainerName="ModelContainer1" EnableFlattening="False" 
        EntitySetName="clients" Include="dossiers" 
        Where="@leNoClient = it.noClient">
        <WhereParameters>
            <asp:Parameter Name="leNoClient" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsTransaction" runat="server" ConnectionString="name=ModelContainer1"
        DefaultContainerName="ModelContainer1" EnableFlattening="False" EnableInsert="True"
        EntitySetName="inscription">
    </asp:EntityDataSource>
</asp:Content>
