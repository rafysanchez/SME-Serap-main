IF NOT EXISTS ( SELECT [Name] FROM sys.databases WHERE [name] = 'ProvaSP' )
BEGIN
    CREATE DATABASE ProvaSP

END
GO

ALTER DATABASE [ProvaSP] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProvaSP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ProvaSP] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ProvaSP] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ProvaSP] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ProvaSP] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ProvaSP] SET ARITHABORT OFF 
GO

ALTER DATABASE [ProvaSP] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ProvaSP] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ProvaSP] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ProvaSP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ProvaSP] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ProvaSP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ProvaSP] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ProvaSP] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ProvaSP] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ProvaSP] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ProvaSP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ProvaSP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ProvaSP] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ProvaSP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ProvaSP] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ProvaSP] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ProvaSP] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ProvaSP] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [ProvaSP] SET  MULTI_USER 
GO

ALTER DATABASE [ProvaSP] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ProvaSP] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ProvaSP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ProvaSP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [ProvaSP] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ProvaSP] SET QUERY_STORE = OFF
GO

USE [ProvaSP]
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [ProvaSP] SET  READ_WRITE 
GO

/****** Object:  Table [dbo].[AcompanhamentoAplicacaoEscola]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcompanhamentoAplicacaoEscola](
	[Edicao] [varchar](10) NOT NULL,
	[esc_codigo] [varchar](20) NOT NULL,
	[AtributoID] [int] NOT NULL,
	[Valor] [varchar](150) NULL,
 CONSTRAINT [PK_AcompanhamentoAplicacaoEscola] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[esc_codigo] ASC,
	[AtributoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcompanhamentoAplicacaoPessoa]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcompanhamentoAplicacaoPessoa](
	[Edicao] [varchar](10) NOT NULL,
	[usu_id] [uniqueidentifier] NOT NULL,
	[esc_codigo] [varchar](20) NOT NULL,
	[CargoID] [tinyint] NOT NULL,
	[AtributoID] [int] NOT NULL,
	[Valor] [varchar](150) NULL,
 CONSTRAINT [PK_AcompanhamentoAplicacaoPessoa] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[usu_id] ASC,
	[esc_codigo] ASC,
	[CargoID] ASC,
	[AtributoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcompanhamentoAplicacaoTurma]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcompanhamentoAplicacaoTurma](
	[Edicao] [varchar](10) NOT NULL,
	[tur_id] [bigint] NOT NULL,
	[AtributoID] [int] NOT NULL,
	[Valor] [varchar](150) NULL,
 CONSTRAINT [PK_AcompanhamentoAplicacaoTurma] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[tur_id] ASC,
	[AtributoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaConhecimento]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaConhecimento](
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Nome] [varchar](50) NULL,
 CONSTRAINT [PK_AreaConhecimento] PRIMARY KEY CLUSTERED 
(
	[AreaConhecimentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Atributo]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atributo](
	[AtributoID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NULL,
 CONSTRAINT [PK_Atributo] PRIMARY KEY CLUSTERED 
(
	[AtributoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escola]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escola](
	[esc_codigo] [varchar](20) NOT NULL,
	[uad_codigo] [varchar](20) NULL,
	[esc_nome] [varchar](200) NULL,
 CONSTRAINT [PK_Escola] PRIMARY KEY CLUSTERED 
(
	[esc_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EscolaCodigoINEP]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscolaCodigoINEP](
	[esc_codigo] [varchar](20) NOT NULL,
	[codigoInep] [varchar](20) NULL,
 CONSTRAINT [PK_EscolaCodigoINEP] PRIMARY KEY CLUSTERED 
(
	[esc_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaAtualTurma]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaAtualTurma](
	[tur_id] [bigint] NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Valor] [varchar](50) NULL,
	[tur_dataAlteracao] [smalldatetime] NULL,
 CONSTRAINT [PK_MediaAtualTurma] PRIMARY KEY CLUSTERED 
(
	[tur_id] ASC,
	[AreaConhecimentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaEdicaoAluno]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaEdicaoAluno](
	[alu_matricula] [varchar](50) NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Edicao] [varchar](10) NOT NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_MediaEdicaoAluno] PRIMARY KEY CLUSTERED 
(
	[alu_matricula] ASC,
	[AreaConhecimentoID] ASC,
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaEdicaoDre]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaEdicaoDre](
	[uad_sigla] [varchar](50) NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Edicao] [varchar](10) NOT NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_MediaDRE] PRIMARY KEY CLUSTERED 
(
	[uad_sigla] ASC,
	[AreaConhecimentoID] ASC,
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaEdicaoEscola]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaEdicaoEscola](
	[esc_codigo] [varchar](20) NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Edicao] [varchar](10) NOT NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_MediaEscola] PRIMARY KEY CLUSTERED 
(
	[esc_codigo] ASC,
	[AreaConhecimentoID] ASC,
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaEdicaoSme]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaEdicaoSme](
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Edicao] [varchar](10) NOT NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_MediaSME] PRIMARY KEY CLUSTERED 
(
	[AreaConhecimentoID] ASC,
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaEdicaoTurma]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaEdicaoTurma](
	[tur_id] [bigint] NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Edicao] [varchar](10) NOT NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_MediaTurma] PRIMARY KEY CLUSTERED 
(
	[tur_id] ASC,
	[AreaConhecimentoID] ASC,
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaEdicaoTurmaAmostral]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaEdicaoTurmaAmostral](
	[esc_codigo] [varchar](20) NOT NULL,
	[ano] [tinyint] NOT NULL,
	[AreaConhecimentoID] [tinyint] NOT NULL,
	[Edicao] [varchar](10) NOT NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_MediaEdicaoTurmaAmostral] PRIMARY KEY CLUSTERED 
(
	[esc_codigo] ASC,
	[ano] ASC,
	[AreaConhecimentoID] ASC,
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[PerfilID] [tinyint] NOT NULL,
	[Nome] [varchar](100) NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[PerfilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[usu_id] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](200) NULL,
	[usu_login] [varchar](50) NULL,
 CONSTRAINT [PK_Pessoa] PRIMARY KEY CLUSTERED 
(
	[usu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PessoaPerfil]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PessoaPerfil](
	[Edicao] [varchar](10) NOT NULL,
	[usu_id] [uniqueidentifier] NOT NULL,
	[esc_codigo] [varchar](20) NOT NULL,
	[PerfilID] [tinyint] NOT NULL,
	[uad_sigla] [varchar](50) NULL,
 CONSTRAINT [PK_PessoaCargo] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC,
	[usu_id] ASC,
	[esc_codigo] ASC,
	[PerfilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProvaEdicao]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvaEdicao](
	[Edicao] [varchar](10) NOT NULL,
	[DataInicioAplicacao] [date] NULL,
 CONSTRAINT [PK_Edicao] PRIMARY KEY CLUSTERED 
(
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questionario]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questionario](
	[QuestionarioID] [int] NOT NULL,
	[Nome] [varchar](150) NULL,
	[Edicao] [varchar](10) NULL,
	[DataInclusao] [smalldatetime] NULL,
 CONSTRAINT [PK_Questionario] PRIMARY KEY CLUSTERED 
(
	[QuestionarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionarioItem]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionarioItem](
	[QuestionarioItemID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionarioID] [int] NULL,
	[Titulo] [varchar](512) NULL,
	[Numero] [varchar](100) NULL,
	[DataInclusao] [smalldatetime] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[QuestionarioItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionarioRespostaItem]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionarioRespostaItem](
	[QuestionarioRespostaItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionarioUsuarioID] [bigint] NOT NULL,
	[QuestionarioItemID] [int] NOT NULL,
	[Valor] [varchar](500) NULL,
 CONSTRAINT [PK_QuestionarioRespostaItem] PRIMARY KEY CLUSTERED 
(
	[QuestionarioRespostaItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionarioUsuario]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionarioUsuario](
	[QuestionarioUsuarioID] [bigint] IDENTITY(1,1) NOT NULL,
	[QuestionarioID] [int] NOT NULL,
	[Guid] [varchar](50) NULL,
	[esc_codigo] [varchar](20) NULL,
	[tur_id] [bigint] NULL,
	[usu_id] [uniqueidentifier] NOT NULL,
	[IP] [varchar](50) NULL,
	[UserAgent] [varchar](200) NULL,
	[Edicao] [varchar](10) NOT NULL,
	[DataPreenchimento] [smalldatetime] NULL,
	[DataInclusao] [smalldatetime] NULL,
 CONSTRAINT [PK_QuestionarioUsuario_1] PRIMARY KEY CLUSTERED 
(
	[QuestionarioUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turma]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turma](
	[tur_id] [bigint] NOT NULL,
	[esc_codigo] [varchar](20) NULL,
	[Periodo] [varchar](50) NULL,
	[tur_codigo] [varchar](20) NULL,
	[TurmaAmostral] [bit] NULL,
 CONSTRAINT [PK_Turma] PRIMARY KEY CLUSTERED 
(
	[tur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurmaAmostral]    Script Date: 03/10/2017 09:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurmaAmostral](
	[esc_codigo] [varchar](20) NULL,
	[alu_matricula] [varchar](50) NOT NULL,
	[alu_nome] [nvarchar](255) NULL,
	[periodo] [varchar](50) NULL,
	[ano_escolar] [varchar](5) NULL,
	[tur_id] [bigint] NULL,
	[tur_id_virtual] [bigint] NULL,
	[Edicao] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TurmaAmostral] PRIMARY KEY CLUSTERED 
(
	[alu_matricula] ASC,
	[Edicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Questionario] ADD  CONSTRAINT [DF_Questionario_DataInclusao]  DEFAULT (getdate()) FOR [DataInclusao]
GO
ALTER TABLE [dbo].[QuestionarioItem] ADD  CONSTRAINT [DF_QuestionarioItem_DataInclusao]  DEFAULT (getdate()) FOR [DataInclusao]
GO
ALTER TABLE [dbo].[QuestionarioUsuario] ADD  CONSTRAINT [DF_QuestionarioUsuario_DataInclusao]  DEFAULT (getdate()) FOR [DataInclusao]
GO
ALTER TABLE [dbo].[Turma] ADD  CONSTRAINT [DF_Turma_TurmaAmostral]  DEFAULT ((0)) FOR [TurmaAmostral]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoEscola]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoEscola_Atributo] FOREIGN KEY([AtributoID])
REFERENCES [dbo].[Atributo] ([AtributoID])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoEscola] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoEscola_Atributo]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoEscola]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoEscola_Escola] FOREIGN KEY([esc_codigo])
REFERENCES [dbo].[Escola] ([esc_codigo])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoEscola] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoEscola_Escola]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Atributo] FOREIGN KEY([AtributoID])
REFERENCES [dbo].[Atributo] ([AtributoID])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Atributo]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Escola] FOREIGN KEY([esc_codigo])
REFERENCES [dbo].[Escola] ([esc_codigo])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Escola]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Perfil] FOREIGN KEY([CargoID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Perfil]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Pessoa] FOREIGN KEY([usu_id])
REFERENCES [dbo].[Pessoa] ([usu_id])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoPessoa] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoPessoa_Pessoa]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoTurma]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoTurma_Atributo] FOREIGN KEY([AtributoID])
REFERENCES [dbo].[Atributo] ([AtributoID])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoTurma] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoTurma_Atributo]
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoTurma]  WITH CHECK ADD  CONSTRAINT [FK_AcompanhamentoAplicacaoTurma_Turma1] FOREIGN KEY([tur_id])
REFERENCES [dbo].[Turma] ([tur_id])
GO
ALTER TABLE [dbo].[AcompanhamentoAplicacaoTurma] CHECK CONSTRAINT [FK_AcompanhamentoAplicacaoTurma_Turma1]
GO
ALTER TABLE [dbo].[MediaEdicaoAluno]  WITH CHECK ADD  CONSTRAINT [FK_MediaAluno_AreaConhecimento] FOREIGN KEY([AreaConhecimentoID])
REFERENCES [dbo].[AreaConhecimento] ([AreaConhecimentoID])
GO
ALTER TABLE [dbo].[MediaEdicaoAluno] CHECK CONSTRAINT [FK_MediaAluno_AreaConhecimento]
GO
ALTER TABLE [dbo].[MediaEdicaoDre]  WITH CHECK ADD  CONSTRAINT [FK_MediaDRE_AreaConhecimento] FOREIGN KEY([AreaConhecimentoID])
REFERENCES [dbo].[AreaConhecimento] ([AreaConhecimentoID])
GO
ALTER TABLE [dbo].[MediaEdicaoDre] CHECK CONSTRAINT [FK_MediaDRE_AreaConhecimento]
GO
ALTER TABLE [dbo].[MediaEdicaoEscola]  WITH CHECK ADD  CONSTRAINT [FK_MediaEscola_AreaConhecimento] FOREIGN KEY([AreaConhecimentoID])
REFERENCES [dbo].[AreaConhecimento] ([AreaConhecimentoID])
GO
ALTER TABLE [dbo].[MediaEdicaoEscola] CHECK CONSTRAINT [FK_MediaEscola_AreaConhecimento]
GO
ALTER TABLE [dbo].[MediaEdicaoSme]  WITH CHECK ADD  CONSTRAINT [FK_MediaSME_AreaConhecimento] FOREIGN KEY([AreaConhecimentoID])
REFERENCES [dbo].[AreaConhecimento] ([AreaConhecimentoID])
GO
ALTER TABLE [dbo].[MediaEdicaoSme] CHECK CONSTRAINT [FK_MediaSME_AreaConhecimento]
GO
ALTER TABLE [dbo].[MediaEdicaoTurma]  WITH CHECK ADD  CONSTRAINT [FK_MediaTurma_AreaConhecimento] FOREIGN KEY([AreaConhecimentoID])
REFERENCES [dbo].[AreaConhecimento] ([AreaConhecimentoID])
GO
ALTER TABLE [dbo].[MediaEdicaoTurma] CHECK CONSTRAINT [FK_MediaTurma_AreaConhecimento]
GO
ALTER TABLE [dbo].[MediaEdicaoTurmaAmostral]  WITH CHECK ADD  CONSTRAINT [FK_MediaEdicaoTurmaAmostral_AreaConhecimento] FOREIGN KEY([AreaConhecimentoID])
REFERENCES [dbo].[AreaConhecimento] ([AreaConhecimentoID])
GO
ALTER TABLE [dbo].[MediaEdicaoTurmaAmostral] CHECK CONSTRAINT [FK_MediaEdicaoTurmaAmostral_AreaConhecimento]
GO
ALTER TABLE [dbo].[PessoaPerfil]  WITH CHECK ADD  CONSTRAINT [FK_PessoaCargo_Cargo] FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[PessoaPerfil] CHECK CONSTRAINT [FK_PessoaCargo_Cargo]
GO
ALTER TABLE [dbo].[PessoaPerfil]  WITH CHECK ADD  CONSTRAINT [FK_PessoaCargo_Escola] FOREIGN KEY([esc_codigo])
REFERENCES [dbo].[Escola] ([esc_codigo])
GO
ALTER TABLE [dbo].[PessoaPerfil] CHECK CONSTRAINT [FK_PessoaCargo_Escola]
GO
ALTER TABLE [dbo].[PessoaPerfil]  WITH CHECK ADD  CONSTRAINT [FK_PessoaCargo_Pessoa] FOREIGN KEY([usu_id])
REFERENCES [dbo].[Pessoa] ([usu_id])
GO
ALTER TABLE [dbo].[PessoaPerfil] CHECK CONSTRAINT [FK_PessoaCargo_Pessoa]
GO
ALTER TABLE [dbo].[QuestionarioItem]  WITH CHECK ADD  CONSTRAINT [FK_QuestionarioItem_Questionario] FOREIGN KEY([QuestionarioID])
REFERENCES [dbo].[Questionario] ([QuestionarioID])
GO
ALTER TABLE [dbo].[QuestionarioItem] CHECK CONSTRAINT [FK_QuestionarioItem_Questionario]
GO
ALTER TABLE [dbo].[QuestionarioRespostaItem]  WITH CHECK ADD  CONSTRAINT [FK_QuestionarioRespostaItem_Item] FOREIGN KEY([QuestionarioItemID])
REFERENCES [dbo].[QuestionarioItem] ([QuestionarioItemID])
GO
ALTER TABLE [dbo].[QuestionarioRespostaItem] CHECK CONSTRAINT [FK_QuestionarioRespostaItem_Item]
GO
ALTER TABLE [dbo].[QuestionarioRespostaItem]  WITH CHECK ADD  CONSTRAINT [FK_QuestionarioRespostaItem_QuestionarioUsuario] FOREIGN KEY([QuestionarioUsuarioID])
REFERENCES [dbo].[QuestionarioUsuario] ([QuestionarioUsuarioID])
GO
ALTER TABLE [dbo].[QuestionarioRespostaItem] CHECK CONSTRAINT [FK_QuestionarioRespostaItem_QuestionarioUsuario]
GO
ALTER TABLE [dbo].[QuestionarioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_QuestionarioUsuario_Questionario] FOREIGN KEY([QuestionarioID])
REFERENCES [dbo].[Questionario] ([QuestionarioID])
GO
ALTER TABLE [dbo].[QuestionarioUsuario] CHECK CONSTRAINT [FK_QuestionarioUsuario_Questionario]
GO
ALTER TABLE [dbo].[Turma]  WITH CHECK ADD  CONSTRAINT [FK_Turma_Escola] FOREIGN KEY([esc_codigo])
REFERENCES [dbo].[Escola] ([esc_codigo])
GO
ALTER TABLE [dbo].[Turma] CHECK CONSTRAINT [FK_Turma_Escola]
GO
