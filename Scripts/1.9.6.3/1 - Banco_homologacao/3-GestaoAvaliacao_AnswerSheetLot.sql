
USE [GestaoAvaliacao];


GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO 

GO
PRINT N'Dropping [dbo].[AnswerSheetLot].[IX_Test_Id]...';


GO
DROP INDEX [IX_Test_Id]
    ON [dbo].[AnswerSheetLot];


GO
PRINT N'Dropping [dbo].[FK_dbo.AnswerSheetLot_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot] DROP CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.Test_Test_Id];


GO
PRINT N'Altering [dbo].[AnswerSheetLot]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot] ALTER COLUMN [Test_Id] BIGINT NULL;


GO
ALTER TABLE [dbo].[AnswerSheetLot]
    ADD [Type]           TINYINT        DEFAULT ((0)) NOT NULL,
        [RequestDate]    DATETIME       NULL,
        [Parent_Id]      BIGINT         DEFAULT ((0)) NULL,
        [ExecutionOwner] VARCHAR (1000) NULL;


GO
PRINT N'Creating [dbo].[AnswerSheetLot].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[AnswerSheetLot]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetLot].[IX_Parent_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Parent_Id]
    ON [dbo].[AnswerSheetLot]([Parent_Id] ASC);


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetLot_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetLot_dbo.AnswerSheetLot_Parent_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.AnswerSheetLot_Parent_Id] FOREIGN KEY ([Parent_Id]) REFERENCES [dbo].[AnswerSheetLot] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [dbo].[AnswerSheetLot] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.Test_Test_Id];

ALTER TABLE [dbo].[AnswerSheetLot] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.AnswerSheetLot_Parent_Id];



GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) 
  ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 
  BEGIN
    PRINT 'The database update succeeded'
    COMMIT TRANSACTION
  END
ELSE 
  PRINT 'The database update failed - ROLLBACK aplied'
GO
DROP TABLE #tmpErrors 
GO
