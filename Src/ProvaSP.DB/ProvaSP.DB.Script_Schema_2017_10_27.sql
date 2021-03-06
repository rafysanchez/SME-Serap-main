/*
   sexta-feira, 27 de outubro de 2017 - 15:02:04
   Database: ProvaSP
*/

USE ProvaSP

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.MediaEdicaoAluno
	DROP CONSTRAINT FK_MediaAluno_AreaConhecimento
GO
ALTER TABLE dbo.MediaEdicaoTurma
	DROP CONSTRAINT FK_MediaTurma_AreaConhecimento
GO
ALTER TABLE dbo.AreaConhecimento SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.AreaConhecimento', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.AreaConhecimento', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.AreaConhecimento', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.MediaAtualTurma ADD CONSTRAINT
	FK_MediaAtualTurma_AreaConhecimento FOREIGN KEY
	(
	AreaConhecimentoID
	) REFERENCES dbo.AreaConhecimento
	(
	AreaConhecimentoID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.MediaAtualTurma SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.MediaAtualTurma', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.MediaAtualTurma', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.MediaAtualTurma', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_MediaEdicaoAluno
	(
	alu_matricula varchar(50) NOT NULL,
	AreaConhecimentoID tinyint NOT NULL,
	Edicao varchar(10) NOT NULL,
	esc_codigo varchar(20) NOT NULL,
	tur_codigo varchar(20) NOT NULL,
	Valor varchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_MediaEdicaoAluno SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.MediaEdicaoAluno)
	 EXEC('INSERT INTO dbo.Tmp_MediaEdicaoAluno (alu_matricula, AreaConhecimentoID, Edicao, Valor)
		SELECT alu_matricula, AreaConhecimentoID, Edicao, Valor FROM dbo.MediaEdicaoAluno WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.MediaEdicaoAluno
GO
EXECUTE sp_rename N'dbo.Tmp_MediaEdicaoAluno', N'MediaEdicaoAluno', 'OBJECT' 
GO
ALTER TABLE dbo.MediaEdicaoAluno ADD CONSTRAINT
	PK_MediaEdicaoAluno PRIMARY KEY CLUSTERED 
	(
	alu_matricula,
	AreaConhecimentoID,
	Edicao
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.MediaEdicaoAluno ADD CONSTRAINT
	FK_MediaAluno_AreaConhecimento FOREIGN KEY
	(
	AreaConhecimentoID
	) REFERENCES dbo.AreaConhecimento
	(
	AreaConhecimentoID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.MediaEdicaoAluno', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.MediaEdicaoAluno', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.MediaEdicaoAluno', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_MediaEdicaoTurma
	(
	tur_id bigint NOT NULL,
	AreaConhecimentoID tinyint NOT NULL,
	Edicao varchar(10) NOT NULL,
	esc_codigo varchar(20) NOT NULL,
	tur_codigo varchar(20) NOT NULL,
	Valor varchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_MediaEdicaoTurma SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.MediaEdicaoTurma)
	 EXEC('INSERT INTO dbo.Tmp_MediaEdicaoTurma (tur_id, AreaConhecimentoID, Edicao, Valor)
		SELECT tur_id, AreaConhecimentoID, Edicao, Valor FROM dbo.MediaEdicaoTurma WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.MediaEdicaoTurma
GO
EXECUTE sp_rename N'dbo.Tmp_MediaEdicaoTurma', N'MediaEdicaoTurma', 'OBJECT' 
GO
ALTER TABLE dbo.MediaEdicaoTurma ADD CONSTRAINT
	PK_MediaTurma PRIMARY KEY CLUSTERED 
	(
	tur_id,
	AreaConhecimentoID,
	Edicao
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.MediaEdicaoTurma ADD CONSTRAINT
	FK_MediaTurma_AreaConhecimento FOREIGN KEY
	(
	AreaConhecimentoID
	) REFERENCES dbo.AreaConhecimento
	(
	AreaConhecimentoID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.MediaEdicaoTurma', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.MediaEdicaoTurma', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.MediaEdicaoTurma', 'Object', 'CONTROL') as Contr_Per 