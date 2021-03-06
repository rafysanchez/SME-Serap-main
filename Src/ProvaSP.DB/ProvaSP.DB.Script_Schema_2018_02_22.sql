USE [ProvaSP]
GO
/****** Object:  Table [dbo].[HabilidadeDre]    Script Date: 22/02/2018 14:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabilidadeDre](
	[Edicao] [varchar](10) NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[AnoEscolar] [varchar](3) NOT NULL,
	[HabilidadeCodigo] [varchar](10) NOT NULL,
	[uad_sigla] [varchar](4) NOT NULL,
	[PercentualAcertos] [decimal](6, 2) NULL,
 CONSTRAINT [PK_HabilidadeDre] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[AreaConhecimentoID] ASC,
	[AnoEscolar] ASC,
	[HabilidadeCodigo] ASC,
	[uad_sigla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabilidadeEscola]    Script Date: 22/02/2018 14:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabilidadeEscola](
	[Edicao] [varchar](10) NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[AnoEscolar] [varchar](3) NOT NULL,
	[HabilidadeCodigo] [varchar](10) NOT NULL,
	[uad_sigla] [varchar](4) NULL,
	[esc_codigo] [varchar](20) NOT NULL,
	[PercentualAcertos] [decimal](6, 2) NULL,
 CONSTRAINT [PK_HabilidadeEscola] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[AreaConhecimentoID] ASC,
	[AnoEscolar] ASC,
	[HabilidadeCodigo] ASC,
	[esc_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabilidadeSme]    Script Date: 22/02/2018 14:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabilidadeSme](
	[Edicao] [varchar](10) NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[AnoEscolar] [varchar](3) NOT NULL,
	[HabilidadeCodigo] [varchar](10) NOT NULL,
	[HabilidadeCategoria] [varchar](100) NULL,
	[HabilidadeDescricao] [varchar](300) NULL,
	[PercentualAcertos] [decimal](6, 2) NULL,
 CONSTRAINT [PK_Habilidade_1] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[AreaConhecimentoID] ASC,
	[AnoEscolar] ASC,
	[HabilidadeCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabilidadeTurma]    Script Date: 22/02/2018 14:03:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabilidadeTurma](
	[Edicao] [varchar](10) NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[AnoEscolar] [varchar](3) NOT NULL,
	[HabilidadeCodigo] [varchar](10) NOT NULL,
	[uad_sigla] [varchar](4) NULL,
	[esc_codigo] [varchar](20) NULL,
	[tur_codigo] [varchar](20) NULL,
	[tur_id] [bigint] NOT NULL,
	[PercentualAcertos] [decimal](6, 2) NULL,
 CONSTRAINT [PK_HabilidadeTurma] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[AreaConhecimentoID] ASC,
	[AnoEscolar] ASC,
	[HabilidadeCodigo] ASC,
	[tur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX INDX_ResultadoAluno_alu_matricula
ON [dbo].[ResultadoAluno] ([alu_matricula])

GO