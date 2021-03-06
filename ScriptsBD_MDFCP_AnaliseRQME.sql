USE [MDFCP]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 23/12/2021 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[Candidato_id] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Cand] PRIMARY KEY CLUSTERED 
(
	[Candidato_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidatoConcurso]    Script Date: 23/12/2021 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidatoConcurso](
	[id] [varchar](15) NOT NULL,
	[idSimulacao] [varchar](15) NOT NULL,
	[Biografico1] [varchar](10) NULL,
	[Biografico2] [varchar](10) NULL,
	[Geografico1] [varchar](20) NULL,
	[Geografico2] [varchar](20) NULL,
	[TempoProva] [real] NULL,
	[Grupo1_Nota1] [real] NULL,
	[Grupo1_nota2] [real] NULL,
	[Grupo2_nota1] [real] NULL,
	[Grupo2_nota2] [real] NULL,
 CONSTRAINT [PK_Candidatos] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[idSimulacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventosAnteriores]    Script Date: 23/12/2021 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventosAnteriores](
	[origem] [varchar](30) NOT NULL,
	[Candidato_Id] [varchar](15) NOT NULL,
	[ano] [smallint] NULL,
	[descricao] [varchar](1000) NULL,
 CONSTRAINT [PK_EventosAnteriores] PRIMARY KEY CLUSTERED 
(
	[origem] ASC,
	[Candidato_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoSimilaridade]    Script Date: 23/12/2021 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoSimilaridade](
	[Contexto_id] [varchar](15) NOT NULL,
	[HistSimilaridade_id] [int] IDENTITY(1,1) NOT NULL,
	[idCand1] [varchar](15) NOT NULL,
	[idCand2] [varchar](15) NOT NULL,
	[indSuspeicao] [float] NOT NULL,
	[stringRespCand1] [varchar](200) NULL,
	[stringRespCand2] [varchar](200) NULL,
 CONSTRAINT [PK_HistoricoSimilaridade] PRIMARY KEY CLUSTERED 
(
	[Contexto_id] ASC,
	[HistSimilaridade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 23/12/2021 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[Contexto_id] [varchar](15) NOT NULL,
	[QntQuestoes] [int] NOT NULL,
	[NivelAcertoQuestao] [varchar](2000) NOT NULL,
	[NivelAcertoQuestaoTop] [varchar](2000) NULL,
	[LimiarSuspeicaoRespSimilar] [float] NOT NULL,
	[LimiarSuspeicao] [real] NULL,
	[PesoAnalisePerfil] [real] NULL,
	[PesoIdentificacaoOutlier] [real] NULL,
	[PesoAnaliseRespostas] [real] NULL,
	[PesoAnaliseRegistros] [real] NULL,
	[LimiteAnaliseRespostas] [real] NULL,
	[Gabarito] [varchar](200) NULL,
 CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED 
(
	[Contexto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RespostasCandidato]    Script Date: 23/12/2021 02:12:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespostasCandidato](
	[Contexto_id] [varchar](15) NOT NULL,
	[Candidato_Id] [varchar](15) NOT NULL,
	[RespostasCndt] [varchar](100) NOT NULL,
	[Classificacao] [int] NOT NULL,
	[MediaFinal] [float] NOT NULL,
	[TipoProva] [char](1) NULL,
	[Indice_01] [float] NULL,
	[Indice_02] [float] NULL,
	[Indice_03] [float] NULL,
	[Indice_04] [float] NULL,
	[Indice_05] [float] NULL,
	[Indice_06] [float] NULL,
	[Indice_07] [float] NULL,
	[Indice_08] [float] NULL,
	[Indice_09] [float] NULL,
	[Indice_10] [float] NULL,
	[Processado] [char](1) NULL,
 CONSTRAINT [PK_RespostasCandidato] PRIMARY KEY CLUSTERED 
(
	[Contexto_id] ASC,
	[Candidato_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CandidatoConcurso]  WITH CHECK ADD  CONSTRAINT [FK_Candidatos_Cand] FOREIGN KEY([id])
REFERENCES [dbo].[Candidato] ([Candidato_id])
GO
ALTER TABLE [dbo].[CandidatoConcurso] CHECK CONSTRAINT [FK_Candidatos_Cand]
GO
ALTER TABLE [dbo].[EventosAnteriores]  WITH CHECK ADD  CONSTRAINT [FK_EventosAnteriores_Candidato] FOREIGN KEY([Candidato_Id])
REFERENCES [dbo].[Candidato] ([Candidato_id])
GO
ALTER TABLE [dbo].[EventosAnteriores] CHECK CONSTRAINT [FK_EventosAnteriores_Candidato]
GO
ALTER TABLE [dbo].[HistoricoSimilaridade]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoSimilaridade_Parametros] FOREIGN KEY([Contexto_id])
REFERENCES [dbo].[Parametros] ([Contexto_id])
GO
ALTER TABLE [dbo].[HistoricoSimilaridade] CHECK CONSTRAINT [FK_HistoricoSimilaridade_Parametros]
GO
ALTER TABLE [dbo].[RespostasCandidato]  WITH CHECK ADD  CONSTRAINT [FK_RespostasCandidato_Parametros] FOREIGN KEY([Contexto_id])
REFERENCES [dbo].[Parametros] ([Contexto_id])
GO
ALTER TABLE [dbo].[RespostasCandidato] CHECK CONSTRAINT [FK_RespostasCandidato_Parametros]
GO
