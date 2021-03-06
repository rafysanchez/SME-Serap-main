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
PRINT N'Creating [dbo].[TestPermission]...';


GO
CREATE TABLE [dbo].[TestPermission] (
    [Id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [gru_id]      UNIQUEIDENTIFIER NOT NULL,
    [Test_Id]     BIGINT           NOT NULL,
    [AllowAnswer] BIT              NOT NULL,
    [ShowResult]  BIT              NOT NULL,
    [TestHide]    BIT              NOT NULL,
    [CreateDate]  DATETIME         NOT NULL,
    [UpdateDate]  DATETIME         NOT NULL,
    [State]       TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.TestPermission] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestPermission].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[TestPermission]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[FK_dbo.TestPermission_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[TestPermission] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestPermission_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Altering [dbo].[MS_Test_SearchFilteredUser]...';


GO

-- =============================================
-- Author:		Guilherme Mendonça
-- Create date: 27/05/2015
-- Description:	Retorna informações da prova de acordo com os filtros
-- =============================================
ALTER PROCEDURE [dbo].[MS_Test_SearchFilteredUser] 
	@TestId BIGINT = NUll,
	@TestType BIGINT = NUll,
	@DisciplineId BIGINT = NUll,
	@Bimester INT = NUll,
	@CreationDateStart DATETIME = NULL,
	@CreationDateEnd DATETIME = NULL,
	@Pendente BIT = NUll,
	@Cadastrada BIT = NUll,
	@Andamento BIT = NUll,
	@Aplicada BIT = NUll,
	@global BIT = NULL,
	@pageSize INT = NUll,
    @pageNumber INT,
	@ent_id UNIQUEIDENTIFIER,
	@pes_id UNIQUEIDENTIFIER,
	@usuId UNIQUEIDENTIFIER,
	@state TINYINT,
	@typeEntity TINYINT,
	@typeSelected TINYINT,
	@typeNotSelected TINYINT,
	@gru_id UNIQUEIDENTIFIER,
	@vis_id INT,
	@uad_id UNIQUEIDENTIFIER = NULL,
	@esc_id INT = NULL,
	@ttn_id INT = NULL,
	@tne_id INT = NULL,
	@crp_ordem INT = NULL,
	@multidiscipline BIT = NULL,
	@testFrequencyApplication INT = NULL

AS
BEGIN
	
	IF OBJECT_ID('tempdb..#tmp') > 0 DROP TABLE #tmp
	
	SELECT  TestId,
			UsuId,
			TestDescription, 
			TestTypeDescription, 
			[Global],
			ItemType_Id,
			CreateDate, 
			TestCreateDate,
			Discipline,
			TestFrequencyApplication,
			TestTypeFrequencyApplication, 
			ApplicationStartDate,
			ApplicationEndDate,
			CorrectionStartDate,
			CorrectionEndDate,
			Bib,
			Desempenho,
			TestSituation,
			Visible,
			ROW_NUMBER() OVER ( ORDER BY TestCreateDate DESC, TestTypeDescription ASC, TestDescription ASC) AS RowNumber
	INTO #tmp
	FROM    (
	
			 SELECT t.Id AS TestId,
					t.UsuId AS UsuId,
					t.Description AS TestDescription,
					tt.Description AS TestTypeDescription,
					tt.[Global],
					tt.ItemType_Id,
					CONVERT(VARCHAR(50), t.CreateDate, 103) AS CreateDate,
					t.CreateDate AS TestCreateDate,
					CASE 
						WHEN d.Description IS NULL AND t.Multidiscipline = 1 THEN 'Multidisciplinar'
						ELSE d.Description 
					END AS Discipline,
					t.FrequencyApplication AS TestFrequencyApplication,
					tt.FrequencyApplication AS TestTypeFrequencyApplication,
					CONVERT(VARCHAR(50), t.ApplicationStartDate, 103) AS ApplicationStartDate,
					CONVERT(VARCHAR(50), t.ApplicationEndDate, 103) AS ApplicationEndDate,
					CONVERT(VARCHAR(50), t.CorrectionStartDate, 103) AS CorrectionStartDate,
					CONVERT(VARCHAR(50), t.CorrectionEndDate, 103) AS CorrectionEndDate,
					t.Bib,
					t.Visible,
					CONVERT(Bit,(CASE WHEN COUNT(tpl.Id) > 0 THEN 1 ELSE 0 END)) AS Desempenho,
					(CASE
						WHEN t.TestSituation = 1 THEN 1
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) < t.ApplicationStartDate THEN 2 
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) BETWEEN t.ApplicationStartDate AND t.ApplicationEndDate THEN 3
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) > t.ApplicationEndDate THEN 4
					 END) AS TestSituation
			 FROM Test t WITH(NOLOCK)
				  INNER JOIN TestType tt WITH(NOLOCK) ON tt.Id = t.TestType_Id 
				  INNER JOIN TestsByUser(@usuId, @pes_id, @ent_id, @state, @typeEntity, @typeSelected, @typeNotSelected, @gru_id, @vis_id, @uad_id, @esc_id, @ttn_id, @tne_id, @crp_ordem) teacher ON t.Id = teacher.Id
				  LEFT JOIN Discipline d WITH(NOLOCK) ON d.Id = t.Discipline_Id AND d.State = @state AND t.Discipline_Id = ISNULL(@DisciplineId, t.Discipline_Id)
				  LEFT JOIN TestPerformanceLevel tpl WITH(NOLOCK) ON tpl.Test_Id = t.Id AND tpl.State = @state
				  LEFT JOIN TestPermission TP WITH(NOLOCK) ON TP.Test_Id = t.Id AND TP.[State] = 1 AND TP.gru_id = @gru_id
			 WHERE t.State = @state AND tt.State = @state 
			 AND t.Id = ISNULL(@TestId, t.Id)
			 AND t.TestType_Id = ISNULL(@TestType, t.TestType_Id)
			 AND t.FrequencyApplication = ISNULL(@testFrequencyApplication, t.FrequencyApplication)
			 AND (@CreationDateStart IS NULL AND @CreationDateEnd IS NULL 
				 OR (@CreationDateStart IS NOT NULL AND @CreationDateEnd IS NULL AND CAST(t.CreateDate AS Date) >= CAST(@CreationDateStart AS Date))
				 OR (@CreationDateStart IS NULL AND @CreationDateEnd IS NOT NULL AND CAST(t.CreateDate AS Date) <= CAST(@CreationDateEnd AS Date))
				 OR (@CreationDateStart IS NOT NULL AND @CreationDateEnd IS NOT NULL AND CAST(t.CreateDate AS Date)  BETWEEN CAST(@CreationDateStart AS Date) AND CAST(@CreationDateEnd AS Date))
			 )
			 AND (@Pendente IS NULL AND @Cadastrada IS NULL AND @Andamento IS NULL AND @Aplicada IS NULL
				 OR (@Pendente IS NOT NULL AND t.TestSituation = 1)
				 OR (@Cadastrada IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) < CAST(t.ApplicationStartDate AS Date)))
				 OR (@Andamento IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) BETWEEN CAST(t.ApplicationStartDate AS Date) AND CAST(t.ApplicationEndDate AS Date)))
				 OR (@Aplicada IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) > CAST(t.ApplicationEndDate AS Date)))
			 )
			 AND tt.[Global] = ISNULL(@global, tt.[Global])
			 AND t.Visible = 1
			 AND ISNULL(TP.TestHide, 0) = 0
			 AND t.Multidiscipline = ISNULL(@multidiscipline, t.Multidiscipline)
			 GROUP BY t.Id,
					  t.UsuId,
					  t.Description,
					  tt.Description,
					  tt.[Global],
					  tt.ItemType_Id,
					  t.CreateDate,
					  d.Description,
					  t.Multidiscipline,
					  t.FrequencyApplication,
					  tt.FrequencyApplication,
					  t.ApplicationStartDate,
					  t.ApplicationEndDate,
					  t.CorrectionStartDate,
					  t.CorrectionEndDate,
					  t.Bib,
					  t.TestSituation,
					  t.Visible
			) AS R
	ORDER BY TestCreateDate DESC, TestTypeDescription ASC, TestDescription ASC


		
	SELECT TOP (@pageSize) TestId, UsuId, TestDescription, TestTypeDescription, [Global], ItemType_Id, CreateDate, Discipline, TestFrequencyApplication,
					TestTypeFrequencyApplication, ApplicationStartDate, ApplicationEndDate, CorrectionStartDate, CorrectionEndDate, Bib, Visible, Desempenho, TestSituation, RowNumber
	FROM #tmp
	WHERE   RowNumber > ( @pageSize * ( @pageNumber ) )
	ORDER BY RowNumber
	 
	SELECT COUNT(TestId) from #tmp

END
GO
PRINT N'Checking existing data against newly created constraints';


GO
ALTER TABLE [dbo].[TestPermission] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestPermission_dbo.Test_Test_Id];


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
