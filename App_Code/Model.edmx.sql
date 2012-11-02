
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/01/2012 14:05:03
-- Generated from EDMX file: C:\Users\Maxime\Documents\Visual Studio 2010\WebSites\CSL\App_Code\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjetRegulier2012_02];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_clientsJeu_dossiersJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[clients] DROP CONSTRAINT [FK_clientsJeu_dossiersJeu];
GO
IF OBJECT_ID(N'[dbo].[FK_clientslisteAttente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[listeAttente] DROP CONSTRAINT [FK_clientslisteAttente];
GO
IF OBJECT_ID(N'[dbo].[FK_groupes_activites]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[groupes] DROP CONSTRAINT [FK_groupes_activites];
GO
IF OBJECT_ID(N'[dbo].[FK_groupeslisteAttente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[listeAttente] DROP CONSTRAINT [FK_groupeslisteAttente];
GO
IF OBJECT_ID(N'[dbo].[FK_horaireDynamique_groupes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[horaireDynamique] DROP CONSTRAINT [FK_horaireDynamique_groupes];
GO
IF OBJECT_ID(N'[dbo].[FK_horaireFixe_groupes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[horaireFixe] DROP CONSTRAINT [FK_horaireFixe_groupes];
GO
IF OBJECT_ID(N'[dbo].[FK_inscription_clients]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscription] DROP CONSTRAINT [FK_inscription_clients];
GO
IF OBJECT_ID(N'[dbo].[FK_inscription_dossiers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscription] DROP CONSTRAINT [FK_inscription_dossiers];
GO
IF OBJECT_ID(N'[dbo].[FK_inscription_groupes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscription] DROP CONSTRAINT [FK_inscription_groupes];
GO
IF OBJECT_ID(N'[dbo].[FK_inscription_paiements]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscription] DROP CONSTRAINT [FK_inscription_paiements];
GO
IF OBJECT_ID(N'[dbo].[FK_panier_dossiers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[panier] DROP CONSTRAINT [FK_panier_dossiers];
GO
IF OBJECT_ID(N'[dbo].[FK_panier_groupes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[panier] DROP CONSTRAINT [FK_panier_groupes];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[activites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[activites];
GO
IF OBJECT_ID(N'[dbo].[clients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[clients];
GO
IF OBJECT_ID(N'[dbo].[dossiers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[dossiers];
GO
IF OBJECT_ID(N'[dbo].[groupes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[groupes];
GO
IF OBJECT_ID(N'[dbo].[horaireDynamique]', 'U') IS NOT NULL
    DROP TABLE [dbo].[horaireDynamique];
GO
IF OBJECT_ID(N'[dbo].[horaireFixe]', 'U') IS NOT NULL
    DROP TABLE [dbo].[horaireFixe];
GO
IF OBJECT_ID(N'[dbo].[inscription]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inscription];
GO
IF OBJECT_ID(N'[dbo].[listeAttente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[listeAttente];
GO
IF OBJECT_ID(N'[dbo].[paiements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[paiements];
GO
IF OBJECT_ID(N'[dbo].[panier]', 'U') IS NOT NULL
    DROP TABLE [dbo].[panier];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'activites'
CREATE TABLE [dbo].[activites] (
    [noActivite] int IDENTITY(1,1) NOT NULL,
    [nomActivite] nvarchar(max)  NOT NULL,
    [typeActivite] nvarchar(max)  NOT NULL,
    [clientele] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'clients'
CREATE TABLE [dbo].[clients] (
    [noClient] int IDENTITY(1,1) NOT NULL,
    [nom] nvarchar(max)  NOT NULL,
    [prenom] nvarchar(max)  NOT NULL,
    [dateNaissance] nvarchar(max)  NOT NULL,
    [noDossier] int  NOT NULL,
    [nomComplet] AS (prenom + SPACE(1) + nom)  NOT NULL
);
GO

-- Creating table 'dossiers'
CREATE TABLE [dbo].[dossiers] (
    [noDossier] int IDENTITY(1,1) NOT NULL,
    [adresse] nvarchar(max)  NOT NULL,
    [ville] nvarchar(max)  NOT NULL,
    [codePostal] nvarchar(max)  NOT NULL,
    [province] nvarchar(max)  NOT NULL,
    [noTelephone] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [username] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [typeUtilisateur] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'groupes'
CREATE TABLE [dbo].[groupes] (
    [noGroupe] int IDENTITY(1,1) NOT NULL,
    [nomProf] nvarchar(max)  NOT NULL,
    [prix] int  NOT NULL,
    [nbPlaceDisponible] nvarchar(max)  NOT NULL,
    [ageMin] int  NOT NULL,
    [ageMax] int  NOT NULL,
    [session] nvarchar(max)  NOT NULL,
    [dateDebut] nvarchar(max)  NOT NULL,
    [noActivite] int  NOT NULL,
    [materielRequis] nvarchar(max)  NOT NULL,
    [prealable] nvarchar(max)  NULL
);
GO

-- Creating table 'horaireDynamique'
CREATE TABLE [dbo].[horaireDynamique] (
    [noHoraireDynamique] int IDENTITY(1,1) NOT NULL,
    [noGroupe] int  NOT NULL,
    [dateDebut] nvarchar(max)  NOT NULL,
    [heureDebut] nvarchar(10)  NOT NULL,
    [heureFin] nvarchar(10)  NOT NULL,
    [emplacement] nvarchar(max)  NOT NULL,
    [dateFin] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'horaireFixe'
CREATE TABLE [dbo].[horaireFixe] (
    [noHoraireFixe] int IDENTITY(1,1) NOT NULL,
    [noGroupe] int  NOT NULL,
    [heureDebut] nvarchar(10)  NOT NULL,
    [heureFin] nvarchar(10)  NOT NULL,
    [jours] nvarchar(max)  NOT NULL,
    [emplacement] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'inscription'
CREATE TABLE [dbo].[inscription] (
    [noInscription] int IDENTITY(1,1) NOT NULL,
    [noClient] int  NOT NULL,
    [dateInscription] nvarchar(max)  NOT NULL,
    [descriptionAchat] nvarchar(max)  NOT NULL,
    [noGroupe] int  NOT NULL,
    [noPaiement] int  NOT NULL,
    [noDossier] int  NOT NULL
);
GO

-- Creating table 'listeAttente'
CREATE TABLE [dbo].[listeAttente] (
    [noListeAttente] int IDENTITY(1,1) NOT NULL,
    [noGroupe] int  NOT NULL,
    [noClient] int  NOT NULL,
    [dateDebutAttente] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'paiements'
CREATE TABLE [dbo].[paiements] (
    [noPaiement] int IDENTITY(1,1) NOT NULL,
    [noInscription] nvarchar(max)  NOT NULL,
    [datePaiement] nvarchar(max)  NOT NULL,
    [TPS] int  NOT NULL,
    [TVQ] int  NOT NULL,
    [rabais] nvarchar(max)  NOT NULL,
    [totalPaiement] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'panier'
CREATE TABLE [dbo].[panier] (
    [noPanier] int IDENTITY(1,1) NOT NULL,
    [noDossier] int  NOT NULL,
    [noGroupe] int  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [noActivite] in table 'activites'
ALTER TABLE [dbo].[activites]
ADD CONSTRAINT [PK_activites]
    PRIMARY KEY CLUSTERED ([noActivite] ASC);
GO

-- Creating primary key on [noClient] in table 'clients'
ALTER TABLE [dbo].[clients]
ADD CONSTRAINT [PK_clients]
    PRIMARY KEY CLUSTERED ([noClient] ASC);
GO

-- Creating primary key on [noDossier] in table 'dossiers'
ALTER TABLE [dbo].[dossiers]
ADD CONSTRAINT [PK_dossiers]
    PRIMARY KEY CLUSTERED ([noDossier] ASC);
GO

-- Creating primary key on [noGroupe] in table 'groupes'
ALTER TABLE [dbo].[groupes]
ADD CONSTRAINT [PK_groupes]
    PRIMARY KEY CLUSTERED ([noGroupe] ASC);
GO

-- Creating primary key on [noHoraireDynamique] in table 'horaireDynamique'
ALTER TABLE [dbo].[horaireDynamique]
ADD CONSTRAINT [PK_horaireDynamique]
    PRIMARY KEY CLUSTERED ([noHoraireDynamique] ASC);
GO

-- Creating primary key on [noHoraireFixe] in table 'horaireFixe'
ALTER TABLE [dbo].[horaireFixe]
ADD CONSTRAINT [PK_horaireFixe]
    PRIMARY KEY CLUSTERED ([noHoraireFixe] ASC);
GO

-- Creating primary key on [noInscription] in table 'inscription'
ALTER TABLE [dbo].[inscription]
ADD CONSTRAINT [PK_inscription]
    PRIMARY KEY CLUSTERED ([noInscription] ASC);
GO

-- Creating primary key on [noListeAttente] in table 'listeAttente'
ALTER TABLE [dbo].[listeAttente]
ADD CONSTRAINT [PK_listeAttente]
    PRIMARY KEY CLUSTERED ([noListeAttente] ASC);
GO

-- Creating primary key on [noPaiement] in table 'paiements'
ALTER TABLE [dbo].[paiements]
ADD CONSTRAINT [PK_paiements]
    PRIMARY KEY CLUSTERED ([noPaiement] ASC);
GO

-- Creating primary key on [noPanier] in table 'panier'
ALTER TABLE [dbo].[panier]
ADD CONSTRAINT [PK_panier]
    PRIMARY KEY CLUSTERED ([noPanier] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [noActivite] in table 'groupes'
ALTER TABLE [dbo].[groupes]
ADD CONSTRAINT [FK_groupes_activites]
    FOREIGN KEY ([noActivite])
    REFERENCES [dbo].[activites]
        ([noActivite])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_groupes_activites'
CREATE INDEX [IX_FK_groupes_activites]
ON [dbo].[groupes]
    ([noActivite]);
GO

-- Creating foreign key on [noDossier] in table 'clients'
ALTER TABLE [dbo].[clients]
ADD CONSTRAINT [FK_clientsJeu_dossiersJeu]
    FOREIGN KEY ([noDossier])
    REFERENCES [dbo].[dossiers]
        ([noDossier])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_clientsJeu_dossiersJeu'
CREATE INDEX [IX_FK_clientsJeu_dossiersJeu]
ON [dbo].[clients]
    ([noDossier]);
GO

-- Creating foreign key on [noClient] in table 'listeAttente'
ALTER TABLE [dbo].[listeAttente]
ADD CONSTRAINT [FK_clientslisteAttente]
    FOREIGN KEY ([noClient])
    REFERENCES [dbo].[clients]
        ([noClient])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_clientslisteAttente'
CREATE INDEX [IX_FK_clientslisteAttente]
ON [dbo].[listeAttente]
    ([noClient]);
GO

-- Creating foreign key on [noClient] in table 'inscription'
ALTER TABLE [dbo].[inscription]
ADD CONSTRAINT [FK_inscription_clients]
    FOREIGN KEY ([noClient])
    REFERENCES [dbo].[clients]
        ([noClient])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inscription_clients'
CREATE INDEX [IX_FK_inscription_clients]
ON [dbo].[inscription]
    ([noClient]);
GO

-- Creating foreign key on [noDossier] in table 'inscription'
ALTER TABLE [dbo].[inscription]
ADD CONSTRAINT [FK_inscription_dossiers]
    FOREIGN KEY ([noDossier])
    REFERENCES [dbo].[dossiers]
        ([noDossier])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inscription_dossiers'
CREATE INDEX [IX_FK_inscription_dossiers]
ON [dbo].[inscription]
    ([noDossier]);
GO

-- Creating foreign key on [noDossier] in table 'panier'
ALTER TABLE [dbo].[panier]
ADD CONSTRAINT [FK_panier_dossiers]
    FOREIGN KEY ([noDossier])
    REFERENCES [dbo].[dossiers]
        ([noDossier])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_panier_dossiers'
CREATE INDEX [IX_FK_panier_dossiers]
ON [dbo].[panier]
    ([noDossier]);
GO

-- Creating foreign key on [noGroupe] in table 'listeAttente'
ALTER TABLE [dbo].[listeAttente]
ADD CONSTRAINT [FK_groupeslisteAttente]
    FOREIGN KEY ([noGroupe])
    REFERENCES [dbo].[groupes]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_groupeslisteAttente'
CREATE INDEX [IX_FK_groupeslisteAttente]
ON [dbo].[listeAttente]
    ([noGroupe]);
GO

-- Creating foreign key on [noGroupe] in table 'horaireDynamique'
ALTER TABLE [dbo].[horaireDynamique]
ADD CONSTRAINT [FK_horaireDynamique_groupes]
    FOREIGN KEY ([noGroupe])
    REFERENCES [dbo].[groupes]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_horaireDynamique_groupes'
CREATE INDEX [IX_FK_horaireDynamique_groupes]
ON [dbo].[horaireDynamique]
    ([noGroupe]);
GO

-- Creating foreign key on [noGroupe] in table 'horaireFixe'
ALTER TABLE [dbo].[horaireFixe]
ADD CONSTRAINT [FK_horaireFixe_groupes]
    FOREIGN KEY ([noGroupe])
    REFERENCES [dbo].[groupes]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_horaireFixe_groupes'
CREATE INDEX [IX_FK_horaireFixe_groupes]
ON [dbo].[horaireFixe]
    ([noGroupe]);
GO

-- Creating foreign key on [noGroupe] in table 'inscription'
ALTER TABLE [dbo].[inscription]
ADD CONSTRAINT [FK_inscription_groupes]
    FOREIGN KEY ([noGroupe])
    REFERENCES [dbo].[groupes]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inscription_groupes'
CREATE INDEX [IX_FK_inscription_groupes]
ON [dbo].[inscription]
    ([noGroupe]);
GO

-- Creating foreign key on [noGroupe] in table 'panier'
ALTER TABLE [dbo].[panier]
ADD CONSTRAINT [FK_panier_groupes]
    FOREIGN KEY ([noGroupe])
    REFERENCES [dbo].[groupes]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_panier_groupes'
CREATE INDEX [IX_FK_panier_groupes]
ON [dbo].[panier]
    ([noGroupe]);
GO

-- Creating foreign key on [noPaiement] in table 'inscription'
ALTER TABLE [dbo].[inscription]
ADD CONSTRAINT [FK_inscription_paiements]
    FOREIGN KEY ([noPaiement])
    REFERENCES [dbo].[paiements]
        ([noPaiement])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inscription_paiements'
CREATE INDEX [IX_FK_inscription_paiements]
ON [dbo].[inscription]
    ([noPaiement]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------