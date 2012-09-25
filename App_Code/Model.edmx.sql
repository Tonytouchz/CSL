
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 09/24/2012 11:34:57
-- Generated from EDMX file: C:\Users\Simon\Documents\Visual Studio 2010\WebSites\ProjetA2012\App_Code\Model.edmx
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

IF OBJECT_ID(N'[dbo].[FK_groupeslisteAttente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[listeAttenteJeu] DROP CONSTRAINT [FK_groupeslisteAttente];
GO
IF OBJECT_ID(N'[dbo].[FK_groupeshoraires]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[horairesJeu] DROP CONSTRAINT [FK_groupeshoraires];
GO
IF OBJECT_ID(N'[dbo].[FK_clientsdossiers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[usersJeu_clients] DROP CONSTRAINT [FK_clientsdossiers];
GO
IF OBJECT_ID(N'[dbo].[FK_inscriptionsclients_inscriptions]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscriptionsclients] DROP CONSTRAINT [FK_inscriptionsclients_inscriptions];
GO
IF OBJECT_ID(N'[dbo].[FK_inscriptionsclients_clients]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inscriptionsclients] DROP CONSTRAINT [FK_inscriptionsclients_clients];
GO
IF OBJECT_ID(N'[dbo].[FK_groupesinscriptions]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[groupesJeu] DROP CONSTRAINT [FK_groupesinscriptions];
GO
IF OBJECT_ID(N'[dbo].[FK_listeAttenteclients_listeAttente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[listeAttenteclients] DROP CONSTRAINT [FK_listeAttenteclients_listeAttente];
GO
IF OBJECT_ID(N'[dbo].[FK_listeAttenteclients_clients]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[listeAttenteclients] DROP CONSTRAINT [FK_listeAttenteclients_clients];
GO
IF OBJECT_ID(N'[dbo].[FK_paiementsinscriptions]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[paiementsJeu] DROP CONSTRAINT [FK_paiementsinscriptions];
GO
IF OBJECT_ID(N'[dbo].[FK_activitesgroupes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[groupesJeu] DROP CONSTRAINT [FK_activitesgroupes];
GO
IF OBJECT_ID(N'[dbo].[FK_prealablesactivites]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[prealablesJeu] DROP CONSTRAINT [FK_prealablesactivites];
GO
IF OBJECT_ID(N'[dbo].[FK_clients_inherits_users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[usersJeu_clients] DROP CONSTRAINT [FK_clients_inherits_users];
GO
IF OBJECT_ID(N'[dbo].[FK_admin_inherits_users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[usersJeu_admin] DROP CONSTRAINT [FK_admin_inherits_users];
GO
IF OBJECT_ID(N'[dbo].[FK_prepose_inherits_users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[usersJeu_prepose] DROP CONSTRAINT [FK_prepose_inherits_users];
GO
IF OBJECT_ID(N'[dbo].[FK_professeur_inherits_users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[usersJeu_professeur] DROP CONSTRAINT [FK_professeur_inherits_users];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[groupesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[groupesJeu];
GO
IF OBJECT_ID(N'[dbo].[horairesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[horairesJeu];
GO
IF OBJECT_ID(N'[dbo].[inscriptionsJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inscriptionsJeu];
GO
IF OBJECT_ID(N'[dbo].[listeAttenteJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[listeAttenteJeu];
GO
IF OBJECT_ID(N'[dbo].[activitesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[activitesJeu];
GO
IF OBJECT_ID(N'[dbo].[paiementsJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[paiementsJeu];
GO
IF OBJECT_ID(N'[dbo].[dossiersJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[dossiersJeu];
GO
IF OBJECT_ID(N'[dbo].[usersJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usersJeu];
GO
IF OBJECT_ID(N'[dbo].[prealablesJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[prealablesJeu];
GO
IF OBJECT_ID(N'[dbo].[usersJeu_clients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usersJeu_clients];
GO
IF OBJECT_ID(N'[dbo].[usersJeu_admin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usersJeu_admin];
GO
IF OBJECT_ID(N'[dbo].[usersJeu_prepose]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usersJeu_prepose];
GO
IF OBJECT_ID(N'[dbo].[usersJeu_professeur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[usersJeu_professeur];
GO
IF OBJECT_ID(N'[dbo].[inscriptionsclients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inscriptionsclients];
GO
IF OBJECT_ID(N'[dbo].[listeAttenteclients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[listeAttenteclients];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'groupesJeu'
CREATE TABLE [dbo].[groupesJeu] (
    [noGroupe] nvarchar(100)  NOT NULL,
    [noActivite] int  NOT NULL,
    [nomProf] nvarchar(100)  NOT NULL,
    [prix] int  NOT NULL,
    [nbPlaceDispo] int  NOT NULL,
    [debutDateInscription] datetime  NOT NULL,
    [finDateInscription] datetime  NOT NULL,
    [clientele] nvarchar(100)  NOT NULL,
    [ageMin] nvarchar(10)  NOT NULL,
    [ageMax] nvarchar(10)  NOT NULL,
    [session] nvarchar(100)  NOT NULL,
    [nomActivite] nvarchar(100)  NOT NULL,
    [dateDebutActivite] datetime  NOT NULL,
    [inscriptions_noTransaction] int  NOT NULL,
    [activites_noActivite] int  NOT NULL
);
GO

-- Creating table 'horairesJeu'
CREATE TABLE [dbo].[horairesJeu] (
    [noGroupe] int  NOT NULL,
    [heureDebut] datetime  NOT NULL,
    [emplacement] nvarchar(100)  NOT NULL,
    [duree] nvarchar(100)  NOT NULL,
    [groupes_noGroupe] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'inscriptionsJeu'
CREATE TABLE [dbo].[inscriptionsJeu] (
    [noTransaction] int IDENTITY(1,1) NOT NULL,
    [noClient] nvarchar(max)  NOT NULL,
    [dateInscription] datetime  NOT NULL,
    [noGroupe] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'listeAttenteJeu'
CREATE TABLE [dbo].[listeAttenteJeu] (
    [noGroupe] int  NOT NULL,
    [noClient] int  NOT NULL,
    [groupes_noGroupe] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'activitesJeu'
CREATE TABLE [dbo].[activitesJeu] (
    [noActivite] int IDENTITY(1,1) NOT NULL,
    [noPrealable] int  NOT NULL,
    [materielRequis] nvarchar(100)  NOT NULL,
    [typeActivite] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'paiementsJeu'
CREATE TABLE [dbo].[paiementsJeu] (
    [noTransaction] int IDENTITY(1,1) NOT NULL,
    [dateTransaction] datetime  NOT NULL,
    [totalTransaction] int  NOT NULL,
    [rabais] int  NOT NULL,
    [TPS] int  NOT NULL,
    [TVQ] int  NOT NULL,
    [inscriptions_noTransaction] int  NOT NULL
);
GO

-- Creating table 'dossiersJeu'
CREATE TABLE [dbo].[dossiersJeu] (
    [noDossier] int IDENTITY(1,1) NOT NULL,
    [adresse] nvarchar(100)  NOT NULL,
    [ville] nvarchar(100)  NOT NULL,
    [codePostal] nvarchar(100)  NOT NULL,
    [province] nvarchar(100)  NOT NULL,
    [telephone] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'usersJeu'
CREATE TABLE [dbo].[usersJeu] (
    [username] nvarchar(100)  NOT NULL,
    [password] nvarchar(100)  NOT NULL,
    [typeUtilisateur] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'prealablesJeu'
CREATE TABLE [dbo].[prealablesJeu] (
    [noPrealable] int IDENTITY(1,1) NOT NULL,
    [description] nvarchar(max)  NOT NULL,
    [noActivite] int  NOT NULL,
    [activites_noActivite] int  NOT NULL
);
GO

-- Creating table 'usersJeu_clients'
CREATE TABLE [dbo].[usersJeu_clients] (
    [noClient] int IDENTITY(1,1) NOT NULL,
    [noDossier] int  NOT NULL,
    [nom] nvarchar(max)  NOT NULL,
    [prenom] nvarchar(100)  NOT NULL,
    [email] nvarchar(100)  NOT NULL,
    [dateNaissance] datetime  NOT NULL,
    [username] nvarchar(100)  NOT NULL,
    [password] nvarchar(100)  NOT NULL,
    [dossiers_noDossier] int  NOT NULL
);
GO

-- Creating table 'usersJeu_admin'
CREATE TABLE [dbo].[usersJeu_admin] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [username] nvarchar(100)  NOT NULL,
    [password] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'usersJeu_prepose'
CREATE TABLE [dbo].[usersJeu_prepose] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [username] nvarchar(100)  NOT NULL,
    [password] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'usersJeu_professeur'
CREATE TABLE [dbo].[usersJeu_professeur] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [username] nvarchar(100)  NOT NULL,
    [password] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'inscriptionsclients'
CREATE TABLE [dbo].[inscriptionsclients] (
    [inscriptions_noTransaction] int  NOT NULL,
    [clients_username] nvarchar(100)  NOT NULL,
    [clients_password] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'listeAttenteclients'
CREATE TABLE [dbo].[listeAttenteclients] (
    [listeAttente_noGroupe] int  NOT NULL,
    [listeAttente_noClient] int  NOT NULL,
    [clients_username] nvarchar(100)  NOT NULL,
    [clients_password] nvarchar(100)  NOT NULL
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

-- Creating primary key on [noGroupe] in table 'horairesJeu'
ALTER TABLE [dbo].[horairesJeu]
ADD CONSTRAINT [PK_horairesJeu]
    PRIMARY KEY CLUSTERED ([noGroupe] ASC);
GO

-- Creating primary key on [noTransaction] in table 'inscriptionsJeu'
ALTER TABLE [dbo].[inscriptionsJeu]
ADD CONSTRAINT [PK_inscriptionsJeu]
    PRIMARY KEY CLUSTERED ([noTransaction] ASC);
GO

-- Creating primary key on [noGroupe], [noClient] in table 'listeAttenteJeu'
ALTER TABLE [dbo].[listeAttenteJeu]
ADD CONSTRAINT [PK_listeAttenteJeu]
    PRIMARY KEY CLUSTERED ([noGroupe], [noClient] ASC);
GO

-- Creating primary key on [noActivite] in table 'activitesJeu'
ALTER TABLE [dbo].[activitesJeu]
ADD CONSTRAINT [PK_activitesJeu]
    PRIMARY KEY CLUSTERED ([noActivite] ASC);
GO

-- Creating primary key on [noTransaction] in table 'paiementsJeu'
ALTER TABLE [dbo].[paiementsJeu]
ADD CONSTRAINT [PK_paiementsJeu]
    PRIMARY KEY CLUSTERED ([noTransaction] ASC);
GO

-- Creating primary key on [noDossier] in table 'dossiersJeu'
ALTER TABLE [dbo].[dossiersJeu]
ADD CONSTRAINT [PK_dossiersJeu]
    PRIMARY KEY CLUSTERED ([noDossier] ASC);
GO

-- Creating primary key on [username], [password] in table 'usersJeu'
ALTER TABLE [dbo].[usersJeu]
ADD CONSTRAINT [PK_usersJeu]
    PRIMARY KEY CLUSTERED ([username], [password] ASC);
GO

-- Creating primary key on [noPrealable] in table 'prealablesJeu'
ALTER TABLE [dbo].[prealablesJeu]
ADD CONSTRAINT [PK_prealablesJeu]
    PRIMARY KEY CLUSTERED ([noPrealable] ASC);
GO

-- Creating primary key on [username], [password] in table 'usersJeu_clients'
ALTER TABLE [dbo].[usersJeu_clients]
ADD CONSTRAINT [PK_usersJeu_clients]
    PRIMARY KEY CLUSTERED ([username], [password] ASC);
GO

-- Creating primary key on [username], [password] in table 'usersJeu_admin'
ALTER TABLE [dbo].[usersJeu_admin]
ADD CONSTRAINT [PK_usersJeu_admin]
    PRIMARY KEY CLUSTERED ([username], [password] ASC);
GO

-- Creating primary key on [username], [password] in table 'usersJeu_prepose'
ALTER TABLE [dbo].[usersJeu_prepose]
ADD CONSTRAINT [PK_usersJeu_prepose]
    PRIMARY KEY CLUSTERED ([username], [password] ASC);
GO

-- Creating primary key on [username], [password] in table 'usersJeu_professeur'
ALTER TABLE [dbo].[usersJeu_professeur]
ADD CONSTRAINT [PK_usersJeu_professeur]
    PRIMARY KEY CLUSTERED ([username], [password] ASC);
GO

-- Creating primary key on [inscriptions_noTransaction], [clients_username], [clients_password] in table 'inscriptionsclients'
ALTER TABLE [dbo].[inscriptionsclients]
ADD CONSTRAINT [PK_inscriptionsclients]
    PRIMARY KEY NONCLUSTERED ([inscriptions_noTransaction], [clients_username], [clients_password] ASC);
GO

-- Creating primary key on [listeAttente_noGroupe], [listeAttente_noClient], [clients_username], [clients_password] in table 'listeAttenteclients'
ALTER TABLE [dbo].[listeAttenteclients]
ADD CONSTRAINT [PK_listeAttenteclients]
    PRIMARY KEY NONCLUSTERED ([listeAttente_noGroupe], [listeAttente_noClient], [clients_username], [clients_password] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- Creating foreign key on [dossiers_noDossier] in table 'usersJeu_clients'
ALTER TABLE [dbo].[usersJeu_clients]
ADD CONSTRAINT [FK_clientsdossiers]
    FOREIGN KEY ([dossiers_noDossier])
    REFERENCES [dbo].[dossiersJeu]
        ([noDossier])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_clientsdossiers'
CREATE INDEX [IX_FK_clientsdossiers]
ON [dbo].[usersJeu_clients]
    ([dossiers_noDossier]);
GO

-- Creating foreign key on [inscriptions_noTransaction] in table 'inscriptionsclients'
ALTER TABLE [dbo].[inscriptionsclients]
ADD CONSTRAINT [FK_inscriptionsclients_inscriptions]
    FOREIGN KEY ([inscriptions_noTransaction])
    REFERENCES [dbo].[inscriptionsJeu]
        ([noTransaction])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [clients_username], [clients_password] in table 'inscriptionsclients'
ALTER TABLE [dbo].[inscriptionsclients]
ADD CONSTRAINT [FK_inscriptionsclients_clients]
    FOREIGN KEY ([clients_username], [clients_password])
    REFERENCES [dbo].[usersJeu_clients]
        ([username], [password])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_inscriptionsclients_clients'
CREATE INDEX [IX_FK_inscriptionsclients_clients]
ON [dbo].[inscriptionsclients]
    ([clients_username], [clients_password]);
GO

-- Creating foreign key on [inscriptions_noTransaction] in table 'groupesJeu'
ALTER TABLE [dbo].[groupesJeu]
ADD CONSTRAINT [FK_groupesinscriptions]
    FOREIGN KEY ([inscriptions_noTransaction])
    REFERENCES [dbo].[inscriptionsJeu]
        ([noTransaction])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_groupesinscriptions'
CREATE INDEX [IX_FK_groupesinscriptions]
ON [dbo].[groupesJeu]
    ([inscriptions_noTransaction]);
GO

-- Creating foreign key on [listeAttente_noGroupe], [listeAttente_noClient] in table 'listeAttenteclients'
ALTER TABLE [dbo].[listeAttenteclients]
ADD CONSTRAINT [FK_listeAttenteclients_listeAttente]
    FOREIGN KEY ([listeAttente_noGroupe], [listeAttente_noClient])
    REFERENCES [dbo].[listeAttenteJeu]
        ([noGroupe], [noClient])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [clients_username], [clients_password] in table 'listeAttenteclients'
ALTER TABLE [dbo].[listeAttenteclients]
ADD CONSTRAINT [FK_listeAttenteclients_clients]
    FOREIGN KEY ([clients_username], [clients_password])
    REFERENCES [dbo].[usersJeu_clients]
        ([username], [password])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_listeAttenteclients_clients'
CREATE INDEX [IX_FK_listeAttenteclients_clients]
ON [dbo].[listeAttenteclients]
    ([clients_username], [clients_password]);
GO

-- Creating foreign key on [inscriptions_noTransaction] in table 'paiementsJeu'
ALTER TABLE [dbo].[paiementsJeu]
ADD CONSTRAINT [FK_paiementsinscriptions]
    FOREIGN KEY ([inscriptions_noTransaction])
    REFERENCES [dbo].[inscriptionsJeu]
        ([noTransaction])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_paiementsinscriptions'
CREATE INDEX [IX_FK_paiementsinscriptions]
ON [dbo].[paiementsJeu]
    ([inscriptions_noTransaction]);
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

-- Creating foreign key on [activites_noActivite] in table 'prealablesJeu'
ALTER TABLE [dbo].[prealablesJeu]
ADD CONSTRAINT [FK_prealablesactivites]
    FOREIGN KEY ([activites_noActivite])
    REFERENCES [dbo].[activitesJeu]
        ([noActivite])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_prealablesactivites'
CREATE INDEX [IX_FK_prealablesactivites]
ON [dbo].[prealablesJeu]
    ([activites_noActivite]);
GO

-- Creating foreign key on [username], [password] in table 'usersJeu_clients'
ALTER TABLE [dbo].[usersJeu_clients]
ADD CONSTRAINT [FK_clients_inherits_users]
    FOREIGN KEY ([username], [password])
    REFERENCES [dbo].[usersJeu]
        ([username], [password])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [username], [password] in table 'usersJeu_admin'
ALTER TABLE [dbo].[usersJeu_admin]
ADD CONSTRAINT [FK_admin_inherits_users]
    FOREIGN KEY ([username], [password])
    REFERENCES [dbo].[usersJeu]
        ([username], [password])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [username], [password] in table 'usersJeu_prepose'
ALTER TABLE [dbo].[usersJeu_prepose]
ADD CONSTRAINT [FK_prepose_inherits_users]
    FOREIGN KEY ([username], [password])
    REFERENCES [dbo].[usersJeu]
        ([username], [password])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [username], [password] in table 'usersJeu_professeur'
ALTER TABLE [dbo].[usersJeu_professeur]
ADD CONSTRAINT [FK_professeur_inherits_users]
    FOREIGN KEY ([username], [password])
    REFERENCES [dbo].[usersJeu]
        ([username], [password])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------