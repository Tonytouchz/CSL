<%@ Page Title="" Language="VB" MasterPageFile="~/maMasterPage.Master" AutoEventWireup="false" CodeFile="Historique.aspx.vb" Inherits="Historique" %>

<asp:Content ID="Content1" ContentPlaceHolderID="placeHolderContenu" runat="server">
   
    <p align="center" style="font-size: xx-large">
        Histoire de la compagnie</p>
    <p align="left" style="text-align: justify">
        <img alt="Fichier:Festival International de Jazz de Montréal 2.jpg" 
            src="http://upload.wikimedia.org/wikipedia/commons/d/dc/Festival_International_de_Jazz_de_Montréal_2.jpg" 
            style="float: left; width: 330px; margin-right: 10px; height: 392px;" />Le Québec est animé tout au long de l’année par 217 festivals. Que l’on pense au 
        célèbre Festival de Jazz de Montréal ou à l’éclectique Festival de Musique 
        émergente en Abitibi-Témiscaminque, au Carnaval de Québec ou au Festival 
        paysages en peinture, Rêves d&#39;automne dans Charlevoix, chaque saison, dans 
        chaque région, un événement gourmand, musical, artistique ou sportif réussit à 
        divertir la population.</p>
    <p align="left" style="text-align: justify">
        Le nombre de musées au Québec a considérablement augmenté au cours des 20 
        dernières années. La diversité du réseau est frappante : près de 500 musées 
        touchant à l’art, l’histoire, l’architecture, les sciences, l’environnement, les 
        technologies, etc. Plusieurs musées sont reconnus internationalement et 
        entretiennent des collaborations avec d’importants réseaux de musées. Parmi ceux-ci, on note : le
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="http://www.mnba.qc.ca/Accueil.aspx">Musée national des beaux-arts du Québec</asp:HyperLink>
        , le
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="http://www.mcq.org/index_fr.php">Musée de la civilisation</asp:HyperLink>
        , le
        <asp:HyperLink ID="HyperLink3" runat="server" 
            NavigateUrl="http://www.macm.org/">Musée d&#39;art contemporain de Montréal</asp:HyperLink>
&nbsp;de même que le
        <asp:HyperLink ID="HyperLink4" runat="server" 
            NavigateUrl="http://www.mbam.qc.ca/fr/">Musée des beaux-arts de Montréal</asp:HyperLink>
        . </p>
    <p align="left">
        <asp:Label ID="lblSource" runat="server" Font-Size="XX-Small" 
            Text="http://en.wikipedia.org/wiki/Image:FIJM2_G.jpg, Jocelynhade, 25 janvier 2008"></asp:Label>
    </p>
    <p align="left" style="text-align: justify">
        Pour les amateurs de nature, 27 parcs nationaux protègent les grands espaces 
        verts du Québec. Ceux-ci témoignent de la diversité géographique de la province 
        et accueillent chaque année des milliers de visiteurs pour la randonnée, le 
        camping et une foule d’autres activités physiques ou éducatives.....</p>
    <p align="left" style="text-align: justify">
        Le sport national est sans contredit le hockey. Pendant la saison hivernale, les 
        Canadiens de Montréal enflamment bon nombre de Québécois chaque samedi soir. Le 
        ski alpin, le ski de fond, le patin et la raquette sont aussi pratiqués, 
        question de faire passer l’hiver un peu plus vite. Bien qu’il ne provoque pas le 
        même engouement qu’en Europe, le football, appelé soccer au Québec, gagne en 
        importance dans la province. Le plein air, la randonnée pédestre, le vélo, le 
        canot et le kayak sont aussi d’excellentes occasions pour profiter du temps plus 
        clément qu’apporte l’été.</p>
       
</asp:Content>
