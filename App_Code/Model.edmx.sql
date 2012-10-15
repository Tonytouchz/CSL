
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/15/2012 11:10:20
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

IF OBJECT_ID(N'[dbo].[FK_activitesgroupes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[groupesJeu] DROP CONSTRAINT [FK_activitesgroupes];
GO
IF OBJECT_ID(N'[dbo].[FK_clientsinscription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscriptionJeu] DROP CONSTRAINT [FK_clientsinscription];
GO
IF OBJECT_ID(N'[dbo].[FK_clientslisteAttente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[listeAttenteJeu] DROP CONSTRAINT [FK_clientslisteAttente];
GO
IF OBJECT_ID(N'[dbo].[FK_dossiersclients]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[clientsJeu] DROP CONSTRAINT [FK_dossiersclients];
GO
IF OBJECT_ID(N'[dbo].[FK_groupeshoraires]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[horairesJeu] DROP CONSTRAINT [FK_groupeshoraires];
GO
IF OBJECT_ID(N'[dbo].[FK_groupesinscription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscriptionJeu] DROP CONSTRAINT [FK_groupesinscription];
GO
IF OBJECT_ID(N'[dbo].[FK_groupeslisteAttente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[listeAttenteJeu] DROP CONSTRAINT [FK_groupeslisteAttente];
GO
IF OBJECT_ID(N'[dbo].[FK_paiementsinscription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscriptionJeu] DROP CONSTRAINT [FK_paiementsinscription];
GO
IF OBJECT_ID(N'[dbo].[FK_prealablesgroupes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[prealablesJeu] DROP CONSTRAINT [FK_prealablesgroupes];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[activitesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[activitesJeu];
GO
IF OBJECT_ID(N'[dbo].[clientsJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[clientsJeu];
GO
IF OBJECT_ID(N'[dbo].[dossiersJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[dossiersJeu];
GO
IF OBJECT_ID(N'[dbo].[groupesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[groupesJeu];
GO
IF OBJECT_ID(N'[dbo].[horairesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[horairesJeu];
GO
IF OBJECT_ID(N'[dbo].[inscriptionJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inscriptionJeu];
GO
IF OBJECT_ID(N'[dbo].[listeAttenteJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[listeAttenteJeu];
GO
IF OBJECT_ID(N'[dbo].[paiementsJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[paiementsJeu];
GO
IF OBJECT_ID(N'[dbo].[prealablesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[prealablesJeu];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'groupesJeu'
CREATE TABLE [dbo].[groupesJeu] (
    [noGroupe] int IDENTITY(1,1) NOT NULL,
    [nomProf] nvarchar(max)  NOT NULL,
    [prix] int  NOT NULL,
    [nbPlaceDisponible] nvarchar(max)  NOT NULL,
    [ageMin] int  NOT NULL,
    [ageMax] int  NOT NULL,
    [session] nvarchar(max)  NOT NULL,
    [dateDebut] nvarchar(max)  NOT NULL,
    [noActivite] nvarchar(max)  NOT NULL,
    [materielRequis] nvarchar(max)  NOT NULL,
    [activites_noActivite] int  NOT NULL
);
GO

-- Creating table 'inscriptionJeu'
CREATE TABLE [dbo].[inscriptionJeu] (
    [noInscription] int IDENTITY(1,1) NOT NULL,
    [noClient] nvarchar(max)  NOT NULL,
    [dateInscription] nvarchar(max)  NOT NULL,
    [descriptionAchat] nvarchar(max)  NOT NULL,
    [noGroupe] nvarchar(max)  NOT NULL,
    [noPaiement] nvarchar(max)  NOT NULL,
    [groupes_noGroupe] int  NOT NULL,
    [paiements_noPaiement] int  NOT NULL,
    [clients_noClient] int  NOT NULL
);
GO

-- Creating table 'listeAttenteJeu'
CREATE TABLE [dbo].[listeAttenteJeu] (
    [noListeAttente] int IDENTITY(1,1) NOT NULL,
    [noGroupe] int  NOT NULL,
    [noClient] nvarchar(max)  NOT NULL,
    [dateDebutAttente] nvarchar(max)  NOT NULL,
    [groupes_noGroupe] int  NOT NULL,
    [clients_noClient] int  NOT NULL
);
GO

-- Creating table 'paiementsJeu'
CREATE TABLE [dbo].[paiementsJeu] (
    [noPaiement] int IDENTITY(1,1) NOT NULL,
    [noInscription] nvarchar(max)  NOT NULL,
    [datePaiement] nvarchar(max)  NOT NULL,
    [TPS] int  NOT NULL,
    [TVQ] int  NOT NULL,
    [rabais] nvarchar(max)  NOT NULL,
    [totalPaiement] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'activitesJeu'
CREATE TABLE [dbo].[activitesJeu] (
    [noActivite] int IDENTITY(1,1) NOT NULL,
    [nomActivite] nvarchar(max)  NOT NULL,
    [typeActivite] nvarchar(max)  NOT NULL,
    [clientele] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'horairesJeu'
CREATE TABLE [dbo].[horairesJeu] (
    [noHoraire] int IDENTITY(1,1) NOT NULL,
    [noGroupe] nvarchar(max)  NOT NULL,
    [heureDebut] nvarchar(max)  NOT NULL,
    [heureFin] nvarchar(max)  NOT NULL,
    [emplacement] nvarchar(max)  NOT NULL,
    [groupes_noGroupe] int  NOT NULL
);
GO

-- Creating table 'clientsJeu'
CREATE TABLE [dbo].[clientsJeu] (
    [noClient] int IDENTITY(1,1) NOT NULL,
    [noDossier] nvarchar(max)  NOT NULL,
    [nom] nvarchar(max)  NOT NULL,
    [prenom] nvarchar(max)  NOT NULL,
    [dateNaissance] nvarchar(max)  NOT NULL,
    [dossiers_noDossier] int  NOT NULL
);
GO

-- Creating table 'dossiersJeu'
CREATE TABLE [dbo].[dossiersJeu] (
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

-- Creating table 'prealablesJeu'
CREATE TABLE [dbo].[prealablesJeu] (
    [noPrealable] int IDENTITY(1,1) NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [noGroupe] nvarchar(max)  NOT NULL,
    [groupes_noGroupe] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [noGroupe] in table 'groupesJeu'
ALTER TABLE [dbo].[groupesJeu]
ADD CONSTRAINT [PK_groupesJeu]
    PRIMARY KEY CLUSTERED ([noGroupe] ASC);
GO

-- Creating primary key on [noInscription] in table 'inscriptionJeu'
ALTER TABLE [dbo].[inscriptionJeu]
ADD CONSTRAINT [PK_inscriptionJeu]
    PRIMARY KEY CLUSTERED ([noInscription] ASC);
GO

-- Creating primary key on [noListeAttente] in table 'listeAttenteJeu'
ALTER TABLE [dbo].[listeAttenteJeu]
ADD CONSTRAINT [PK_listeAttenteJeu]
    PRIMARY KEY CLUSTERED ([noListeAttente] ASC);
GO

-- Creating primary key on [noPaiement] in table 'paiementsJeu'
ALTER TABLE [dbo].[paiementsJeu]
ADD CONSTRAINT [PK_paiementsJeu]
    PRIMARY KEY CLUSTERED ([noPaiement] ASC);
GO

-- Creating primary key on [noActivite] in table 'activitesJeu'
ALTER TABLE [dbo].[activitesJeu]
ADD CONSTRAINT [PK_activitesJeu]
    PRIMARY KEY CLUSTERED ([noActivite] ASC);
GO

-- Creating primary key on [noHoraire] in table 'horairesJeu'
ALTER TABLE [dbo].[horairesJeu]
ADD CONSTRAINT [PK_horairesJeu]
    PRIMARY KEY CLUSTERED ([noHoraire] ASC);
GO

-- Creating primary key on [noClient] in table 'clientsJeu'
ALTER TABLE [dbo].[clientsJeu]
ADD CONSTRAINT [PK_clientsJeu]
    PRIMARY KEY CLUSTERED ([noClient] ASC);
GO

-- Creating primary key on [noDossier] in table 'dossiersJeu'
ALTER TABLE [dbo].[dossiersJeu]
ADD CONSTRAINT [PK_dossiersJeu]
    PRIMARY KEY CLUSTERED ([noDossier] ASC);
GO

-- Creating primary key on [noPrealable] in table 'prealablesJeu'
ALTER TABLE [dbo].[prealablesJeu]
ADD CONSTRAINT [PK_prealablesJeu]
    PRIMARY KEY CLUSTERED ([noPrealable] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [groupes_noGroupe] in table 'inscriptionJeu'
ALTER TABLE [dbo].[inscriptionJeu]
ADD CONSTRAINT [FK_groupesinscription]
    FOREIGN KEY ([groupes_noGroupe])
    REFERENCES [dbo].[groupesJeu]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_groupesinscription'
CREATE INDEX [IX_FK_groupesinscription]
ON [dbo].[inscriptionJeu]
    ([groupes_noGroupe]);
GO

-- Creating foreign key on [paiements_noPaiement] in table 'inscriptionJeu'
ALTER TABLE [dbo].[inscriptionJeu]
ADD CONSTRAINT [FK_paiementsinscription]
    FOREIGN KEY ([paiements_noPaiement])
    REFERENCES [dbo].[paiementsJeu]
        ([noPaiement])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_paiementsinscription'
CREATE INDEX [IX_FK_paiementsinscription]
ON [dbo].[inscriptionJeu]
    ([paiements_noPaiement]);
GO

-- Creating foreign key on [groupes_noGroupe] in table 'horairesJeu'
ALTER TABLE [dbo].[horairesJeu]
ADD CONSTRAINT [FK_groupeshoraires]
    FOREIGN KEY ([groupes_noGroupe])
    REFERENCES [dbo].[groupesJeu]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_groupeshoraires'
CREATE INDEX [IX_FK_groupeshoraires]
ON [dbo].[horairesJeu]
    ([groupes_noGroupe]);
GO

-- Creating foreign key on [activites_noActivite] in table 'groupesJeu'
ALTER TABLE [dbo].[groupesJeu]
ADD CONSTRAINT [FK_activitesgroupes]
    FOREIGN KEY ([activites_noActivite])
    REFERENCES [dbo].[activitesJeu]
        ([noActivite])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_activitesgroupes'
CREATE INDEX [IX_FK_activitesgroupes]
ON [dbo].[groupesJeu]
    ([activites_noActivite]);
GO

-- Creating foreign key on [groupes_noGroupe] in table 'listeAttenteJeu'
ALTER TABLE [dbo].[listeAttenteJeu]
ADD CONSTRAINT [FK_groupeslisteAttente]
    FOREIGN KEY ([groupes_noGroupe])
    REFERENCES [dbo].[groupesJeu]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_groupeslisteAttente'
CREATE INDEX [IX_FK_groupeslisteAttente]
ON [dbo].[listeAttenteJeu]
    ([groupes_noGroupe]);
GO

-- Creating foreign key on [dossiers_noDossier] in table 'clientsJeu'
ALTER TABLE [dbo].[clientsJeu]
ADD CONSTRAINT [FK_dossiersclients]
    FOREIGN KEY ([dossiers_noDossier])
    REFERENCES [dbo].[dossiersJeu]
        ([noDossier])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_dossiersclients'
CREATE INDEX [IX_FK_dossiersclients]
ON [dbo].[clientsJeu]
    ([dossiers_noDossier]);
GO

-- Creating foreign key on [clients_noClient] in table 'inscriptionJeu'
ALTER TABLE [dbo].[inscriptionJeu]
ADD CONSTRAINT [FK_clientsinscription]
    FOREIGN KEY ([clients_noClient])
    REFERENCES [dbo].[clientsJeu]
        ([noClient])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_clientsinscription'
CREATE INDEX [IX_FK_clientsinscription]
ON [dbo].[inscriptionJeu]
    ([clients_noClient]);
GO

-- Creating foreign key on [clients_noClient] in table 'listeAttenteJeu'
ALTER TABLE [dbo].[listeAttenteJeu]
ADD CONSTRAINT [FK_clientslisteAttente]
    FOREIGN KEY ([clients_noClient])
    REFERENCES [dbo].[clientsJeu]
        ([noClient])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_clientslisteAttente'
CREATE INDEX [IX_FK_clientslisteAttente]
ON [dbo].[listeAttenteJeu]
    ([clients_noClient]);
GO

-- Creating foreign key on [groupes_noGroupe] in table 'prealablesJeu'
ALTER TABLE [dbo].[prealablesJeu]
ADD CONSTRAINT [FK_prealablesgroupes]
    FOREIGN KEY ([groupes_noGroupe])
    REFERENCES [dbo].[groupesJeu]
        ([noGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_prealablesgroupes'
CREATE INDEX [IX_FK_prealablesgroupes]
ON [dbo].[prealablesJeu]
    ([groupes_noGroupe]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------