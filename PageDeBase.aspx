<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="PageDeBase.aspx.vb" Inherits="PageDeBase" %>

<asp:Content ID="contenu" ContentPlaceHolderID="placeHolderContenu" Runat="Server">
   <h1>Détail de la commande</h1><br>
   <table style='height: 70px; width: 700px; background-color:Silver'>
   <tr>
   <td style="width: 163px"><div style="font-weight:bold;">Nom d'utilisateur :<br>Numéro de Commande :</td>
   <td>BMarley<br>2835892735982</td>
   </tr>
   </table>
   <br>
   <table style="height: 144px; width: 700px; background-color:Gray">
   <tr>
   <td style="width: 349px; font-weight:bold"><div align='center'>Date de l&#39;achat</div></td>
   <td><div align='center' style='font-weight:bold'>Total</div></td>
   </tr>
   <tr style="background-color:Silver">
   <td style="width: 349px"><div align='center'>Le 6 novembre 2012 @ 10h40 AM</div></td>
   <td><div align='center'>100$</div></td>
   </tr>
   </table> 
   <br>
   <table style="height: 144px; width: 700px; background-color:Gray;">
   <tr>
   <td style="width:350px;"><h2>Détails</h2></td>
   <td></td>
   <td></td>
   </tr>
   <tr style="background-color:Silver;">
   <td style="width:350px; height: 50px; text-decoration: underline; font-weight:bold; padding-left:10px">Nom Cours</td>
   <td style="width:350px; text-decoration: underline; font-weight:bold; padding-left:10px">Personne Inscrite</td>
   <td style="width:100px; text-decoration: underline; font-weight:bold; padding-left:10px">Prix</td>
   </tr>
   <tr style="background-color:Silver">
   <td style='height: 50px; padding-left:10px'>Peinture II</td>
   <td style='height: 50px; padding-left:10px'>BobJunior</td>
   <td style='height: 50px; padding-left:10px'>75$</td> 
   </tr>
   </table>
   <br>
   <strong>Cordialement,</strong><br><br>
   <strong>L'équipe de Centre des Sports et Loisir</strong>
</asp:Content>

