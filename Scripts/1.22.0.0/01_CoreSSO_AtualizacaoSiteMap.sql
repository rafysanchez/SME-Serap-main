USE CoreSSO
GO

--Iniciar transação
BEGIN TRANSACTION
SET XACT_ABORT ON
		
	DECLARE @nomeSistema VARCHAR(100) = 'SERAp'

	DECLARE @sisId INT = (SELECT sis_id FROM SYS_Sistema WHERE sis_nome = 'SERAp')
	DECLARE @modId INT = (SELECT mod_id FROM SYS_Modulo WHERE sis_id = 204 AND mod_nome = 'Enviar folhas de respostas')

	UPDATE SYS_ModuloSiteMap
	SET msm_url = '/AnswerSheet/IndexBatchDetailsLot'
	WHERE mod_id = @modId and sis_id = @sisId AND msm_url = '/AnswerSheet/IndexBatchDetails'

	EXEC MS_InsereSiteMap
		 @nomeSistema = @nomeSistema
		 , @nomeModulo = 'Enviar folhas de respostas'
		 , @nomeModuloPai = 'Provas'
		 , @SiteMapNome = 'Enviar folhas de respostas'
		 , @SiteMapUrl = '/AnswerSheet/IndexBatchDetails'

-- Fechar transação
SET XACT_ABORT OFF
COMMIT TRANSACTION	
