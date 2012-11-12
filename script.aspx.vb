Imports System.IO
Imports Model

Partial Class script
    Inherits System.Web.UI.Page

    Protected Shared leContexte As ModelContainer1 = New ModelContainer1

    Protected Sub btnScript_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnScript.Click

        'Début des dossiers et clients

        'Administrateur
        Dim Dossier1 = New dossiers With {.adresse = "Rue du Marais", .ville = "Granby", .codePostal = "P6A8K1", .province = "Québec", .noTelephone = "(450)555-0971", .email = "Admin@CSL.com", .username = "Admin", .password = "1", .typeUtilisateur = "Administrateur"}
        leContexte.AddObject("dossiers", Dossier1)
        Dim Admin1 = New clients With {.nom = "Trudel", .prenom = "Richard", .dateNaissance = "7/1/1960"}
        Admin1.dossiers = Dossier1
        leContexte.AddObject("clients", Admin1)

        'Client
        Dim Dossier2 = New dossiers With {.adresse = "Rue de la Promenade", .ville = "Granby", .codePostal = "S2A9K4", .province = "Québec", .noTelephone = "(450)555-6590", .email = "BMarley@CSL.com", .username = "BMarley", .password = "1", .typeUtilisateur = "Client"}
        leContexte.AddObject("dossiers", Dossier2)
        Dim Client2 = New clients With {.nom = "Marley", .prenom = "Bob", .dateNaissance = "5/25/1975", .noDossier = 2}
        Client2.dossiers = Dossier2
        leContexte.AddObject("clients", Client2)
        Dim Client3 = New clients With {.nom = "Marley", .prenom = "BobJunior", .dateNaissance = "8/12/1993", .noDossier = 2}
        Client3.dossiers = Dossier2
        leContexte.AddObject("clients", Client3)
        Dim Client4 = New clients With {.nom = "Marley", .prenom = "BobJuniorI", .dateNaissance = "10/3/1995", .noDossier = 2}
        Client4.dossiers = Dossier2
        leContexte.AddObject("clients", Client4)

        'Fin des dossiers et clients

        'Début des cours

        'Enfant
        Dim Activite1 = New activites With {.nomActivite = "Académie technique du Cosmos", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite1)
        Dim Groupe1 = New groupes With {.nomProf = "Jean Dubuc", .prix = 75, .nbPlaceDisponible = "20", .ageMin = "7", .ageMax = "10", .session = "Automne", .dateDebut = "1/14/2013", .materielRequis = "soulier adéquat"}
        Groupe1.activites = Activite1
        leContexte.AddObject("groupes", Groupe1)

        Dim Activite2 = New activites With {.nomActivite = "Baseball intérieur", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite2)
        Dim Groupe2 = New groupes With {.nomProf = "Jean Dubuc", .prix = 100, .nbPlaceDisponible = "20", .ageMin = "7", .ageMax = "13", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe2.activites = Activite2
        leContexte.AddObject("groupes", Groupe2)

        Dim Activite3 = New activites With {.nomActivite = "Cheerleading", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite3)
        Dim Groupe3 = New groupes With {.nomProf = "Jean Dubuc", .prix = 50, .nbPlaceDisponible = "20", .ageMin = "5", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe3.activites = Activite3
        leContexte.AddObject("groupes", Groupe3)

        Dim Activite4 = New activites With {.nomActivite = "Escalade", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite4)
        Dim Groupe4 = New groupes With {.nomProf = "Jean Dubuc", .prix = 250, .nbPlaceDisponible = "20", .ageMin = "6", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe4.activites = Activite4
        leContexte.AddObject("groupes", Groupe4)

        Dim Activite5 = New activites With {.nomActivite = "Escrime", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite5)
        Dim Groupe5 = New groupes With {.nomProf = "Jean Dubuc", .prix = 150, .nbPlaceDisponible = "10", .ageMin = "9", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe5.activites = Activite5
        leContexte.AddObject("groupes", Groupe5)

        Dim Activite6 = New activites With {.nomActivite = "Gymnastique", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite6)
        Dim Groupe6 = New groupes With {.nomProf = "Jean Dubuc", .prix = 65, .nbPlaceDisponible = "20", .ageMin = "3", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe6.activites = Activite6
        leContexte.AddObject("groupes", Groupe6)

        Dim Activite7 = New activites With {.nomActivite = "Hockey", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite7)
        Dim Groupe7 = New groupes With {.nomProf = "Jean Dubuc", .prix = 350, .nbPlaceDisponible = "20", .ageMin = "10", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013", .materielRequis = "Ensemble Complet"}
        Groupe7.activites = Activite7
        leContexte.AddObject("groupes", Groupe7)

        Dim Activite8 = New activites With {.nomActivite = "Judo", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite8)
        Dim Groupe8 = New groupes With {.nomProf = "Jean Dubuc", .prix = 70, .nbPlaceDisponible = "20", .ageMin = "6", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe8.activites = Activite8
        leContexte.AddObject("groupes", Groupe8)

        Dim Activite9 = New activites With {.nomActivite = "Patinage artistique", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite9)
        Dim Groupe9 = New groupes With {.nomProf = "Jean Dubuc", .prix = 175, .nbPlaceDisponible = "8", .ageMin = "3", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013", .materielRequis = "Patin"}
        Groupe9.activites = Activite9
        leContexte.AddObject("groupes", Groupe9)

        Dim Activite10 = New activites With {.nomActivite = "Soccer intérieur", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite10)
        Dim Groupe10 = New groupes With {.nomProf = "Jean Dubuc", .prix = 150, .nbPlaceDisponible = "30", .ageMin = "4", .ageMax = "15", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe10.activites = Activite10
        leContexte.AddObject("groupes", Groupe10)

        Dim Activite11 = New activites With {.nomActivite = "Tennis de table", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite11)
        Dim Groupe11 = New groupes With {.nomProf = "Jean Dubuc", .prix = 80, .nbPlaceDisponible = "20", .ageMin = "7", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013", .materielRequis = "Raquette"}
        Groupe11.activites = Activite11
        leContexte.AddObject("groupes", Groupe11)

        Dim Activite12 = New activites With {.nomActivite = "Trampoline", .typeActivite = "Sport", .clientele = "Enfant"}
        leContexte.AddObject("activites", Activite12)
        Dim Groupe12 = New groupes With {.nomProf = "Jean Dubuc", .prix = 70, .nbPlaceDisponible = "8", .ageMin = "5", .ageMax = "16", .session = "Automne", .dateDebut = "1/14/2013"}
        Groupe12.activites = Activite12
        leContexte.AddObject("groupes", Groupe12)

        'Adulte
        'Dim Activite13 = New activites With {.nomActivite = "Badminton", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite13)
        'Dim Activite14 = New activites With {.nomActivite = "Centre de tir", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite14)
        'Dim Activite15 = New activites With {.nomActivite = "Conditionnement physique de groupe", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite15)
        'Dim Activite16 = New activites With {.nomActivite = "Escrime", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite16)
        'Dim Activite17 = New activites With {.nomActivite = "Exercices physiques", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite17)
        'Dim Activite18 = New activites With {.nomActivite = "Judo", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite18)
        'Dim Activite19 = New activites With {.nomActivite = "Judo Ju Jitsu", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite19)
        'Dim Activite20 = New activites With {.nomActivite = "Karaté (style shotokan)", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite20)
        'Dim Activite21 = New activites With {.nomActivite = "Patinage (40 ans et plus)", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite21)
        'Dim Activite22 = New activites With {.nomActivite = "Pétanque intérieure", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite22)
        'Dim Activite23 = New activites With {.nomActivite = "Tai Chi", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite23)
        'Dim Activite24 = New activites With {.nomActivite = "Tennis de table", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite24)
        'Dim Activite25 = New activites With {.nomActivite = "Volley-ball", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite25)
        'Dim Activite26 = New activites With {.nomActivite = "Yoga", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite26)

        'Parents-enfants
        'Dim Activite27 = New activites With {.nomActivite = "Club de badminton", .typeActivite = "Sport", .clientele = "Parents-enfants"}
        'leContexte.AddObject("activites", Activite27)
        'Dim Activite28 = New activites With {.nomActivite = "Escalade", .typeActivite = "Sport", .clientele = "Parents-enfants"}
        'leContexte.AddObject("activites", Activite28)
        'Dim Activite29 = New activites With {.nomActivite = "Tennis de table", .typeActivite = "Sport", .clientele = "Parents-enfants"}
        'leContexte.AddObject("activites", Activite29)
        'Dim Activite30 = New activites With {.nomActivite = "Yoga", .typeActivite = "Sport", .clientele = "Parents-enfants"}
        'leContexte.AddObject("activites", Activite30)

        'Enfant
        'Dim Activite31 = New activites With {.nomActivite = "Programme Croix-Rouge", .typeActivite = "Sport", .clientele = "Enfant"}
        'leContexte.AddObject("activites", Activite31)
        'Dim Activite32 = New activites With {.nomActivite = "Cours de natation préscolaire", .typeActivite = "Sport", .clientele = "Enfant"}
        'leContexte.AddObject("activites", Activite32)

        'Adulte
        'Dim Activite33 = New activites With {.nomActivite = "Programme Croix-Rouge", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite33)
        'Dim Activite34 = New activites With {.nomActivite = "Cours de natation junior", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite34)
        'Dim Activite35 = New activites With {.nomActivite = "Aquaforme", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite35)
        'Dim Activite36 = New activites With {.nomActivite = "Aquaforme 50 ans et plus", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite36)
        'Dim Activite37 = New activites With {.nomActivite = "Aquajogging", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite37)
        'Dim Activite38 = New activites With {.nomActivite = "Aquapoussette", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite38)
        'Dim Activite39 = New activites With {.nomActivite = "Remise en forme", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite39)
        'Dim Activite40 = New activites With {.nomActivite = "Natation essentiel", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite40)
        'Dim Activite41 = New activites With {.nomActivite = "Natation style de nages", .typeActivite = "Sport", .clientele = "Adulte"}
        'leContexte.AddObject("activites", Activite41)

        'Debut du 3ème pdf


        leContexte.SaveChanges()

    End Sub
End Class
