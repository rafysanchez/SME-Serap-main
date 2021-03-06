USE GestaoAvaliacao
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

ALTER TABLE [dbo].[TestType] ADD [FrequencyApplication] [int] NOT NULL DEFAULT 1
ALTER TABLE [dbo].[Test] ADD [FrequencyApplication] [int] NOT NULL DEFAULT 1

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

USE GestaoAvaliacao
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

DECLARE @bimestral AS TABLE (Id BIGINT) 
INSERT INTO @bimestral 
SELECT Id 
FROM TestType WITH(NOLOCK) 
WHERE Bimester = 1

DECLARE @anual AS TABLE (Id BIGINT) 
INSERT INTO @anual 
SELECT Id 
FROM TestType WITH(NOLOCK) 
WHERE Bimester = 0

UPDATE TestType SET FrequencyApplication = 3 WHERE Id IN (SELECT Id FROM @bimestral)
UPDATE TestType SET FrequencyApplication = 1 WHERE Id IN (SELECT Id FROM @anual)

DECLARE @primeiroB AS TABLE (Id BIGINT) 
INSERT INTO @primeiroB 
SELECT Id 
FROM Test WITH(NOLOCK) 
WHERE Bimester = 1

DECLARE @segundoB AS TABLE (Id BIGINT) 
INSERT INTO @segundoB 
SELECT Id 
FROM Test WITH(NOLOCK) 
WHERE Bimester = 2

DECLARE @terceiroB AS TABLE (Id BIGINT) 
INSERT INTO @terceiroB 
SELECT Id 
FROM Test WITH(NOLOCK) 
WHERE Bimester = 3

DECLARE @quartoB AS TABLE (Id BIGINT) 
INSERT INTO @quartoB 
SELECT Id 
FROM Test WITH(NOLOCK) 
WHERE Bimester = 4

DECLARE @zero AS TABLE (Id BIGINT) 
INSERT INTO @zero 
SELECT Id 
FROM Test WITH(NOLOCK) 
WHERE Bimester = 0

UPDATE Test SET FrequencyApplication = 7 WHERE Id IN (SELECT Id FROM @primeiroB)
UPDATE Test SET FrequencyApplication = 8 WHERE Id IN (SELECT Id FROM @segundoB)
UPDATE Test SET FrequencyApplication = 9 WHERE Id IN (SELECT Id FROM @terceiroB)
UPDATE Test SET FrequencyApplication = 10 WHERE Id IN (SELECT Id FROM @quartoB)
UPDATE Test SET FrequencyApplication = 1 WHERE Id IN (SELECT Id FROM @zero)

-- DROP COLUNA ANTIGA Bimester
DECLARE @var0 nvarchar(128)
SELECT @var0 = name
FROM sys.default_constraints
WHERE parent_object_id = object_id(N'dbo.Test')
AND col_name(parent_object_id, parent_column_id) = 'Bimester';
IF @var0 IS NOT NULL
    EXECUTE('ALTER TABLE [dbo].[Test] DROP CONSTRAINT [' + @var0 + ']')
ALTER TABLE [dbo].[Test] DROP COLUMN [Bimester]

DECLARE @var1 nvarchar(128)
SELECT @var1 = name
FROM sys.default_constraints
WHERE parent_object_id = object_id(N'dbo.TestType')
AND col_name(parent_object_id, parent_column_id) = 'Bimester';
IF @var1 IS NOT NULL
    EXECUTE('ALTER TABLE [dbo].[TestType] DROP CONSTRAINT [' + @var1 + ']')
ALTER TABLE [dbo].[TestType] DROP COLUMN [Bimester]

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