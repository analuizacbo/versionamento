--------------------------------------------------------
--  Arquivo criado - sexta-feira-julho-14-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package ABATIMENTO_CTR_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ABATIMENTO_CTR_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_parcela_contrato_id            IN  parcela_contrato.parcela_contrato_id%TYPE
, p_valor_abat                     IN  VARCHAR2
, p_flag_debito_cli                IN  abatimento.flag_debito_cli%TYPE
, p_justificativa                  IN  VARCHAR2
, p_abatimento_ctr_id              OUT abatimento_ctr.abatimento_ctr_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_abatimento_ctr_id              IN  abatimento_ctr.abatimento_ctr_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_abatimento_ctr_id              IN  abatimento_ctr.abatimento_ctr_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- ABATIMENTO_CTR_PKG


/
--------------------------------------------------------
--  DDL for Package ABATIMENTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ABATIMENTO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  abatimento.carta_acordo_id%TYPE
, p_item_id                        IN  item.item_id%TYPE
, p_valor_abat                     IN  VARCHAR2
, p_flag_debito_cli                IN  abatimento.flag_debito_cli%TYPE
, p_justificativa                  IN  VARCHAR2
, p_abatimento_id                  OUT abatimento.abatimento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_abatimento_id                  IN  abatimento.abatimento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            auto_abater
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_sobra_id                       IN  sobra.sobra_id%TYPE
, p_abatimento_id                  OUT abatimento.abatimento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_abatimento_id                  IN  abatimento.abatimento_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             item_id_retornar (
  p_abatimento_id                 IN abatimento.abatimento_id%TYPE)
RETURN NUMBER;
--
END;  -- ABATIMENTO_PKG


/
--------------------------------------------------------
--  DDL for Package ADIANT_DESP_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ADIANT_DESP_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_motivo_adiant                  IN  adiant_desp.motivo_adiant%TYPE
, p_complemento                    IN  VARCHAR2
, p_data_limite                    IN  VARCHAR2
, p_hora_limite                    IN  VARCHAR2
, p_valor_solicitado               IN  VARCHAR2
, p_forma_adiant_pref              IN  adiant_desp.forma_adiant_pref%TYPE
, p_solicitante_id                 IN  adiant_desp.solicitante_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor                    IN  VARCHAR2
, p_adiant_desp_id                 OUT adiant_desp.adiant_desp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_motivo_adiant                  IN  adiant_desp.motivo_adiant%TYPE
, p_complemento                    IN  VARCHAR2
, p_data_limite                    IN  VARCHAR2
, p_hora_limite                    IN  VARCHAR2
, p_valor_solicitado               IN  VARCHAR2
, p_forma_adiant_pref              IN  adiant_desp.forma_adiant_pref%TYPE
, p_solicitante_id                 IN  adiant_desp.solicitante_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_motivo                         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            retomar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            encerrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reabrir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            realizado_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_realiz.adiant_desp_id%TYPE
, p_forma_adiant                   IN  adiant_realiz.forma_adiant%TYPE
, p_valor_realiz                   IN  VARCHAR2
, p_fi_banco_id                    IN  adiant_realiz.fi_banco_id%TYPE
, p_num_agencia                    IN  adiant_realiz.num_agencia%TYPE
, p_num_conta                      IN  adiant_realiz.num_conta%TYPE
, p_tipo_conta                     IN  adiant_realiz.tipo_conta%TYPE
, p_cnpj_cpf_titular               IN  VARCHAR2
, p_nome_titular                   IN  VARCHAR2
, p_flag_atualiza_conta            IN  VARCHAR2
, p_adiant_realiz_id               OUT adiant_realiz.adiant_realiz_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            realizado_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_realiz_id               IN  adiant_realiz.adiant_realiz_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            despesa_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_realiz.adiant_desp_id%TYPE
, p_vetor_data_desp                IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_fornecedor               IN  VARCHAR2
, p_vetor_num_doc                  IN  VARCHAR2
, p_vetor_serie                    IN  VARCHAR2
, p_vetor_valor_desp               IN  VARCHAR2
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor_desp_it            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            despesa_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_realiz.adiant_desp_id%TYPE
, p_vetor_data_desp                IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_fornecedor               IN  VARCHAR2
, p_vetor_num_doc                  IN  VARCHAR2
, p_vetor_serie                    IN  VARCHAR2
, p_vetor_valor_desp               IN  VARCHAR2
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor_desp_it            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            devolucao_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_realiz.adiant_desp_id%TYPE
, p_vetor_data_devol               IN  VARCHAR2
, p_vetor_forma_devol              IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_valor_devol              IN  VARCHAR2
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor_devol_it           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            devolucao_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_adiant_desp_id                 IN  adiant_realiz.adiant_desp_id%TYPE
, p_vetor_data_devol               IN  VARCHAR2
, p_vetor_forma_devol              IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_valor_devol              IN  VARCHAR2
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor_devol_it           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION       numero_formatar (
  p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE,
  p_flag_prefixo                   IN  VARCHAR2)
RETURN   VARCHAR2;
--
FUNCTION       valor_retornar (
  p_adiant_desp_id                 IN  adiant_desp.adiant_desp_id%TYPE,
  p_tipo_valor                     IN  VARCHAR2)
RETURN   NUMBER;
--
END;  -- ADIANT_DESP_PKG


/
--------------------------------------------------------
--  DDL for Package APONTAM_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "APONTAM_PKG" 
IS
--
PROCEDURE            acao_executar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_usuario_apontam_id             IN  apontam_data.usuario_id%TYPE
, p_data_ini                       IN  apontam_data.data%TYPE
, p_data_fim                       IN  apontam_data.data%TYPE
, p_cod_acao                       IN  ts_transicao.cod_acao%TYPE
, p_motivo                         IN  apontam_data_ev.motivo%TYPE
, p_flag_verifica_horas            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            data_criar
(
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_tipo_chamada                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            data_geral_criar;
--
PROCEDURE            data_pendente_processar;
--
PROCEDURE            periodo_ence_criar;
--
PROCEDURE            periodo_criar
(
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            periodo_excluir
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_tipo_exclusao                  IN  VARCHAR2
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_obs                            IN  apontam_hora.obs%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            periodo_aprovar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            encerrar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mes_ano                        IN  VARCHAR2
, p_flag_forca_encer               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reabrir
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mes_ano                        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_apontar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_apontam_data_id                IN  apontam_data.apontam_data_id%TYPE
, p_flag_home_office               IN  VARCHAR2
, p_vetor_tipo_apontam_id          IN  VARCHAR2
, p_vetor_objeto_id                IN  VARCHAR2
, p_vetor_horas                    IN  VARCHAR2
, p_vetor_obs                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_semanal_apontar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_vetor_data                     IN  VARCHAR2
, p_vetor_flag_home_office         IN  VARCHAR2
, p_vetor_tipo_apontam_id          IN  VARCHAR2
, p_vetor_objeto_id                IN  VARCHAR2
, p_vetor_horas                    IN  VARCHAR2
, p_vetor_obs                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_job_apontar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_data                           IN  VARCHAR2
, p_vetor_tipo_apontam_job_id      IN  VARCHAR2
, p_vetor_horas                    IN  VARCHAR2
, p_obs                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_oport_apontar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_data                           IN  VARCHAR2
, p_vetor_servico_id               IN  VARCHAR2
, p_vetor_horas                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_os_apontar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_vetor_data                     IN  LONG
, p_vetor_horas                    IN  LONG
, p_vetor_obs                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_tarefa_apontar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_vetor_data                     IN  LONG
, p_vetor_horas                    IN  LONG
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_adicionar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_data                           IN  VARCHAR2
, p_horas                          IN  VARCHAR2
, p_job                            IN  VARCHAR2
, p_tipo_apontam_id                IN  apontam_hora.tipo_apontam_id%TYPE
, p_obs                            IN  apontam_hora.obs%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_admin_adicionar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_tipo_apontam_id                IN  apontam_hora.tipo_apontam_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_obs                            IN  apontam_hora.obs%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            objeto_mostrar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_objeto                    IN  hist_ender.tipo_objeto%TYPE
, p_objeto_id                      IN  hist_ender.objeto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            objeto_ocultar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_objeto                    IN  hist_ender.tipo_objeto%TYPE
, p_objeto_id                      IN  hist_ender.objeto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            objeto_reexibir
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_vetor_hist_ender_id            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_apontam_data_id                IN  apontam_data.apontam_data_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_pend_excluir
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apontamento_horas_ajustar
(
  p_apontam_data_id                IN  apontam_data.apontam_data_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apontamento_custo_atualizar
(
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_data                           IN  DATE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apontamento_cargo_atualizar
(
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_data                           IN  DATE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_job_acao_executar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_vetor_apontam_hora_id          IN  LONG
, p_cod_acao                       IN  VARCHAR2
, p_coment_acao                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             em_dia_verificar (
  p_usuario_id                     IN  usuario.usuario_id%TYPE,
  p_tipo_verificacao               IN  VARCHAR2)
RETURN   INTEGER;
--
--
FUNCTION             apontam_ence_verificar (
  p_empresa_id                     IN  empresa.empresa_id%TYPE,
  p_mes_ano                        IN  apontam_ence.mes_ano%TYPE,
  p_tipo_verificacao               IN  VARCHAR2)
RETURN INTEGER;
--
--
FUNCTION             num_dias_status_retornar (
  p_usuario_id                     IN  usuario.usuario_id%TYPE,
  p_status                         IN  apontam_data.status%TYPE)
RETURN   INTEGER;
--
--
FUNCTION             completo_verificar (
  p_usuario_id                     IN  apontam_data.usuario_id%TYPE,
  p_empresa_id                     IN  empresa.empresa_id%TYPE,
  p_data_ini                       IN  apontam_data.data%TYPE,
  p_data_fim                       IN  apontam_data.data%TYPE)
RETURN INTEGER;
--
--
FUNCTION             horas_apontadas_retornar (
  p_apontam_data_id                IN  apontam_data.apontam_data_id%TYPE
, p_tipo_apontam                   IN  VARCHAR2)
RETURN NUMBER;
--
--
FUNCTION             horas_apontadas_retornar (
  p_usuario_id                     IN  apontam_data.usuario_id%TYPE
, p_data                           IN  apontam_data.data%TYPE
, p_tipo_apontam                   IN  VARCHAR2
, p_objeto_id                      IN  NUMBER)
RETURN NUMBER;
--
--
FUNCTION             obs_retornar (
  p_usuario_id                     IN  apontam_data.usuario_id%TYPE
, p_data                           IN  apontam_data.data%TYPE
, p_tipo_apontam                   IN  VARCHAR2
, p_objeto_id                      IN  NUMBER)
RETURN VARCHAR2;
--
--
FUNCTION             data_ult_apontam_retornar (
  p_usuario_id                     IN  usuario.usuario_id%TYPE)
RETURN   DATE;
--
--
FUNCTION             status_periodo_retornar (
  p_usuario_id                     IN  apontam_data.usuario_id%TYPE
, p_data_ini                       IN  apontam_data.data%TYPE
, p_data_fim                       IN  apontam_data.data%TYPE)
RETURN VARCHAR2;
--
--
FUNCTION             custo_job_mes_retornar (
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_mes_ano                        IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             custo_horario_retornar (
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_tipo                           IN  VARCHAR2
, p_mes_ano                        IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             flag_mostrar_retornar (
  p_usuario_id                     IN  hist_ender.usuario_id%TYPE
, p_tipo_objeto                    IN  hist_ender.tipo_objeto%TYPE
, p_objeto_id                      IN  hist_ender.objeto_id%TYPE)
RETURN VARCHAR2;
--
--
END;  -- APONTAM_PKG

/
--------------------------------------------------------
--  DDL for Package APONTAM_PROGR_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "APONTAM_PROGR_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_hora_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_hora_fim                       IN  VARCHAR2
, p_tipo_apontam_id                IN  tipo_apontam.tipo_apontam_id%TYPE
, p_obs                            IN  VARCHAR2
, p_flag_os_aprov_auto             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_apontam_progr_id               IN  apontam_progr.apontam_progr_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_hora_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_hora_fim                       IN  VARCHAR2
, p_tipo_apontam_id                IN  tipo_apontam.tipo_apontam_id%TYPE
, p_obs                            IN  VARCHAR2
, p_flag_os_aprov_auto             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_apontam_progr_id               IN  apontam_progr.apontam_progr_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_apontam_progr_id               IN  apontam_progr.apontam_progr_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- APONTAM_PROGR_PKG


/
--------------------------------------------------------
--  DDL for Package AREA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "AREA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  area.nome%TYPE
, p_flag_briefing                  IN  VARCHAR2
, p_modelo_briefing                IN  area.modelo_briefing %TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_area_id                        IN  area.area_id%TYPE
, p_nome                           IN  area.nome%TYPE
, p_flag_briefing                  IN  VARCHAR2
, p_modelo_briefing                IN  area.modelo_briefing %TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            iniciativas_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_area_id                        IN  area.area_id%TYPE
, p_vetor_dicion_emp_val_id        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_area_id                        IN  area.area_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_area_id                        IN  area.area_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- AREA_PKG


/
--------------------------------------------------------
--  DDL for Package ARQUIVO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ARQUIVO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_objeto_id                      IN  NUMBER
, p_tipo_arquivo_id                IN  arquivo.tipo_arquivo_id%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_descricao                      IN  VARCHAR2
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            palavras_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_palavras_arquivo               IN  CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            id_gerar
(
  p_arquivo_id                     OUT  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- ARQUIVO_PKG


/
--------------------------------------------------------
--  DDL for Package BRIEFING_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "BRIEFING_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  briefing.job_id%TYPE
, p_vetor_area_id                  IN  VARCHAR2
, p_briefing_id                    OUT briefing.briefing_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_requisicao_cliente             IN  briefing.requisicao_cliente%TYPE
, p_revisoes                       IN  briefing.revisoes%TYPE
, p_vetor_area_id                  IN  VARCHAR2
, p_vetor_atributo_id              IN  VARCHAR2
, p_vetor_atributo_valor           IN  CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            dicion_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_vetor_dicion_emp_id            IN  VARCHAR2
, p_vetor_dicion_emp_val_id        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            dicion_verificar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            task_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_prioridade                     IN  task.prioridade%TYPE
, p_vetor_papel_id                 IN  LONG
, p_obs                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            retomar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_nota_aval                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_motivo_reprov                  IN  VARCHAR2
, p_compl_reprov                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            revisar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_motivo_rev                     IN  VARCHAR2
, p_compl_rev                      IN  VARCHAR2
, p_briefing_new_id                OUT briefing.briefing_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_briefing_id                    IN  briefing.briefing_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             ultimo_retornar
(
  p_job_id                         IN job.job_id%TYPE
)
RETURN INTEGER;
--
END;  -- BRIEFING_PKG


/
--------------------------------------------------------
--  DDL for Package CAMPANHA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CAMPANHA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cliente_id                     IN  campanha.cliente_id%TYPE
, p_cod_ext_camp                   IN  campanha.cod_ext_camp%TYPE
, p_nome                           IN  campanha.nome%TYPE
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_campanha_id                    OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_campanha_id                    IN  campanha.campanha_id%TYPE
, p_cod_ext_camp                   IN  campanha.cod_ext_camp%TYPE
, p_nome                           IN  campanha.nome%TYPE
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_flag_ativo                     IN  campanha.flag_ativo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_campanha_id                    IN  campanha.campanha_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_campanha_id                    IN  campanha.campanha_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- CAMPANHA_PKG


/
--------------------------------------------------------
--  DDL for Package CARGA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CARGA_PKG" 
IS
--
PROCEDURE pessoa_carregar
( p_empresa_id                     IN empresa.empresa_id%TYPE
, p_vetor_job_pdv                  IN VARCHAR2
, p_flag_excluir_carregados        IN VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2);
--
PROCEDURE usuario_carregar
( p_empresa_id                     IN empresa.empresa_id%TYPE
, p_flag_excluir_carregados        IN VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2);
--
PROCEDURE tipo_produto_carregar
( p_empresa_id                     IN empresa.empresa_id%TYPE
, p_flag_excluir_carregados        IN VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2);
--
--
END; -- CARGA_pkg


/
--------------------------------------------------------
--  DDL for Package CARGO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CARGO_PKG" IS
--
--
/*
PROCEDURE adicionar
(
  p_usuario_sessao_id IN NUMBER,
  p_empresa_id        IN empresa.empresa_id%TYPE,
  p_area_id           IN cargo.area_id%TYPE,
  p_nome              IN cargo.nome%TYPE,
  p_ordem             IN VARCHAR2,
  p_qtd_vagas_aprov   IN VARCHAR2,
  p_flag_aloc_usu_ctr IN VARCHAR2,
  p_cargo_id          OUT cargo.cargo_id%TYPE,
  p_erro_cod          OUT VARCHAR2,
  p_erro_msg          OUT VARCHAR2
);
*/
--
--
PROCEDURE adicionar
(
  p_usuario_sessao_id    IN NUMBER
 ,p_empresa_id           IN empresa.empresa_id%TYPE
 ,p_area_id              IN cargo.area_id%TYPE
 ,p_nome                 IN cargo.nome%TYPE
 ,p_ordem                IN VARCHAR2
 ,p_qtd_vagas_aprov      IN VARCHAR2
 ,p_flag_aloc_usu_ctr    IN VARCHAR2
 ,p_vetor_preco_id       IN VARCHAR2
 ,p_vetor_nivel          IN VARCHAR2
 ,p_vetor_faixa_salarial IN VARCHAR2
 ,p_vetor_beneficio      IN VARCHAR2
 ,p_vetor_encargo        IN VARCHAR2
 ,p_vetor_dissidio       IN VARCHAR2
 ,p_vetor_overhead       IN VARCHAR2
 ,p_vetor_custo_mensal   IN VARCHAR2
 ,p_vetor_custo_hora     IN VARCHAR2
 ,p_vetor_margem_hora    IN VARCHAR2
 ,p_vetor_venda_hora     IN VARCHAR2
 ,p_cargo_id             OUT cargo.cargo_id%TYPE
 ,p_erro_cod             OUT VARCHAR2
 ,p_erro_msg             OUT VARCHAR2
);
--
--
PROCEDURE atualizar
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_cargo_id          IN cargo.cargo_id%TYPE
 ,p_area_id           IN cargo.area_id%TYPE
 ,p_nome              IN cargo.nome%TYPE
 ,p_ordem             IN VARCHAR2
 ,p_qtd_vagas_aprov   IN VARCHAR2
 ,p_flag_aloc_usu_ctr IN VARCHAR2
 ,p_flag_ativo        IN VARCHAR2
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE excluir
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_cargo_id          IN cargo.cargo_id%TYPE
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE salario_adicionar
(
  p_usuario_sessao_id    IN NUMBER
 ,p_empresa_id           IN empresa.empresa_id%TYPE
 ,p_cargo_id             IN cargo.cargo_id%TYPE
 ,p_data_ini             IN VARCHAR2
 ,p_vetor_nivel          IN VARCHAR2
 ,p_vetor_custo_mensal   IN VARCHAR2
 ,p_vetor_venda_mensal   IN VARCHAR2
 ,p_vetor_faixa_salarial IN VARCHAR2
 ,p_vetor_beneficio      IN VARCHAR2
 ,p_vetor_encargo        IN VARCHAR2
 ,p_vetor_dissidio       IN VARCHAR2
 ,p_vetor_overhead       IN VARCHAR2
 ,p_vetor_margem_hora    IN VARCHAR2
 ,p_vetor_margem_mensal  IN VARCHAR2
 ,p_erro_cod             OUT VARCHAR2
 ,p_erro_msg             OUT VARCHAR2
);
--
--
PROCEDURE salario_atualizar
(
  p_usuario_sessao_id  IN NUMBER
 ,p_empresa_id         IN empresa.empresa_id%TYPE
 ,p_cargo_id           IN cargo.cargo_id%TYPE
 ,p_data_ini           IN VARCHAR2
 ,p_vetor_nivel        IN VARCHAR2
 ,p_vetor_custo_mensal IN VARCHAR2
 ,p_vetor_venda_mensal IN VARCHAR2
 ,p_erro_cod           OUT VARCHAR2
 ,p_erro_msg           OUT VARCHAR2
);
--
--
PROCEDURE salario_excluir
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_cargo_id          IN cargo.cargo_id%TYPE
 ,p_data_ini          IN VARCHAR2
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE xml_gerar
(
  p_cargo_id IN cargo.cargo_id%TYPE
 ,p_xml      OUT CLOB
 ,p_erro_cod OUT VARCHAR2
 ,p_erro_msg OUT VARCHAR2
);
--
--
FUNCTION salario_id_atu_retornar
(
  p_cargo_id IN cargo.cargo_id%TYPE
 ,p_nivel    IN salario_cargo.nivel%TYPE
) RETURN INTEGER;
--
--
FUNCTION do_usuario_retornar
(
  p_usuario_id IN NUMBER
 ,p_data       IN DATE
) RETURN INTEGER;
--
--
FUNCTION nivel_usuario_retornar
(
  p_usuario_id IN NUMBER
 ,p_data       IN DATE
) RETURN VARCHAR2;
--
--
END; -- CARGO_PKG

/
--------------------------------------------------------
--  DDL for Package CARTA_ACORDO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CARTA_ACORDO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_fornecedor_id                  IN  carta_acordo.fornecedor_id%TYPE
, p_cliente_id                     IN  carta_acordo.cliente_id%TYPE
, p_emp_faturar_por_id             IN  carta_acordo.emp_faturar_por_id%TYPE
, p_contato_fornec                 IN  carta_acordo.contato_fornec%TYPE
, p_jus_fornec_naohmlg             IN  VARCHAR2
, p_desc_item                      IN  VARCHAR2
, p_valor_credito                  IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_motivo_atu_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_motivo_atu_imp                 IN  VARCHAR2
, p_tipo_fatur_bv                  IN  carta_acordo.tipo_fatur_bv%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor_aprovado           IN  VARCHAR2
, p_vetor_valor_fornecedor         IN  VARCHAR2
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_carta.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_condicao_pagto_id              IN  carta_acordo.condicao_pagto_id%TYPE
, p_modo_pagto                     IN  carta_acordo.modo_pagto%TYPE
, p_emp_fi_banco_id                IN  carta_acordo.fi_banco_fornec_id%TYPE
, p_emp_num_agencia                IN  carta_acordo.num_agencia%TYPE
, p_emp_num_conta                  IN  carta_acordo.num_conta%TYPE
, p_emp_tipo_conta                 IN  carta_acordo.tipo_conta%TYPE
, p_emp_flag_atualizar             IN  VARCHAR2
, p_instr_especiais                IN  VARCHAR2
, p_entre_data_prototipo           IN  VARCHAR2
, p_entre_data_produto             IN  VARCHAR2
, p_entre_local                    IN  VARCHAR2
, p_monta_hora_ini                 IN  VARCHAR2
, p_monta_data_ini                 IN  VARCHAR2
, p_monta_hora_fim                 IN  VARCHAR2
, p_monta_data_fim                 IN  VARCHAR2
, p_pserv_hora_ini                 IN  VARCHAR2
, p_pserv_data_ini                 IN  VARCHAR2
, p_pserv_hora_fim                 IN  VARCHAR2
, p_pserv_data_fim                 IN  VARCHAR2
, p_desmo_hora_ini                 IN  VARCHAR2
, p_desmo_data_ini                 IN  VARCHAR2
, p_desmo_hora_fim                 IN  VARCHAR2
, p_desmo_data_fim                 IN  VARCHAR2
, p_event_desc                     IN  VARCHAR2
, p_event_local                    IN  VARCHAR2
, p_event_hora_ini                 IN  VARCHAR2
, p_event_data_ini                 IN  VARCHAR2
, p_event_hora_fim                 IN  VARCHAR2
, p_event_data_fim                 IN  VARCHAR2
, p_produtor_id                    IN  carta_acordo.produtor_id%TYPE
, p_flag_com_aprovacao             IN  VARCHAR2
, p_cod_ext_carta                  IN  VARCHAR2
, p_carta_acordo_id                OUT carta_acordo.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            monojob_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_fornecedor_id                  IN  carta_acordo.fornecedor_id%TYPE
, p_cliente_id                     IN  carta_acordo.cliente_id%TYPE
, p_emp_faturar_por_id             IN  carta_acordo.emp_faturar_por_id%TYPE
, p_contato_fornec_id              IN  carta_acordo.contato_fornec_id%TYPE
, p_jus_fornec_naohmlg             IN  VARCHAR2
, p_desc_item                      IN  VARCHAR2
, p_valor_credito                  IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_motivo_atu_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_motivo_atu_imp                 IN  VARCHAR2
, p_tipo_fatur_bv                  IN  carta_acordo.tipo_fatur_bv%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_produto_fiscal_id        IN  VARCHAR2
, p_vetor_quantidade               IN  VARCHAR2
, p_vetor_frequencia               IN  VARCHAR2
, p_vetor_custo_unitario           IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_valor_fornecedor         IN  VARCHAR2
, p_vetor_valor_aprovado           IN  VARCHAR2
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_carta.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_condicao_pagto_id              IN  carta_acordo.condicao_pagto_id%TYPE
, p_modo_pagto                     IN  carta_acordo.modo_pagto%TYPE
, p_emp_fi_banco_id                IN  carta_acordo.fi_banco_fornec_id%TYPE
, p_emp_num_agencia                IN  carta_acordo.num_agencia%TYPE
, p_emp_num_conta                  IN  carta_acordo.num_conta%TYPE
, p_emp_tipo_conta                 IN  carta_acordo.tipo_conta%TYPE
, p_emp_flag_atualizar             IN  VARCHAR2
, p_instr_especiais                IN  VARCHAR2
, p_entre_data_prototipo           IN  VARCHAR2
, p_entre_data_produto             IN  VARCHAR2
, p_entre_local                    IN  VARCHAR2
, p_monta_hora_ini                 IN  VARCHAR2
, p_monta_data_ini                 IN  VARCHAR2
, p_monta_hora_fim                 IN  VARCHAR2
, p_monta_data_fim                 IN  VARCHAR2
, p_pserv_hora_ini                 IN  VARCHAR2
, p_pserv_data_ini                 IN  VARCHAR2
, p_pserv_hora_fim                 IN  VARCHAR2
, p_pserv_data_fim                 IN  VARCHAR2
, p_desmo_hora_ini                 IN  VARCHAR2
, p_desmo_data_ini                 IN  VARCHAR2
, p_desmo_hora_fim                 IN  VARCHAR2
, p_desmo_data_fim                 IN  VARCHAR2
, p_event_desc                     IN  VARCHAR2
, p_event_local                    IN  VARCHAR2
, p_event_hora_ini                 IN  VARCHAR2
, p_event_data_ini                 IN  VARCHAR2
, p_event_hora_fim                 IN  VARCHAR2
, p_event_data_fim                 IN  VARCHAR2
, p_produtor_id                    IN  carta_acordo.produtor_id%TYPE
, p_flag_com_aprovacao             IN  VARCHAR2
, p_cod_ext_carta                  IN  VARCHAR2
, p_vetor_sobra_item_id            IN  VARCHAR2
, p_vetor_sobra_valores            IN  VARCHAR2
, p_carta_acordo_id                OUT carta_acordo.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            multijob_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_fornecedor_id                  IN  carta_acordo.fornecedor_id%TYPE
, p_cliente_id                     IN  carta_acordo.cliente_id%TYPE
, p_emp_faturar_por_id             IN  carta_acordo.emp_faturar_por_id%TYPE
, p_contato_fornec_id              IN  carta_acordo.contato_fornec_id%TYPE
, p_jus_fornec_naohmlg             IN  VARCHAR2
, p_desc_item                      IN  VARCHAR2
, p_valor_credito                  IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_motivo_atu_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_motivo_atu_imp                 IN  VARCHAR2
, p_tipo_fatur_bv                  IN  carta_acordo.tipo_fatur_bv%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_produto_fiscal_id        IN  VARCHAR2
, p_vetor_quantidade               IN  VARCHAR2
, p_vetor_frequencia               IN  VARCHAR2
, p_vetor_custo_unitario           IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_carta.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_condicao_pagto_id              IN  carta_acordo.condicao_pagto_id%TYPE
, p_modo_pagto                     IN  carta_acordo.modo_pagto%TYPE
, p_emp_fi_banco_id                IN  carta_acordo.fi_banco_fornec_id%TYPE
, p_emp_num_agencia                IN  carta_acordo.num_agencia%TYPE
, p_emp_num_conta                  IN  carta_acordo.num_conta%TYPE
, p_emp_tipo_conta                 IN  carta_acordo.tipo_conta%TYPE
, p_emp_flag_atualizar             IN  VARCHAR2
, p_instr_especiais                IN  VARCHAR2
, p_entre_data_prototipo           IN  VARCHAR2
, p_entre_data_produto             IN  VARCHAR2
, p_entre_local                    IN  VARCHAR2
, p_monta_hora_ini                 IN  VARCHAR2
, p_monta_data_ini                 IN  VARCHAR2
, p_monta_hora_fim                 IN  VARCHAR2
, p_monta_data_fim                 IN  VARCHAR2
, p_pserv_hora_ini                 IN  VARCHAR2
, p_pserv_data_ini                 IN  VARCHAR2
, p_pserv_hora_fim                 IN  VARCHAR2
, p_pserv_data_fim                 IN  VARCHAR2
, p_desmo_hora_ini                 IN  VARCHAR2
, p_desmo_data_ini                 IN  VARCHAR2
, p_desmo_hora_fim                 IN  VARCHAR2
, p_desmo_data_fim                 IN  VARCHAR2
, p_event_desc                     IN  VARCHAR2
, p_event_local                    IN  VARCHAR2
, p_event_hora_ini                 IN  VARCHAR2
, p_event_data_ini                 IN  VARCHAR2
, p_event_hora_fim                 IN  VARCHAR2
, p_event_data_fim                 IN  VARCHAR2
, p_produtor_id                    IN  carta_acordo.produtor_id%TYPE
, p_flag_com_aprovacao             IN  VARCHAR2
, p_cod_ext_carta                  IN  VARCHAR2
, p_vetor_sobra_item_id            IN  VARCHAR2
, p_vetor_sobra_valores            IN  VARCHAR2
, p_carta_acordo_id                OUT carta_acordo.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_fornecedor_id                  IN  carta_acordo.fornecedor_id%TYPE
, p_cliente_id                     IN  carta_acordo.cliente_id%TYPE
, p_emp_faturar_por_id             IN  carta_acordo.emp_faturar_por_id%TYPE
, p_flag_mostrar_ac                IN  carta_acordo.flag_mostrar_ac%TYPE
, p_contato_fornec                 IN  carta_acordo.contato_fornec%TYPE
, p_desc_item                      IN  VARCHAR2
, p_valor_credito                  IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_motivo_atu_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_motivo_atu_imp                 IN  VARCHAR2
, p_tipo_fatur_bv                  IN  carta_acordo.tipo_fatur_bv%TYPE
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_carta.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_condicao_pagto_id              IN  carta_acordo.condicao_pagto_id%TYPE
, p_modo_pagto                     IN  carta_acordo.modo_pagto%TYPE
, p_emp_fi_banco_id                IN  carta_acordo.fi_banco_fornec_id%TYPE
, p_emp_num_agencia                IN  carta_acordo.num_agencia%TYPE
, p_emp_num_conta                  IN  carta_acordo.num_conta%TYPE
, p_emp_tipo_conta                 IN  carta_acordo.tipo_conta%TYPE
, p_emp_flag_atualizar             IN  VARCHAR2
, p_instr_especiais                IN  VARCHAR2
, p_entre_data_prototipo           IN  VARCHAR2
, p_entre_data_produto             IN  VARCHAR2
, p_entre_local                    IN  VARCHAR2
, p_monta_hora_ini                 IN  VARCHAR2
, p_monta_data_ini                 IN  VARCHAR2
, p_monta_hora_fim                 IN  VARCHAR2
, p_monta_data_fim                 IN  VARCHAR2
, p_pserv_hora_ini                 IN  VARCHAR2
, p_pserv_data_ini                 IN  VARCHAR2
, p_pserv_hora_fim                 IN  VARCHAR2
, p_pserv_data_fim                 IN  VARCHAR2
, p_desmo_hora_ini                 IN  VARCHAR2
, p_desmo_data_ini                 IN  VARCHAR2
, p_desmo_hora_fim                 IN  VARCHAR2
, p_desmo_data_fim                 IN  VARCHAR2
, p_event_desc                     IN  VARCHAR2
, p_event_local                    IN  VARCHAR2
, p_event_hora_ini                 IN  VARCHAR2
, p_event_data_ini                 IN  VARCHAR2
, p_event_hora_fim                 IN  VARCHAR2
, p_event_data_fim                 IN  VARCHAR2
, p_produtor_id                    IN  carta_acordo.produtor_id%TYPE
, p_cod_ext_carta                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            monojob_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_fornecedor_id                  IN  carta_acordo.fornecedor_id%TYPE
, p_cliente_id                     IN  carta_acordo.cliente_id%TYPE
, p_emp_faturar_por_id             IN  carta_acordo.emp_faturar_por_id%TYPE
, p_contato_fornec_id              IN  carta_acordo.contato_fornec_id%TYPE
, p_desc_item                      IN  VARCHAR2
, p_valor_credito                  IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_motivo_atu_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_motivo_atu_imp                 IN  VARCHAR2
, p_tipo_fatur_bv                  IN  carta_acordo.tipo_fatur_bv%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_produto_fiscal_id        IN  VARCHAR2
, p_vetor_quantidade               IN  VARCHAR2
, p_vetor_frequencia               IN  VARCHAR2
, p_vetor_custo_unitario           IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_valor_fornecedor         IN  VARCHAR2
, p_vetor_valor_aprovado           IN  VARCHAR2
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_carta.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_condicao_pagto_id              IN  carta_acordo.condicao_pagto_id%TYPE
, p_modo_pagto                     IN  carta_acordo.modo_pagto%TYPE
, p_emp_fi_banco_id                IN  carta_acordo.fi_banco_fornec_id%TYPE
, p_emp_num_agencia                IN  carta_acordo.num_agencia%TYPE
, p_emp_num_conta                  IN  carta_acordo.num_conta%TYPE
, p_emp_tipo_conta                 IN  carta_acordo.tipo_conta%TYPE
, p_emp_flag_atualizar             IN  VARCHAR2
, p_instr_especiais                IN  VARCHAR2
, p_entre_data_prototipo           IN  VARCHAR2
, p_entre_data_produto             IN  VARCHAR2
, p_entre_local                    IN  VARCHAR2
, p_monta_hora_ini                 IN  VARCHAR2
, p_monta_data_ini                 IN  VARCHAR2
, p_monta_hora_fim                 IN  VARCHAR2
, p_monta_data_fim                 IN  VARCHAR2
, p_pserv_hora_ini                 IN  VARCHAR2
, p_pserv_data_ini                 IN  VARCHAR2
, p_pserv_hora_fim                 IN  VARCHAR2
, p_pserv_data_fim                 IN  VARCHAR2
, p_desmo_hora_ini                 IN  VARCHAR2
, p_desmo_data_ini                 IN  VARCHAR2
, p_desmo_hora_fim                 IN  VARCHAR2
, p_desmo_data_fim                 IN  VARCHAR2
, p_event_desc                     IN  VARCHAR2
, p_event_local                    IN  VARCHAR2
, p_event_hora_ini                 IN  VARCHAR2
, p_event_data_ini                 IN  VARCHAR2
, p_event_hora_fim                 IN  VARCHAR2
, p_event_data_fim                 IN  VARCHAR2
, p_produtor_id                    IN  carta_acordo.produtor_id%TYPE
, p_cod_ext_carta                  IN  VARCHAR2
, p_vetor_sobra_item_id            IN  VARCHAR2
, p_vetor_sobra_valores            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            multijob_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_fornecedor_id                  IN  carta_acordo.fornecedor_id%TYPE
, p_cliente_id                     IN  carta_acordo.cliente_id%TYPE
, p_emp_faturar_por_id             IN  carta_acordo.emp_faturar_por_id%TYPE
, p_contato_fornec_id              IN  carta_acordo.contato_fornec_id%TYPE
, p_desc_item                      IN  VARCHAR2
, p_valor_credito                  IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_motivo_atu_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_motivo_atu_imp                 IN  VARCHAR2
, p_tipo_fatur_bv                  IN  carta_acordo.tipo_fatur_bv%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_produto_fiscal_id        IN  VARCHAR2
, p_vetor_quantidade               IN  VARCHAR2
, p_vetor_frequencia               IN  VARCHAR2
, p_vetor_custo_unitario           IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_carta.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_condicao_pagto_id              IN  carta_acordo.condicao_pagto_id%TYPE
, p_modo_pagto                     IN  carta_acordo.modo_pagto%TYPE
, p_emp_fi_banco_id                IN  carta_acordo.fi_banco_fornec_id%TYPE
, p_emp_num_agencia                IN  carta_acordo.num_agencia%TYPE
, p_emp_num_conta                  IN  carta_acordo.num_conta%TYPE
, p_emp_tipo_conta                 IN  carta_acordo.tipo_conta%TYPE
, p_emp_flag_atualizar             IN  VARCHAR2
, p_instr_especiais                IN  VARCHAR2
, p_entre_data_prototipo           IN  VARCHAR2
, p_entre_data_produto             IN  VARCHAR2
, p_entre_local                    IN  VARCHAR2
, p_monta_hora_ini                 IN  VARCHAR2
, p_monta_data_ini                 IN  VARCHAR2
, p_monta_hora_fim                 IN  VARCHAR2
, p_monta_data_fim                 IN  VARCHAR2
, p_pserv_hora_ini                 IN  VARCHAR2
, p_pserv_data_ini                 IN  VARCHAR2
, p_pserv_hora_fim                 IN  VARCHAR2
, p_pserv_data_fim                 IN  VARCHAR2
, p_desmo_hora_ini                 IN  VARCHAR2
, p_desmo_data_ini                 IN  VARCHAR2
, p_desmo_hora_fim                 IN  VARCHAR2
, p_desmo_data_fim                 IN  VARCHAR2
, p_event_desc                     IN  VARCHAR2
, p_event_local                    IN  VARCHAR2
, p_event_hora_ini                 IN  VARCHAR2
, p_event_data_ini                 IN  VARCHAR2
, p_event_hora_fim                 IN  VARCHAR2
, p_event_data_fim                 IN  VARCHAR2
, p_produtor_id                    IN  carta_acordo.produtor_id%TYPE
, p_cod_ext_carta                  IN  VARCHAR2
, p_vetor_sobra_item_id            IN  VARCHAR2
, p_vetor_sobra_valores            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            emitida_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_valor_fornecedor               IN  VARCHAR2
, p_tipo_fatur_bv                  IN  carta_acordo.tipo_fatur_bv%TYPE
, p_perc_bv                        IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_vetor_item_nota_id             IN  VARCHAR2
, p_vetor_valor_fornec             IN  VARCHAR2
, p_vetor_valor_bv                 IN  VARCHAR2
, p_vetor_valor_tip                IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_motivo_reprov                  IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            emitir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_pessoa_id                      IN  arquivo_pessoa.pessoa_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            email_registrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  email_carta.carta_acordo_id%TYPE
, p_fornecedor_id                  IN  carta_acordo.fornecedor_id%TYPE
, p_enviar_para                    IN  email_carta.enviar_para%TYPE
, p_enviado_por                    IN  email_carta.enviado_por%TYPE
, p_responder_para                 IN  email_carta.responder_para%TYPE
, p_assunto                        IN  email_carta.assunto%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enviada_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_tipo_envio                     IN  carta_acordo.tipo_envio%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enviada_desmarcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE              parcela_simular (
    p_usuario_sessao_id            IN  NUMBER,
    p_empresa_id                   IN  empresa.empresa_id%TYPE,
    p_condicao_pagto_id            IN  condicao_pagto.condicao_pagto_id%TYPE,
    p_valor_a_parcelar             IN  VARCHAR2,
    p_vetor_num_parcela            OUT VARCHAR2,
    p_vetor_data                   OUT VARCHAR2,
    p_vetor_dia_semana             OUT VARCHAR2,
    p_vetor_perc                   OUT VARCHAR2,
    p_vetor_valor                  OUT VARCHAR2,
    p_erro_cod                     OUT VARCHAR2,
    p_erro_msg                     OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_carta_acordo_id                IN  arquivo_carta.carta_acordo_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_tipo_arq_ca                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_carta_acordo_id                IN  arquivo_carta.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aceite_registrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  arquivo_carta.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aceite_desfazer
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  arquivo_carta.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            id_retornar
(
  p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_num_job                        IN  VARCHAR2
, p_num_carta_acordo               IN  VARCHAR2
, p_carta_acordo_id                OUT carta_acordo.carta_acordo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             numero_formatar (
  p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             num_orcam_retornar (
  p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             numero_completo_formatar (
  p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE,
  p_flag_prefixo                   IN  VARCHAR2)
RETURN   VARCHAR2;
--
FUNCTION             valor_retornar (
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             resultado_retornar (
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE)
RETURN NUMBER;
--
FUNCTION             legenda_retornar (
  p_carta_acordo_id               IN  carta_acordo.carta_acordo_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             faixa_aprov_verificar (
  p_usuario_id                    IN usuario.usuario_id%TYPE,
  p_empresa_id                    IN empresa.empresa_id%TYPE,
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE)
RETURN INTEGER;
--
FUNCTION             faixa_aprov_id_retornar (
  p_usuario_id                    IN usuario.usuario_id%TYPE,
  p_empresa_id                    IN empresa.empresa_id%TYPE,
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE)
RETURN NUMBER;
--
FUNCTION             usuario_aprov_verificar (
  p_empresa_id                    IN empresa.empresa_id%TYPE,
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE)
RETURN INTEGER;
--
FUNCTION             papel_priv_verificar (
    p_usuario_sessao_id           IN  usuario.usuario_id%TYPE,
    p_codigo_priv                 IN  privilegio.codigo%TYPE,
    p_papel_id                    IN  papel.papel_id%TYPE,
    p_carta_acordo_id             IN  carta_acordo.carta_acordo_id%TYPE)
RETURN INTEGER;
--
END;  -- CARTA_ACORDO_PKG


/
--------------------------------------------------------
--  DDL for Package CEP_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CEP_PKG" 
IS
PROCEDURE        codigo_pesquisar
(
  p_codigo                         IN  cep.codigo%TYPE
, p_logradouro                     OUT cep.logradouro%TYPE
, p_bairro                         OUT cep.bairro%TYPE
, p_localidade                     OUT cep.localidade%TYPE
, p_uf                             OUT cep.uf%TYPE);
--
PROCEDURE        codigo_novo_pesquisar
(
  p_codigo                         IN  VARCHAR2
, p_logradouro                     OUT VARCHAR2
, p_bairro                         OUT VARCHAR2
, p_localidade                     OUT VARCHAR2
, p_uf                             OUT VARCHAR2);
--
--
FUNCTION        MOSTRAR
     (p_cep                     IN  VARCHAR2)
RETURN     VARCHAR2;
--
--
FUNCTION        CONVERTER
     (p_cep                     IN  VARCHAR2)
RETURN     VARCHAR2;
--
--
FUNCTION        VALIDAR
     (p_cep                    IN  VARCHAR2)
RETURN     INTEGER;
--
--
FUNCTION        municipio_validar
(p_uf                    IN  VARCHAR2,
 p_municipio             IN  VARCHAR2)
RETURN  INTEGER;
--
--
FUNCTION        proximidade_retornar
(p_cep_referencia                IN  VARCHAR2,
 p_cep_analisado                 IN  VARCHAR2)
RETURN  INTEGER;
--
END; -- CEP_PKG


/
--------------------------------------------------------
--  DDL for Package CNPJ_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CNPJ_PKG" 
  IS
FUNCTION        VALIDAR
     (p_cnpj                     IN  VARCHAR2,
      p_empresa_id               IN  empresa.empresa_id%TYPE)
RETURN     INTEGER;
PRAGMA restrict_references (validar, wnds);
--
FUNCTION        MOSTRAR
     (p_cnpj                     IN  VARCHAR2,
      p_empresa_id               IN  empresa.empresa_id%TYPE)
RETURN     VARCHAR2;
PRAGMA restrict_references (mostrar, wnds);
--
FUNCTION        CONVERTER
     (p_cnpj                     IN  VARCHAR2,
      p_empresa_id               IN  empresa.empresa_id%TYPE)
RETURN     VARCHAR2;
PRAGMA restrict_references (converter, wnds);
--
END; -- CNPJ_PKG


/
--------------------------------------------------------
--  DDL for Package COMENTARIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "COMENTARIO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_tipo_objeto                    IN  VARCHAR2
, p_objeto_id                      IN  comentario.objeto_id%TYPE
, p_classe                         IN  comentario.classe%TYPE
, p_comentario_pai_id              IN  comentario.comentario_pai_id%TYPE
, p_comentario                     IN  comentario.comentario%TYPE
, p_comentario_id                  OUT comentario.comentario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_comentario_id                  IN  comentario.comentario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecados_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_comentario_id                  IN  comentario.comentario_id%TYPE
, p_vetor_enderecados              IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ocultar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_comentario_id                  IN  comentario.comentario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- COMENTARIO_PKG


/
--------------------------------------------------------
--  DDL for Package CONDICAO_PAGTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CONDICAO_PAGTO_PKG" 
IS
--
PROCEDURE        adicionar
( p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  condicao_pagto.nome%TYPE
, p_descricao                      IN  condicao_pagto.descricao%TYPE
, p_codigo                         IN  condicao_pagto.codigo%TYPE
, p_cod_ext_condicao               IN  condicao_pagto.cod_ext_condicao%TYPE
, p_tipo_regra                     IN  condicao_pagto.tipo_regra%TYPE
, p_vetor_dia_semana               IN  VARCHAR2
, p_semana_mes                     IN  VARCHAR2
, p_dia_util_mes                   IN  VARCHAR2
, p_flag_pag_for                   IN  VARCHAR2
, p_flag_fat_cli                   IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_vetor_valor_perc               IN  VARCHAR2
, p_vetor_num_dias                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE        atualizar
( p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_condicao_pagto_id              IN  condicao_pagto.condicao_pagto_id%TYPE
, p_nome                           IN  condicao_pagto.nome%TYPE
, p_descricao                      IN  condicao_pagto.descricao%TYPE
, p_codigo                         IN  condicao_pagto.codigo%TYPE
, p_cod_ext_condicao               IN  condicao_pagto.cod_ext_condicao%TYPE
, p_tipo_regra                     IN  condicao_pagto.tipo_regra%TYPE
, p_vetor_dia_semana               IN  VARCHAR2
, p_semana_mes                     IN  VARCHAR2
, p_dia_util_mes                   IN  VARCHAR2
, p_flag_pag_for                   IN  VARCHAR2
, p_flag_fat_cli                   IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_vetor_valor_perc               IN  VARCHAR2
, p_vetor_num_dias                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE        excluir
( p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_condicao_pagto_id              IN  condicao_pagto.condicao_pagto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             data_retornar (
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_condicao_pagto_id              IN  condicao_pagto.condicao_pagto_id%TYPE
, p_data                           IN  DATE)
RETURN DATE;
--
END; -- CONDICAO_PAGTO_PKG


/
--------------------------------------------------------
--  DDL for Package CONTRATO_ELAB_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CONTRATO_ELAB_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_cod_contrato_elab              IN  contrato_elab.cod_contrato_elab%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);  
--
PROCEDURE            acao_executar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_elab_id               IN  contrato_elab.contrato_elab_id%TYPE
, p_cod_acao                       IN  ct_transicao.cod_acao%TYPE
, p_motivo                         IN  contrato_elab.motivo%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);  
--
END;
-- CONTRATO_ELAB_PKG

/
--------------------------------------------------------
--  DDL for Package CONTRATO_FISICO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CONTRATO_FISICO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_data_prazo                     IN  VARCHAR2
, p_flag_commit                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE           desc_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN contrato.empresa_id%TYPE
, p_contrato_fisico_id             IN contrato_fisico.contrato_fisico_id%TYPE
, p_descricao                      IN contrato_fisico.descricao%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            acao_executar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_fisico_id             IN  contrato_fisico.contrato_fisico_id%TYPE
, p_cod_acao                       IN  ct_transicao.cod_acao%TYPE
, p_descricao                      IN  contrato_fisico.descricao%TYPE
, p_motivo                         IN  contrato_fisico.motivo%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_contrato_fisico_id             IN  contrato_fisico.contrato_fisico_id%TYPE
, p_tipo_arq_fisico                IN  arquivo_contrato_fisico.tipo_arq_fisico%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- CONTRATO_FISICO_PKG

/
--------------------------------------------------------
--  DDL for Package CONTRATO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CONTRATO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_ori_id                IN  contrato.contrato_id%TYPE
, p_tipo_contrato_id               IN  contrato.tipo_contrato_id%TYPE
, p_cod_ext_contrato               IN  contrato.cod_ext_contrato%TYPE
, p_nome                           IN  contrato.nome%TYPE
, p_contratante_id                 IN  contrato.contratante_id%TYPE
, p_contato_id                     IN  contrato.contato_id%TYPE
, p_emp_resp_id                    IN  contrato.emp_resp_id%TYPE
, p_data_assinatura                IN  VARCHAR2
, p_data_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_flag_renovavel                 IN  VARCHAR2
, p_objeto                         IN  contrato.objeto%TYPE
, p_ordem_compra                   IN  contrato.ordem_compra%TYPE
, p_cod_ext_ordem                  IN  contrato.cod_ext_ordem%TYPE
, p_contrato_id                    OUT contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_simples
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_tipo_contrato_id               IN  contrato.tipo_contrato_id%TYPE
, p_emp_resp_id                    IN  contrato.emp_resp_id%TYPE
, p_nome                           IN  contrato.nome%TYPE
, p_cli_flag_pessoa_jur            IN  VARCHAR2
, p_cli_flag_exterior              IN  VARCHAR2
, p_cli_flag_sem_docum             IN  VARCHAR2
, p_cli_apelido                    IN  VARCHAR2
, p_cli_nome                       IN  VARCHAR2
, p_cli_cnpj                       IN  VARCHAR2
, p_cli_cpf                        IN  VARCHAR2
, p_cli_endereco                   IN  VARCHAR2
, p_cli_num_ender                  IN  VARCHAR2
, p_cli_compl_ender                IN  VARCHAR2
, p_cli_bairro                     IN  VARCHAR2
, p_cli_cep                        IN  VARCHAR2
, p_cli_cidade                     IN  VARCHAR2
, p_cli_uf                         IN  VARCHAR2
, p_cli_pais                       IN  VARCHAR2 
, p_cli_email                      IN  VARCHAR2
, p_cli_ddd_telefone               IN  VARCHAR2
, p_cli_num_telefone               IN  VARCHAR2 
, p_cli_nome_setor                 IN  VARCHAR2
, p_data_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_flag_renovavel                 IN  VARCHAR2
, p_flag_ctr_fisico                IN  VARCHAR2
, p_vetor_ender_empresas           IN  VARCHAR2
, p_vetor_ender_usuarios           IN  VARCHAR2
, p_vetor_ender_flag_resp          IN  VARCHAR2
, p_contrato_id                    OUT contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_tipo_contrato_id               IN  contrato.tipo_contrato_id%TYPE
, p_cod_ext_contrato               IN  contrato.cod_ext_contrato%TYPE
, p_nome                           IN  contrato.nome%TYPE
, p_contratante_id                 IN  contrato.contratante_id%TYPE
, p_contato_id                     IN  contrato.contato_id%TYPE
, p_emp_resp_id                    IN  contrato.emp_resp_id%TYPE
, p_data_assinatura                IN  VARCHAR2
, p_data_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_flag_repetir                   IN  VARCHAR2
, p_flag_renovavel                 IN  VARCHAR2
, p_flag_ctr_fisico                IN  VARCHAR2
, p_objeto                         IN  contrato.objeto%TYPE
, p_ordem_compra                   IN  contrato.ordem_compra%TYPE
, p_cod_ext_ordem                  IN  contrato.cod_ext_ordem%TYPE
, p_vetor_natureza_item_id         IN  VARCHAR2
, p_vetor_valor_padrao             IN  VARCHAR2
, p_contato_fatur_id               IN  contrato.contato_fatur_id%TYPE
, p_flag_pago_cliente              IN  VARCHAR2
, p_flag_bloq_negoc                IN  VARCHAR2
, p_flag_bv_fornec                 IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_emp_faturar_por_id             IN  contrato.emp_faturar_por_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_vigencia
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_data_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_flag_repetir                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_responsavel
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            desconto_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_perc_desc                      IN  VARCHAR2
, p_motivo_desc                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            assinado_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_data_assinatura                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            assinado_desmarcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            concluir_automatico;
--
PROCEDURE            enderecar_automatico
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_usuario
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_usuario_id                     IN  contrato_usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_area_id                        IN  papel.area_id%TYPE
, p_vetor_usuarios                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            status_alterar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_status_new                     IN  contrato.status%TYPE
, p_complemento                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato_horas.contrato_id%TYPE
, p_tipo_formulario                IN  VARCHAR2
, p_usuario_id                     IN  contrato_horas.usuario_id%TYPE
, p_cargo_id                       IN  contrato_horas.cargo_id%TYPE
, p_nivel                          IN  contrato_horas.nivel%TYPE
, p_contrato_servico_id            IN  contrato_horas.contrato_servico_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_vetor_mes_ano_de               IN  VARCHAR2
, p_vetor_mes_ano_ate              IN  VARCHAR2
, p_vetor_horas_planej             IN  VARCHAR2
, p_vetor_venda_hora               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_desc_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_id              IN  contrato_horas.contrato_horas_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_planej_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_id              IN  contrato_horas.contrato_horas_id%TYPE
, p_horas_planej                   IN  VARCHAR2
, p_venda_valor_total              OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_fator_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_id              IN  contrato_horas.contrato_horas_id%TYPE
, p_venda_fator_ajuste             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_venda_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_id              IN  contrato_horas.contrato_horas_id%TYPE
, p_venda_hora_rev                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_ajustar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_venda_fator_ajuste             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_servico_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_id              IN  contrato_horas.contrato_horas_id%TYPE
, p_contrato_servico_id            IN  contrato_horas.contrato_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_id              IN  contrato_horas.contrato_horas_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_linha_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato_horas.contrato_id%TYPE
, p_usuario_id                     IN  contrato_horas.usuario_id%TYPE
, p_cargo_id                       IN  contrato_horas.cargo_id%TYPE
, p_nivel                          IN  contrato_horas.nivel%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_usu_adicionar(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_vetor_contrato_horas_id        IN  VARCHAR2
, p_vetor_usuario_id               IN  VARCHAR2
, p_vetor_horas_aloc               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_usu_atualizar(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_usu_id          IN  contrato_horas_usu.contrato_horas_usu_id%TYPE
, p_horas_aloc                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_usu_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_usuario_id                     IN  contrato_horas_usu.usuario_id%TYPE
, p_vetor_contrato_horas_id        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            valores_sugeridos_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_horas_id              IN  contrato_horas.contrato_horas_id%TYPE
, p_custo_hora_pdr                 IN  VARCHAR2
, p_venda_hora_pdr                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato_servico.contrato_id%TYPE
, p_servico_id                     IN  contrato_servico.servico_id%TYPE
, p_emp_faturar_por_id             IN  contrato.emp_faturar_por_id%TYPE
, p_data_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_cod_externo                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_servico_id            IN  contrato_servico.contrato_servico_id%TYPE
, p_servico_id                     IN  contrato_servico.servico_id%TYPE
, p_emp_faturar_por_id             IN  contrato.emp_faturar_por_id%TYPE
, p_data_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_cod_externo                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_servico_id            IN  contrato_servico.contrato_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_integrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_servico_id            IN  contrato_servico.contrato_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_valor_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_servico_id            IN  contrato_servico.contrato_servico_id%TYPE
, p_emp_resp_id                    IN  contrato_serv_valor.emp_resp_id%TYPE
, p_valor_servico                  IN  VARCHAR2
, p_usuario_resp_id                IN  contrato_serv_valor.usuario_resp_id%TYPE
, p_unid_negocio_resp_id           IN  contrato_serv_valor.unid_negocio_resp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_valor_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_serv_valor_id         IN  contrato_serv_valor.contrato_serv_valor_id%TYPE
, p_emp_resp_id                    IN  contrato_serv_valor.emp_resp_id%TYPE
, p_valor_servico                  IN  VARCHAR2
, p_usuario_resp_id                IN  contrato_serv_valor.usuario_resp_id%TYPE
, p_unid_negocio_resp_id           IN  contrato_serv_valor.unid_negocio_resp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_valor_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_serv_valor_id         IN  contrato_serv_valor.contrato_serv_valor_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            parcelas_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato_servico.contrato_id%TYPE
, p_contrato_servico_id            IN  contrato_servico.contrato_servico_id%TYPE
, p_num_parcelas                   IN  VARCHAR2
, p_data_prim_parcela              IN  VARCHAR2
, p_valor_parcela                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            parcela_alterar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_parcela_contrato_id            IN  parcela_contrato.parcela_contrato_id%TYPE
, p_data_vencim                    IN  VARCHAR2
, p_valor_parcela                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            parcela_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_parcela_contrato_id            IN  parcela_contrato.parcela_contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            parcelamento_terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            parcelamento_revisar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  contrato.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_motivo_rev                     IN  VARCHAR2
, p_compl_rev                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_contrato_id                    IN  arquivo_contrato.contrato_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             numero_formatar (
  p_contrato_id                    IN  contrato.contrato_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             horas_do_usuario_retornar (
  p_empresa_id                    IN contrato.empresa_id%TYPE,
  p_usuario_id                    IN contrato.contrato_id%TYPE,
  p_tipo                          IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_retornar (
  p_contrato_id                   IN contrato.contrato_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_parcela_retornar (
  p_parcela_contrato_id           IN parcela_contrato.parcela_contrato_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             status_parcela_retornar (
  p_parcela_contrato_id           IN parcela_contrato.parcela_contrato_id%TYPE)
RETURN VARCHAR2;
--
END;  -- CONTRATO_PKG

/
--------------------------------------------------------
--  DDL for Package CPF_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CPF_PKG" 
  IS
FUNCTION        VALIDAR
     (p_cpf                     IN  VARCHAR2,
      p_empresa_id              IN  empresa.empresa_id%TYPE)
RETURN     INTEGER;
PRAGMA restrict_references (validar, wnds);
--
FUNCTION        MOSTRAR
     (p_cpf                     IN  VARCHAR2,
      p_empresa_id              IN  empresa.empresa_id%TYPE)
RETURN     VARCHAR2;
PRAGMA restrict_references (mostrar, wnds);
--
FUNCTION        CONVERTER
     (p_cpf                     IN  VARCHAR2,
      p_empresa_id              IN  empresa.empresa_id%TYPE)
RETURN     VARCHAR2;
PRAGMA restrict_references (converter, wnds);
--
END; -- CPF_PKG


/
--------------------------------------------------------
--  DDL for Package CRONOGRAMA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CRONOGRAMA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  cronograma.job_id%TYPE
, p_cronograma_id                  OUT cronograma.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_com_modelo
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  cronograma.job_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_data_base                      IN  VARCHAR2
, p_cronograma_id                  OUT cronograma.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            acrescentar_com_modelo
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_data_base                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            retomar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_motivo_reprov                  IN  VARCHAR2
, p_compl_reprov                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            revisar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_motivo_rev                     IN  VARCHAR2
, p_compl_rev                      IN  VARCHAR2
, p_cronograma_new_id              OUT cronograma.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_cronograma_id                  IN  item_crono.cronograma_id%TYPE
, p_item_crono_pai_id              IN  item_crono.item_crono_pai_id%TYPE
, p_nome                           IN  item_crono.nome%TYPE
, p_data_planej_ini                IN  VARCHAR2
, p_data_planej_fim                IN  VARCHAR2
, p_cod_objeto                     IN  objeto_crono.cod_objeto%TYPE
, p_tipo_objeto_id                 IN  mod_item_crono.tipo_objeto_id%TYPE
, p_sub_tipo_objeto                IN  mod_item_crono.sub_tipo_objeto%TYPE
, p_papel_resp_id                  IN  mod_item_crono.papel_resp_id%TYPE
, p_vetor_papel_dest_id            IN  VARCHAR2
, p_flag_enviar                    IN  VARCHAR2
, p_repet_a_cada                   IN  VARCHAR2
, p_frequencia_id                  IN  mod_item_crono.frequencia_id%TYPE
, p_vetor_dia_semana_id            IN  VARCHAR2
, p_repet_term_tipo                IN  VARCHAR2
, p_repet_term_ocor                IN  VARCHAR2
, p_obs                            IN  VARCHAR2
, p_item_crono_id                  OUT item_crono.item_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_objeto_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  item_crono.cronograma_id%TYPE
, p_cod_objeto                     IN  objeto_crono.cod_objeto%TYPE
, p_demanda                        IN  VARCHAR2
, p_item_crono_id                  OUT item_crono.item_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_nome                           IN  item_crono.nome%TYPE
, p_data_planej_ini                IN  VARCHAR2
, p_data_planej_fim                IN  VARCHAR2
, p_flag_altera_depend             IN  VARCHAR2
, p_flag_altera_filhos             IN  VARCHAR2
, p_obs                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_situacao_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_situacao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_mover
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_ori_id              IN  item_crono.item_crono_id%TYPE
, p_item_crono_des_id              IN  item_crono.item_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_deslocar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_direcao                        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_pre_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono_pre.item_crono_id%TYPE
, p_item_crono_pre_id              IN  item_crono_pre.item_crono_pre_id%TYPE
, p_tipo                           IN  item_crono_pre.tipo%TYPE
, p_lag                            IN  item_crono_pre.lag%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_pre_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_vetor_item_crono_pre           IN  VARCHAR2
, p_vetor_tipo                     IN  VARCHAR2
, p_vetor_lag                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_crono_pre_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono_pre.item_crono_id%TYPE
, p_item_crono_pre_id              IN  item_crono_pre.item_crono_pre_id%TYPE
, p_tipo                           IN  item_crono_pre.tipo%TYPE
, p_lag                            IN  item_crono_pre.lag%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            executores_replicar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_origem                         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            repeticao_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  item_crono.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            datas_depend_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_num_dias_uteis                 IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            datas_hierarq_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_num_dias_uteis                 IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            dias_replanejar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_tipo_calc                      IN  VARCHAR2
, p_num_dias_uteis                 IN  VARCHAR2
, p_vetor_item_crono_id            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            datas_replanejar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  cronograma.cronograma_id%TYPE
, p_tipo_data                      IN  VARCHAR2
, p_data_nova                      IN  VARCHAR2
, p_item_crono_base_id             IN  item_crono.item_crono_id%TYPE
, p_vetor_item_crono_id            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            seq_renumerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  item_crono.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ordem_renumerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cronograma_id                  IN  item_crono.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            num_gantt_processar
(
  p_cronograma_id                  IN  item_crono.cronograma_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            info_pre_retornar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  objeto_crono.cod_objeto%TYPE
, p_objeto_id                      IN  NUMBER
, p_nome_ativ_pre                  OUT VARCHAR2
, p_cod_objeto_pre                 OUT VARCHAR2
, p_nome_objeto_pre                OUT VARCHAR2
, p_status_objeto_pre              OUT VARCHAR2
, p_objeto_pre_id                  OUT NUMBER
, p_data_fim_pre                   OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_item_crono_id                  IN  item_crono_usu.item_crono_id%TYPE
, p_usuario_id                     IN  item_crono_usu.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_horas_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_crono_id                  IN  item_crono_usu.item_crono_id%TYPE
, p_vetor_usuario_id               IN  VARCHAR2
, p_vetor_horas_diarias            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_item_crono_id                  IN  item_crono_usu.item_crono_id%TYPE
, p_usuario_id                     IN  item_crono_usu.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            alocacao_processar;
--
PROCEDURE            alocacao_usu_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  item_crono_usu.usuario_id%TYPE
, p_data_ini                       IN  DATE
, p_data_fim                       IN  DATE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             ultimo_retornar
(
  p_job_id                         IN job.job_id%TYPE)
RETURN INTEGER;
--
FUNCTION             item_duracao_retornar 
(
  p_usuario_id                     IN usuario.usuario_id%TYPE,
  p_item_crono_id                  IN item_crono.item_crono_id%TYPE)
RETURN    INTEGER;
--
FUNCTION             num_seq_pre_retornar (
  p_item_crono_id                  IN  item_crono.item_crono_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             ativ_do_objeto_retornar (
    p_job_id                      IN job.job_id%TYPE,
    p_cod_objeto                  IN item_crono.cod_objeto%TYPE,
    p_objeto_id                   IN item_crono.objeto_id%TYPE,
    p_tipo_texto                  IN VARCHAR2)
RETURN    VARCHAR2;
--
END cronograma_pkg;

/
--------------------------------------------------------
--  DDL for Package DEPARTAMENTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DEPARTAMENTO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  departamento.nome%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_departamento_id                IN  departamento.departamento_id%TYPE
, p_nome                           IN  departamento.nome%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_departamento_id                IN  departamento.departamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_departamento_id                IN  departamento.departamento_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- DEPARTAMENTO_PKG


/
--------------------------------------------------------
--  DDL for Package DICION_EMP_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DICION_EMP_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo                          IN  VARCHAR2
, p_codigo                         IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_dicion_emp_id                  OUT dicion_emp.dicion_emp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_dicion_emp_id                  IN  dicion_emp.dicion_emp_id%TYPE
, p_codigo                         IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_dicion_emp_id                  IN  dicion_emp.dicion_emp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            valor_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_dicion_emp_id                  IN  dicion_emp.dicion_emp_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_dicion_emp_val_id              OUT dicion_emp_val.dicion_emp_val_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            valor_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_dicion_emp_val_id              IN  dicion_emp_val.dicion_emp_val_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            valor_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_dicion_emp_val_id              IN  dicion_emp_val.dicion_emp_val_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
END;  -- DICION_EMP_PKG


/
--------------------------------------------------------
--  DDL for Package DOCUMENTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DOCUMENTO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  documento.job_id%TYPE
, p_papel_resp_id                  IN  documento.papel_resp_id%TYPE
, p_tipo_documento_id              IN  documento.tipo_documento_id%TYPE
, p_nome                           IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_tipo_fluxo                     IN  documento.tipo_fluxo%TYPE
, p_vetor_papel_id                 IN  LONG
, p_prioridade                     IN  task.prioridade%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_documento_id                   OUT documento.documento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_documento_id                   IN  documento.documento_id%TYPE
, p_nome                           IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_documento_id                   IN  documento.documento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            versao_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  documento.job_id%TYPE
, p_papel_resp_id                  IN  documento.papel_resp_id%TYPE
, p_documento_origem_id            IN  documento.documento_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_tipo_fluxo                     IN  documento.tipo_fluxo%TYPE
, p_vetor_papel_id                 IN  LONG
, p_prioridade                     IN  task.prioridade%TYPE
, p_flag_manter_arquivos           IN  VARCHAR2
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_documento_id                   OUT documento.documento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_documento_id                   IN  arquivo_documento.documento_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_documento_id                   IN  documento.documento_id%TYPE
, p_flag_remover                   OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            consolidar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_documento_id                   IN  documento.documento_id%TYPE
, p_flag_reprovado                 IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            task_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_documento_id                   IN  documento.documento_id%TYPE
, p_tipo_task                      IN  VARCHAR2
, p_prioridade                     IN  task.prioridade%TYPE
, p_vetor_papel_id                 IN  LONG
, p_tipo_fluxo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             status_retornar (
  p_documento_id                   IN  documento.documento_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             status_task_retornar (
  p_task_id                        IN  task.task_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             consolidado_verificar (
  p_documento_id                   IN  documento.documento_id%TYPE)
RETURN   INTEGER;
--
--
FUNCTION             prim_arquivo_id_retornar (
  p_documento_id                   IN  documento.documento_id%TYPE)
RETURN   INTEGER;
--
--
FUNCTION             qtd_arquivo_retornar (
  p_documento_id                   IN  documento.documento_id%TYPE)
RETURN   INTEGER;
--
--
PROCEDURE            xml_gerar
(
  p_documento_id                   IN  documento.documento_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- DOCUMENTO_PKG


/
--------------------------------------------------------
--  DDL for Package EMPRESA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "EMPRESA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_nome                           IN  empresa.nome%TYPE
, p_codigo                         IN  empresa.codigo%TYPE
, p_cod_ext_empresa                IN  empresa.cod_ext_empresa%TYPE
, p_pais_id                        IN  pais.pais_id%TYPE
, p_localidade                     IN  VARCHAR2
, p_empresa_id                     OUT empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  empresa.nome%TYPE
, p_codigo                         IN  empresa.codigo%TYPE
, p_cod_ext_empresa                IN  empresa.cod_ext_empresa%TYPE
, p_pais_id                        IN  pais.pais_id%TYPE
, p_localidade                     IN  VARCHAR2
, p_flag_ativo                     IN  empresa.flag_ativo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_empresa_arq_id                 IN  arquivo_empresa.empresa_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            parametro_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa_parametro.empresa_id%TYPE
, p_parametro_id                   IN  empresa_parametro.parametro_id%TYPE
, p_valor_parametro                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION       parametro_retornar (
 p_empresa_id                     IN  empresa.empresa_id%TYPE,
 p_nome_parametro                 IN  parametro.nome%TYPE)
RETURN   VARCHAR2;
--
FUNCTION       servidor_arquivo_retornar (
 p_empresa_id                     IN  empresa.empresa_id%TYPE,
 p_job_id                         IN  job.job_id%TYPE)
RETURN   NUMBER;
--
END; -- empresa_pkg


/
--------------------------------------------------------
--  DDL for Package EQUIPE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "EQUIPE_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  equipe.nome%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_nome                           IN  equipe.nome%TYPE
, p_flag_em_dist_os                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            guide_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_flag_guide                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            membro_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_flag_membro                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            responsavel_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_flag_responsavel               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_tarefa_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_tipo_tarefa_id                 IN  equipe.tipo_tarefa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- EQUIPE_PKG


/
--------------------------------------------------------
--  DDL for Package EVENTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "EVENTO_PKG" 
IS
--
PROCEDURE            gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_cod_objeto                     IN  tipo_objeto.codigo%TYPE
, p_cod_acao                       IN  tipo_acao.codigo%TYPE
, p_identif_objeto                 IN  historico.identif_objeto%TYPE
, p_objeto_id                      IN  historico.objeto_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_flag_pula_notif                IN  VARCHAR2
, p_xml_antes                      IN  CLOB
, p_xml_atual                      IN  CLOB
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            carregar;
--
--
PROCEDURE            config_padrao_criar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_evento_id                      IN  evento.evento_id%TYPE
, p_tipo_os_id                     IN  evento_config.tipo_os_id%TYPE
, p_evento_config_id               OUT evento_config.evento_config_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            config_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  evento_config.empresa_id%TYPE
, p_evento_id                      IN  evento_config.evento_id%TYPE
, p_classe_evento                  IN  evento.classe%TYPE
, p_tipo_os_id                     IN  evento_config.tipo_os_id%TYPE
, p_flag_historico                 IN  evento_config.flag_historico%TYPE
, p_flag_notifica_tela             IN  evento_config.flag_notifica_tela%TYPE
, p_nt_flag_ender_todos            IN  VARCHAR2
, p_nt_flag_ender_papel            IN  VARCHAR2
, p_nt_vetor_ender_papel           IN  VARCHAR2
, p_nt_flag_usu_papel              IN  VARCHAR2
, p_nt_vetor_usu_papel             IN  VARCHAR2
, p_nt_flag_usu_indicado           IN  VARCHAR2
, p_nt_vetor_usu_indicado          IN  VARCHAR2
, p_nt_flag_job_criador            IN  VARCHAR2
, p_nt_flag_job_respint            IN  VARCHAR2
, p_nt_flag_ca_produtor            IN  VARCHAR2
, p_nt_flag_os_solicit             IN  VARCHAR2
, p_nt_flag_os_distr               IN  VARCHAR2
, p_nt_flag_os_exec                IN  VARCHAR2
, p_nt_flag_os_aprov               IN  VARCHAR2
, p_nt_flag_ctr_criador            IN  VARCHAR2
, p_nt_flag_ctr_respint            IN  VARCHAR2
, p_nt_flag_ad_criador             IN  VARCHAR2
, p_nt_flag_ad_solicit             IN  VARCHAR2
, p_nt_flag_ad_aprov               IN  VARCHAR2
, p_nt_flag_est_criador            IN  VARCHAR2
, p_nt_flag_est_aprov              IN  VARCHAR2
, p_nt_flag_doc_criador            IN  VARCHAR2
, p_nt_flag_doc_aprov              IN  VARCHAR2
, p_nt_flag_bri_aprov              IN  VARCHAR2
, p_nt_flag_pa_notif_ender         IN  VARCHAR2
, p_flag_notifica_email            IN  evento_config.flag_notifica_email%TYPE
, p_ne_flag_ender_todos            IN  VARCHAR2
, p_ne_flag_ender_papel            IN  VARCHAR2
, p_ne_vetor_ender_papel           IN  VARCHAR2
, p_ne_flag_usu_papel              IN  VARCHAR2
, p_ne_vetor_usu_papel             IN  VARCHAR2
, p_ne_flag_usu_indicado           IN  VARCHAR2
, p_ne_vetor_usu_indicado          IN  VARCHAR2
, p_ne_flag_job_criador            IN  VARCHAR2
, p_ne_flag_job_respint            IN  VARCHAR2
, p_ne_flag_ca_produtor            IN  VARCHAR2
, p_ne_flag_os_solicit             IN  VARCHAR2
, p_ne_flag_os_distr               IN  VARCHAR2
, p_ne_flag_os_exec                IN  VARCHAR2
, p_ne_flag_os_aprov               IN  VARCHAR2
, p_ne_flag_ctr_criador            IN  VARCHAR2
, p_ne_flag_ctr_respint            IN  VARCHAR2
, p_ne_flag_ad_criador             IN  VARCHAR2
, p_ne_flag_ad_solicit             IN  VARCHAR2
, p_ne_flag_ad_aprov               IN  VARCHAR2
, p_ne_flag_est_criador            IN  VARCHAR2
, p_ne_flag_est_aprov              IN  VARCHAR2
, p_ne_flag_doc_criador            IN  VARCHAR2
, p_ne_flag_doc_aprov              IN  VARCHAR2
, p_ne_flag_bri_aprov              IN  VARCHAR2
, p_ne_flag_pa_notif_ender         IN  VARCHAR2
, p_ne_flag_emails                 IN  VARCHAR2
, p_ne_emails                      IN  VARCHAR2
, p_notif_corpo                    IN  VARCHAR2
, p_email_assunto                  IN  VARCHAR2
, p_email_corpo                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            notifica_atraso_gerar;
--
PROCEDURE            notifica_processar;
--
PROCEDURE            notifica_especial_processar;
--
PROCEDURE            notifica_aprovador_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            notifica_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_notifica_fila_usu_id           IN  notifica_fila_usu.notifica_fila_usu_id%TYPE
, p_flag_lido                      IN  notifica_fila_usu.flag_lido%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            email_enviado_marcar
(
  p_notifica_fila_id               IN  notifica_fila_email.notifica_fila_id%TYPE
, p_notifica_fila_email_id         IN  notifica_fila_email.notifica_fila_email_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            motivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_evento_id                      IN  evento_motivo.evento_id%TYPE
, p_tipo_os_id                     IN  evento_motivo.tipo_os_id%TYPE
, p_nome                           IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_tipo_cliente_agencia           IN  evento_motivo.tipo_cliente_agencia%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            motivo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_nome                           IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_tipo_cliente_agencia           IN  evento_motivo.tipo_cliente_agencia%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            motivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             job_id_retornar (
  p_cod_objeto                     IN tipo_objeto.codigo%TYPE,
  p_objeto_id                      IN NUMBER)
RETURN   NUMBER;
--
FUNCTION             contrato_id_retornar (
  p_cod_objeto                     IN tipo_objeto.codigo%TYPE,
  p_objeto_id                      IN NUMBER)
RETURN   NUMBER;
--
END;  -- EVENTO_PKG


/
--------------------------------------------------------
--  DDL for Package FAIXA_APROV_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FAIXA_APROV_PKG" 
IS
--
PROCEDURE            ao_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_ori_id             IN  faixa_aprov.faixa_aprov_id%TYPE
, p_valor_de                       IN  VARCHAR2
, p_valor_ate                      IN  VARCHAR2
, p_cliente_id                     IN  faixa_aprov_ao.cliente_id%TYPE
, p_flag_itens_a                   IN  VARCHAR2
, p_flag_itens_bc                  IN  VARCHAR2
, p_fornec_homolog                 IN  VARCHAR2
, p_fornec_interno                 IN  VARCHAR2
, p_resultado_de                   IN  VARCHAR2
, p_resultado_ate                  IN  VARCHAR2
, p_faixa_aprov_id                 OUT faixa_aprov.faixa_aprov_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ao_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_valor_de                       IN  VARCHAR2
, p_valor_ate                      IN  VARCHAR2
, p_cliente_id                     IN  faixa_aprov_ao.cliente_id%TYPE
, p_flag_itens_a                   IN  VARCHAR2
, p_flag_itens_bc                  IN  VARCHAR2
, p_fornec_homolog                 IN  VARCHAR2
, p_fornec_interno                 IN  VARCHAR2
, p_resultado_de                   IN  VARCHAR2
, p_resultado_ate                  IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_ori_id             IN  faixa_aprov.faixa_aprov_id%TYPE
, p_cliente_id                     IN  faixa_aprov_os.cliente_id%TYPE
, p_tipo_job_id                    IN  faixa_aprov_os.tipo_job_id%TYPE
, p_complex_job                    IN  VARCHAR2
, p_flag_aprov_est                 IN  VARCHAR2
, p_flag_aprov_exe                 IN  VARCHAR2
, p_faixa_aprov_id                 OUT faixa_aprov.faixa_aprov_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_cliente_id                     IN  faixa_aprov_os.cliente_id%TYPE
, p_tipo_job_id                    IN  faixa_aprov_os.tipo_job_id%TYPE
, p_complex_job                    IN  VARCHAR2
, p_flag_aprov_est                 IN  VARCHAR2
, p_flag_aprov_exe                 IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            flag_ativo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_flag_ativo                     IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ec_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_id                 OUT faixa_aprov.faixa_aprov_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            papel_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            papel_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_seq_aprov                      IN  faixa_aprov_papel.seq_aprov%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            papel_geral_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_faixa                     IN  faixa_aprov.tipo_faixa%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            seq_aprov_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_flag_sequencial                IN  faixa_aprov.flag_sequencial%TYPE
, p_vetor_papel_id                 IN  VARCHAR2
, p_vetor_seq_aprov                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_faixa_aprov_id                 IN  faixa_aprov.faixa_aprov_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END faixa_aprov_pkg;

/
--------------------------------------------------------
--  DDL for Package FATURAMENTO_CTR_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FATURAMENTO_CTR_PKG" 
IS
--
PROCEDURE            comandar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_contrato_id                    IN  faturamento_ctr.contrato_id%TYPE
, p_vetor_parcela_contrato_id      IN  VARCHAR2
, p_vetor_valor_fatura             IN  VARCHAR2
, p_emp_faturar_por_id             IN  faturamento_ctr.emp_faturar_por_id%TYPE
, p_cod_natureza_oper              IN  faturamento_ctr.cod_natureza_oper%TYPE
, p_ordem_compra                   IN  faturamento.ordem_compra%TYPE
, p_cliente_id                     IN  faturamento_ctr.cliente_id%TYPE
, p_contato_cli_id                 IN  faturamento_ctr.contato_cli_id%TYPE
, p_data_vencim                    IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_obs                            IN  VARCHAR2
, p_flag_patrocinio                IN  VARCHAR2
, p_flag_outras_receitas           IN  VARCHAR2
, p_tipo_receita                   IN  VARCHAR2
, p_municipio_servico              IN  nota_fiscal.municipio_servico%TYPE
, p_uf_servico                     IN  nota_fiscal.uf_servico%TYPE
, p_flag_pula_integr               IN  VARCHAR2
, p_faturamento_ctr_id             OUT faturamento_ctr.faturamento_ctr_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_faturamento_ctr_id             IN  faturamento_ctr.faturamento_ctr_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_faturamento_ctr_id             IN  faturamento_ctr.faturamento_ctr_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             valor_fatura_retornar (
  p_faturamento_ctr_id             IN  faturamento_ctr.faturamento_ctr_id%TYPE)
RETURN NUMBER;
--
FUNCTION             parcelas_retornar (
  p_faturamento_ctr_id            IN  faturamento_ctr.faturamento_ctr_id%TYPE)
RETURN VARCHAR2;
--
END;  -- FATURAMENTO_CTR_PKG

/
--------------------------------------------------------
--  DDL for Package FATURAMENTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FATURAMENTO_PKG" 
IS
--
PROCEDURE            comandar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  faturamento.job_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_carta_acordo_id          IN  VARCHAR2
, p_vetor_nota_fiscal_id           IN  VARCHAR2
, p_vetor_valor_fatura             IN  VARCHAR2
, p_emp_faturar_por_id             IN  faturamento.emp_faturar_por_id%TYPE
, p_cod_natureza_oper              IN  faturamento.cod_natureza_oper%TYPE
, p_ordem_compra                   IN  faturamento.ordem_compra%TYPE
, p_cliente_id                     IN  faturamento.cliente_id%TYPE
, p_contato_cli_id                 IN  faturamento.contato_cli_id%TYPE
, p_produto_cliente_id             IN  faturamento.produto_cliente_id%TYPE
, p_data_vencim                    IN  VARCHAR2
, p_num_parcela                    IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_obs                            IN  VARCHAR2
, p_flag_patrocinio                IN  VARCHAR2
, p_flag_outras_receitas           IN  VARCHAR2
, p_tipo_receita                   IN  VARCHAR2
, p_municipio_servico              IN  nota_fiscal.municipio_servico%TYPE
, p_uf_servico                     IN  nota_fiscal.uf_servico%TYPE
, p_faturamento_id                 OUT faturamento.faturamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            bv_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_flag_comandar                  IN  VARCHAR2
, p_faturamento_id                 OUT faturamento.faturamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            bv_comandar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_emp_faturar_por_id             IN  faturamento.emp_faturar_por_id%TYPE
, p_cod_natureza_oper              IN  faturamento.cod_natureza_oper%TYPE
, p_produto_cliente_id             IN  faturamento.produto_cliente_id%TYPE
, p_data_vencim                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_emp_faturar_por_id             IN  faturamento.emp_faturar_por_id%TYPE
, p_cliente_id                     IN  faturamento.cliente_id%TYPE
, p_contato_cli_id                 IN  faturamento.contato_cli_id%TYPE
, p_produto_cliente_id             IN  faturamento.produto_cliente_id%TYPE
, p_data_vencim                    IN  VARCHAR2
, p_descricao                      IN  faturamento.descricao%TYPE
, p_obs                            IN  faturamento.obs%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            receita_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  VARCHAR2
, p_flag_patrocinio                IN  VARCHAR2
, p_flag_outras_receitas           IN  VARCHAR2
, p_tipo_receita                   IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             valor_fatura_retornar (
  p_faturamento_id                 IN  faturamento.faturamento_id%TYPE)
RETURN NUMBER;
--
FUNCTION             valor_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_na_nf_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE,
  p_nota_fiscal_id                IN nota_fiscal.nota_fiscal_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_orcam_retornar (
  p_orcamento_id                  IN orcamento.orcamento_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             data_fechamento_retornar (
  p_orcamento_id                  IN orcamento.orcamento_id%TYPE)
RETURN DATE;
--
FUNCTION             itens_retornar (
  p_faturamento_id                 IN  faturamento.faturamento_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             nf_fornec_id_retornar (
  p_faturamento_id                 IN  faturamento.faturamento_id%TYPE)
RETURN INTEGER;
--
END;  -- FATURAMENTO_PKG


/
--------------------------------------------------------
--  DDL for Package FERIADO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FERIADO_PKG" 
IS
--
PROCEDURE            tab_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  tab_feriado.nome%TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_tab_feriado_base_id            IN  tab_feriado.tab_feriado_id%TYPE
, p_data_base                      IN  VARCHAR2
, p_tab_feriado_id                 OUT tab_feriado.tab_feriado_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tab_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tab_feriado_id                 IN  tab_feriado.tab_feriado_id%TYPE
, p_nome                           IN  tab_feriado.nome%TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tab_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tab_feriado_id                 IN  tab_feriado.tab_feriado_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tab_feriado_id                 IN  feriado.tab_feriado_id%TYPE
, p_data                           IN  VARCHAR2
, p_nome                           IN  feriado.nome%TYPE
, p_tipo                           IN  feriado.tipo%TYPE
, p_feriado_id                     OUT feriado.feriado_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_feriado_id                     IN  feriado.feriado_id%TYPE
, p_data                           IN  VARCHAR2
, p_nome                           IN  feriado.nome%TYPE
, p_tipo                           IN  feriado.tipo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            replicar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tab_feriado_id                 IN  tab_feriado.tab_feriado_id%TYPE
, p_ano_origem                     IN  VARCHAR2
, p_ano_destino                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_feriado_id                     IN  feriado.feriado_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             prox_dia_util_retornar (
  p_usuario_id                     IN usuario.usuario_id%TYPE,
  p_data                           IN DATE,
  p_dias_uteis                     IN INTEGER,
  p_feriado_interno                IN VARCHAR2)
RETURN   DATE;
--
FUNCTION             dif_horas_uteis_retornar (

  p_usuario_id                     IN usuario.usuario_id%TYPE,
  p_empresa_id                     IN empresa.empresa_id%TYPE,
  p_data_inicio                    IN DATE,
  p_data_fim                       IN DATE,
  p_flag_considera_progr           IN VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             dia_util_verificar (
  p_usuario_id                     IN usuario.usuario_id%TYPE,
  p_data                           IN DATE,
  p_feriado_interno                IN VARCHAR2)
RETURN   INTEGER;
--
--
FUNCTION             qtd_dias_uteis_retornar (
  p_usuario_id                     IN usuario.usuario_id%TYPE,
  p_data_ini                       IN DATE,
  p_data_fim                       IN DATE)
RETURN   INTEGER;
--
--
FUNCTION             prazo_em_horas_retornar (
  p_usuario_id                     IN usuario.usuario_id%TYPE,
  p_empresa_id                     IN empresa.empresa_id%TYPE,
  p_data                           IN DATE,
  p_param_num_horas                IN VARCHAR2,
  p_num_horas                      NUMBER)
RETURN   DATE;
--
--
PROCEDURE            xml_gerar
(
  p_tab_feriado_id                 IN  tab_feriado.tab_feriado_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
END;  -- FERIADO_PKG


/
--------------------------------------------------------
--  DDL for Package FI_BANCO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FI_BANCO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  fi_banco.codigo%TYPE
, p_nome                           IN  fi_banco.nome%TYPE
, p_fi_banco_id                    OUT fi_banco.fi_banco_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_fi_banco_id                    IN  fi_banco.fi_banco_id%TYPE
, p_codigo                         IN  fi_banco.codigo%TYPE
, p_nome                           IN  fi_banco.nome%TYPE
, p_flag_ativo                     In  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_fi_banco_id                    IN  fi_banco.fi_banco_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_fi_banco_id                    IN  fi_banco.fi_banco_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- FI_BANCO_PKG

/
--------------------------------------------------------
--  DDL for Package FLEX_PAPER_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FLEX_PAPER_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_id                             IN  mark.id%TYPE
, p_ordem_servico_id               IN  mark.ordem_servico_id%TYPE
, p_arquivo_id                     IN  mark.arquivo_id%TYPE
, p_status_os                      IN  mark.status_os%TYPE
, p_refacao                        IN  mark.refacao%TYPE
, p_document_filename              IN  mark.document_filename%TYPE
, p_document_relative_path         IN  mark.document_relative_path%TYPE
, p_selection_text                 IN  mark.selection_text%TYPE
, p_has_selection                  IN  mark.has_selection%TYPE
, p_color                          IN  mark.color%TYPE
, p_selection_info                 IN  mark.selection_info%TYPE
, p_readonly                       IN  mark.readonly%TYPE
, p_type                           IN  mark.type%TYPE
, p_displayformat                  IN  mark.displayformat%TYPE
, p_note                           IN  mark.note%TYPE
, p_pageindex                      IN  mark.pageindex%TYPE
, p_positionx                      IN  mark.positionx%TYPE
, p_positiony                      IN  mark.positiony%TYPE
, p_width                          IN  mark.width%TYPE
, p_height                         IN  mark.height%TYPE
, p_collapsed                      IN  mark.collapsed%TYPE
, p_points                         IN  mark.points%TYPE
, p_author                         IN  mark.author%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_id                             IN  mark.id%TYPE
, p_status_os                      IN  mark.status_os%TYPE
, p_selection_text                 IN  mark.selection_text%TYPE
, p_has_selection                  IN  mark.has_selection%TYPE
, p_color                          IN  mark.color%TYPE
, p_selection_info                 IN  mark.selection_info%TYPE
, p_readonly                       IN  mark.readonly%TYPE
, p_note                           IN  mark.note%TYPE
, p_pageindex                      IN  mark.pageindex%TYPE
, p_positionx                      IN  mark.positionx%TYPE
, p_positiony                      IN  mark.positiony%TYPE
, p_width                          IN  mark.width%TYPE
, p_height                         IN  mark.height%TYPE
, p_collapsed                      IN  mark.collapsed%TYPE
, p_points                         IN  mark.points%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_id                             IN  mark.id%TYPE
, p_author                         IN  mark.author%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- FLEX_PAPER_PKG


/
--------------------------------------------------------
--  DDL for Package GRUPO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "GRUPO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  grupo.nome%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo_id                       IN  grupo.grupo_id%TYPE
, p_nome                           IN  grupo.nome%TYPE
, p_flag_agrupa_cnpj               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo_id                       IN  grupo.grupo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo_id                       IN  grupo.grupo_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo_id                       IN  grupo.grupo_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_grupo_id                       IN  grupo.grupo_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             tem_regra_ender_verificar (
 p_grupo_id                        IN  grupo.grupo_id%TYPE)
RETURN   INTEGER;
--
END;  -- GRUPO_PKG


/
--------------------------------------------------------
--  DDL for Package HISTORICO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "HISTORICO_PKG" 
IS
--
--
PROCEDURE            hist_ender_registrar
(
  p_usuario_id                     IN  NUMBER
, p_tipo_objeto                    IN  VARCHAR2
, p_objeto_id                      IN  NUMBER
, p_atuacao                        IN  hist_ender.atuacao%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
END;  -- HISTORICO_PKG


/
--------------------------------------------------------
--  DDL for Package IMPOSTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IMPOSTO_PKG" 
IS
--
FUNCTION             valor_bruto_acum_retornar
(
 p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN NUMBER;
--
FUNCTION             imposto_retido_retornar
(
 p_fi_tipo_imposto_id             IN  fi_tipo_imposto.fi_tipo_imposto_id%TYPE,
 p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN NUMBER;
--
--
END; -- IMPOSTO_PKG


/
--------------------------------------------------------
--  DDL for Package IT_ADNNET_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_ADNNET_PKG" 
IS
--
PROCEDURE            job_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            contrato_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            orcamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_entrada_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            faturamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
PROCEDURE            faturamento_ctr_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_ctr_id             IN  faturamento_ctr.faturamento_ctr_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ordem_fatura_processar
(
  p_cod_acao                       IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adnnet_executar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             data_adn_converter
( p_data                           IN VARCHAR2)
RETURN  DATE;
--
FUNCTION             data_adn_validar
( p_data                           IN VARCHAR2)
RETURN  INTEGER;
--
FUNCTION             numero_adn_converter
( p_numero                         IN VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             numero_adn_validar
( p_numero                         IN VARCHAR2)
RETURN    INTEGER;
--
END; -- IT_ADNNET_PKG

/
--------------------------------------------------------
--  DDL for Package IT_APOLO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_APOLO_PKG" 
IS
--
PROCEDURE            xml_env_cabec_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_emp_resp_id                    IN  job.emp_resp_id%TYPE
, p_processo                       IN  VARCHAR2
, p_xml_cabecalho                  OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_ret_cabec_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_processo                       IN  VARCHAR2
, p_xml_cabecalho                  OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_ret_msg_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_retorno                    IN  VARCHAR2
, p_processo                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_mensagem                       IN  VARCHAR2
, p_xml_resposta                   OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_retorno_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_retorno                    IN  VARCHAR2
, p_processo                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_mensagem                       IN  VARCHAR2
, p_xml_retorno                    OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_processar
(
  p_cod_agencia                    IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_operacao                       IN  VARCHAR2
, p_tipo_pessoa                    IN  VARCHAR2
, p_cod_ext_pessoa                 IN  VARCHAR2
, p_apelido                        IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_flag_pessoa_jur                IN  VARCHAR2
, p_flag_pessoa_ex                 IN  VARCHAR2
, p_cnpj                           IN  VARCHAR2
, p_inscr_estadual                 IN  VARCHAR2
, p_inscr_municipal                IN  VARCHAR2
, p_inscr_inss                     IN  VARCHAR2
, p_cpf                            IN  VARCHAR2
, p_rg                             IN  VARCHAR2
, p_rg_org_exp                     IN  VARCHAR2
, p_rg_data_exp                    IN  VARCHAR2
, p_rg_uf                          IN  VARCHAR2
, p_sexo                           IN  VARCHAR2
, p_data_nasc                      IN  VARCHAR2
, p_endereco                       IN  VARCHAR2
, p_num_ender                      IN  VARCHAR2
, p_compl_ender                    IN  VARCHAR2
, p_zona                           IN  VARCHAR2
, p_bairro                         IN  VARCHAR2
, p_cep                            IN  VARCHAR2
, p_cidade                         IN  VARCHAR2
, p_uf                             IN  VARCHAR2
, p_pais                           IN  VARCHAR2
, p_ddd_telefone                   IN  VARCHAR2
, p_num_telefone                   IN  VARCHAR2
, p_num_ramal                      IN  VARCHAR2
, p_ddd_fax                        IN  VARCHAR2
, p_num_fax                        IN  VARCHAR2
, p_ddd_celular                    IN  VARCHAR2
, p_num_celular                    IN  VARCHAR2
, p_website                        IN  VARCHAR2
, p_email                          IN  VARCHAR2
, p_tipo_conta                     IN  VARCHAR2
, p_cod_banco                      IN  VARCHAR2
, p_num_agencia                    IN  VARCHAR2
, p_num_conta                      IN  VARCHAR2
, p_nome_titular                   IN  VARCHAR2
, p_cnpj_cpf_titular               IN  VARCHAR2
, p_pessoa_id                      OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_processar
(
  p_cod_agencia                    IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_saida_processar
(
  p_cod_agencia                    IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            carta_acordo_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            faturamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apolo_executar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT CLOB
);
--
FUNCTION             data_apolo_mostrar
( p_data                           IN DATE)
RETURN  VARCHAR2;
--
FUNCTION             data_apolo_converter
( p_data                           IN VARCHAR2)
RETURN  DATE;
--
FUNCTION             data_apolo_validar
( p_data                           IN VARCHAR2)
RETURN  INTEGER;
--
FUNCTION             numero_apolo_converter
( p_numero                         IN VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             numero_apolo_validar
( p_numero                         IN VARCHAR2)
RETURN    INTEGER;
--
FUNCTION             numero_apolo_mostrar
(
     p_numero                     IN NUMBER,
     p_casas_dec                  IN INTEGER,
     p_flag_milhar                IN VARCHAR2
)
RETURN  VARCHAR2;
--
END; -- it_apolo_pkg


/
--------------------------------------------------------
--  DDL for Package IT_CIGAM_ANT_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_CIGAM_ANT_PKG" 
IS
--
PROCEDURE            xml_env_cabec_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_processo                       IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_xml_cabecalho                  OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_ret_cabec_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_servico                        IN  VARCHAR2
, p_operacao                       IN  VARCHAR2
, p_transacao                      IN  VARCHAR2
, p_xml_cabecalho                  OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_ret_msg_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_retorno                    IN  VARCHAR2
, p_mensagem                       IN  VARCHAR2
, p_xml_resposta                   OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_retorno_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_servico                        IN  VARCHAR2
, p_operacao                       IN  VARCHAR2
, p_transacao                      IN  VARCHAR2
, p_cod_retorno                    IN  VARCHAR2
, p_mensagem                       IN  VARCHAR2
, p_xml_retorno                    OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_saida_processar
(
  p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            job_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            orcamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            faturamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_entrada_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cigam_executar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT CLOB
);
--
FUNCTION             data_cigam_mostrar
( p_data                           IN DATE)
RETURN  VARCHAR2;
--
FUNCTION             data_cigam_converter
( p_data                           IN VARCHAR2)
RETURN  DATE;
--
FUNCTION             data_cigam_validar
( p_data                           IN VARCHAR2)
RETURN  INTEGER;
--
FUNCTION             numero_cigam_converter
( p_numero                         IN VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             numero_cigam_validar
( p_numero                         IN VARCHAR2)
RETURN    INTEGER;
--
FUNCTION             numero_cigam_mostrar
(
     p_numero                     IN NUMBER,
     p_casas_dec                  IN INTEGER,
     p_flag_milhar                IN VARCHAR2
)
RETURN  VARCHAR2;
--
FUNCTION             uuid_retornar 
RETURN VARCHAR2;
--
END; -- it_cigam_pkg


/
--------------------------------------------------------
--  DDL for Package IT_CIGAM_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_CIGAM_PKG" 
IS
--
PROCEDURE            xml_env_cabec_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_processo                       IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_xml_cabecalho                  OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_ret_cabec_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_servico                        IN  VARCHAR2
, p_operacao                       IN  VARCHAR2
, p_transacao                      IN  VARCHAR2
, p_xml_cabecalho                  OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_ret_msg_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_retorno                    IN  VARCHAR2
, p_mensagem                       IN  VARCHAR2
, p_xml_resposta                   OUT XMLTYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_retorno_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_servico                        IN  VARCHAR2
, p_operacao                       IN  VARCHAR2
, p_transacao                      IN  VARCHAR2
, p_cod_retorno                    IN  VARCHAR2
, p_mensagem                       IN  VARCHAR2
, p_xml_retorno                    OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_saida_processar
(
  p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            job_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            orcamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            faturamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_entrada_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cigam_executar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT CLOB
);
--
FUNCTION             data_cigam_mostrar
( p_data                           IN DATE)
RETURN  VARCHAR2;
--
FUNCTION             data_cigam_converter
( p_data                           IN VARCHAR2)
RETURN  DATE;
--
FUNCTION             data_cigam_validar
( p_data                           IN VARCHAR2)
RETURN  INTEGER;
--
FUNCTION             numero_cigam_converter
( p_numero                         IN VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             numero_cigam_validar
( p_numero                         IN VARCHAR2)
RETURN    INTEGER;
--
FUNCTION             numero_cigam_mostrar
(
     p_numero                     IN NUMBER,
     p_casas_dec                  IN INTEGER,
     p_flag_milhar                IN VARCHAR2
)
RETURN  VARCHAR2;
--
FUNCTION             uuid_retornar 
RETURN VARCHAR2;
--
END; -- it_cigam_pkg


/
--------------------------------------------------------
--  DDL for Package IT_CONTROLE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_CONTROLE_PKG" 
IS
--
PROCEDURE            integrar
(
  p_ponto_integracao               IN  ponto_integracao.codigo%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_objeto_id                      IN  NUMBER
, p_parametros                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END; -- IT_CONTROLE_PKG


/
--------------------------------------------------------
--  DDL for Package ITEM_DECUP_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ITEM_DECUP_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_id                        IN  item_decup.item_id%TYPE
, p_fornecedor_id                  IN  item_decup.fornecedor_id%TYPE
, p_custo_fornec                   IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_item_decup_id                  OUT item_decup.item_decup_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_decup_id                  IN  item_decup.item_decup_id%TYPE
, p_fornecedor_id                  IN  item_decup.fornecedor_id%TYPE
, p_custo_fornec                   IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_decup_id                  IN  item_decup.item_decup_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            mover
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_decup_id                  IN  item_decup.item_decup_id%TYPE
, p_direcao                        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- ITEM_DECUP_PKG


/
--------------------------------------------------------
--  DDL for Package ITEM_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ITEM_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  item.orcamento_id%TYPE
, p_tipo_produto_id                IN  item.tipo_produto_id%TYPE
, p_fornecedor_id                  IN  item.fornecedor_id%TYPE
, p_grupo                          IN  VARCHAR2
, p_subgrupo                       IN  VARCHAR2
, p_complemento                    IN  item.complemento%TYPE
, p_tipo_item                      IN  item.tipo_item%TYPE
, p_flag_sem_valor                 IN  item.flag_sem_valor%TYPE
, p_flag_com_honor                 IN  item.flag_com_honor%TYPE
, p_flag_com_encargo               IN  item.flag_com_encargo%TYPE
, p_flag_com_encargo_honor         IN  item.flag_com_encargo_honor%TYPE
, p_flag_pago_cliente              IN  item.flag_pago_cliente%TYPE
, p_quantidade                     IN  VARCHAR2
, p_frequencia                     IN  VARCHAR2
, p_unidade_freq                   IN  item.unidade_freq%TYPE
, p_custo_unitario                 IN  VARCHAR2
, p_valor_fornecedor               IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_tipo_fatur_bv                  IN  item.tipo_fatur_bv%TYPE
, p_obs                            IN  VARCHAR2
, p_item_id                        OUT item.item_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_id                        IN  item.item_id%TYPE
, p_tipo_produto_id                IN  item.tipo_produto_id%TYPE
, p_fornecedor_id                  IN  item.fornecedor_id%TYPE
, p_grupo                          IN  item.grupo%TYPE
, p_subgrupo                       IN  item.subgrupo%TYPE
, p_complemento                    IN  item.complemento%TYPE
, p_tipo_item                      IN  item.tipo_item%TYPE
, p_flag_sem_valor                 IN  item.flag_sem_valor%TYPE
, p_flag_com_honor                 IN  item.flag_com_honor%TYPE
, p_flag_com_encargo               IN  item.flag_com_encargo%TYPE
, p_flag_com_encargo_honor         IN  item.flag_com_encargo_honor%TYPE
, p_flag_pago_cliente              IN  item.flag_pago_cliente%TYPE
, p_quantidade                     IN  VARCHAR2
, p_frequencia                     IN  VARCHAR2
, p_unidade_freq                   IN  item.unidade_freq%TYPE
, p_custo_unitario                 IN  VARCHAR2
, p_valor_fornecedor               IN  VARCHAR2
, p_perc_bv                        IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_tipo_fatur_bv                  IN  item.tipo_fatur_bv%TYPE
, p_obs                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_id                        IN  item.item_id%TYPE
, p_complemento                    IN  item.complemento%TYPE
, p_tipo_produto_id                IN  item.tipo_produto_id%TYPE
, p_novo_tipo_produto              IN  tipo_produto.nome%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_id                        IN  item.item_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            valores_recalcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_item_id                        IN  item.item_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ordem_retornar
(
  p_usuario_sessao_id              IN  NUMBER
, p_job_id                         IN  item.job_id%TYPE
, p_orcamento_id                   IN  item.orcamento_id%TYPE
, p_item_id                        IN  item.item_id%TYPE
, p_tipo_item                      IN  item.tipo_item%TYPE
, p_grupo                          IN  item.grupo%TYPE
, p_subgrupo                       IN  item.subgrupo%TYPE
, p_flag_quebra_tipo               IN  VARCHAR2
, p_ordem_grupo                    OUT item.ordem_grupo%TYPE
, p_ordem_subgrupo                 OUT item.ordem_subgrupo%TYPE
, p_ordem_item                     OUT item.ordem_item%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            historico_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_item_id                        IN  item.item_id%TYPE
, p_codigo                         IN  item_hist.codigo%TYPE
, p_complemento                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_item_id                        IN  item.item_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             liberacao_especial_verificar (
  p_item_id                        IN  item.item_id%TYPE)
RETURN INTEGER;
--
FUNCTION             data_evento_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_codigo                        IN item_hist.codigo%TYPE)
RETURN DATE;
--
FUNCTION             valor_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_sobra_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_tipo_sobra                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_planejado_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_utilizado_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_reservado_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_liberado_b_retornar (
  p_item_id                       IN item.item_id%TYPE)
RETURN NUMBER;
--
FUNCTION             valor_disponivel_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_na_nf_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_carta_acordo_id               IN carta_acordo.carta_acordo_id%TYPE,
  p_nota_fiscal_id                IN nota_fiscal.nota_fiscal_id%TYPE)
RETURN NUMBER;
--
FUNCTION             valor_checkin_pend_retornar (
  p_item_id                        IN item.item_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             valor_realizado_retornar (
  p_item_id                       IN item.item_id%TYPE,
  p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             parcelado_verificar (
  p_item_id                        IN  item.item_id%TYPE)
RETURN INTEGER;
--
FUNCTION             qtd_carta_acordo_retornar (
  p_item_id                        IN  item.item_id%TYPE)
RETURN INTEGER;
--
FUNCTION             carta_acordo_ok_verificar (
  p_item_id                        IN  item.item_id%TYPE)
RETURN INTEGER;
--
FUNCTION             nome_item_retornar (
  p_item_id                        IN  item.item_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             num_item_retornar (
  p_item_id                        IN  item.item_id%TYPE,
  p_flag_com_job                   IN  VARCHAR2)
RETURN VARCHAR2;
--
END;  -- ITEM_PKG


/
--------------------------------------------------------
--  DDL for Package IT_PORTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_PORTO_PKG" 
IS
--
PROCEDURE            job_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ordem_servico_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            comentario_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_comentario_id                  IN  comentario.comentario_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            porto_executar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END; -- it_porto_pkg


/
--------------------------------------------------------
--  DDL for Package IT_PROTHEUS_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_PROTHEUS_PKG" 
IS
--
PROCEDURE            pessoa_replicar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_cli_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_for_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pv_orcam_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pv_contrato_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_contrato_servico_id            IN  contrato_servico.contrato_servico_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_entrada_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
PROCEDURE            faturamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_tipo_fat                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
PROCEDURE            nf_saida_processar
(
  p_cod_acao                       IN  VARCHAR2
, p_empresa_filial                 IN  VARCHAR2
, p_id_jobone_fatura               IN  VARCHAR2
, p_tipo_doc                       IN  VARCHAR2
, p_num_doc                        IN  VARCHAR2
, p_serie                          IN  VARCHAR2
, p_chave_acesso                   IN  VARCHAR2
, p_data_emissao                   IN  VARCHAR2
, p_desc_servico                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_operacao                       IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_cod_ext_produto                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_processar
(
  p_cod_acao                       IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_cod_ext_produto                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            protheus_executar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT CLOB
);
--
FUNCTION             uuid_retornar 
RETURN VARCHAR2;
--
FUNCTION             data_protheus_converter
( p_data                           IN VARCHAR2)
RETURN  DATE;
--
FUNCTION             data_protheus_validar
( p_data                           IN VARCHAR2)
RETURN  INTEGER;
--
FUNCTION             numero_protheus_converter
( p_numero                         IN VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             numero_protheus_validar
( p_numero                         IN VARCHAR2)
RETURN    INTEGER;
--
END; -- it_protheus_pkg


/
--------------------------------------------------------
--  DDL for Package IT_SAP_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "IT_SAP_PKG" 
IS
--
PROCEDURE            pessoa_processar
(
  p_cod_acao                       IN  VARCHAR2
, p_tipo_pessoa                    IN  VARCHAR2
, p_cod_emp_sap                    IN  VARCHAR2
, p_cod_filial_sap                 IN  VARCHAR2
, p_cod_cli_sap                    IN  VARCHAR2
, p_apelido                        IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_cod_projeto                    IN  VARCHAR2
, p_tipo_fis_jur                   IN  VARCHAR2
, p_cnpj                           IN  VARCHAR2
, p_cpf                            IN  VARCHAR2
, p_pais                           IN  VARCHAR2
, p_uf                             IN  VARCHAR2
, p_cidade                         IN  VARCHAR2
, p_bairro                         IN  VARCHAR2
, p_cep                            IN  VARCHAR2
, p_endereco                       IN  VARCHAR2
, p_complemento                    IN  VARCHAR2
, p_telefone                       IN  VARCHAR2
, p_fax                            IN  VARCHAR2
, p_email                          IN  VARCHAR2
, p_ativo                          IN  VARCHAR2
, p_pessoa_id                      OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_emp_resp_pdr_id                IN  pessoa.emp_resp_pdr_id%TYPE
, p_operacao                       IN  VARCHAR2
, p_tipo_pessoa                    IN  VARCHAR2
, p_cod_ext_pessoa                 IN  VARCHAR2
, p_cod_job                        IN  VARCHAR2
, p_pessoa_fis_jur                 IN  VARCHAR2
, p_apelido                        IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_cnpj                           IN  VARCHAR2
, p_cpf                            IN  VARCHAR2
, p_endereco                       IN  VARCHAR2
, p_num_ender                      IN  VARCHAR2
, p_compl_ender                    IN  VARCHAR2
, p_bairro                         IN  VARCHAR2
, p_cep                            IN  VARCHAR2
, p_cidade                         IN  VARCHAR2
, p_uf                             IN  VARCHAR2
, p_pais                           IN  VARCHAR2
, p_telefone                       IN  VARCHAR2
, p_fax                            IN  VARCHAR2
, p_email                          IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_pessoa_id                      OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            produto_cliente_processar
(
  p_cod_acao                       IN  VARCHAR2
, p_cod_emp_sap                    IN  VARCHAR2
, p_cod_cli_sap                    IN  VARCHAR2
, p_cod_pro_sap                    IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_ativo                          IN  VARCHAR2
, p_produto_cliente_id             OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            produto_cliente_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_operacao                       IN  VARCHAR2
, p_cod_ext_cliente                IN  VARCHAR2
, p_cod_ext_produto                IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_produto_cliente_id             OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_processar
(
  p_cod_acao                       IN  VARCHAR2
, p_cod_emp_sap                    IN  VARCHAR2
, p_cod_material_sap               IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_categoria                      IN  VARCHAR2
, p_ativo                          IN  VARCHAR2
, p_tipo_produto_id                OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_operacao                       IN  VARCHAR2
, p_cod_ext_produto                IN  VARCHAR2
, p_nome                           IN  VARCHAR2
, p_categoria                      IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_tipo_produto_id                OUT NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ordem_servico_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            job_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            carta_acordo_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            carta_acordo_processar
(
  p_cod_emp_sap                    IN  VARCHAR2
, p_carta_acordo_id                IN  VARCHAR2
, p_cod_ext_carta                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            faturamento_integrar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_cod_acao                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            sap_executar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_objeto                     IN  VARCHAR2
, p_cod_acao                       IN  VARCHAR2
, p_objeto_id                      IN  VARCHAR2
, p_xml_in                         IN  CLOB
, p_xml_out                        OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END; -- it_sap_pkg


/
--------------------------------------------------------
--  DDL for Package JOB_HORAS_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JOB_HORAS_PKG" 
IS
--
PROCEDURE            horas_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job_horas.job_id%TYPE
, p_tipo_formulario                IN  VARCHAR2
, p_usuario_id                     IN  job_horas.usuario_id%TYPE
, p_cargo_id                       IN  job_horas.cargo_id%TYPE
, p_nivel                          IN  job_horas.nivel%TYPE
, p_horas_planej                   IN  VARCHAR2
, p_venda_hora_rev                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_horas_id                   IN  job_horas.job_horas_id%TYPE
, p_horas_planej                   IN  VARCHAR2
, p_venda_fator_ajuste             IN  VARCHAR2
, p_venda_hora_rev                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_ajustar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_venda_fator_ajuste             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_horas_id                   IN  job_horas.job_horas_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            retomar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_motivo_reprov                  IN  VARCHAR2
, p_compl_reprov                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            revisar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_motivo_rev                     IN  VARCHAR2
, p_compl_rev                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
END;  -- JOB_HORAS_PKG


/
--------------------------------------------------------
--  DDL for Package JOB_PECA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JOB_PECA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job_peca.job_id%TYPE
, p_tipo_peca_id                   IN  job_peca.tipo_peca_id%TYPE
, p_complemento                    IN  job_peca.complemento%TYPE
, p_especificacao                  IN  VARCHAR2
, p_obs                            IN  VARCHAR2
, p_tipo_solicitacao               IN  VARCHAR2
, p_data_prazo                     IN  VARCHAR2
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_peca_id                    IN  job_peca.job_peca_id%TYPE
, p_tipo_peca_id                   IN  job_peca.tipo_peca_id%TYPE
, p_complemento                    IN  job_peca.complemento%TYPE
, p_especificacao                  IN  VARCHAR2
, p_obs                            IN  VARCHAR2
, p_tipo_solicitacao               IN  VARCHAR2
, p_data_prazo                     IN  VARCHAR2
, p_ref_arquivo_id                 IN  arquivo.arquivo_id%TYPE
, p_ref_volume_id                  IN  arquivo.volume_id%TYPE
, p_ref_nome_original              IN  arquivo.nome_original%TYPE
, p_ref_nome_fisico                IN  arquivo.nome_fisico%TYPE
, p_ref_mime_type                  IN  arquivo.mime_type%TYPE
, p_ref_tamanho                    IN  arquivo.tamanho%TYPE
, p_cri_arquivo_id                 IN  arquivo.arquivo_id%TYPE
, p_cri_volume_id                  IN  arquivo.volume_id%TYPE
, p_cri_nome_original              IN  arquivo.nome_original%TYPE
, p_cri_nome_fisico                IN  arquivo.nome_fisico%TYPE
, p_cri_mime_type                  IN  arquivo.mime_type%TYPE
, p_cri_tamanho                    IN  arquivo.tamanho%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            documento_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_peca_id                    IN  job_peca.job_peca_id%TYPE
, p_documento_id                   IN  documento.documento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_peca_id                    IN  job_peca.job_peca_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cancelar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_peca_id                    IN  job_peca.job_peca_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            concluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_peca_id                    IN  job_peca.job_peca_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION       ult_peca_retornar (
  p_job_id                         IN  job.job_id%TYPE
, p_tipo_peca_id                   IN  job_peca.tipo_peca_id%TYPE
, p_complemento                    IN  job_peca.complemento%TYPE)
RETURN   INTEGER;
--
FUNCTION       ult_doc_retornar (
  p_job_id                         IN  job.job_id%TYPE
, p_tipo_peca_id                   IN  job_peca.tipo_peca_id%TYPE
, p_complemento                    IN  job_peca.complemento%TYPE
, p_tipo_doc                       IN  tipo_documento.codigo%TYPE)
RETURN   INTEGER;
--
END;  -- JOB_PECA_PKG


/
--------------------------------------------------------
--  DDL for Package JOB_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "JOB_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_cliente_id                     IN  job.cliente_id%TYPE
, p_emp_resp_id                    IN  job.emp_resp_id%TYPE
, p_tipo_job_id                    IN  job.tipo_job_id%TYPE
, p_tipo_financeiro_id             IN  job.tipo_financeiro_id%TYPE
, p_contrato_id                    IN  job.contrato_id%TYPE
, p_campanha_id                    IN  job.campanha_id%TYPE
, p_numero_job                     IN  VARCHAR2
, p_cod_ext_job                    IN  VARCHAR2
, p_nome                           IN  job.nome%TYPE
, p_descricao                      IN  LONG
, p_complex_job                    IN  VARCHAR2
, p_job_id                         OUT job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            consistir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_numero_job                     IN  VARCHAR2
, p_cod_ext_job                    IN  VARCHAR2
, p_nome                           IN  job.nome%TYPE
, p_cliente_id                     IN  job.cliente_id%TYPE
, p_emp_resp_id                    IN  job.emp_resp_id%TYPE
, p_contato_id                     IN  job.contato_id%TYPE
, p_unidade_negocio_id             IN  job.unidade_negocio_id%TYPE
, p_produto_cliente_id             IN  job.produto_cliente_id%TYPE
, p_tipo_job_id                    IN  job.tipo_job_id%TYPE
, p_servico_id                     IN  job.servico_id%TYPE
, p_tipo_financeiro_id             IN  job.tipo_financeiro_id%TYPE
, p_contrato_id                    IN  job.contrato_id%TYPE
, p_campanha_id                    IN  job.campanha_id%TYPE
, p_data_prev_ini                  IN  VARCHAR2
, p_data_prev_fim                  IN  VARCHAR2
, p_tipo_data_prev                 IN  job.tipo_data_prev%TYPE
, p_flag_obriga_desc_horas         IN  VARCHAR2
, p_data_pri_aprov                 IN  VARCHAR2
, p_data_golive                    IN  VARCHAR2
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_data_crono_base                IN  VARCHAR2
, p_budget                         IN  VARCHAR2
, p_flag_budget_nd                 IN  VARCHAR2
, p_receita_prevista               IN  VARCHAR2
, p_flag_concorrencia              IN  VARCHAR2
, p_descricao                      IN  LONG
, p_complex_job                    IN  VARCHAR2
, p_nome_contexto                  IN  VARCHAR2
, p_flag_restringe_alt_crono       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_wizard
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_numero_job                     IN  VARCHAR2
, p_cod_ext_job                    IN  VARCHAR2
, p_nome                           IN  job.nome%TYPE
, p_cliente_id                     IN  job.cliente_id%TYPE
, p_emp_resp_id                    IN  job.emp_resp_id%TYPE
, p_contato_id                     IN  job.contato_id%TYPE
, p_unidade_negocio_id             IN  job.unidade_negocio_id%TYPE
, p_produto_cliente_id             IN  job.produto_cliente_id%TYPE
, p_tipo_job_id                    IN  job.tipo_job_id%TYPE
, p_servico_id                     IN  job.servico_id%TYPE
, p_tipo_financeiro_id             IN  job.tipo_financeiro_id%TYPE
, p_contrato_id                    IN  job.contrato_id%TYPE
, p_campanha_id                    IN  job.campanha_id%TYPE
, p_data_prev_ini                  IN  VARCHAR2
, p_data_prev_fim                  IN  VARCHAR2
, p_tipo_data_prev                 IN  job.tipo_data_prev%TYPE
, p_flag_obriga_desc_horas         IN  VARCHAR2
, p_data_pri_aprov                 IN  VARCHAR2
, p_data_golive                    IN  VARCHAR2
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_data_crono_base                IN  VARCHAR2
, p_budget                         IN  VARCHAR2
, p_flag_budget_nd                 IN  VARCHAR2
, p_receita_prevista               IN  VARCHAR2
, p_flag_concorrencia              IN  VARCHAR2
, p_descricao                      IN  LONG
, p_complex_job                    IN  VARCHAR2
, p_requisicao_cliente             IN  briefing.requisicao_cliente%TYPE
, p_vetor_area_id                  IN  VARCHAR2
, p_vetor_atributo_id              IN  VARCHAR2
, p_vetor_atributo_valor           IN  CLOB
, p_vetor_dicion_emp_id            IN  VARCHAR2
, p_vetor_dicion_emp_val_id        IN  VARCHAR2
, p_nome_contexto                  IN  VARCHAR2
, p_flag_restringe_alt_crono       IN  VARCHAR2
, p_job_id                         OUT job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_do_cliente
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_cliente_id                     IN  job.cliente_id%TYPE
, p_nome                           IN  job.nome%TYPE
, p_produto_cliente_id             IN  job.produto_cliente_id%TYPE
, p_nome_produto_cliente           IN  VARCHAR2
, p_descricao_cliente              IN  CLOB
, p_contrato_id                    IN  job.contrato_id%TYPE
, p_budget                         IN  VARCHAR2
, p_flag_budget_nd                 IN  VARCHAR2
, p_job_id                         OUT job.job_id%TYPE
, p_briefing_id                    OUT briefing.briefing_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_principal
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_emp_resp_id                    IN  job.emp_resp_id%TYPE
, p_tipo_job_id                    IN  job.tipo_job_id%TYPE
, p_servico_id                     IN  job.servico_id%TYPE
, p_tipo_financeiro_id             IN  job.tipo_financeiro_id%TYPE
, p_contrato_id                    IN  job.contrato_id%TYPE
, p_campanha_id                    IN  job.campanha_id%TYPE
, p_nome                           IN  job.nome%TYPE
, p_cod_ext_job                    IN  VARCHAR2
, p_cliente_id                     IN  job.cliente_id%TYPE
, p_contato_id                     IN  job.contato_id%TYPE
, p_unidade_negocio_id             IN  job.unidade_negocio_id%TYPE
, p_produto_cliente_id             IN  job.produto_cliente_id%TYPE
, p_descricao                      IN  LONG
, p_complex_job                    IN  VARCHAR2
, p_budget                         IN  VARCHAR2
, p_flag_budget_nd                 IN  VARCHAR2
, p_receita_prevista               IN  VARCHAR2
, p_data_prev_ini                  IN  VARCHAR2
, p_data_prev_fim                  IN  VARCHAR2
, p_tipo_data_prev                 IN  job.tipo_data_prev%TYPE
, p_data_pri_aprov                 IN  VARCHAR2
, p_data_golive                    IN  VARCHAR2
, p_flag_alt_data_estim            IN  VARCHAR2
, p_nome_contexto                  IN  VARCHAR2
, p_flag_restringe_alt_crono       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_concorrencia
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_flag_concorrencia              IN  job.flag_concorrencia%TYPE
, p_contra_quem                    IN  job.contra_quem%TYPE
, p_flag_conc_perdida              IN  job.flag_conc_perdida%TYPE
, p_perdida_para                   IN  job.perdida_para%TYPE
, p_motivo_cancel                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_financeiro
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_contato_fatur_id               IN  job.contato_fatur_id%TYPE
, p_vetor_natureza_item_id         IN  VARCHAR2
, p_vetor_valor_padrao             IN  VARCHAR2
, p_flag_pago_cliente              IN  job.flag_pago_cliente%TYPE
, p_flag_bloq_negoc                IN  job.flag_bloq_negoc%TYPE
, p_flag_bv_fornec                 IN  job.flag_bv_fornec%TYPE
, p_perc_bv                        IN  VARCHAR2
, p_emp_faturar_por_id             IN  job.emp_faturar_por_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_comissionados
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_vetor_usuarios                 IN  VARCHAR2
, p_vetor_comissionado             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_responsavel
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_periodo_apont
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_data_apont_ini                 IN  VARCHAR2
, p_data_apont_fim                 IN  VARCHAR2
, p_flag_obriga_desc_horas         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_job_id                         IN  arquivo_job.job_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            receita_contrato_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_valor_alocado                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            receita_contrato_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_receita_ctr_id             IN  job_receita_ctr.job_receita_ctr_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            valor_ajuste_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_data                           IN  VARCHAR2
, p_descricao                      IN  ajuste_job.descricao%TYPE
, p_valor_ajuste                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            valor_ajuste_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_ajuste_job_id                  IN  ajuste_job.ajuste_job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            checkin_fechar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            faturamento_fechar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            status_alterar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_status                         IN  job.status%TYPE
, p_status_aux_job_id              IN  status_aux_job.status_aux_job_id%TYPE
, p_motivo                         IN  VARCHAR2
, p_complemento                    IN  VARCHAR2
, p_flag_commit                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            caminho_arq_alterar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_caminho_arq_externo            IN  job.caminho_arq_externo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            status_tratar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_tipo_status                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reabrir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            concluir_automatico;
--
PROCEDURE            concluir_em_massa
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_data_de                        IN  VARCHAR2
, p_data_ate                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            resp_int_tratar
(
  p_job_id                         IN  job.job_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            desenderecar_usuario
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_flag_pula_notif                IN  VARCHAR2
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_usuario
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_flag_coender                   IN  VARCHAR2
, p_flag_pula_notif                IN  VARCHAR2
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_automatico
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_manual
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_area_id                        IN  papel.area_id%TYPE
, p_vetor_usuarios                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_solidario
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_todos_usuarios
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            task_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_prioridade                     IN  task.prioridade%TYPE
, p_vetor_papel_id                 IN  LONG
, p_obs                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            visualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            lido_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nao_lido_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_tipo                           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            prox_numero_retornar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_cliente_id                     IN  job.cliente_id%TYPE
, p_tipo_financeiro_id             IN  job.tipo_financeiro_id%TYPE
, p_numero_job                     OUT job.numero%TYPE
, p_tipo_num_job                   OUT job.tipo_num_job%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_job_id                         IN  job.job_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             usuarios_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_papel_id                       IN  papel.papel_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             menor_data_aprov_retornar (
  p_job_id                        IN job.job_id%TYPE,
  p_tipo_item                     IN VARCHAR2)
RETURN DATE;
--
--
FUNCTION             nome_retornar (
  p_job_id                         IN  job.job_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             valor_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_status_orcam                   IN  VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             valor_custo_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_tipo_item                      IN  VARCHAR2,
  p_status_orcam                   IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_realizado_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_status_orcam                   IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_abat_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_status_orcam                   IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_cred_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_status_orcam                   IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_outras_receitas_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_status_orcam                   IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_economia_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_tipo_item                      IN  VARCHAR2,
  p_status_orcam                   IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_custo_horas_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_tipo                           IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             status_checkin_retornar (
  p_job_id                         IN  job.job_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             status_fatur_retornar (
  p_job_id                         IN  job.job_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             data_fech_fatur_retornar (
  p_job_id                         IN  job.job_id%TYPE)
RETURN   DATE;
--
--
FUNCTION             horas_retornar (
  p_job_id                         IN  job.job_id%TYPE,
  p_nivel                          IN  usuario_cargo.nivel%TYPE,
  p_tipo                           IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             usuario_solic_retornar (
  p_job_id                         IN  job.job_id%TYPE)
RETURN   NUMBER;
--
--
FUNCTION             sla_data_inicio_job_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  DATE;
--
--
FUNCTION             sla_data_inicio_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  DATE;
--
--
FUNCTION             sla_data_inicio_ori_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  VARCHAR2;
--
--
FUNCTION             sla_data_limite_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  DATE;
--
--
FUNCTION             sla_data_limite_ori_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  VARCHAR2;
--
--
FUNCTION             sla_data_termino_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  DATE;
--
--
FUNCTION             sla_job_no_prazo_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  VARCHAR2;
--
--
FUNCTION             sla_num_dias_retornar (
 p_job_id                          IN job.job_id%TYPE)
RETURN  INT;
--
--
END;  -- JOB_PKG

/
--------------------------------------------------------
--  DDL for Package LIMPEZA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "LIMPEZA_PKG" 
IS
--
PROCEDURE            empresa_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            jobs_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            job_apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            oportunidades_processar (
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            oportunidade_apagar (
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tasks_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            task_apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_task_id                        IN  task.task_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            milestones_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            milestone_apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_milestone_id                   IN  milestone.milestone_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            contratos_processar (
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            contrato_apagar (
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_contrato_id                    IN  contrato.contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            papeis_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            papel_apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            pessoas_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pessoa_apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            outros_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- LIMPEZA_PKG


/
--------------------------------------------------------
--  DDL for Package LINK_DIRETO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "LINK_DIRETO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  link_direto.empresa_id%TYPE
, p_cliente_id                     IN  link_direto.cliente_id%TYPE
, p_ordem_servico_id               IN  link_direto.ordem_servico_id%TYPE
, p_tipo_link                      IN  VARCHAR2
, p_interface                      IN  VARCHAR2
, p_link                           IN  VARCHAR2
, p_cod_hash                       IN  VARCHAR2
, p_link_direto_id                 OUT link_direto.link_direto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- LINK_DIRETO_PKG

/
--------------------------------------------------------
--  DDL for Package METADADO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "METADADO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_objeto                    IN  metadado.tipo_objeto%TYPE
, p_objeto_id                      IN  metadado.objeto_id%TYPE
, p_grupo                          IN  metadado.grupo%TYPE
, p_nome                           IN  metadado.nome%TYPE
, p_tipo_dado_id                   IN  metadado.tipo_dado_id%TYPE
, p_privilegio_id                  IN  metadado.privilegio_id%TYPE
, p_tamanho                        IN  VARCHAR2
, p_flag_obrigatorio               IN  VARCHAR2
, p_flag_ao_lado                   IN  VARCHAR2
, p_flag_na_lista                  IN  VARCHAR2
, p_flag_ordenar                   IN  VARCHAR2
, p_sufixo                         IN  VARCHAR2
, p_instrucoes                     IN  VARCHAR2
, p_valores                        IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_metadado_cond_id               IN  metadado.metadado_cond_id%TYPE
, p_valor_cond                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_metadado_id                    IN  metadado.metadado_id%TYPE
, p_nome                           IN  metadado.nome%TYPE
, p_tipo_dado_id                   IN  metadado.tipo_dado_id%TYPE
, p_privilegio_id                  IN  metadado.privilegio_id%TYPE
, p_tamanho                        IN  VARCHAR2
, p_flag_obrigatorio               IN  VARCHAR2
, p_flag_ao_lado                   IN  VARCHAR2
, p_flag_na_lista                  IN  VARCHAR2
, p_flag_ordenar                   IN  VARCHAR2
, p_sufixo                         IN  VARCHAR2
, p_instrucoes                     IN  VARCHAR2
, p_valores                        IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_metadado_cond_id               IN  metadado.metadado_cond_id%TYPE
, p_valor_cond                     IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_metadado_id                    IN  metadado.metadado_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_metadado_id                    IN  metadado.metadado_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- METADADO_PKG

/
--------------------------------------------------------
--  DDL for Package MI_CARGA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "MI_CARGA_PKG" 
IS
--
PROCEDURE            arquivo_carregar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_tipo                           IN  VARCHAR2
, p_arquivo                        IN  VARCHAR2
, p_mi_carga_id                    OUT mi_carga.mi_carga_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_ooh_limpar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_ooh_carregar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mi_carga_id                    IN  mi_carga.mi_carga_id%TYPE
, p_ano                            IN  VARCHAR2
, p_veiculo                        IN  VARCHAR2
, p_praca                          IN  VARCHAR2
, p_formato                        IN  VARCHAR2
, p_periodicidade                  IN  VARCHAR2
, p_valor_unit_neg                 IN  VARCHAR2
, p_perc_negoc                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_ooh_calcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_radio_limpar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_radio_carregar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mi_carga_id                    IN  mi_carga.mi_carga_id%TYPE
, p_ano                            IN  VARCHAR2
, p_veiculo                        IN  VARCHAR2
, p_praca                          IN  VARCHAR2
, p_formato                        IN  VARCHAR2
, p_valor_unit_neg                 IN  VARCHAR2
, p_daypart                        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_radio_calcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_print_limpar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_print_carregar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mi_carga_id                    IN  mi_carga.mi_carga_id%TYPE
, p_ano                            IN  VARCHAR2
, p_veiculo                        IN  VARCHAR2
, p_praca                          IN  VARCHAR2
, p_formato                        IN  VARCHAR2
, p_valor_unit_neg                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_print_calcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_digital_limpar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_digital_carregar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mi_carga_id                    IN  mi_carga.mi_carga_id%TYPE
, p_ano                            IN  VARCHAR2
, p_veiculo                        IN  VARCHAR2
, p_formato                        IN  VARCHAR2
, p_negociacao                     IN  VARCHAR2
, p_valor_unit_neg                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_digital_calcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_tv_limpar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_tv_calcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metas_tv_carregar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mi_carga_id                    IN  mi_carga.mi_carga_id%TYPE
, p_ano                            IN  VARCHAR2
, p_meio                           IN  VARCHAR2
, p_meio_compl                     IN  VARCHAR2
, p_target                         IN  VARCHAR2
, p_rede                           IN  VARCHAR2
, p_praca                          IN  VARCHAR2
, p_daypart                        IN  VARCHAR2
, p_cpp_q1                         IN  VARCHAR2
, p_cpp_q2                         IN  VARCHAR2
, p_cpp_q3                         IN  VARCHAR2
, p_cpp_q4                         IN  VARCHAR2
, p_trp_q1                         IN  VARCHAR2
, p_trp_q2                         IN  VARCHAR2
, p_trp_q3                         IN  VARCHAR2
, p_trp_q4                         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pi_limpar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_periodo                        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pi_carregar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mi_carga_id                    IN  mi_carga.mi_carga_id%TYPE
, p_periodo                        IN  VARCHAR2
, p_cod_cliente                    IN  VARCHAR2
, p_cliente                        IN  VARCHAR2
, p_cod_produto                    IN  VARCHAR2
, p_produto                        IN  VARCHAR2
, p_num_ap                         IN  VARCHAR2  
, p_num_pi                         IN  VARCHAR2  
, p_periodo_tab                    IN  VARCHAR2 
, p_campanha                       IN  VARCHAR2  
, p_tipo_pi                        IN  VARCHAR2  
, p_meio                           IN  VARCHAR2 
, p_cod_emissora                   IN  VARCHAR2 
, p_rede                           IN  VARCHAR2 
, p_uf                             IN  VARCHAR2 
, p_cod_praca                      IN  VARCHAR2 
, p_praca                          IN  VARCHAR2 
, p_cod_veiculo                    IN  VARCHAR2 
, p_veiculo                        IN  VARCHAR2 
, p_cod_representante              IN  VARCHAR2 
, p_representante                  IN  VARCHAR2 
, p_cnpj_representante             IN  VARCHAR2 
, p_faturavel                      IN  VARCHAR2 
, p_cod_programa                   IN  VARCHAR2 
, p_descricao                      IN  VARCHAR2 
, p_negociacao                     IN  VARCHAR2 
, p_hora_inicio                    IN  VARCHAR2 
, p_hora_fim                       IN  VARCHAR2 
, p_titulo                         IN  VARCHAR2 
, p_formato                        IN  VARCHAR2 
, p_cod_tipo_comerc                IN  VARCHAR2 
, p_tipo_comercial                 IN  VARCHAR2 
, p_data                           IN  VARCHAR2 
, p_valor_unit_tab                 IN  VARCHAR2 
, p_perc_negoc                     IN  VARCHAR2 
, p_valor_unit_neg                 IN  VARCHAR2 
, p_aud_dom                        IN  VARCHAR2 
, p_target                         IN  VARCHAR2 
, p_aud_targ                       IN  VARCHAR2 
, p_tot_ins                        IN  VARCHAR2 
, p_qtd_impressoes                 IN  VARCHAR2 
, p_valor_total                    IN  VARCHAR2 
, p_semana_ano                     IN  VARCHAR2 
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pi_descartar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ano                            IN  VARCHAR2
, p_vetor_num_pi                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             numero_validar 
( p_numero                         IN VARCHAR2)
RETURN   INTEGER;
--
FUNCTION             numero_converter
( p_numero                         IN VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             daypart_id_retornar (
  p_empresa_id                    IN  NUMBER,
  p_daypart                       IN  VARCHAR2,
  p_rede                          IN  VARCHAR2)
RETURN NUMBER;
--
END;  -- MI_CARGA_PKG


/
--------------------------------------------------------
--  DDL for Package MILESTONE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "MILESTONE_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_papel_resp_id                  IN  milestone.papel_resp_id%TYPE
, p_job_id                         IN  milestone.job_id%TYPE
, p_vetor_tipo_milestone_id        IN  LONG
, p_data_milestone                 IN  VARCHAR2
, p_hora_ini                       IN  milestone.hora_ini%TYPE
, p_hora_fim                       IN  milestone.hora_fim%TYPE
, p_descricao                      IN  milestone.descricao%TYPE
, p_vetor_usuario_id               IN  VARCHAR2
, p_milestone_id                   OUT milestone.milestone_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_milestone_id                   IN  milestone.milestone_id%TYPE
, p_papel_resp_id                  IN  milestone.papel_resp_id%TYPE
, p_vetor_tipo_milestone_id        IN  LONG
, p_data_milestone                 IN  VARCHAR2
, p_hora_ini                       IN  milestone.hora_ini%TYPE
, p_hora_fim                       IN  milestone.hora_fim%TYPE
, p_descricao                      IN  milestone.descricao%TYPE
, p_vetor_usuario_id               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_data
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_milestone_id                   IN  milestone.milestone_id%TYPE
, p_data_milestone                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_milestone_id                   IN  milestone.milestone_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fechar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_milestone_id                   IN  milestone.milestone_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reabrir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_milestone_id                   IN  milestone.milestone_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             atrasado_verificar (
  p_milestone_id                   IN  milestone.milestone_id%TYPE)
RETURN   INTEGER;
--
FUNCTION             data_evento_retornar (
  p_empresa_id                     IN  milestone.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_data_refer                     IN  DATE,
  p_sentido                        IN  VARCHAR2)
RETURN   DATE;
--
END;  -- MILESTONE_PKG


/
--------------------------------------------------------
--  DDL for Package MOD_CRONO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "MOD_CRONO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  mod_crono.nome%TYPE
, p_tipo_data_base                 IN  mod_crono.tipo_data_base%TYPE
, p_mod_crono_id                   OUT mod_crono.mod_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_nome                           IN  mod_crono.nome%TYPE
, p_tipo_data_base                 IN  mod_crono.tipo_data_base%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            copiar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_mod_crono_new_id               OUT mod_crono.mod_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_crono_id                   IN  mod_item_crono.mod_crono_id%TYPE
, p_mod_item_crono_pai_id          IN  mod_item_crono.mod_item_crono_pai_id%TYPE
, p_nome_item                      IN  mod_item_crono.nome%TYPE
, p_dia_inicio                     IN  VARCHAR2
, p_demanda                        IN  VARCHAR2
, p_duracao                        IN  VARCHAR2
, p_mod_item_crono_pre_id          IN  mod_item_crono_pre.mod_item_crono_pre_id%TYPE
, p_cod_objeto                     IN  mod_item_crono.cod_objeto%TYPE
, p_tipo_objeto_id                 IN  mod_item_crono.tipo_objeto_id%TYPE
, p_sub_tipo_objeto                IN  mod_item_crono.sub_tipo_objeto%TYPE
, p_papel_resp_id                  IN  mod_item_crono.papel_resp_id%TYPE
, p_vetor_papel_dest_id            IN  VARCHAR2
, p_flag_enviar                    IN  VARCHAR2
, p_repet_a_cada                   IN  VARCHAR2
, p_frequencia_id                  IN  mod_item_crono.frequencia_id%TYPE
, p_vetor_dia_semana_id            IN  VARCHAR2
, p_repet_term_tipo                IN  VARCHAR2
, p_repet_term_ocor                IN  VARCHAR2
, p_mod_item_crono_id              OUT mod_item_crono.mod_item_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_item_crono_id              IN  mod_item_crono.mod_item_crono_id%TYPE
, p_nome_item                      IN  mod_item_crono.nome%TYPE
, p_dia_inicio                     IN  VARCHAR2
, p_demanda                        IN  VARCHAR2
, p_duracao                        IN  VARCHAR2
, p_mod_item_crono_pre_id          IN  mod_item_crono_pre.mod_item_crono_pre_id%TYPE
, p_cod_objeto                     IN  mod_item_crono.cod_objeto%TYPE
, p_tipo_objeto_id                 IN  mod_item_crono.tipo_objeto_id%TYPE
, p_sub_tipo_objeto                IN  mod_item_crono.sub_tipo_objeto%TYPE
, p_papel_resp_id                  IN  mod_item_crono.papel_resp_id%TYPE
, p_vetor_papel_dest_id            IN  VARCHAR2
, p_flag_enviar                    IN  VARCHAR2
, p_repet_a_cada                   IN  VARCHAR2
, p_frequencia_id                  IN  mod_item_crono.frequencia_id%TYPE
, p_vetor_dia_semana_id            IN  VARCHAR2
, p_repet_term_tipo                IN  VARCHAR2
, p_repet_term_ocor                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_item_crono_id              IN mod_item_crono.mod_item_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_lista_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_crono_id                   IN  mod_item_crono.mod_crono_id%TYPE
, p_vetor_mod_item_crono_id        IN  VARCHAR2
, p_vetor_dia_inicio               IN  VARCHAR2
, p_vetor_demanda                  IN  VARCHAR2
, p_vetor_duracao                  IN  VARCHAR2
, p_vetor_mod_item_crono_pre_id    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_mover
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_item_crono_ori_id          IN  mod_item_crono.mod_item_crono_id%TYPE
, p_mod_item_crono_des_id          IN  mod_item_crono.mod_item_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_deslocar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_item_crono_id              IN  mod_item_crono.mod_item_crono_id%TYPE
, p_direcao                        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            seq_renumerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_crono_id                   IN  mod_item_crono.mod_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ordem_renumerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mod_crono_id                   IN  mod_item_crono.mod_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- MOD_CRONO_PKG


/
--------------------------------------------------------
--  DDL for Package NATUREZA_ITEM_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "NATUREZA_ITEM_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_codigo                         IN  VARCHAR2
, p_tipo                           IN  VARCHAR2
, p_mod_calculo                    IN  VARCHAR2
, p_valor_padrao                   IN  VARCHAR2
, p_flag_inc_a                     IN  VARCHAR2
, p_flag_inc_b                     IN  VARCHAR2
, p_flag_inc_c                     IN  VARCHAR2
, p_flag_vinc_ck_a                 IN  VARCHAR2
, p_vetor_natureza_item_inc_id     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_natureza_item_id               IN  natureza_item.natureza_item_id%TYPE
, p_nome                           IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_tipo                           IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_mod_calculo                    IN  VARCHAR2
, p_valor_padrao                   IN  VARCHAR2
, p_flag_inc_a                     IN  VARCHAR2
, p_flag_inc_b                     IN  VARCHAR2
, p_flag_inc_c                     IN  VARCHAR2
, p_flag_vinc_ck_a                 IN  VARCHAR2
, p_vetor_natureza_item_inc_id     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_natureza_item_id               IN  natureza_item.natureza_item_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_natureza_item_id               IN  natureza_item.natureza_item_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION       valor_padrao_retornar (
  p_cod_objeto                     IN  VARCHAR2,
  p_objeto_id                      IN  NUMBER,
  p_natureza_item                  IN  VARCHAR2)
RETURN   NUMBER;
--
END;  -- NATUREZA_ITEM_PKG


/
--------------------------------------------------------
--  DDL for Package NATUREZA_OPER_FATUR_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "NATUREZA_OPER_FATUR_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  natureza_oper_fatur.pessoa_id%TYPE
, p_codigo                         IN  natureza_oper_fatur.codigo%TYPE
, p_descricao                      IN  natureza_oper_fatur.descricao%TYPE
, p_flag_padrao                    IN  natureza_oper_fatur.flag_padrao%TYPE
, p_flag_bv                        IN  natureza_oper_fatur.flag_bv%TYPE
, p_flag_servico                   IN  natureza_oper_fatur.flag_servico%TYPE
, p_ordem                          IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_natureza_oper_fatur_id         IN  natureza_oper_fatur.natureza_oper_fatur_id%TYPE
, p_codigo                         IN  natureza_oper_fatur.codigo%TYPE
, p_descricao                      IN  natureza_oper_fatur.descricao%TYPE
, p_flag_padrao                    IN  natureza_oper_fatur.flag_padrao%TYPE
, p_flag_bv                        IN  natureza_oper_fatur.flag_bv%TYPE
, p_flag_servico                   IN  natureza_oper_fatur.flag_servico%TYPE
, p_ordem                          IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_natureza_oper_fatur_id         IN  natureza_oper_fatur.natureza_oper_fatur_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END natureza_oper_fatur_pkg;


/
--------------------------------------------------------
--  DDL for Package NOTA_FISCAL_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "NOTA_FISCAL_PKG" 
IS
--
PROCEDURE            sub_itens_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_carta_acordo_id          IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_quantidade               IN  VARCHAR2
, p_vetor_frequencia               IN  VARCHAR2
, p_vetor_custo_unitario           IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_valor_aprovado           IN  VARCHAR2
, p_vetor_valor_fornecedor         IN  VARCHAR2
, p_vetor_valor_bv                 IN  VARCHAR2
, p_vetor_valor_tip                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_carta_acordo_id          IN  VARCHAR2
, p_vetor_valor_aprovado           IN  VARCHAR2
, p_vetor_valor_fornecedor         IN  VARCHAR2
, p_vetor_valor_bv                 IN  VARCHAR2
, p_vetor_valor_tip                IN  VARCHAR2
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  VARCHAR2
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_data_entrada                   IN  VARCHAR2
, p_data_emissao                   IN  VARCHAR2
, p_data_pri_vencim                IN  VARCHAR2
, p_valor_bruto                    IN  VARCHAR2
, p_condicao_pagto_id              IN  nota_fiscal.condicao_pagto_id%TYPE
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_nf.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_nivel_excelencia               IN  VARCHAR2
, p_nivel_parceria                 IN  VARCHAR2
, p_emp_receita_id                 IN  nota_fiscal.emp_receita_id%TYPE
, p_flag_repasse                   IN  VARCHAR2
, p_flag_patrocinio                IN  nota_fiscal.flag_item_patrocinado%TYPE
, p_tipo_receita                   IN  nota_fiscal.tipo_receita%TYPE
, p_resp_pgto_receita              IN  nota_fiscal.resp_pgto_receita%TYPE
, p_desc_servico                   IN  VARCHAR2
, p_municipio_servico              IN  nota_fiscal.municipio_servico%TYPE
, p_uf_servico                     IN  nota_fiscal.uf_servico%TYPE
, p_emp_faturar_por_id             IN  nota_fiscal.emp_faturar_por_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_nota_fiscal_id                 OUT nota_fiscal.nota_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            multijob_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_carta_acordo_id          IN  VARCHAR2
, p_vetor_tipo_produto_id          IN  VARCHAR2
, p_vetor_quantidade               IN  VARCHAR2
, p_vetor_frequencia               IN  VARCHAR2
, p_vetor_custo_unitario           IN  VARCHAR2
, p_vetor_complemento              IN  VARCHAR2
, p_vetor_valor_aprovado           IN  VARCHAR2
, p_vetor_valor_fornecedor         IN  VARCHAR2
, p_vetor_valor_bv                 IN  VARCHAR2
, p_vetor_valor_tip                IN  VARCHAR2
, p_valor_credito_usado            IN  VARCHAR2
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  VARCHAR2
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_data_entrada                   IN  VARCHAR2
, p_data_emissao                   IN  VARCHAR2
, p_data_pri_vencim                IN  VARCHAR2
, p_valor_bruto                    IN  VARCHAR2
, p_condicao_pagto_id              IN  nota_fiscal.condicao_pagto_id%TYPE
, p_vetor_parc_datas               IN  VARCHAR2
, p_vetor_parc_num_dias            IN  VARCHAR2
, p_tipo_num_dias                  IN  parcela_nf.tipo_num_dias%TYPE
, p_vetor_parc_valores             IN  VARCHAR2
, p_nivel_excelencia               IN  VARCHAR2
, p_nivel_parceria                 IN  VARCHAR2
, p_emp_receita_id                 IN  nota_fiscal.emp_receita_id%TYPE
, p_flag_repasse                   IN  VARCHAR2
, p_flag_patrocinio                IN  nota_fiscal.flag_item_patrocinado%TYPE
, p_tipo_receita                   IN  nota_fiscal.tipo_receita%TYPE
, p_resp_pgto_receita              IN  nota_fiscal.resp_pgto_receita%TYPE
, p_desc_servico                   IN  VARCHAR2
, p_municipio_servico              IN  nota_fiscal.municipio_servico%TYPE
, p_uf_servico                     IN  nota_fiscal.uf_servico%TYPE
, p_emp_faturar_por_id             IN  nota_fiscal.emp_faturar_por_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_nota_fiscal_id                 OUT nota_fiscal.nota_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            auto_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_carta_acordo_id                IN  carta_acordo.carta_acordo_id%TYPE
, p_nota_fiscal_id                 OUT nota_fiscal.nota_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_carta_acordo_id          IN  VARCHAR2
, p_vetor_valor_aprovado           IN  VARCHAR2
, p_vetor_valor_fornecedor         IN  VARCHAR2
, p_vetor_valor_bv                 IN  VARCHAR2
, p_vetor_valor_tip                IN  VARCHAR2
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  VARCHAR2
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_data_entrada                   IN  VARCHAR2
, p_data_emissao                   IN  VARCHAR2
, p_data_pri_vencim                IN  VARCHAR2
, p_valor_bruto                    IN  VARCHAR2
, p_emp_receita_id                 IN  nota_fiscal.emp_receita_id%TYPE
, p_flag_repasse                   IN  VARCHAR2
, p_flag_patrocinio                IN  nota_fiscal.flag_item_patrocinado%TYPE
, p_tipo_receita                   IN  nota_fiscal.tipo_receita%TYPE
, p_resp_pgto_receita              IN  nota_fiscal.resp_pgto_receita%TYPE
, p_desc_servico                   IN  VARCHAR2
, p_municipio_servico              IN  nota_fiscal.municipio_servico%TYPE
, p_uf_servico                     IN  nota_fiscal.uf_servico%TYPE
, p_emp_faturar_por_id             IN  nota_fiscal.emp_faturar_por_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_nfe
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  VARCHAR2
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_tipo_pag_pessoa                IN  nota_fiscal.tipo_pag_pessoa%TYPE
, p_valor_mao_obra                 IN  VARCHAR2
, p_data_entrada                   IN  VARCHAR2
, p_data_emissao                   IN  VARCHAR2
, p_data_pri_vencim                IN  VARCHAR2
, p_cliente_id                     IN  nota_fiscal.cliente_id%TYPE
, p_emp_faturar_por_id             IN  nota_fiscal.emp_faturar_por_id%TYPE
, p_municipio_servico              IN  nota_fiscal.municipio_servico%TYPE
, p_uf_servico                     IN  nota_fiscal.uf_servico%TYPE
, p_desc_servico                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            completar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_valor_mao_obra                 IN  VARCHAR2
, p_valor_base_iss                 IN  VARCHAR2
, p_valor_base_ir                  IN  VARCHAR2
, p_desc_servico                   IN  VARCHAR2
, p_produto_fiscal_id              IN  nota_fiscal.produto_fiscal_id%TYPE
, p_produto                        IN  nota_fiscal.produto%TYPE
, p_tipo_pag_pessoa                IN  nota_fiscal.tipo_pag_pessoa%TYPE
, p_cod_verificacao                IN  nota_fiscal.cod_verificacao%TYPE
, p_chave_acesso                   IN  nota_fiscal.chave_acesso%TYPE
, p_modo_pagto                     IN  nota_fiscal.modo_pagto%TYPE
, p_num_doc_pagto                  IN  nota_fiscal.num_doc_pagto%TYPE
, p_emp_fi_banco_id                IN  pessoa.fi_banco_id%TYPE
, p_emp_num_agencia                IN  pessoa.num_agencia%TYPE
, p_emp_num_conta                  IN  pessoa.num_conta%TYPE
, p_emp_tipo_conta                 IN  pessoa.tipo_conta%TYPE
, p_emp_flag_atualizar             IN  VARCHAR2
, p_fi_banco_cobrador_id           IN  nota_fiscal.fi_banco_cobrador_id%TYPE
, p_vetor_data_vencim              IN  VARCHAR2
, p_vetor_valor_duplicata          IN  VARCHAR2
, p_vetor_fi_tipo_imposto          IN  VARCHAR2
, p_vetor_perc_imposto             IN  VARCHAR2
, p_fi_tipo_imposto_pessoa_id      IN  fi_tipo_imposto_pessoa.fi_tipo_imposto_pessoa_id%TYPE
, p_flag_reter_iss                 IN  fi_tipo_imposto_pessoa.flag_reter%TYPE
, p_motivo_alt_aliquota            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  nota_fiscal.num_doc%TYPE
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fornecedor_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_emp2_apelido                   IN  pessoa.apelido%TYPE
, p_emp2_nome                      IN  pessoa.nome%TYPE
, p_emp2_flag_simples              IN  VARCHAR2
, p_emp2_flag_cpom                 IN  VARCHAR2
, p_emp2_cnpj                      IN  pessoa.cnpj%TYPE
, p_emp2_inscr_estadual            IN  pessoa.inscr_estadual%TYPE
, p_emp2_inscr_municipal           IN  pessoa.inscr_municipal%TYPE
, p_emp2_inscr_inss                IN  pessoa.inscr_inss%TYPE
, p_emp2_endereco                  IN  pessoa.endereco%TYPE
, p_emp2_num_ender                 IN  pessoa.num_ender%TYPE
, p_emp2_compl_ender               IN  pessoa.compl_ender%TYPE
, p_emp2_bairro                    IN  pessoa.bairro%TYPE
, p_emp2_cep                       IN  pessoa.cep%TYPE
, p_emp2_cidade                    IN  pessoa.cidade%TYPE
, p_emp2_uf                        IN  pessoa.uf%TYPE
, p_emp2_obs                       IN  pessoa.obs%TYPE
, p_emp2_fi_banco_id               IN  pessoa.fi_banco_id%TYPE
, p_emp2_num_agencia               IN  pessoa.num_agencia%TYPE
, p_emp2_num_conta                 IN  pessoa.num_conta%TYPE
, p_emp2_tipo_conta                IN  pessoa.tipo_conta%TYPE
, p_emp2_nome_titular              IN  pessoa.nome_titular%TYPE
, p_emp2_cnpj_cpf_titular          IN  pessoa.cnpj_cpf_titular%TYPE
, p_emp2_perc_bv                   IN  VARCHAR2
, p_emp2_tipo_fatur_bv             IN  VARCHAR2
, p_emp2_perc_imposto              IN  VARCHAR2
, p_fornecedor_id                  OUT pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            receita_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  nota_fiscal.num_doc%TYPE
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_emp_patrocinio_id              IN  nota_fiscal.cliente_id%TYPE
, p_tipo_receita                   IN  nota_fiscal.tipo_receita%TYPE
, p_emp_receita_id                 IN  nota_fiscal.emp_receita_id%TYPE
, p_resp_pgto_receita              IN  nota_fiscal.resp_pgto_receita%TYPE
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            numero_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  nota_fiscal.num_doc%TYPE
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_num_doc_novo                   IN  nota_fiscal.num_doc%TYPE
, p_serie_novo                     IN  nota_fiscal.serie%TYPE
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            pagto_comandar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_fi_banco_cobrador_id           IN  nota_fiscal.fi_banco_cobrador_id%TYPE
, p_vetor_data_vencim              IN  VARCHAR2
, p_vetor_valor_duplicata          IN  VARCHAR2
, p_vetor_fi_tipo_imposto          IN  VARCHAR2
, p_vetor_perc_imposto             IN  VARCHAR2
, p_fi_tipo_imposto_pessoa_id      IN  fi_tipo_imposto_pessoa.fi_tipo_imposto_pessoa_id%TYPE
, p_flag_reter_iss                 IN  fi_tipo_imposto_pessoa.flag_reter%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_nota_fiscal_id                 IN  arquivo_nf.nota_fiscal_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            bv_comandar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  nota_fiscal.num_doc%TYPE
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_saida_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_fatur                     IN  VARCHAR2
, p_faturamento_id                 IN  faturamento.faturamento_id%TYPE
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_num_doc                        IN  VARCHAR2
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_data_emissao                   IN  VARCHAR2
, p_data_pri_vencim                IN  VARCHAR2
, p_valor_bruto                    IN  VARCHAR2
, p_valor_mao_obra                 IN  VARCHAR2
, p_nota_fiscal_id                 OUT nota_fiscal.nota_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_saida_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_emp_emissora_id                IN  nota_fiscal.emp_emissora_id%TYPE
, p_tipo_doc_nf_id                 IN  nota_fiscal.tipo_doc_nf_id%TYPE
, p_num_doc                        IN  VARCHAR2
, p_serie                          IN  nota_fiscal.serie%TYPE
, p_valor_mao_obra                 IN  VARCHAR2
, p_data_emissao                   IN  VARCHAR2
, p_data_pri_vencim                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nf_saida_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             valor_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE
, p_tipo_valor                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             valor_checkin_pend_retornar (
  p_nota_fiscal_id                 IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             data_pri_vencim_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN DATE;
--
FUNCTION             flag_pago_cliente_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             flag_com_fatur_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             tipo_item_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             tipo_fatur_bv_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             data_fatur_bv_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN DATE;
--
FUNCTION             bv_faturado_verificar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN INTEGER;
--
FUNCTION             bv_comandado_verificar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN INTEGER;
--
FUNCTION             bv_nf_saida_retornar (
  p_nota_fiscal_id                IN  nota_fiscal.nota_fiscal_id%TYPE)
RETURN NUMBER;
--
FUNCTION             chave_acesso_verificar (
  p_chave_acesso                  IN  VARCHAR2)
RETURN NUMBER;
--
END;  -- NOTA_FISCAL_PKG


/
--------------------------------------------------------
--  DDL for Package OPORTUNIDADE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "OPORTUNIDADE_PKG" 
IS
--
PROCEDURE            consistir_principal
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_tipo_chamada                   IN  VARCHAR2
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_nome                           IN  VARCHAR2
, p_cliente_id                     IN  oportunidade.cliente_id%TYPE
, p_flag_conflito                  IN  VARCHAR2
, p_cliente_conflito_id            IN  oportunidade.cliente_conflito_id%TYPE
, p_contato_id                     IN  oportunidade.contato_id%TYPE
, p_produto_cliente_id             IN  oportunidade.produto_cliente_id%TYPE
, p_usuario_resp_id                IN  oportunidade.usuario_resp_id%TYPE
, p_unid_negocio_resp_id           IN  oportunidade.unid_negocio_resp_id%TYPE
, p_origem                         IN  oportunidade.origem%TYPE
, p_compl_origem                   IN  VARCHAR2
, p_tipo_negocio                   IN  oportunidade.tipo_negocio%TYPE
, p_tipo_contrato_id               IN  oportunidade.tipo_contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            consistir_cenario
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_tipo_chamada                   IN  VARCHAR2
, p_cenario_id                     IN  cenario.cenario_id%TYPE
, p_nome_cenario                   IN  VARCHAR2
, p_vetor_servico_id               IN  VARCHAR2
, p_vetor_servico_valor            IN  VARCHAR2
, p_vetor_usu_resp_id              IN  VARCHAR2
, p_vetor_uneg_resp_id             IN  VARCHAR2
, p_vetor_empresa_id               IN  VARCHAR2
, p_vetor_empresa_valor            IN  VARCHAR2
, p_num_parcelas                   IN  VARCHAR2
, p_coment_parcelas                IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_moeda                          IN  VARCHAR2
, p_valor_cotacao                  IN  VARCHAR2
, p_data_cotacao                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_wizard
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_nome                           IN  oportunidade.nome%TYPE
, p_cliente_id                     IN  oportunidade.cliente_id%TYPE
, p_flag_conflito                  IN  VARCHAR2
, p_cliente_conflito_id            IN  oportunidade.cliente_conflito_id%TYPE
, p_contato_id                     IN  oportunidade.contato_id%TYPE
, p_produto_cliente_id             IN  oportunidade.produto_cliente_id%TYPE
, p_usuario_resp_id                IN  oportunidade.usuario_resp_id%TYPE
, p_unid_negocio_resp_id           IN  oportunidade.unid_negocio_resp_id%TYPE
, p_origem                         IN  oportunidade.origem%TYPE
, p_compl_origem                   IN  VARCHAR2
, p_tipo_negocio                   IN  oportunidade.tipo_negocio%TYPE
, p_tipo_contrato_id               IN  oportunidade.tipo_contrato_id%TYPE
, p_usuario_comissionado_id        IN  oport_usuario.usuario_id%TYPE
, p_nome_cenario                   IN  VARCHAR2
, p_moeda                          IN  VARCHAR2
, p_valor_cotacao                  IN  VARCHAR2
, p_data_cotacao                   IN  VARCHAR2
, p_vetor_servico_id               IN  VARCHAR2
, p_vetor_servico_valor            IN  VARCHAR2
, p_vetor_usu_resp_id              IN  VARCHAR2
, p_vetor_uneg_resp_id             IN  VARCHAR2
, p_vetor_empresa_id               IN  VARCHAR2
, p_vetor_empresa_valor            IN  VARCHAR2
, p_num_parcelas                   IN  VARCHAR2
, p_coment_parcelas                IN  VARCHAR2
, p_int1_data                      IN  VARCHAR2
, p_int1_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int1_meio_contato              IN  VARCHAR2
, p_int1_descricao                 IN  interacao.descricao%TYPE
, p_perc_prob_fech                 IN  VARCHAR2
, p_data_prov_fech                 IN  VARCHAR2
, p_int2_data                      IN  VARCHAR2
, p_int2_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int2_descricao                 IN  interacao.descricao%TYPE
, p_oportunidade_id                OUT oportunidade.oportunidade_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_principal
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_nome                           IN  oportunidade.nome%TYPE
, p_cliente_id                     IN  oportunidade.cliente_id%TYPE
, p_flag_conflito                  IN  VARCHAR2
, p_cliente_conflito_id            IN  oportunidade.cliente_conflito_id%TYPE
, p_contato_id                     IN  oportunidade.contato_id%TYPE
, p_produto_cliente_id             IN  oportunidade.produto_cliente_id%TYPE
, p_origem                         IN  oportunidade.origem%TYPE
, p_compl_origem                   IN  VARCHAR2
, p_tipo_negocio                   IN  oportunidade.tipo_negocio%TYPE
, p_tipo_contrato_id               IN  oportunidade.tipo_contrato_id%TYPE
, p_usuario_resp_id                IN  oportunidade.usuario_resp_id%TYPE
, p_unid_negocio_resp_id           IN  oportunidade.unid_negocio_resp_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_comissionados
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_vetor_usuarios                 IN  VARCHAR2
, p_vetor_comissionado             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_responsavel
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            interacao_andam_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_int1_data                      IN  VARCHAR2
, p_int1_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int1_meio_contato              IN  VARCHAR2
, p_int1_descricao                 IN  interacao.descricao%TYPE
, p_perc_prob_fech                 IN  VARCHAR2
, p_data_prov_fech                 IN  VARCHAR2
, p_status_aux_oport_id            IN  oportunidade.status_aux_oport_id%TYPE
, p_int2_data                      IN  VARCHAR2
, p_int2_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int2_descricao                 IN  interacao.descricao%TYPE
, p_interacao_id                   OUT interacao.interacao_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            interacao_ganha_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_cli_tipo_pessoa                IN  VARCHAR2
, p_cli_apelido                    IN  VARCHAR2
, p_cli_nome                       IN  VARCHAR2
, p_cli_produto                    IN  VARCHAR2
, p_cli_cnpj_cpf                   IN  VARCHAR2
, p_cli_endereco                   IN  VARCHAR2
, p_cli_num_ender                  IN  VARCHAR2
, p_cli_compl_ender                IN  VARCHAR2
, p_cli_bairro                     IN  VARCHAR2
, p_cli_cep                        IN  VARCHAR2
, p_cli_cidade                     IN  VARCHAR2
, p_cli_uf                         IN  VARCHAR2
, p_cli_pais                       IN  VARCHAR2 
, p_cli_email                      IN  VARCHAR2
, p_cli_ddd_telefone               IN  VARCHAR2
, p_cli_num_telefone               IN  VARCHAR2
, p_cli_nome_setor                 IN  VARCHAR2
, p_int1_data                      IN  VARCHAR2
, p_int1_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int1_meio_contato              IN  VARCHAR2
, p_int1_descricao                 IN  interacao.descricao%TYPE
, p_cenario_escolhido_id           IN  cenario.cenario_id%TYPE
, p_arquivo_prop_id                IN  oportunidade.arquivo_prop_id%TYPE
, p_arquivo_prec_id                IN  oportunidade.arquivo_prec_id%TYPE
, p_vetor_srv_servico_id           IN  VARCHAR2
, p_vetor_srv_empresa_id           IN  VARCHAR2
, p_vetor_srv_emp_resp_id          IN  VARCHAR2
, p_vetor_srv_valor                IN  VARCHAR2
, p_vetor_srv_usu_resp_id          IN  VARCHAR2
, p_vetor_srv_uneg_resp_id         IN  VARCHAR2
, p_vetor_ctr_cenario_empresa      IN  VARCHAR2
, p_vetor_ctr_emp_resp             IN  VARCHAR2
, p_vetor_ctr_data_inicio          IN  VARCHAR2
, p_vetor_ctr_data_termino         IN  VARCHAR2
, p_vetor_ctr_flag_renovavel       IN  VARCHAR2
, p_vetor_ctr_flag_fisico          IN  VARCHAR2
, p_vetor_ender_empresas           IN  VARCHAR2
, p_vetor_ender_usuarios           IN  VARCHAR2
, p_vetor_ender_flag_resp          IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            interacao_perda_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_int1_data                      IN  VARCHAR2
, p_int1_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int1_meio_contato              IN  VARCHAR2
, p_int1_descricao                 IN  interacao.descricao%TYPE
, p_motivo                         IN  VARCHAR2
, p_complemento                    IN  VARCHAR2
, p_perda_para                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            interacao_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_interacao_id                   IN  interacao.interacao_id%TYPE
, p_int1_data                      IN  VARCHAR2
, p_int1_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int1_meio_contato              IN  VARCHAR2
, p_int1_descricao                 IN  interacao.descricao%TYPE
, p_perc_prob_fech                 IN  VARCHAR2
, p_data_prov_fech                 IN  VARCHAR2
, p_int2_data                      IN  VARCHAR2
, p_int2_usuario_id                IN  interacao.usuario_resp_id%TYPE
, p_int2_descricao                 IN  interacao.descricao%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            interacao_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_interacao_id                   IN  interacao.interacao_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cenario_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_nome                           IN  VARCHAR2
, p_vetor_servico_id               IN  VARCHAR2
, p_vetor_servico_valor            IN  VARCHAR2
, p_vetor_usu_resp_id              IN  VARCHAR2
, p_vetor_uneg_resp_id             IN  VARCHAR2
, p_vetor_empresa_id               IN  VARCHAR2
, p_vetor_empresa_valor            IN  VARCHAR2
, p_num_parcelas                   IN  VARCHAR2
, p_coment_parcelas                IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_moeda                          IN  VARCHAR2
, p_valor_cotacao                  IN  VARCHAR2
, p_data_cotacao                   IN  VARCHAR2
, p_cenario_id                     OUT  cenario.cenario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cenario_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_cenario_id                     IN  cenario.cenario_id%TYPE
, p_nome                           IN  VARCHAR2
, p_vetor_servico_id               IN  VARCHAR2
, p_vetor_servico_valor            IN  VARCHAR2
, p_vetor_usu_resp_id              IN  VARCHAR2
, p_vetor_uneg_resp_id             IN  VARCHAR2
, p_vetor_empresa_id               IN  VARCHAR2
, p_vetor_empresa_valor            IN  VARCHAR2
, p_num_parcelas                   IN  VARCHAR2
, p_coment_parcelas                IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_moeda                          IN  VARCHAR2
, p_valor_cotacao                  IN  VARCHAR2
, p_data_cotacao                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cenario_padrao_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_cenario_id                     IN  cenario.cenario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cenario_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_cenario_id                     IN  cenario.cenario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            status_alterar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_status                         IN  oportunidade.status%TYPE
, p_status_aux_oport_id            IN  status_aux_oport.status_aux_oport_id%TYPE
, p_tipo_conc                      IN  VARCHAR2
, p_motivo                         IN  VARCHAR2
, p_complemento                    IN  VARCHAR2
, p_perda_para                     IN  VARCHAR2
, p_flag_commit                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            desenderecar_usuario
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_flag_pula_notif                IN  VARCHAR2
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_usuario
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_flag_coender                   IN  VARCHAR2
, p_flag_pula_notif                IN  VARCHAR2
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_automatico
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_manual
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_area_id                        IN  papel.area_id%TYPE
, p_vetor_usuarios                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cancelar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_motivo                         IN  VARCHAR2
, p_complemento                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reabrir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            apagar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_cenario_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_cenario_id                     IN  arquivo_cenario.cenario_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_cenario_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_oportun_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_oportunidade_id                IN  arquivo_oportunidade.oportunidade_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_oportun_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            visualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  oportunidade.empresa_id%TYPE
, p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_oportunidade_id                IN  oportunidade.oportunidade_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             cenario_valor_retornar (
  p_cenario_id                    IN  cenario.cenario_id%TYPE)
RETURN NUMBER;
--
END;  -- OPORTUNIDADE_PKG

/
--------------------------------------------------------
--  DDL for Package ORCAMENTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ORCAMENTO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  orcamento.job_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_usuario_resp_id                IN  NUMBER
, p_orcamento_id                   OUT orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_demais
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  orcamento.job_id%TYPE
, p_repet_grupo                    IN  item_crono.repet_grupo%TYPE
, p_descricao                      IN  VARCHAR2
, p_usuario_resp_id                IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_contato_fatur_id               IN  orcamento.contato_fatur_id%TYPE
, p_emp_faturar_por_id             IN  orcamento.emp_faturar_por_id%TYPE
, p_tipo_job_id                    IN  orcamento.tipo_job_id%TYPE
, p_servico_id                     IN  orcamento.servico_id%TYPE
, p_tipo_financeiro_id             IN  orcamento.tipo_financeiro_id%TYPE
, p_ordem_compra                   IN  VARCHAR2
, p_cod_externo                    IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_data_prev_ini                  IN  VARCHAR2
, p_data_prev_fim                  IN  VARCHAR2
, p_meta_valor_min                 IN  VARCHAR2
, p_meta_valor_max                 IN  VARCHAR2
, p_vetor_natureza_item_id         IN  VARCHAR2
, p_vetor_valor_padrao             IN  VARCHAR2
, p_uf_servico                     IN  VARCHAR2
, p_municipio_servico              IN  VARCHAR2
, p_obs_checkin                    IN  VARCHAR2
, p_obs_fatur                      IN  VARCHAR2
, p_flag_pago_cliente              IN  orcamento.flag_pago_cliente%TYPE
, p_data_prev_fec_check            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            desc_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ordem_compra_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_ordem_compra                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            autor_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_usuario_autor_id               IN  orcamento.usuario_autor_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            copiar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_num_job_de                     IN  VARCHAR2
, p_num_orcam_de                   IN  VARCHAR2
, p_job_para_id                    IN  job.job_id%TYPE
, p_orcam_para_id                  OUT orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            desarquivar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            retomar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_motivo_reprov                  IN  VARCHAR2
, p_compl_reprov                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            revisar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_motivo_rev                     IN  VARCHAR2
, p_compl_rev                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            revisar_especial
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_num_job                        IN  VARCHAR2
, p_num_orcamento                  IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            honorario_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_num_job                        IN  VARCHAR2
, p_num_orcamento                  IN  VARCHAR2
, p_perc_honor                     IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_transferir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_num_job                        IN  VARCHAR2
, p_num_orcam_de                   IN  VARCHAR2
, p_num_item                       IN  VARCHAR2
, p_num_orcam_para                 IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_historico_id                   OUT historico.historico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            checkin_encerrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_vetor_orcamento_id             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            faturamento_encerrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_vetor_orcamento_id             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            task_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_objeto_id                      IN  NUMBER
, p_tipo_task                      IN  VARCHAR2
, p_prioridade                     IN  task.prioridade%TYPE
, p_vetor_papel_id                 IN  LONG
, p_obs                            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            grupo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_tipo_item                      IN  item.tipo_item%TYPE
, p_grupo_old                      IN  item.grupo%TYPE
, p_grupo_new                      IN  item.grupo%TYPE
, p_flag_quebra_tipo               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            subgrupo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_tipo_item                      IN  item.tipo_item%TYPE
, p_grupo                          IN  item.grupo%TYPE
, p_subgrupo_old                   IN  item.subgrupo%TYPE
, p_subgrupo_new                   IN  item.subgrupo%TYPE
, p_flag_quebra_tipo               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            grupo_mover
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_tipo_item                      IN  item.tipo_item%TYPE
, p_grupo                          IN  item.grupo%TYPE
, p_direcao                        IN  VARCHAR2
, p_flag_quebra_tipo               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            subgrupo_mover
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_tipo_item                      IN  item.tipo_item%TYPE
, p_grupo                          IN  item.grupo%TYPE
, p_subgrupo                       IN  item.subgrupo%TYPE
, p_direcao                        IN  VARCHAR2
, p_flag_quebra_tipo               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            item_mover
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_item_id                        IN  item.item_id%TYPE
, p_direcao                        IN  VARCHAR2
, p_flag_quebra_tipo               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            num_seq_recalcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            totais_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            totais_recalcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_usuario
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_orcamento_id                   IN  orcam_usuario.orcamento_id%TYPE
, p_usuario_id                     IN  orcam_usuario.usuario_id%TYPE
, p_atuacao                        IN  orcam_usuario.atuacao%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_vetor_usuarios                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_orcamento_id                   IN  arquivo_orcamento.orcamento_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_tipo_arq_orcam                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_orcamento_id                   IN  arquivo_orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            saldos_acessorios_recalcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION             liberado_fatur_verificar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE)
RETURN   INTEGER;
--
--
FUNCTION             numero_formatar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             numero_formatar2 (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE)
RETURN   VARCHAR2;
--
--
FUNCTION             qtd_itens_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE)
RETURN   INTEGER;
--
--
FUNCTION             valor_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_tipo_item                      IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_outras_receitas_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_tipo_item                      IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_abat_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_tipo_item                      IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_cred_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_tipo_item                      IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_fornec_apagar_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE)
RETURN   NUMBER;
--
--
FUNCTION             valor_checkin_pend_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_tipo_item                      IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_geral_pend_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_tipo_item                      IN  VARCHAR2)
RETURN   NUMBER;
--
--
FUNCTION             valor_realizado_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_natureza_item                  IN  VARCHAR2,
  p_tipo_item                      IN  VARCHAR2)
RETURN NUMBER;
--
--
FUNCTION             valor_rentab_retornar (
  p_orcamento_id                   IN  orcamento.orcamento_id%TYPE,
  p_tipo_calculo                   IN  VARCHAR2)
RETURN NUMBER;
--
--
FUNCTION             parcelado_verificar (
  p_orcamento_id                  IN orcamento.orcamento_id%TYPE)
RETURN INTEGER;
--
--
FUNCTION             carta_acordo_ok_verificar (
  p_orcamento_id                  IN orcamento.orcamento_id%TYPE)
RETURN INTEGER;
--
END;  -- ORCAMENTO_PKG

/
--------------------------------------------------------
--  DDL for Package ORDEM_SERVICO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ORDEM_SERVICO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  ordem_servico.job_id%TYPE
, p_milestone_id                   IN  ordem_servico.milestone_id%TYPE
, p_tipo_os_id                     IN  tipo_os.tipo_os_id%TYPE
, p_descricao                      IN  ordem_servico.descricao%TYPE
, p_data_solicitada                IN  VARCHAR2
, p_hora_solicitada                IN  VARCHAR2
, p_texto_os                       IN  ordem_servico.texto_os%TYPE
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_vetor_tp_id                    IN  VARCHAR2
, p_vetor_tp_compl                 IN  VARCHAR2
, p_vetor_tp_desc                  IN  VARCHAR2
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_flag_com_estim                 IN  VARCHAR2
, p_ordem_servico_id               OUT ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_demais
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  ordem_servico.job_id%TYPE
, p_repet_grupo                    IN  item_crono.repet_grupo%TYPE
, p_tipo_os_id                     IN  tipo_os.tipo_os_id%TYPE
, p_descricao                      IN  ordem_servico.descricao%TYPE
, p_texto_os                       IN  ordem_servico.texto_os%TYPE
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_vetor_tp_id                    IN  VARCHAR2
, p_vetor_tp_compl                 IN  VARCHAR2
, p_vetor_tp_desc                  IN  VARCHAR2
, p_flag_com_estim                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            basico_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_milestone_id                   IN  ordem_servico.milestone_id%TYPE
, p_descricao                      IN  ordem_servico.descricao%TYPE
, p_num_estim                      IN  VARCHAR2
, p_data_entrada                   IN  VARCHAR2
, p_hora_entrada                   IN  VARCHAR2
, p_data_solicitada                IN  VARCHAR2
, p_hora_solicitada                IN  VARCHAR2
, p_data_interna                   IN  VARCHAR2
, p_hora_interna                   IN  VARCHAR2
, p_demanda                        IN  ordem_servico.demanda%TYPE
, p_data_demanda                   IN  VARCHAR2
, p_tamanho                        IN  ordem_servico.tamanho%TYPE
, p_os_evento_id                   IN  ordem_servico.os_evento_id%TYPE
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_complex_refacao                IN  os_evento.complex_refacao%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            corpo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_tipo_financeiro_id             IN  ordem_servico.tipo_financeiro_id%TYPE
, p_texto_os                       IN  ordem_servico.texto_os%TYPE
, p_vetor_atributo_id              IN  VARCHAR2
, p_vetor_atributo_valor           IN  CLOB
, p_vetor_flag_ignora_obrig        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            copiar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_old_id           IN  ordem_servico.ordem_servico_id%TYPE
, p_tipo_os_id                     IN  tipo_os.tipo_os_id%TYPE
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_vetor_arquivo_id               IN  VARCHAR2
, p_acao_executada                 IN  VARCHAR2
, p_ordem_servico_new_id           OUT ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            data_solic_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_data_solicitada                IN  VARCHAR2
, p_hora_solicitada                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            data_interna_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_data_interna                   IN  VARCHAR2
, p_hora_interna                   IN  VARCHAR2
, p_flag_atu_periodo               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tamanho_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_tamanho                        IN  ordem_servico.tamanho%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecados_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_vetor_enderecados              IN  VARCHAR2
, p_vetor_horas_planej             IN  VARCHAR2
, p_vetor_sequencia                IN  VARCHAR2
, p_tipo_ender                     IN  VARCHAR2
, p_flag_volta_status              IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            executores_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_data_inicio                    IN  VARCHAR2
, p_hora_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_hora_termino                   IN  VARCHAR2
, p_vetor_enderecados              IN  LONG
, p_vetor_datas                    IN  LONG
, p_vetor_horas                    IN  LONG
, p_flag_volta_status              IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fluxo_papel_desabilitar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_vetor_tipo_os_id               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fluxo_papel_habilitar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_vetor_tipo_os_id               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fluxo_aprov_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_tipo_aprov                     IN  VARCHAR2
, p_papel_id                       OUT papel.papel_id%TYPE
, p_seq_aprov                      OUT os_fluxo_aprov.seq_aprov%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2);
--
PROCEDURE            acao_executar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_cod_acao_os                    IN  VARCHAR2
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_complex_refacao                IN  os_evento.complex_refacao%TYPE
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_vetor_arquivo_id               IN  VARCHAR2
, p_vetor_os_link_id               IN  VARCHAR2
, p_vetor_usuario_id               IN  VARCHAR2
, p_vetor_tipo_notifica            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            concluir_cancelar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            concluir_em_massa
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_data_de                        IN  VARCHAR2
, p_data_ate                       IN  VARCHAR2
, p_status                         IN  VARCHAR2
, p_tipo_os_id                     IN  tipo_os.tipo_os_id%TYPE
, p_tipo_refacao                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_refacao_gravar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_usuario_executor_id            IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_usuario_executor_id            IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            retomar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_usuario_executor_id            IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            refazer_em_nova
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_complex_refacao                IN  os_evento.complex_refacao%TYPE
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_vetor_arquivo_id               IN  VARCHAR2
, p_vetor_os_link_id               IN  VARCHAR2
, p_ordem_servico_new_id           OUT ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            concluir_automatico;
--
PROCEDURE            custo_estimar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_custo_estim                    IN  VARCHAR2
, p_dias_estim                     IN  VARCHAR2
, p_obs_estim                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            estimativa_aprovar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_os_estim_id                    IN  ordem_servico.os_estim_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            estimativa_recusar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_os_estim_id                    IN  ordem_servico.os_estim_id%TYPE
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_complex_refacao                IN  os_evento.complex_refacao%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            lido_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nao_lido_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            metadados_validar
(
  p_usuario_sessao_id              IN  NUMBER
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            nota_aval_registrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_tipo_ender                     IN  VARCHAR2
, p_nota_aval                      IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_ordem_servico_id               IN  os_horas.ordem_servico_id%TYPE
, p_usuario_id                     IN  os_horas.usuario_id%TYPE
, p_cargo_id                       IN  os_horas.cargo_id%TYPE
, p_horas_planej                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_os_horas_id                    IN  os_horas.os_horas_id%TYPE
, p_horas_planej                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            horas_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_os_horas_id                    IN  os_horas.os_horas_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_ordem_servico_id               IN  arquivo_os.ordem_servico_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_thumb_arquivo_id               IN  arquivo.arquivo_id%TYPE
, p_thumb_volume_id                IN  arquivo.volume_id%TYPE
, p_thumb_nome_original            IN  arquivo.nome_original%TYPE
, p_thumb_nome_fisico              IN  arquivo.nome_fisico%TYPE
, p_thumb_mime_type                IN  arquivo.mime_type%TYPE
, p_thumb_tamanho                  IN  arquivo.tamanho%TYPE
, p_tipo_arq_os                    IN  arquivo_os.tipo_arq_os%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_ordem_servico_id               IN  arquivo_os.ordem_servico_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_ordem_servico_id               IN  arquivo_os.ordem_servico_id%TYPE
, p_flag_remover                   OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_mover
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_novo_tipo_arq_os               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_link_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_ordem_servico_id               IN  os_link.ordem_servico_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_url                            IN  VARCHAR2
, p_tipo_link                      IN  os_link.tipo_link%TYPE
, p_os_link_id                     OUT os_link.os_link_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_link_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_os_link_id                     IN  os_link.os_link_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_ordem_servico_id               IN  os_afazer.ordem_servico_id%TYPE
, p_usuario_resp_id                IN  os_afazer.usuario_resp_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_data                           IN  VARCHAR2
, p_os_afazer_id                   OUT os_afazer.os_afazer_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_os_afazer_id                   IN  os_afazer.os_afazer_id%TYPE
, p_usuario_resp_id                IN  os_afazer.usuario_resp_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_data                           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_feito_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_os_afazer_id                   IN  os_afazer.os_afazer_id%TYPE
, p_flag_feito                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_reordenar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_vetor_os_afazer_id             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_os_afazer_id                   IN  os_afazer.os_afazer_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_negociacao_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_ordem_servico_id               IN  os_link.ordem_servico_id%TYPE
, p_data_sugerida                  IN  VARCHAR2
, p_hora_sugerida                  IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_negociacao_aceitar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_ordem_servico_id               IN  os_link.ordem_servico_id%TYPE
, p_data_sugerida                  IN  VARCHAR2
, p_hora_sugerida                  IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipos_produtos_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipos_produtos_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  os_tipo_produto.ordem_servico_id%TYPE
, p_tipo_produto_id                IN  job_tipo_produto.tipo_produto_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_quantidade                     IN  VARCHAR2
, p_descricao                      IN  CLOB
, p_vetor_atributo_id              IN  VARCHAR2
, p_vetor_atributo_valor           IN  CLOB
, p_vetor_flag_ignora_obrig        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  os_tipo_produto.ordem_servico_id%TYPE
, p_job_tipo_produto_id            IN  job_tipo_produto.job_tipo_produto_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_quantidade                     IN  VARCHAR2
, p_descricao                      IN  CLOB
, p_vetor_atributo_id              IN  VARCHAR2
, p_vetor_atributo_valor           IN  CLOB
, p_vetor_flag_ignora_obrig        IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  os_tipo_produto.ordem_servico_id%TYPE
, p_job_tipo_produto_id            IN  os_tipo_produto.job_tipo_produto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_refacao_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_num_refacao                    IN  VARCHAR2
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_refacao_desmarcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_num_refacao                    IN  VARCHAR2
, p_vetor_job_tipo_produto         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fator_tempo_calcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            dias_calcular
(
  p_usuario_sessao_id              IN  NUMBER
, p_ordem_servico_id               IN  os_refacao.ordem_servico_id%TYPE
, p_num_refacao                    IN  os_refacao.num_refacao%TYPE
, p_flag_estim                     IN  os_refacao.flag_estim%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprovacao_autom_processar;
--
PROCEDURE            aval_cliente_registrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_nota_aval_cli                  IN  VARCHAR2
, p_coment_aval_cli                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            aprov_cliente_registrar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_flag_com_aval                  IN  VARCHAR2
, p_nota_aval_cli                  IN  VARCHAR2
, p_coment_aval_cli                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             atuacao_usuario_retornar (
  p_usuario_id                    IN usuario.usuario_id%TYPE,
  p_empresa_id                    IN empresa.empresa_id%TYPE,
  p_ordem_servico_id              IN ordem_servico.ordem_servico_id%TYPE)
RETURN VARCHAR2;
--
FUNCTION             enderecados_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE,
  p_tipo_ender                     IN  VARCHAR2,
  p_flag_marca_inativo             IN  VARCHAR2)
RETURN   VARCHAR2;
--
FUNCTION             com_usuarios_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             desc_evento_retornar (
  p_cod_acao                   IN  os_transicao.cod_acao%TYPE,
  p_status_de                  IN  os_transicao.status_de%TYPE,
  p_status_para                IN  os_transicao.status_para%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             dias_depend_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             tempo_exec_prev_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             tempo_exec_gasto_retornar (
  p_ordem_servico_id               IN  os_tipo_produto.ordem_servico_id%TYPE,
  p_tipo_produto_id                IN  job_tipo_produto.tipo_produto_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             descricao_retornar (
  p_ordem_servico_id               IN  os_tipo_produto.ordem_servico_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             ultima_os_retornar (
  p_job_tipo_produto_id            IN  job_tipo_produto.job_tipo_produto_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             ultimo_evento_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             horas_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE,
  p_papel_id                       IN  papel.papel_id%TYPE,
  p_nivel                          IN  usuario_cargo.nivel%TYPE,
  p_tipo                           IN  VARCHAR2)
RETURN   NUMBER;
--
FUNCTION             data_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE,
  p_tipo                           IN  VARCHAR2)
RETURN   DATE;
--
FUNCTION             data_status_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   DATE;
--
FUNCTION             data_apont_retornar (
  p_usuario_sessao_id              IN  NUMBER,
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE,
  p_tipo                           IN  VARCHAR2)
RETURN   DATE;
--
FUNCTION             numero_formatar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             nome_retornar (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             numero_formatar2 (
  p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             faixa_aprov_verificar (
  p_usuario_id                    IN usuario.usuario_id%TYPE,
  p_empresa_id                    IN empresa.empresa_id%TYPE,
  p_ordem_servico_id              IN ordem_servico.ordem_servico_id%TYPE)
RETURN INTEGER;
--
FUNCTION             faixa_aprov_id_retornar (
  p_usuario_id                    IN usuario.usuario_id%TYPE,
  p_empresa_id                    IN empresa.empresa_id%TYPE,
  p_ordem_servico_id              IN ordem_servico.ordem_servico_id%TYPE,
  p_tipo_aprov                    IN VARCHAR2)
RETURN NUMBER;
--
FUNCTION             fluxo_seq_ok_verificar (
  p_ordem_servico_id              IN ordem_servico.ordem_servico_id%TYPE,
  p_tipo_aprov                    IN VARCHAR2)
RETURN INTEGER;
--
FUNCTION             papel_priv_verificar (
    p_usuario_sessao_id           IN  usuario.usuario_id%TYPE,
    p_codigo_priv                 IN  privilegio.codigo%TYPE,
    p_papel_id                    IN  papel.papel_id%TYPE,
    p_ordem_servico_id            IN  ordem_servico.ordem_servico_id%TYPE)
RETURN INTEGER;
--
FUNCTION             preenchimento_ok_verificar (
  p_ordem_servico_id              IN ordem_servico.ordem_servico_id%TYPE)
RETURN INTEGER;
--
END;  -- ORDEM_SERVICO_PKG

/
--------------------------------------------------------
--  DDL for Package PAINEL_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PAINEL_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_autoria                        IN  VARCHAR2
, p_versao                         IN  VARCHAR2
, p_data_refer                     IN  VARCHAR2
, p_contato                        IN  VARCHAR2
, p_url                            IN  VARCHAR2
, p_origem                         IN  VARCHAR2
, p_abertura                       IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_painel_id                      OUT painel.painel_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_painel_id                      IN  painel.painel_id%TYPE
, p_nome                           IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_autoria                        IN  VARCHAR2
, p_versao                         IN  VARCHAR2
, p_data_refer                     IN  VARCHAR2
, p_contato                        IN  VARCHAR2
, p_url                            IN  VARCHAR2
, p_origem                         IN  VARCHAR2
, p_abertura                       IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_painel_id                      IN  painel.painel_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            padrao_papel_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_painel_id                      IN  painel.painel_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            papel_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_painel_id                      IN  painel.painel_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            papel_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_painel_id                      IN  painel.painel_id%TYPE
, p_papel_id                       IN  papel.papel_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_painel_id                      IN  painel.painel_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- PAINEL_PKG


/
--------------------------------------------------------
--  DDL for Package PAPEL_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PAPEL_PKG" IS
--
   PROCEDURE         adicionar (
    p_usuario_sessao_id                   IN  usuario.usuario_id%TYPE,
    p_empresa_id                          IN  empresa.empresa_id%TYPE,
    p_area_id                             IN  papel.area_id%TYPE,
    p_nome                                IN  papel.nome%TYPE,
    p_flag_ender                          IN  papel.flag_ender%TYPE,
    p_flag_auto_ender                     IN  papel.flag_auto_ender%TYPE,
    p_flag_auto_ender_ctr                 IN  papel.flag_auto_ender_ctr%TYPE,
    p_flag_auto_ender_oport               IN  papel.flag_auto_ender_oport%TYPE,
    p_flag_notif_ender                    IN  papel.flag_notif_ender%TYPE,
    p_flag_apontam_form                   IN  papel.flag_apontam_form%TYPE,
    p_ordem                               IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_v_geral        IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_v_somen        IN  VARCHAR2,
    p_flag_tipo_pessoa_v_todos            IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_c_geral        IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_c_somen        IN  VARCHAR2,
    p_flag_tipo_pessoa_c_todos            IN  VARCHAR2,
    p_vetor_configurar_priv_id            IN  VARCHAR2,
    p_vetor_oportun_priv_id               IN  VARCHAR2,
    p_vetor_oportunend_priv_id            IN  VARCHAR2,
    p_vetor_oportunend_abrang             IN  VARCHAR2,
    p_vetor_contrato_priv_id              IN  VARCHAR2,
    p_vetor_contratoend_priv_id           IN  VARCHAR2,
    p_vetor_contratoend_abrang            IN  VARCHAR2,
    p_vetor_job_priv_id                   IN  VARCHAR2,
    p_vetor_jobend_priv_id                IN  VARCHAR2,
    p_vetor_jobend_abrang                 IN  VARCHAR2, 
    p_vetor_orcend_priv_id                IN  VARCHAR2,
    p_vetor_orcend_abrang                 IN  VARCHAR2,    
    p_vetor_tipo_job_id                   IN  VARCHAR2,
    p_vetor_tipo_financeiro_id            IN  VARCHAR2,
    p_vetor_enderecar_area_id             IN  VARCHAR2,
    p_vetor_enderecar_abrang              IN  VARCHAR2,
    p_vetor_entrega_priv_id               IN  VARCHAR2,
    p_vetor_entrega_tipo_os_id            IN  VARCHAR2,
    p_vetor_entrega_abrang                IN  VARCHAR2,
    p_vetor_monitorar_priv_id             IN  VARCHAR2,
    p_vetor_analisar_priv_id              IN  VARCHAR2,
    p_vetor_docum_priv_id                 IN  VARCHAR2,
    p_vetor_docum_tipo_doc_id             IN  VARCHAR2,
    p_vetor_docum_abrang                  IN  VARCHAR2,
    p_vetor_apontam_priv_id               IN  VARCHAR2,
    p_vetor_navegacao_priv_id             IN  VARCHAR2,
    p_vetor_painel_id                     IN  VARCHAR2,
    p_painel_pdr_id                       IN  VARCHAR2,
    p_erro_cod                            OUT VARCHAR2,
    p_erro_msg                            OUT VARCHAR2);
--
   PROCEDURE         atualizar (
    p_usuario_sessao_id                   IN  usuario.usuario_id%TYPE,
    p_empresa_id                          IN  empresa.empresa_id%TYPE,
    p_papel_id                            IN  papel.papel_id%TYPE,
    p_area_id                             IN  papel.area_id%TYPE,
    p_nome                                IN  papel.nome%TYPE,
    p_flag_ender                          IN  papel.flag_ender%TYPE,
    p_flag_auto_ender                     IN  papel.flag_auto_ender%TYPE,
    p_flag_auto_ender_ctr                 IN  papel.flag_auto_ender_ctr%TYPE,
    p_flag_auto_ender_oport               IN  papel.flag_auto_ender_oport%TYPE,
    p_flag_notif_ender                    IN  papel.flag_notif_ender%TYPE,
    p_flag_apontam_form                   IN  papel.flag_apontam_form%TYPE,
    p_ordem                               IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_v_geral        IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_v_somen        IN  VARCHAR2,
    p_flag_tipo_pessoa_v_todos            IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_c_geral        IN  VARCHAR2,
    p_vetor_tipo_pessoa_id_c_somen        IN  VARCHAR2,
    p_flag_tipo_pessoa_c_todos            IN  VARCHAR2,
    p_vetor_configurar_priv_id            IN  VARCHAR2,
    p_vetor_oportun_priv_id               IN  VARCHAR2,
    p_vetor_oportunend_priv_id            IN  VARCHAR2,
    p_vetor_oportunend_abrang             IN  VARCHAR2,
    p_vetor_contrato_priv_id              IN  VARCHAR2,
    p_vetor_contratoend_priv_id           IN  VARCHAR2,
    p_vetor_contratoend_abrang            IN  VARCHAR2,
    p_vetor_job_priv_id                   IN  VARCHAR2,
    p_vetor_jobend_priv_id                IN  VARCHAR2,
    p_vetor_jobend_abrang                 IN  VARCHAR2, 
    p_vetor_orcend_priv_id                IN  VARCHAR2,
    p_vetor_orcend_abrang                 IN  VARCHAR2,    
    p_vetor_tipo_job_id                   IN  VARCHAR2,
    p_vetor_tipo_financeiro_id            IN  VARCHAR2,
    p_vetor_enderecar_area_id             IN  VARCHAR2,
    p_vetor_enderecar_abrang              IN  VARCHAR2,
    p_vetor_entrega_priv_id               IN  VARCHAR2,
    p_vetor_entrega_tipo_os_id            IN  VARCHAR2,
    p_vetor_entrega_abrang                IN  VARCHAR2,
    p_vetor_monitorar_priv_id             IN  VARCHAR2,
    p_vetor_analisar_priv_id              IN  VARCHAR2,
    p_vetor_docum_priv_id                 IN  VARCHAR2,
    p_vetor_docum_tipo_doc_id             IN  VARCHAR2,
    p_vetor_docum_abrang                  IN  VARCHAR2,
    p_vetor_apontam_priv_id               IN  VARCHAR2,
    p_vetor_navegacao_priv_id             IN  VARCHAR2,
    p_vetor_painel_id                     IN  VARCHAR2,
    p_painel_pdr_id                       IN  VARCHAR2,
    p_erro_cod                            OUT VARCHAR2,
    p_erro_msg                            OUT VARCHAR2);
--
   PROCEDURE         excluir   (
    p_usuario_sessao_id                   IN  usuario.usuario_id%TYPE,
    p_empresa_id                          IN  empresa.empresa_id%TYPE,
    p_papel_id                            IN  papel.papel_id%TYPE,
    p_erro_cod                            OUT VARCHAR2,
    p_erro_msg                            OUT VARCHAR2);
--
   PROCEDURE         copiar (
    p_usuario_sessao_id                   IN  usuario.usuario_id%TYPE,
    p_empresa_id                          IN  empresa.empresa_id%TYPE,
    p_papel_id                            IN  papel.papel_id%TYPE,
    p_erro_cod                            OUT VARCHAR2,
    p_erro_msg                            OUT VARCHAR2);
--
PROCEDURE            xml_gerar
(
  p_papel_id                       IN  papel.papel_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END papel_pkg;


/
--------------------------------------------------------
--  DDL for Package PARCELA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PARCELA_PKG" 
IS
--
PROCEDURE            arredondar
(
  p_usuario_sessao_id              IN  NUMBER,
  p_item_id                        IN  item.item_id%TYPE,
  p_erro_cod                       OUT VARCHAR2,
  p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            parcelado_marcar
(
  p_usuario_sessao_id              IN  NUMBER,
  p_item_id                        IN  item.item_id%TYPE,
  p_erro_cod                       OUT VARCHAR2,
  p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            simular (
    p_usuario_sessao_id            IN  NUMBER,
    p_empresa_id                   IN  empresa.empresa_id%TYPE,
    p_job_id                       IN  job.job_id%TYPE,
    p_vetor_item_id                IN  VARCHAR2,
    p_condicao_pagto_id            IN  condicao_pagto.condicao_pagto_id%TYPE,
    p_vetor_num_parcela            OUT VARCHAR2,
    p_vetor_data                   OUT VARCHAR2,
    p_vetor_dia_semana             OUT VARCHAR2,
    p_vetor_perc                   OUT VARCHAR2,
    p_vetor_valor                  OUT VARCHAR2,
    p_erro_cod                     OUT VARCHAR2,
    p_erro_msg                     OUT VARCHAR2);
--
PROCEDURE            simulacao_gravar (
    p_usuario_sessao_id            IN  NUMBER,
    p_empresa_id                   IN  empresa.empresa_id%TYPE,
    p_job_id                       IN  job.job_id%TYPE,
    p_vetor_item_id                IN  VARCHAR2,
    p_vetor_datas                  IN  VARCHAR2,
    p_vetor_perc                   IN  VARCHAR2,
    p_erro_cod                     OUT VARCHAR2,
    p_erro_msg                     OUT VARCHAR2);
--
PROCEDURE            atualizar (
    p_usuario_sessao_id            IN  NUMBER,
    p_empresa_id                   IN  empresa.empresa_id%TYPE,
    p_item_id                      IN  item.item_id%TYPE,
    p_vetor_cli_valor              IN  VARCHAR2,
    p_vetor_cli_data               IN  VARCHAR2,
    p_vetor_for_valor              IN  VARCHAR2,
    p_vetor_for_data               IN  VARCHAR2,
    p_erro_cod                     OUT VARCHAR2,
    p_erro_msg                     OUT VARCHAR2);
--
PROCEDURE            desparcelar
(
  p_usuario_sessao_id              IN  NUMBER,
  p_empresa_id                   IN  empresa.empresa_id%TYPE,
  p_item_id                        IN  item.item_id%TYPE,
  p_erro_cod                       OUT VARCHAR2,
  p_erro_msg                       OUT VARCHAR2
);
--
END; -- PARCELA_PKG


/
--------------------------------------------------------
--  DDL for Package PESQUISA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PESQUISA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  pesquisa.nome%TYPE
, p_arquivo                        IN  VARCHAR2
, p_url                            IN  VARCHAR2
, p_flag_publico                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pesquisa_id                    IN  pesquisa.pesquisa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- PESQUISA_PKG


/
--------------------------------------------------------
--  DDL for Package PESSOA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PESSOA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_pai_id                  IN  pessoa.pessoa_id%TYPE
, p_apelido                        IN  pessoa.apelido%TYPE
, p_nome                           IN  pessoa.nome%TYPE
, p_flag_pessoa_jur                IN  VARCHAR2
, p_flag_simples                   IN  VARCHAR2
, p_flag_cpom                      IN  VARCHAR2
, p_cnpj                           IN  pessoa.cnpj%TYPE
, p_inscr_estadual                 IN  pessoa.inscr_estadual%TYPE
, p_inscr_municipal                IN  pessoa.inscr_municipal%TYPE
, p_inscr_inss                     IN  pessoa.inscr_inss%TYPE
, p_cpf                            IN  pessoa.cpf%TYPE
, p_rg                             IN  pessoa.rg%TYPE
, p_rg_org_exp                     IN  pessoa.rg_org_exp%TYPE
, p_rg_uf                          IN  pessoa.rg_uf%TYPE
, p_rg_data_exp                    IN  VARCHAR2
, p_sexo                           IN  pessoa.sexo%TYPE
, p_data_nasc                      IN  VARCHAR2
, p_estado_civil                   IN  pessoa.estado_civil%TYPE
, p_funcao                         IN  pessoa.funcao%TYPE
, p_flag_sem_docum                 IN  VARCHAR2
, p_endereco                       IN  pessoa.endereco%TYPE
, p_num_ender                      IN  pessoa.num_ender%TYPE
, p_compl_ender                    IN  pessoa.compl_ender%TYPE
, p_bairro                         IN  pessoa.bairro%TYPE
, p_cep                            IN  pessoa.cep%TYPE
, p_cidade                         IN  pessoa.cidade%TYPE
, p_uf                             IN  pessoa.uf%TYPE
, p_pais                           IN  pessoa.pais%TYPE
, p_website                        IN  pessoa.website%TYPE
, p_email                          IN  pessoa.email%TYPE
, p_ddd_telefone                   IN  pessoa.ddd_telefone%TYPE
, p_num_telefone                   IN  pessoa.num_telefone%TYPE
, p_num_ramal                      IN  pessoa.num_ramal%TYPE
, p_ddd_fax                        IN  pessoa.ddd_fax%TYPE
, p_num_fax                        IN  pessoa.num_fax%TYPE
, p_ddd_celular                    IN  pessoa.ddd_celular%TYPE
, p_num_celular                    IN  pessoa.num_celular%TYPE
, p_obs                            IN  pessoa.obs%TYPE
, p_fi_banco_id                    IN  pessoa.fi_banco_id%TYPE
, p_num_agencia                    IN  pessoa.num_agencia%TYPE
, p_num_conta                      IN  pessoa.num_conta%TYPE
, p_tipo_conta                     IN  pessoa.tipo_conta%TYPE
, p_nome_titular                   IN  pessoa.nome_titular%TYPE
, p_cnpj_cpf_titular               IN  pessoa.cnpj_cpf_titular%TYPE
, p_vetor_tipo_pessoa              IN  VARCHAR2
, p_vetor_natureza_item_id         IN  VARCHAR2
, p_vetor_valor_padrao             IN  VARCHAR2
, p_num_dias_fatur                 IN  VARCHAR2
, p_tipo_num_dias_fatur            IN  pessoa.tipo_num_dias_fatur%TYPE
, p_perc_bv                        IN  VARCHAR2
, p_tipo_fatur_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_flag_fornec_homolog            IN  VARCHAR2
, p_desc_servicos                  IN  VARCHAR2
, p_flag_fornec_interno            IN  VARCHAR2
, p_flag_emp_resp                  IN  VARCHAR2
, p_flag_emp_fatur                 IN  VARCHAR2
, p_flag_pago_cliente              IN  VARCHAR2
, p_cod_job                        IN  pessoa.cod_job%TYPE
, p_num_primeiro_job               IN  VARCHAR2
, p_data_entrada_agencia           IN  VARCHAR2
, p_emp_resp_pdr_id                IN  pessoa.emp_resp_pdr_id%TYPE
, p_emp_fatur_pdr_id               IN  pessoa.emp_fatur_pdr_id%TYPE
, p_setor_id                       IN  pessoa.setor_id%TYPE
, p_cod_ext_pessoa                 IN  VARCHAR2
, p_cod_ext_resp                   IN  VARCHAR2
, p_cod_ext_fatur                  IN  VARCHAR2
, p_tipo_publ_priv                 IN  VARCHAR2
, p_flag_obriga_email              IN  VARCHAR2
, p_flag_testa_codjob              IN  VARCHAR2
, p_pessoa_id                      OUT pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            basico_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_incluir                   IN  VARCHAR2
, p_apelido                        IN  pessoa.apelido%TYPE
, p_nome                           IN  pessoa.nome%TYPE
, p_flag_simples                   IN  VARCHAR2
, p_flag_cpom                      IN  VARCHAR2
, p_cnpj                           IN  pessoa.cnpj%TYPE
, p_inscr_estadual                 IN  pessoa.inscr_estadual%TYPE
, p_inscr_municipal                IN  pessoa.inscr_municipal%TYPE
, p_inscr_inss                     IN  pessoa.inscr_inss%TYPE
, p_endereco                       IN  pessoa.endereco%TYPE
, p_num_ender                      IN  pessoa.num_ender%TYPE
, p_compl_ender                    IN  pessoa.compl_ender%TYPE
, p_bairro                         IN  pessoa.bairro%TYPE
, p_cep                            IN  pessoa.cep%TYPE
, p_cidade                         IN  pessoa.cidade%TYPE
, p_uf                             IN  pessoa.uf%TYPE
, p_obs                            IN  pessoa.obs%TYPE
, p_fi_banco_id                    IN  pessoa.fi_banco_id%TYPE
, p_num_agencia                    IN  pessoa.num_agencia%TYPE
, p_num_conta                      IN  pessoa.num_conta%TYPE
, p_tipo_conta                     IN  pessoa.tipo_conta%TYPE
, p_nome_titular                   IN  pessoa.nome_titular%TYPE
, p_cnpj_cpf_titular               IN  pessoa.cnpj_cpf_titular%TYPE
, p_perc_bv                        IN  VARCHAR2
, p_tipo_fatur_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_pessoa_id                      OUT pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_apelido                        IN  pessoa.apelido%TYPE
, p_nome                           IN  pessoa.nome%TYPE
, p_flag_pessoa_jur                IN  VARCHAR2
, p_flag_simples                   IN  VARCHAR2
, p_flag_cpom                      IN  VARCHAR2
, p_cnpj                           IN  pessoa.cnpj%TYPE
, p_inscr_estadual                 IN  pessoa.inscr_estadual%TYPE
, p_inscr_municipal                IN  pessoa.inscr_municipal%TYPE
, p_inscr_inss                     IN  pessoa.inscr_inss%TYPE
, p_cpf                            IN  pessoa.cpf%TYPE
, p_rg                             IN  pessoa.rg%TYPE
, p_rg_org_exp                     IN  pessoa.rg_org_exp%TYPE
, p_rg_uf                          IN  pessoa.rg_uf%TYPE
, p_rg_data_exp                    IN  VARCHAR2
, p_sexo                           IN  pessoa.sexo%TYPE
, p_data_nasc                      IN  VARCHAR2
, p_estado_civil                   IN  pessoa.estado_civil%TYPE
, p_funcao                         IN  pessoa.funcao%TYPE
, p_flag_sem_docum                 IN  VARCHAR2
, p_endereco                       IN  pessoa.endereco%TYPE
, p_num_ender                      IN  pessoa.num_ender%TYPE
, p_compl_ender                    IN  pessoa.compl_ender%TYPE
, p_bairro                         IN  pessoa.bairro%TYPE
, p_cep                            IN  pessoa.cep%TYPE
, p_cidade                         IN  pessoa.cidade%TYPE
, p_uf                             IN  pessoa.uf%TYPE
, p_pais                           IN  pessoa.pais%TYPE
, p_website                        IN  pessoa.website%TYPE
, p_email                          IN  pessoa.email%TYPE
, p_ddd_telefone                   IN  pessoa.ddd_telefone%TYPE
, p_num_telefone                   IN  pessoa.num_telefone%TYPE
, p_num_ramal                      IN  pessoa.num_ramal%TYPE
, p_ddd_fax                        IN  pessoa.ddd_fax%TYPE
, p_num_fax                        IN  pessoa.num_fax%TYPE
, p_ddd_celular                    IN  pessoa.ddd_celular%TYPE
, p_num_celular                    IN  pessoa.num_celular%TYPE
, p_obs                            IN  pessoa.obs%TYPE
, p_fi_banco_id                    IN  pessoa.fi_banco_id%TYPE
, p_num_agencia                    IN  pessoa.num_agencia%TYPE
, p_num_conta                      IN  pessoa.num_conta%TYPE
, p_tipo_conta                     IN  pessoa.tipo_conta%TYPE
, p_nome_titular                   IN  pessoa.nome_titular%TYPE
, p_cnpj_cpf_titular               IN  pessoa.cnpj_cpf_titular%TYPE
, p_vetor_tipo_pessoa              IN  VARCHAR2
, p_vetor_natureza_item_id         IN  VARCHAR2
, p_vetor_valor_padrao             IN  VARCHAR2
, p_num_dias_fatur                 IN  VARCHAR2
, p_tipo_num_dias_fatur            IN  pessoa.tipo_num_dias_fatur%TYPE
, p_perc_bv                        IN  VARCHAR2
, p_tipo_fatur_bv                  IN  VARCHAR2
, p_perc_imposto                   IN  VARCHAR2
, p_flag_fornec_homolog            IN  VARCHAR2
, p_desc_servicos                  IN  VARCHAR2
, p_flag_fornec_interno            IN  VARCHAR2
, p_flag_emp_resp                  IN  VARCHAR2
, p_flag_emp_fatur                 IN  VARCHAR2
, p_flag_pago_cliente              IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_cod_job                        IN  pessoa.cod_job%TYPE
, p_num_primeiro_job               IN  VARCHAR2
, p_data_entrada_agencia           IN  VARCHAR2
, p_emp_resp_pdr_id                IN  pessoa.emp_resp_pdr_id%TYPE
, p_emp_fatur_pdr_id               IN  pessoa.emp_fatur_pdr_id%TYPE
, p_setor_id                       IN  pessoa.setor_id%TYPE
, p_cod_ext_pessoa                 IN  VARCHAR2
, p_cod_ext_resp                   IN  VARCHAR2
, p_cod_ext_fatur                  IN  VARCHAR2
, p_tipo_publ_priv                 IN  VARCHAR2
, p_flag_obriga_email              IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            perfil_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_data_nasc                      IN  VARCHAR2
, p_ddd_celular                    IN  pessoa.ddd_celular%TYPE
, p_num_celular                    IN  pessoa.num_celular%TYPE
, p_num_ramal                      IN  pessoa.num_ramal%TYPE
, p_flag_notifica_email            IN  usuario.flag_notifica_email%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            coordenadas_atualizar
(
  p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_longitude                      IN  VARCHAR2
, p_latitude                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  arquivo_pessoa.pessoa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_thumb1_arquivo_id              IN  arquivo.arquivo_id%TYPE
, p_thumb1_volume_id               IN  arquivo.volume_id%TYPE
, p_thumb1_nome_original           IN  arquivo.nome_original%TYPE
, p_thumb1_nome_fisico             IN  arquivo.nome_fisico%TYPE
, p_thumb1_mime_type               IN  arquivo.mime_type%TYPE
, p_thumb1_tamanho                 IN  arquivo.tamanho%TYPE
, p_thumb2_arquivo_id              IN  arquivo.arquivo_id%TYPE
, p_thumb2_volume_id               IN  arquivo.volume_id%TYPE
, p_thumb2_nome_original           IN  arquivo.nome_original%TYPE
, p_thumb2_nome_fisico             IN  arquivo.nome_fisico%TYPE
, p_thumb2_mime_type               IN  arquivo.mime_type%TYPE
, p_thumb2_tamanho                 IN  arquivo.tamanho%TYPE
, p_thumb3_arquivo_id              IN  arquivo.arquivo_id%TYPE
, p_thumb3_volume_id               IN  arquivo.volume_id%TYPE
, p_thumb3_nome_original           IN  arquivo.nome_original%TYPE
, p_thumb3_nome_fisico             IN  arquivo.nome_fisico%TYPE
, p_thumb3_mime_type               IN  arquivo.mime_type%TYPE
, p_thumb3_tamanho                 IN  arquivo.tamanho%TYPE
, p_tipo_arq_pessoa                IN  arquivo_pessoa.tipo_arq_pessoa%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            associar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_pai_id                  IN  pessoa.pessoa_id%TYPE
, p_pessoa_filho_id                IN  pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            desassociar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_pai_id                  IN  pessoa.pessoa_id%TYPE
, p_pessoa_filho_id                IN  pessoa.pessoa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            impostos_nfe_configurar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_valor_faixa_retencao           IN  VARCHAR2
, p_vetor_tipo_imposto_id          IN  VARCHAR2
, p_vetor_aliquota                 IN  VARCHAR2
, p_vetor_pessoa_iss_id            IN  VARCHAR2
, p_vetor_aliquota_iss             IN  VARCHAR2
, p_vetor_flag_reter_iss           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            iss_nfe_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_nome_servico                   IN  fi_tipo_imposto_pessoa.nome_servico%TYPE
, p_perc_imposto                   IN  VARCHAR2
, p_flag_reter                     IN  fi_tipo_imposto_pessoa.flag_reter%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa_servico.pessoa_id%TYPE
, p_servico_id                     IN  pessoa_servico.servico_id%TYPE
, p_cod_ext_servico                IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            servico_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa_servico.pessoa_id%TYPE
, p_servico_id                     IN  pessoa_servico.servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            config_oper_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_flag_cli_aprov_os              IN  VARCHAR2
, p_flag_cli_aval_os               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            email_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_email                          IN  pessoa.email%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             perc_imposto_retornar (
 p_pessoa_id                      IN  pessoa.pessoa_id%TYPE,
 p_fi_tipo_imposto_id             IN  fi_tipo_imposto.fi_tipo_imposto_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             pai_retornar (
 p_pessoa_id                      IN  pessoa.pessoa_id%TYPE,
 p_tipo_retorno                   IN  VARCHAR2)
RETURN   VARCHAR2;
--
FUNCTION             tipo_verificar (
 p_pessoa_id                      IN  pessoa.pessoa_id%TYPE,
 p_tipo_pessoa                    IN  VARCHAR2)
RETURN   INTEGER;
--
FUNCTION             dados_integr_verificar (
 p_pessoa_id                      IN  pessoa.pessoa_id%TYPE)
RETURN   INTEGER;
--
FUNCTION             saldo_do_dia_retornar (
 p_pessoa_id                       IN  pessoa.pessoa_id%TYPE,
 p_data                            IN  DATE)
RETURN NUMBER;
--
FUNCTION             cnpj_raiz_retornar (
 p_pessoa_id                      IN  pessoa.pessoa_id%TYPE,
 p_empresa_id                     IN  empresa.empresa_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             cod_sist_ext_retornar (
 p_pessoa_id                      IN  pessoa.pessoa_id%TYPE,
 p_cod_tipo_pessoa                IN  tipo_pessoa.codigo%TYPE,
 p_cod_sist_ext                   IN  sistema_externo.codigo%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             nivel_excelencia_retornar (
 p_pessoa_id                       IN  pessoa.pessoa_id%TYPE)
RETURN NUMBER;
--
FUNCTION             nivel_parceria_retornar (
 p_pessoa_id                       IN  pessoa.pessoa_id%TYPE)
RETURN NUMBER;
--
FUNCTION             unid_negocio_retornar (
 p_cliente_id                      IN  pessoa.pessoa_id%TYPE,
 p_job_id                          IN  job.job_id%TYPE,
 p_usuario_id                      IN  usuario.usuario_id%TYPE)
--
RETURN NUMBER;
--
PROCEDURE            cadastro_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_flag_cad_verif                 IN  pessoa.flag_cad_verif%TYPE
, p_coment_cad_verifi              IN  pessoa.coment_cad_verif%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            info_fiscal_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_pessoa_id                      IN  pessoa.pessoa_id%TYPE
, p_flag_fis_verif                 IN  pessoa.flag_fis_verif%TYPE
, p_status_fis_verif               IN  pessoa.status_fis_verif%TYPE
, p_coment_fis_verif               IN  pessoa.coment_fis_verif%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- PESSOA_PKG

/
--------------------------------------------------------
--  DDL for Package PRECO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRECO_PKG" IS
--
--
PROCEDURE tab_preco_adicionar
(
  p_usuario_sessao_id     IN NUMBER
 ,p_empresa_id            IN empresa.empresa_id%TYPE
 ,p_cliente_id            IN tab_preco.cliente_id%TYPE
 ,p_grupo_id              IN tab_preco.grupo_id%TYPE
 ,p_nome                  IN tab_preco.nome%TYPE
 ,p_tabela_preco_base_id  IN tab_preco.tabela_preco_base_id%TYPE
 ,p_data_referencia       IN VARCHAR2
 ,p_data_validade         IN VARCHAR2
 ,p_flag_padrao           IN tab_preco.flag_padrao%TYPE
 ,p_perc_acres_cargo      IN VARCHAR2
 ,p_perc_acres_tipo_prod  IN VARCHAR2
 ,p_erro_cod              OUT VARCHAR2
 ,p_erro_msg              OUT VARCHAR2
);
--
--
PROCEDURE tab_preco_alterar
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_preco_id          IN tab_preco.preco_id%TYPE
 ,p_cliente_id        IN tab_preco.cliente_id%TYPE
 ,p_grupo_id          IN tab_preco.grupo_id%TYPE
 ,p_nome              IN tab_preco.nome%TYPE
 ,p_data_referencia   IN VARCHAR2
 ,p_data_validade     IN VARCHAR2
 ,p_flag_pode_precif  IN tab_preco.flag_pode_precif%TYPE
 ,p_flag_pode_ganhar  IN tab_preco.flag_pode_ganhar%TYPE
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);

--
--
PROCEDURE tab_preco_excluir
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_preco_id          IN tab_preco.preco_id%TYPE
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE tab_preco_acao_arquivo
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_preco_id          IN tab_preco.preco_id%TYPE
 ,p_acao              IN VARCHAR2
 ,p_flag_commit       IN VARCHAR2
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE salario_cargo_vincular
(
  p_usuario_sessao_id    IN NUMBER
 ,p_empresa_id           IN empresa.empresa_id%TYPE
 ,p_cargo_id             IN cargo.cargo_id%TYPE
 ,p_vetor_preco_id       IN VARCHAR2
 ,p_vetor_nivel          IN VARCHAR2
 ,p_vetor_faixa_salarial IN VARCHAR2
 ,p_vetor_beneficio      IN VARCHAR2
 ,p_vetor_encargo        IN VARCHAR2
 ,p_vetor_dissidio       IN VARCHAR2
 ,p_vetor_overhead       IN VARCHAR2
 ,p_vetor_custo_hora     IN VARCHAR2
 ,p_vetor_custo_mensal   IN VARCHAR2
 ,p_vetor_venda_hora     IN VARCHAR2
 ,p_vetor_margem_hora    IN VARCHAR2
 ,p_erro_cod             OUT VARCHAR2
 ,p_erro_msg             OUT VARCHAR2
);
--
--
PROCEDURE salario_cargo_associar
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_preco_id          IN tab_preco.preco_id%TYPE
 ,p_cargo_id          IN cargo.cargo_id%TYPE
 ,p_flag_commit       IN VARCHAR2
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE salario_cargo_desassociar
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_preco_id          IN tab_preco.preco_id%TYPE
 ,p_cargo_id          IN cargo.cargo_id%TYPE
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE salario_cargo_alterar
(
  p_usuario_sessao_id    IN NUMBER
 ,p_empresa_id           IN empresa.empresa_id%TYPE
 ,p_cargo_id             IN cargo.cargo_id%TYPE
 ,p_preco_id             IN tab_preco.preco_id%TYPE
 ,p_nome_alternativo     IN VARCHAR2
 ,p_vetor_nivel          IN VARCHAR2
 ,p_vetor_faixa_salarial IN VARCHAR2
 ,p_vetor_beneficio      IN VARCHAR2
 ,p_vetor_encargo        IN VARCHAR2
 ,p_vetor_dissidio       IN VARCHAR2
 ,p_vetor_overhead       IN VARCHAR2
 ,p_vetor_custo_hora     IN VARCHAR2
 ,p_vetor_custo_mensal   IN VARCHAR2
 ,p_vetor_venda_hora     IN VARCHAR2
 ,p_vetor_margem_hora    IN VARCHAR2
 ,p_erro_cod             OUT VARCHAR2
 ,p_erro_msg             OUT VARCHAR2
);
--
--
PROCEDURE tab_preco_percent
(
  p_usuario_sessao_id    IN NUMBER
 ,p_empresa_id           IN empresa.empresa_id%TYPE
 ,p_preco_id             IN tab_preco.preco_id%TYPE
 ,p_perc_acres_cargo     IN VARCHAR2
 ,p_perc_acres_tipo_prod IN VARCHAR2
 ,p_flag_commit          IN VARCHAR2
 ,p_erro_cod             OUT VARCHAR2
 ,p_erro_msg             OUT VARCHAR2
);
--
--
PROCEDURE tipo_produto_vincular
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_tipo_produto_id   IN tipo_produto.tipo_produto_id%TYPE
 ,p_vetor_preco_id    IN VARCHAR2
 ,p_custo             VARCHAR2
 ,p_preco             VARCHAR2
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE tipo_produto_preco_associar
(
  p_usuario_sessao_id     IN NUMBER
 ,p_empresa_id            IN empresa.empresa_id%TYPE
 ,p_preco_id              IN tab_preco.preco_id%TYPE
 ,p_tipo_produto_id       IN tipo_produto.tipo_produto_id%TYPE
 ,p_flag_commit           IN VARCHAR2
 ,p_erro_cod              OUT VARCHAR2
 ,p_erro_msg              OUT VARCHAR2
);
--
--
PROCEDURE tipo_produto_preco_desassociar
(
  p_usuario_sessao_id    IN NUMBER
, p_empresa_id           IN empresa.empresa_id%TYPE
, p_preco_id             IN tab_preco.preco_id%TYPE
, p_tipo_produto_id      IN tipo_produto.tipo_produto_id%TYPE
, p_erro_cod             OUT VARCHAR2
, p_erro_msg             OUT VARCHAR2
);
--
--
PROCEDURE tipo_produto_preco_alterar
(
  p_usuario_sessao_id IN NUMBER
 ,p_empresa_id        IN empresa.empresa_id%TYPE
 ,p_tipo_produto_id   IN tipo_produto.tipo_produto_id%TYPE
 ,p_preco_id          IN tab_preco.preco_id%TYPE
 ,p_custo             IN VARCHAR2
 ,p_preco             IN VARCHAR2
 ,p_erro_cod          OUT VARCHAR2
 ,p_erro_msg          OUT VARCHAR2
);
--
--
PROCEDURE xml_gerar
(
  p_preco_id IN tab_preco.preco_id%TYPE,
  p_xml      OUT CLOB,
  p_erro_cod OUT VARCHAR2,
  p_erro_msg OUT VARCHAR2
);
END; -- PRECO_PKG

/
--------------------------------------------------------
--  DDL for Package PRODUTO_CLIENTE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRODUTO_CLIENTE_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_pessoa_id                      IN  produto_cliente.pessoa_id%TYPE
, p_nome                           IN  produto_cliente.nome%TYPE
, p_produto_cliente_id             OUT produto_cliente.produto_cliente_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_produto_cliente_id             IN  produto_cliente.produto_cliente_id%TYPE
, p_nome                           IN  produto_cliente.nome%TYPE
, p_flag_ativo                     IN  produto_cliente.flag_ativo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_produto_cliente_id             IN  produto_cliente.produto_cliente_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- PRODUTO_CLIENTE_PKG


/
--------------------------------------------------------
--  DDL for Package PRODUTO_FISCAL_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRODUTO_FISCAL_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  produto_fiscal.nome%TYPE
, p_categoria                      IN  produto_fiscal.categoria%TYPE
, p_cod_ext_produto                IN  produto_fiscal.cod_ext_produto%TYPE
, p_flag_ativo                     IN  produto_fiscal.flag_ativo%TYPE
, p_produto_fiscal_id              OUT produto_fiscal.produto_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_produto_fiscal_id              IN  produto_fiscal.produto_fiscal_id%TYPE
, p_nome                           IN  produto_fiscal.nome%TYPE
, p_categoria                      IN  produto_fiscal.categoria%TYPE
, p_cod_ext_produto                IN  produto_fiscal.cod_ext_produto%TYPE
, p_flag_ativo                     IN  produto_fiscal.flag_ativo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_produto_fiscal_id              IN  produto_fiscal.produto_fiscal_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_produto_fiscal_id              IN  produto_fiscal.produto_fiscal_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- PRODUTO_FISCAL_PKG


/
--------------------------------------------------------
--  DDL for Package QUADRO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "QUADRO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  VARCHAR2
, p_quadro_id                      OUT quadro.quadro_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_id                      IN  quadro.quadro_id%TYPE
, p_nome                           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_id                      IN  quadro.quadro_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            equipe_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_id                      IN  quadro.quadro_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            equipe_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_id                      IN  quadro.quadro_id%TYPE
, p_equipe_id                      IN  equipe.equipe_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            coluna_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_id                      IN  quadro.quadro_id%TYPE
, p_nome                           IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            coluna_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_coluna_id               IN  quadro_coluna.quadro_coluna_id%TYPE
, p_nome                           IN  VARCHAR2
, p_ordem                          IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            coluna_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_coluna_id               IN  quadro_coluna.quadro_coluna_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            config_os_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_coluna_id               IN  quadro_os_config.quadro_coluna_id%TYPE
, p_tipo_os_id                     IN  quadro_os_config.tipo_os_id%TYPE
, p_status                         IN  quadro_os_config.status%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            config_os_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_coluna_id               IN  quadro_os_config.quadro_coluna_id%TYPE
, p_tipo_os_id                     IN  quadro_os_config.tipo_os_id%TYPE
, p_status                         IN  quadro_os_config.status%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            config_tarefa_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_coluna_id               IN  quadro_tarefa_config.quadro_coluna_id%TYPE
, p_status                         IN  quadro_tarefa_config.status%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            config_tarefa_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_quadro_coluna_id               IN  quadro_tarefa_config.quadro_coluna_id%TYPE
, p_status                         IN  quadro_tarefa_config.status%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_quadro_id                      IN  quadro.quadro_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- QUADRO_PKG


/
--------------------------------------------------------
--  DDL for Package REGRA_COENDER_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "REGRA_COENDER_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo_id                       IN  regra_coender.grupo_id%TYPE
, p_cliente_id                     IN  regra_coender.cliente_id%TYPE
, p_produto_cliente_id             IN  regra_coender.produto_cliente_id%TYPE
, p_tipo_job_id                    IN  regra_coender.tipo_job_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_vetor_usuario_end_id           IN  VARCHAR2
, p_vetor_usuario_coend_id         IN  VARCHAR2
, p_regra_coender_id               OUT regra_coender.regra_coender_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_regra_coender_id               IN  regra_coender.regra_coender_id%TYPE
, p_grupo_id                       IN  regra_coender.grupo_id%TYPE
, p_cliente_id                     IN  regra_coender.cliente_id%TYPE
, p_produto_cliente_id             IN  regra_coender.produto_cliente_id%TYPE
, p_tipo_job_id                    IN  regra_coender.tipo_job_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_ender_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_regra_coender_id               IN  regra_coender.regra_coender_id%TYPE
, p_vetor_usuario_id               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_coender_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_regra_coender_id               IN  regra_coender.regra_coender_id%TYPE
, p_vetor_usuario_id               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            flag_ativo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_regra_coender_id               IN  regra_coender.regra_coender_id%TYPE
, p_flag_ativo                     IN  VARCHAR2
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            copiar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_regra_coender_id               IN  regra_coender.regra_coender_id%TYPE
, p_regra_coender_novo_id          OUT regra_coender.regra_coender_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_regra_coender_id               IN  regra_coender.regra_coender_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_regra_coender_id               IN  regra_coender.regra_coender_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- REGRA_COENDER_PKG


/
--------------------------------------------------------
--  DDL for Package RELATORIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "RELATORIO_PKG" 
IS
--
PROCEDURE            os_tline_processar
(
  p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_tline_processar_iniciar
(
  p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_tline_processar_depend
(
  p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            os_tline_processar_espacos
(
  p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            rentab_job_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fluxo_checkin_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_data_fim                       IN  VARCHAR2
, p_rel_fluxo_checkin_id           OUT rel_fluxo_checkin.rel_fluxo_checkin_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            apontam_mensal_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_mes_ano                        IN  VARCHAR2
, p_jobs                           IN  VARCHAR2
, p_rel_apon_mens_id               OUT rel_apon_mens_val.rel_apon_mens_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            limpar;
--
--
END; --  RELATORIO_PKG


/
--------------------------------------------------------
--  DDL for Package RESULT_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "RESULT_PKG" AS
type ref_cursor is ref cursor;
END;


/
--------------------------------------------------------
--  DDL for Package SALARIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALARIO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  salario.usuario_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_custo_mensal                   IN  VARCHAR2
, p_venda_mensal                   IN  VARCHAR2
, p_salario_id                     OUT salario.salario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_salario_id                     IN  salario.salario_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_custo_mensal                   IN  VARCHAR2
, p_venda_mensal                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_salario_id                     IN  salario.salario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION salario_id_atu_retornar (
  p_usuario_id                     IN  NUMBER)
RETURN INTEGER;
--
FUNCTION salario_id_retornar (
  p_usuario_id                     IN  NUMBER,
  p_data                           IN  DATE)
RETURN INTEGER;
--
END;  -- SALARIO_PKG


/
--------------------------------------------------------
--  DDL for Package SERVICO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SERVICO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  VARCHAR2
, p_codigo                         IN  VARCHAR2
, p_margem_oper_min                IN  VARCHAR2
, p_margem_oper_meta               IN  VARCHAR2
, p_grupo_servico_id               IN  grupo_servico.grupo_servico_id%type
, p_servico_id                     OUT servico.servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_servico_id                     IN  servico.servico_id%TYPE
, p_nome                           IN  VARCHAR2
, p_codigo                         IN  VARCHAR2
, p_margem_oper_min                IN  VARCHAR2
, p_margem_oper_meta               IN  VARCHAR2
, p_grupo_servico_id               IN  grupo_servico.grupo_servico_id%type
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_servico_id                     IN  servico.servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            grupo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  VARCHAR2
, p_grupo_servico_id               OUT grupo_servico.grupo_servico_id%type 
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            grupo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo_servico_id               IN  grupo_servico.grupo_servico_id%TYPE
, p_nome                           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            grupo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_grupo_servico_id               IN  grupo_servico.grupo_servico_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_servico_id                     IN  servico.servico_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- SERVICO_PKG

/
--------------------------------------------------------
--  DDL for Package SETOR_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SETOR_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  VARCHAR2
, p_codigo                         IN  VARCHAR2
, p_setor_id                       OUT setor.setor_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_setor_id                       IN  setor.setor_id%TYPE
, p_nome                           IN  VARCHAR2
, p_codigo                         IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_setor_id                       IN  setor.setor_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_setor_id                       IN  setor.setor_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- SETOR_PKG


/
--------------------------------------------------------
--  DDL for Package SISTEMA_EXTERNO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SISTEMA_EXTERNO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  sistema_externo.codigo%TYPE
, p_nome                           IN  sistema_externo.nome%TYPE
, p_tipo_integracao_id             IN  sistema_externo.tipo_integracao_id%TYPE
, p_tipo_sistema                   IN  sistema_externo.tipo_sistema%TYPE
, p_sistema_externo_id             OUT sistema_externo.sistema_externo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_codigo                         IN  sistema_externo.codigo%TYPE
, p_nome                           IN  sistema_externo.nome%TYPE
, p_tipo_integracao_id             IN  sistema_externo.tipo_integracao_id%TYPE
, p_tipo_sistema                   IN  sistema_externo.tipo_sistema%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ativo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ponto_integracao_ligar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_ponto_integracao_id            IN  ponto_integracao.ponto_integracao_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ponto_integracao_desligar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_ponto_integracao_id            IN  ponto_integracao.ponto_integracao_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END SISTEMA_EXTERNO_PKG;

/
--------------------------------------------------------
--  DDL for Package SISTEMA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SISTEMA_PKG" 
IS
--
PROCEDURE          evento_sistema_gerar;
--
PROCEDURE          logs_limpar;
--
PROCEDURE          jobs_diarios_executar;
--
END; -- SISTEMA_pkg


/
--------------------------------------------------------
--  DDL for Package SOAP_API_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SOAP_API_PKG" AS
-- --------------------------------------------------------------------------
-- Name         : http://www.oracle-base.com/dba/miscellaneous/soap_api
-- Author       : DR Timothy S Hall
-- Description  : SOAP related functions for consuming web services.
-- Ammedments   :
--   When         Who           What
--   ===========  ========      =================================================
--   04-OCT-2003  Tim Hall      Initial Creation
--   23-FEB-2006  Tim Hall      Parameterized the "soap" envelope tags.
--   11-MAY-2009  Jason Bennett Update the invoke procedure to use CLOB value
--                              instead of VARCHAR2 to accomodate responses
--                              larger than 32K.
-- --------------------------------------------------------------------------

TYPE t_request IS RECORD (
  method        VARCHAR2(256),
  namespace     VARCHAR2(256),
  --body          VARCHAR2(32767),
  body          CLOB,
  envelope_tag  VARCHAR2(30)
);

TYPE t_response IS RECORD
(
  doc           XMLTYPE,
  envelope_tag  VARCHAR2(30)
);

PROCEDURE set_proxy_authentication(p_username  IN  VARCHAR2,
                                   p_password  IN  VARCHAR2);

PROCEDURE generate_envelope(p_request  IN OUT NOCOPY  t_request,
                            p_env      IN OUT NOCOPY  CLOB);

FUNCTION new_request(p_method        IN  VARCHAR2,
                     p_namespace     IN  VARCHAR2,
                     p_envelope_tag  IN  VARCHAR2 DEFAULT 'SOAP-ENV')
  RETURN t_request;


PROCEDURE add_parameter(p_request  IN OUT NOCOPY  t_request,
                        p_name     IN             VARCHAR2,
                        p_type     IN             VARCHAR2,
                        p_value    IN             VARCHAR2);

FUNCTION invoke(p_request  IN OUT NOCOPY  t_request,
                p_url      IN             VARCHAR2,
                p_action   IN             VARCHAR2)
  RETURN t_response;

FUNCTION get_return_value(p_response   IN OUT NOCOPY  t_response,
                          p_name       IN             VARCHAR2,
                          p_namespace  IN             VARCHAR2)
  RETURN VARCHAR2;

END soap_api_pkg;


/
--------------------------------------------------------
--  DDL for Package SOBRA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SOBRA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  sobra.job_id%TYPE
, p_carta_acordo_id                IN  sobra.carta_acordo_id%TYPE
, p_vetor_item_id                  IN  VARCHAR2
, p_vetor_valor_sobra              IN  VARCHAR2
, p_tipo_sobra                     IN  sobra.tipo_sobra%TYPE
, p_tipo_extra                     IN  VARCHAR2
, p_justificativa                  IN  VARCHAR2
, p_sobra_id                       OUT sobra.sobra_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_sobra_id                       IN  sobra.sobra_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_sobra_id                       IN  sobra.sobra_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             item_id_retornar (
  p_sobra_id                      IN sobra.sobra_id%TYPE)
RETURN NUMBER;
--
END;  -- SOBRA_PKG


/
--------------------------------------------------------
--  DDL for Package STATUS_AUX_JOB_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STATUS_AUX_JOB_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_status_pai                 IN  status_aux_job.cod_status_pai%TYPE
, p_nome                           IN  status_aux_job.nome%TYPE
, p_ordem                          IN  VARCHAR2 
, p_flag_padrao                    IN  VARCHAR2
, p_status_aux_job_id              OUT status_aux_job.status_aux_job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_status_aux_job_id              IN  status_aux_job.status_aux_job_id%TYPE
, p_nome                           IN  status_aux_job.nome%TYPE
, p_ordem                          IN  VARCHAR2 
, p_flag_padrao                    IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_status_aux_job_id              IN  status_aux_job.status_aux_job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- STTAUS_AUX_JOB_PKG


/
--------------------------------------------------------
--  DDL for Package STATUS_AUX_OPORT_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STATUS_AUX_OPORT_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_cod_status_pai                 IN  status_aux_oport.cod_status_pai%TYPE
, p_nome                           IN  status_aux_oport.nome%TYPE
, p_ordem                          IN  VARCHAR2 
, p_flag_obriga_cenario            IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_status_aux_oport_id            OUT status_aux_oport.status_aux_oport_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_status_aux_oport_id            IN  status_aux_oport.status_aux_oport_id%TYPE
, p_nome                           IN  status_aux_oport.nome%TYPE
, p_ordem                          IN  VARCHAR2 
, p_flag_obriga_cenario            IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_status_aux_oport_id            IN  status_aux_oport.status_aux_oport_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- STTAUS_AUX_OPORT_PKG

/
--------------------------------------------------------
--  DDL for Package TAREFA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TAREFA_PKG" 
IS
--
PROCEDURE            adicionar_temp
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_job_id                         IN  tarefa.job_id%TYPE
, p_flag_desc_usuario              IN  VARCHAR2
, p_num_max_itens                  IN  VARCHAR2
, p_num_max_dias_prazo             IN  VARCHAR2
, p_flag_obriga_item               IN  VARCHAR2
, p_descricao                      IN  VARCHAR2
, p_tarefa_id                      OUT tarefa.tarefa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_tarefa_temp_id                 IN  tarefa.tarefa_id%TYPE
, p_job_id                         IN  job.job_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_detalhes                       IN  tarefa.detalhes%TYPE
, p_flag_volta_exec                IN  VARCHAR2
, p_data_inicio                    IN  VARCHAR2
, p_hora_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_hora_termino                   IN  VARCHAR2
, p_vetor_usuario_id               IN  VARCHAR2
, p_vetor_datas                    IN  VARCHAR2
, p_vetor_horas                    IN  VARCHAR2
, p_item_crono_id                  IN  item_crono.item_crono_id%TYPE
, p_ordem_servico_id               IN  ordem_servico.ordem_servico_id%TYPE
, p_repet_a_cada                   IN  VARCHAR2
, p_frequencia_id                  IN  mod_item_crono.frequencia_id%TYPE
, p_vetor_dia_semana_id            IN  VARCHAR2
, p_repet_term_tipo                IN  VARCHAR2
, p_data_term_repet                IN  VARCHAR2
, p_repet_term_ocor                IN  VARCHAR2
, p_tarefa_id                      OUT tarefa.tarefa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar_demais
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  job.job_id%TYPE
, p_repet_grupo                    IN  item_crono.repet_grupo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_job
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_job_id                         IN  tarefa.job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_principal
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_detalhes                       IN  tarefa.detalhes%TYPE
, p_flag_volta_exec                IN  VARCHAR2
, p_tipo_alteracao                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar_estimativa
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_data_inicio                    IN  VARCHAR2
, p_hora_inicio                    IN  VARCHAR2
, p_data_termino                   IN  VARCHAR2
, p_hora_termino                   IN  VARCHAR2
, p_vetor_usuario_id               IN  VARCHAR2
, p_vetor_datas                    IN  VARCHAR2
, p_vetor_horas                    IN  VARCHAR2
, p_tipo_alteracao                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            usuario_repet_processar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_alteracao                 IN  VARCHAR2
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_usuario_executor_id            IN  NUMBER
, p_cod_acao_usu                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            terminar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_usuario_executor_id            IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            retomar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_usuario_executor_id            IN  NUMBER
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            acao_executar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_cod_acao_tarefa                IN  VARCHAR2
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cancelar_demais
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_tipo_alteracao                 IN  VARCHAR2
, p_evento_motivo_id               IN  evento_motivo.evento_motivo_id%TYPE
, p_comentario                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_tarefa_id                      IN  arquivo_tarefa.tarefa_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_thumb_arquivo_id               IN  arquivo.arquivo_id%TYPE
, p_thumb_volume_id                IN  arquivo.volume_id%TYPE
, p_thumb_nome_original            IN  arquivo.nome_original%TYPE
, p_thumb_nome_fisico              IN  arquivo.nome_fisico%TYPE
, p_thumb_mime_type                IN  arquivo.mime_type%TYPE
, p_thumb_tamanho                  IN  arquivo.tamanho%TYPE
, p_tipo_arq_tarefa                IN  arquivo_tarefa.tipo_arq_tarefa%TYPE
, p_palavras_chave                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            link_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_tarefa_id                      IN  tarefa_link.tarefa_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_url                            IN  VARCHAR2
, p_tipo_link                      IN  tarefa_link.tipo_link%TYPE
, p_tipo_alteracao                 IN  VARCHAR2
, p_tarefa_link_id                 OUT tarefa_link.tarefa_link_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            link_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_link_id                 IN  tarefa_link.tarefa_link_id%TYPE
, p_tipo_alteracao                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_tarefa_id                      IN  tarefa_afazer.tarefa_id%TYPE
, p_usuario_resp_id                IN  tarefa_afazer.usuario_resp_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_data                           IN  VARCHAR2
, p_tarefa_afazer_id               OUT tarefa_afazer.tarefa_afazer_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_tarefa_afazer_id               IN  tarefa_afazer.tarefa_afazer_id%TYPE
, p_usuario_resp_id                IN  tarefa_afazer.usuario_resp_id%TYPE
, p_descricao                      IN  VARCHAR2
, p_data                           IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_feito_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_tarefa_afazer_id               IN  tarefa_afazer.tarefa_afazer_id%TYPE
, p_flag_feito                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_reordenar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_vetor_tarefa_afazer_id         IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            afazer_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  NUMBER
, p_tarefa_afazer_id               IN  tarefa_afazer.tarefa_afazer_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_id                      IN  tarefa_tipo_produto.tarefa_id%TYPE
, p_tipo_produto_id                IN  job_tipo_produto.tipo_produto_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_descricao                      IN  CLOB
, p_vetor_atributo_id              IN  VARCHAR2
, p_vetor_atributo_valor           IN  CLOB
, p_tipo_alteracao                 IN  VARCHAR2
, p_tarefa_tipo_produto_id         OUT tarefa_tipo_produto.tarefa_tipo_produto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_tipo_produto_id         IN  tarefa_tipo_produto.tarefa_tipo_produto_id%TYPE
, p_complemento                    IN  VARCHAR2
, p_descricao                      IN  CLOB
, p_vetor_atributo_id              IN  VARCHAR2
, p_vetor_atributo_valor           IN  CLOB
, p_tipo_alteracao                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            tipo_produto_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tarefa_tipo_produto_id         IN  tarefa_tipo_produto.tarefa_tipo_produto_id%TYPE
, p_tipo_alteracao                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             numero_formatar (
  p_tarefa_id                      IN  tarefa.tarefa_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             enderecados_retornar (
  p_tarefa_id                      IN  tarefa.tarefa_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION       priv_no_grupo_verificar (
  p_usuario_sessao_id              IN  NUMBER,
  p_tarefa_id                      IN  tarefa.tarefa_id%TYPE,
  p_tipo_verif                     IN  VARCHAR2)
RETURN   INTEGER;
--
FUNCTION             ultimo_evento_retornar (
  p_tarefa_id                      IN  tarefa.tarefa_id%TYPE)
RETURN   NUMBER;
--
PROCEDURE            xml_gerar
(
  p_tarefa_id                      IN  tarefa.tarefa_id%TYPE
, p_flag_com_evento                IN  VARCHAR2
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TAREFA_PKG

/
--------------------------------------------------------
--  DDL for Package TASK_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TASK_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_job_id                         IN  task.job_id%TYPE
, p_milestone_id                   IN  task.milestone_id%TYPE
, p_papel_resp_id                  IN  task.papel_resp_id%TYPE
, p_desc_curta                     IN  task.desc_curta%TYPE
, p_desc_detalhada                 IN  LONG
, p_prioridade                     IN  task.prioridade%TYPE
, p_tipo_task                      IN  task.tipo_task%TYPE
, p_task_id                        OUT task.task_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_task_id                        IN  task.task_id%TYPE
, p_papel_resp_id                  IN  task.papel_resp_id%TYPE
, p_desc_curta                     IN  task.desc_curta%TYPE
, p_desc_detalhada                 IN  LONG
, p_prioridade                     IN  task.prioridade%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_task_id                        IN  task.task_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            arquivo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_arquivo_id                     IN  arquivo.arquivo_id%TYPE
, p_volume_id                      IN  arquivo.volume_id%TYPE
, p_task_id                        IN  arquivo_task.task_id%TYPE
, p_descricao                      IN  arquivo.descricao%TYPE
, p_nome_original                  IN  arquivo.nome_original%TYPE
, p_nome_fisico                    IN  arquivo.nome_fisico%TYPE
, p_mime_type                      IN  arquivo.mime_type%TYPE
, p_tamanho                        IN  arquivo.tamanho%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            comentario_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_task_id                        IN  task_coment.task_id%TYPE
, p_comentario                     IN  LONG
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            fechar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_task_id                        IN  task.task_id%TYPE
, p_compl_fecham                   IN  task.compl_fecham%TYPE
, p_comentario                     IN  LONG
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            reabrir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_task_id                        IN  task.task_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            historico_gerar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_task_id                        IN  item.item_id%TYPE
, p_codigo                         IN  item_hist.codigo%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            ciente_marcar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_task_hist_id                   IN  task_hist.task_hist_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             ciente_verificar (
  p_usuario_sessao_id              IN  NUMBER
, p_task_hist_id                   IN  task_hist.task_hist_id%TYPE)
RETURN   INTEGER;
--
FUNCTION             data_evento_retornar (
  p_task_id                       IN task_hist.task_id%TYPE,
  p_codigo                        IN task_hist.codigo%TYPE)
RETURN DATE;
--
FUNCTION             usuario_id_evento_retornar (
  p_task_id                       IN task_hist.task_id%TYPE,
  p_codigo                        IN task_hist.codigo%TYPE)
RETURN NUMBER;
--
FUNCTION             situacao_retornar (
  p_task_id                       IN task_hist.task_id%TYPE)
RETURN   VARCHAR2;
--
FUNCTION             ult_comentario_retornar (
  p_task_id                       IN task_hist.task_id%TYPE)
RETURN   VARCHAR2;
--
END;  -- TASK_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_APONTAM_JOB_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_APONTAM_JOB_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  tipo_apontam_job.nome%TYPE
, p_flag_ativo                     IN  VARCHAR2
, p_tipo_apontam_job_id            OUT tipo_apontam_job.tipo_apontam_job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_apontam_job_id            IN  tipo_apontam_job.tipo_apontam_job_id%TYPE
, p_nome                           IN  tipo_apontam_job.nome%TYPE
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_apontam_job_id            IN  tipo_apontam_job.tipo_apontam_job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_apontam_job_id            IN  tipo_apontam_job.tipo_apontam_job_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
END;  -- TIPO_APONTAM_JOB_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_APONTAM_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_APONTAM_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  tipo_apontam.codigo%TYPE
, p_nome                           IN  tipo_apontam.nome%TYPE
, p_grupo                          IN  tipo_apontam.grupo%TYPE
, p_flag_billable                  IN  VARCHAR2
, p_flag_sistema                   IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_flag_ausencia                  IN  VARCHAR2
, p_flag_ausencia_full             IN  VARCHAR2
, p_flag_formulario                IN  VARCHAR2
, p_tipo_apontam_id                OUT tipo_apontam.tipo_apontam_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_apontam_id                IN  tipo_apontam.tipo_apontam_id%TYPE
, p_codigo                         IN  tipo_apontam.codigo%TYPE
, p_nome                           IN  tipo_apontam.nome%TYPE
, p_grupo                          IN  tipo_apontam.grupo%TYPE
, p_flag_billable                  IN  VARCHAR2
, p_flag_sistema                   IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_flag_ausencia                  IN  VARCHAR2
, p_flag_ausencia_full             IN  VARCHAR2
, p_flag_formulario                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_apontam_id                IN  tipo_apontam.tipo_apontam_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_apontam_id                IN  tipo_apontam.tipo_apontam_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
END;  -- TIPO_APONTAM_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_ARQUIVO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_ARQUIVO_PKG" 
IS
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_arquivo_id                IN  tipo_arquivo.tipo_arquivo_id%TYPE
, p_nome                           IN  tipo_arquivo.nome%TYPE
, p_tam_max_arq                    IN  VARCHAR2
, p_qtd_max_arq                    IN  VARCHAR2
, p_extensoes                      IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_arquivo_id                IN  tipo_arquivo.tipo_arquivo_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TIPO_ARQUIVO_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_CONTRATO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_CONTRATO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  tipo_contrato.codigo%TYPE
, p_cod_ext_tipo                   IN  tipo_contrato.cod_ext_tipo%TYPE
, p_nome                           IN  tipo_contrato.nome%TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_flag_tem_horas                 IN  VARCHAR2
, p_flag_tem_fee                   IN  VARCHAR2
, p_tipo_contratante               IN  tipo_contrato.tipo_contratante%TYPE
, p_flag_verifi_precif             IN  tipo_contrato.flag_verifi_precif%TYPE
, p_flag_verifi_horas              IN  tipo_contrato.flag_verifi_horas%TYPE
, p_flag_elab_contrato             IN  tipo_contrato.flag_elab_contrato%TYPE
, p_flag_aloc_usuario              IN  tipo_contrato.flag_aloc_usuario%TYPE
, p_tipo_contrato_id               OUT tipo_contrato.tipo_contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_contrato_id               IN  tipo_contrato.tipo_contrato_id%TYPE
, p_codigo                         IN  tipo_contrato.codigo%TYPE
, p_cod_ext_tipo                   IN  tipo_contrato.cod_ext_tipo%TYPE
, p_nome                           IN  tipo_contrato.nome%TYPE
, p_flag_ativo                     In  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_flag_tem_horas                 IN  VARCHAR2
, p_flag_tem_fee                   IN  VARCHAR2
, p_tipo_contratante               IN  tipo_contrato.tipo_contratante%TYPE
, p_flag_verifi_precif             IN  tipo_contrato.flag_verifi_precif%TYPE
, p_flag_verifi_horas              IN  tipo_contrato.flag_verifi_horas%TYPE
, p_flag_elab_contrato             IN  tipo_contrato.flag_elab_contrato%TYPE
, p_flag_aloc_usuario              IN  tipo_contrato.flag_aloc_usuario%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_contrato_id               IN  tipo_contrato.tipo_contrato_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_contrato_id               IN  tipo_contrato.tipo_contrato_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TIPO_CONTRATO_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_DADO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_DADO_PKG" 
IS
--
PROCEDURE          validar
( p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  VARCHAR2
, p_flag_obrigatorio               IN  VARCHAR2
, p_flag_ignora_obrig              IN  VARCHAR2
, p_tamanho                        IN  NUMBER
, p_valor                          IN  VARCHAR2
, p_valor_saida                    OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2);
--
END tipo_dado_pkg;

/
--------------------------------------------------------
--  DDL for Package TIPO_DOCUMENTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_DOCUMENTO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  tipo_documento.codigo%TYPE
, p_nome                           IN  tipo_documento.nome%TYPE
, p_ordem_cli                      IN  VARCHAR2
, p_flag_visivel_cli               IN  VARCHAR2
, p_tam_max_arq                    IN  VARCHAR2
, p_qtd_max_arq                    IN  VARCHAR2
, p_extensoes                      IN  VARCHAR2
, p_flag_tem_aprov                 IN  VARCHAR2
, p_flag_tem_comen                 IN  VARCHAR2
, p_flag_tem_cienc                 IN  VARCHAR2
, p_tipo_documento_id              OUT tipo_documento.tipo_documento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_documento_id              IN  tipo_documento.tipo_documento_id%TYPE
, p_codigo                         IN  tipo_documento.codigo%TYPE
, p_nome                           IN  tipo_documento.nome%TYPE
, p_ordem_cli                      IN  VARCHAR2
, p_flag_visivel_cli               IN  VARCHAR2
, p_tam_max_arq                    IN  VARCHAR2
, p_qtd_max_arq                    IN  VARCHAR2
, p_extensoes                      IN  VARCHAR2
, p_flag_tem_aprov                 IN  VARCHAR2
, p_flag_tem_comen                 IN  VARCHAR2
, p_flag_tem_cienc                 IN  VARCHAR2
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_documento_id              IN  tipo_documento.tipo_documento_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_documento_id              IN  tipo_documento.tipo_documento_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TIPO_DOCUMENTO_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_FINANCEIRO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_FINANCEIRO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  tipo_financeiro.codigo%TYPE
, p_nome                           IN  tipo_financeiro.nome%TYPE
, p_flag_despesa                   IN  VARCHAR2
, p_flag_consid_hr_os_ctr          IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_tipo_custo                     IN  VARCHAR2
, p_cod_job                        IN  VARCHAR2  
, p_flag_usa_budget                IN  VARCHAR2
, p_flag_usa_receita_prev          IN  VARCHAR2 
, p_flag_obriga_contrato           IN  VARCHAR2 
, p_tipo_financeiro_id             OUT tipo_financeiro.tipo_financeiro_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_financeiro_id             IN  tipo_financeiro.tipo_financeiro_id%TYPE
, p_codigo                         IN  tipo_financeiro.codigo%TYPE
, p_nome                           IN  tipo_financeiro.nome%TYPE
, p_flag_despesa                   IN  VARCHAR2
, p_flag_consid_hr_os_ctr          IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_tipo_custo                     IN  VARCHAR2
, p_cod_job                        IN  VARCHAR2   
, p_flag_usa_budget                IN  VARCHAR2
, p_flag_usa_receita_prev          IN  VARCHAR2
, p_flag_obriga_contrato           IN  VARCHAR2 
, p_flag_ativo                     IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_financeiro_id             IN  tipo_financeiro.tipo_financeiro_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            papel_priv_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  tipo_financeiro.empresa_id%TYPE
, p_tipo_financeiro_id             IN  tipo_financeiro.tipo_financeiro_id%TYPE
, p_vetor_papeis                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_financeiro_id             IN  tipo_financeiro.tipo_financeiro_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TIPO_FINANCEIRO_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_JOB_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_JOB_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  tipo_job.codigo%TYPE
, p_nome                           IN  tipo_job.nome%TYPE
, p_cod_ext_tipo_job               IN  tipo_job.cod_ext_tipo_job%TYPE
, p_modelo_briefing                IN  tipo_job.modelo_briefing %TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_complex_job_pdr                IN  VARCHAR2
, p_flag_alt_complex               IN  VARCHAR2
, p_flag_alt_tipo_est              IN  VARCHAR2
, p_flag_tem_camp                  IN  VARCHAR2
, p_flag_camp_obr                  IN  VARCHAR2
, p_flag_pode_qq_serv              IN  VARCHAR2
, p_flag_pode_os                   IN  VARCHAR2
, p_flag_pode_tarefa               IN  VARCHAR2
, p_estrat_job                     IN  VARCHAR2
, p_flag_usa_per_job               IN  VARCHAR2
, p_flag_usa_data_cli              IN  VARCHAR2
, p_flag_obriga_data_cli           IN  VARCHAR2
, p_flag_usa_data_golive           IN  VARCHAR2
, p_flag_obr_data_golive           IN  VARCHAR2
, p_flag_apr_brief_auto            IN  VARCHAR2
, p_flag_apr_crono_auto            IN  VARCHAR2
, p_flag_apr_horas_auto            IN  VARCHAR2
, p_flag_apr_orcam_auto            IN  VARCHAR2
, p_flag_cria_crono_auto           IN  VARCHAR2
, p_flag_usa_crono_cria_job        IN  VARCHAR2
, p_flag_obr_crono_cria_job        IN  VARCHAR2
, p_flag_usa_data_cria_job         IN  VARCHAR2
, p_flag_usa_matriz                IN  VARCHAR2
, p_flag_ender_todos               IN  VARCHAR2
, p_flag_topo_apont                IN  VARCHAR2
, p_tipo_job_id                    OUT tipo_job.tipo_job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_codigo                         IN  tipo_job.codigo%TYPE
, p_nome                           IN  tipo_job.nome%TYPE
, p_cod_ext_tipo_job               IN  tipo_job.cod_ext_tipo_job%TYPE
, p_modelo_briefing                IN  tipo_job.modelo_briefing %TYPE
, p_flag_ativo                     IN  VARCHAR2
, p_flag_padrao                    IN  VARCHAR2
, p_complex_job_pdr                IN  VARCHAR2
, p_flag_alt_complex               IN  VARCHAR2
, p_flag_alt_tipo_est              IN  VARCHAR2
, p_flag_tem_camp                  IN  VARCHAR2
, p_flag_camp_obr                  IN  VARCHAR2
, p_flag_pode_qq_serv              IN  VARCHAR2
, p_flag_pode_os                   IN  VARCHAR2
, p_flag_pode_tarefa               IN  VARCHAR2
, p_estrat_job                     IN  VARCHAR2
, p_flag_usa_per_job               IN  VARCHAR2
, p_flag_usa_data_cli              IN  VARCHAR2
, p_flag_obriga_data_cli           IN  VARCHAR2
, p_flag_usa_data_golive           IN  VARCHAR2
, p_flag_obr_data_golive           IN  VARCHAR2
, p_flag_apr_brief_auto            IN  VARCHAR2
, p_flag_apr_crono_auto            IN  VARCHAR2
, p_flag_apr_horas_auto            IN  VARCHAR2
, p_flag_apr_orcam_auto            IN  VARCHAR2
, p_flag_cria_crono_auto           IN  VARCHAR2
, p_flag_usa_crono_cria_job        IN  VARCHAR2
, p_flag_obr_crono_cria_job        IN  VARCHAR2
, p_flag_usa_data_cria_job         IN  VARCHAR2
, p_flag_usa_matriz                IN  VARCHAR2
, p_flag_ender_todos               IN  VARCHAR2
, p_flag_topo_apont                IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  tipo_job.empresa_id%TYPE
, p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_area_id                        IN  papel.area_id%TYPE
, p_vetor_usuarios                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            papel_priv_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  tipo_job.empresa_id%TYPE
, p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_vetor_papeis                   IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            mod_crono_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  tipo_job.empresa_id%TYPE
, p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            mod_crono_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  tipo_job.empresa_id%TYPE
, p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_flag_padrao                    IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            mod_crono_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  tipo_job.empresa_id%TYPE
, p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_mod_crono_id                   IN  mod_crono.mod_crono_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_job_id                    IN  tipo_job.tipo_job_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TIPO_JOB_PKG


/
--------------------------------------------------------
--  DDL for Package TIPO_OS_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_OS_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_codigo                         IN  tipo_os.codigo%TYPE
, p_nome                           IN  tipo_os.nome%TYPE
, p_ordem                          IN  VARCHAR2
, p_cor_no_quadro                  IN  VARCHAR2  
, p_tipo_os_id                     OUT tipo_os.tipo_os_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_os_id                     IN  tipo_os.tipo_os_id%TYPE
, p_nome                           IN  tipo_os.nome%TYPE
, p_codigo                         IN  tipo_os.codigo%TYPE
, p_ordem                          IN  VARCHAR2
, p_cor_no_quadro                  IN  VARCHAR2  
, p_flag_ativo                     IN  VARCHAR2
, p_tipo_tela_nova_os              IN  VARCHAR2
, p_flag_tem_tipo_finan            IN  VARCHAR2
, p_flag_obriga_apont_exec         IN  VARCHAR2
, p_flag_depende_out               IN  VARCHAR2
, p_flag_tem_estim                 IN  VARCHAR2
, p_flag_estim_horas_usu           IN  VARCHAR2
, p_flag_estim_prazo               IN  VARCHAR2
, p_flag_estim_custo               IN  VARCHAR2
, p_flag_estim_arq                 IN  VARCHAR2
, p_flag_estim_obs                 IN  VARCHAR2
, p_flag_exec_estim                IN  VARCHAR2
, p_flag_tem_descricao             IN  VARCHAR2
, p_flag_impr_briefing             IN  VARCHAR2
, p_flag_impr_prazo_estim          IN  VARCHAR2
, p_flag_impr_historico            IN  VARCHAR2
, p_flag_item_existente            IN  VARCHAR2
, p_flag_pode_refazer              IN  VARCHAR2
, p_flag_pode_refaz_em_novo        IN  VARCHAR2
, p_flag_pode_aval_solic           IN  VARCHAR2
, p_flag_pode_aval_exec            IN  VARCHAR2
, p_flag_tem_corpo                 IN  VARCHAR2
, p_flag_tem_itens                 IN  VARCHAR2
, p_flag_tem_qtd_item              IN  VARCHAR2
, p_flag_tem_desc_item             IN  VARCHAR2
, p_flag_tem_meta_item             IN  VARCHAR2
, p_flag_tem_importacao            IN  VARCHAR2
, p_num_max_itens                  IN  VARCHAR2
, p_flag_solic_alt_arqref          IN  VARCHAR2
, p_flag_exec_alt_arqexe           IN  VARCHAR2
, p_tipo_termino_exec              IN  VARCHAR2
, p_modelo                         IN  tipo_os.modelo%TYPE
, p_modelo_itens                   IN  tipo_os.modelo_itens%TYPE
, p_flag_tem_pontos_tam            IN  VARCHAR2
, p_flag_calc_prazo_tam            IN  VARCHAR2
, p_flag_obriga_tam                IN  VARCHAR2
, p_pontos_tam_p                   IN  VARCHAR2
, p_pontos_tam_m                   IN  VARCHAR2
, p_pontos_tam_g                   IN  VARCHAR2
, p_flag_apont_horas_aloc          IN  VARCHAR2
, p_vetor_workflow                 IN  VARCHAR2
, p_status_integracao              IN  VARCHAR2
, p_cod_ext_tipo_os                IN  VARCHAR2
, p_tam_max_arq_ref                IN  VARCHAR2
, p_qtd_max_arq_ref                IN  VARCHAR2
, p_extensoes_ref                  IN  VARCHAR2
, p_tam_max_arq_exe                IN  VARCHAR2
, p_qtd_max_arq_exe                IN  VARCHAR2
, p_extensoes_exe                  IN  VARCHAR2
, p_tam_max_arq_apr                IN  VARCHAR2
, p_qtd_max_arq_apr                IN  VARCHAR2
, p_extensoes_apr                  IN  VARCHAR2
, p_flag_pode_anexar_arqapr        IN  VARCHAR2
, p_tam_max_arq_est                IN  VARCHAR2
, p_qtd_max_arq_est                IN  VARCHAR2
, p_extensoes_est                  IN  VARCHAR2
, p_tam_max_arq_rfa                IN  VARCHAR2
, p_qtd_max_arq_rfa                IN  VARCHAR2
, p_extensoes_rfa                  IN  VARCHAR2
, p_flag_pode_pular_aval           IN  VARCHAR2
, p_flag_pode_anexar_arqexe        IN  VARCHAR2
, p_flag_obriga_anexar_arqexe      IN  VARCHAR2
, p_flag_aprov_refaz               IN  VARCHAR2
, p_flag_aprov_devolve             IN  VARCHAR2
, p_flag_habilita_aprov            IN  VARCHAR2
, p_flag_acei_todas                IN  VARCHAR2
, p_flag_solic_v_emaval            IN  VARCHAR2
, p_flag_faixa_aprov               IN  VARCHAR2
, p_flag_solic_pode_encam          IN  VARCHAR2
, p_flag_dist_com_ender            IN  VARCHAR2
, p_acoes_executadas               IN  VARCHAR2
, p_acoes_depois                   IN  VARCHAR2
, p_num_dias_conc_os               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_os_id                     IN  tipo_os.tipo_os_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            privilegio_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_os_id                     IN  papel_priv_tos.tipo_os_id%TYPE
, p_papel_id                       IN  papel_priv_tos.papel_id%TYPE
, p_privilegio_id                  IN  papel_priv_tos.privilegio_id%TYPE
, p_abrangencia                    IN  papel_priv_tos.abrangencia%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            privilegio_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_os_id                     IN  papel_priv_tos.tipo_os_id%TYPE
, p_papel_id                       IN  papel_priv_tos.papel_id%TYPE
, p_privilegio_id                  IN  papel_priv_tos.privilegio_id%TYPE
, p_abrangencia                    IN  papel_priv_tos.abrangencia%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_os_id                     IN  tipo_os.tipo_os_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TIPO_OS_PKG

/
--------------------------------------------------------
--  DDL for Package TIPO_PRODUTO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_PRODUTO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_flag_commit                    IN  VARCHAR2
, p_classe_produto_id              IN  tipo_produto.classe_produto_id%TYPE
, p_nome                           IN  tipo_produto.nome%TYPE
, p_categoria                      IN  tipo_produto.categoria%TYPE
, p_cod_ext_produto                IN  tipo_produto.cod_ext_produto%TYPE
, p_variacoes                      IN  VARCHAR2
, p_vetor_tipo_os                  IN  VARCHAR2
, p_tempo_exec_info                IN  VARCHAR2
, p_flag_ativo                     IN  tipo_produto.flag_ativo%TYPE
, p_flag_midia_online              IN  tipo_produto.flag_midia_online%TYPE
, p_flag_midia_offline             IN  tipo_produto.flag_midia_offline%TYPE
, p_flag_tarefa                    IN  tipo_produto.flag_tarefa%TYPE
, p_flag_cliente                   IN  tipo_produto.flag_cliente%TYPE
, p_unidade_freq                   IN  tipo_produto.unidade_freq%TYPE
, p_vetor_preco_id                 IN  VARCHAR2
, p_custo                          IN  VARCHAR2
, p_preco                          IN  VARCHAR2
, p_tipo_produto_id                OUT tipo_produto.tipo_produto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_produto_id                IN  tipo_produto.tipo_produto_id%TYPE
, p_classe_produto_id              IN  tipo_produto.classe_produto_id%TYPE
, p_nome                           IN  tipo_produto.nome%TYPE
, p_categoria                      IN  tipo_produto.categoria%TYPE
, p_cod_ext_produto                IN  tipo_produto.cod_ext_produto%TYPE
, p_variacoes                      IN  VARCHAR2
, p_vetor_tipo_os                  IN  VARCHAR2
, p_custo_interno_min              IN  VARCHAR2
, p_custo_interno_max              IN  VARCHAR2
, p_custo_interno_med              IN  VARCHAR2
, p_tempo_exec_info                IN  VARCHAR2
, p_flag_ativo                     IN  tipo_produto.flag_ativo%TYPE
, p_flag_midia_online              IN  tipo_produto.flag_midia_online%TYPE
, p_flag_midia_offline             IN  tipo_produto.flag_midia_offline%TYPE
, p_flag_tarefa                    IN  tipo_produto.flag_tarefa%TYPE
, p_flag_cliente                   IN  tipo_produto.flag_cliente%TYPE
, p_unidade_freq                   IN  tipo_produto.unidade_freq%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_produto_id                IN  tipo_produto.tipo_produto_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            substituir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_produto_id_old            IN  tipo_produto.tipo_produto_id%TYPE
, p_tipo_produto_id_new            IN  tipo_produto.tipo_produto_id%TYPE
, p_flag_concat_complem            IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            texto_tratar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_texto                          IN  VARCHAR2
, p_tipo_produto_id                OUT tipo_produto.tipo_produto_id%TYPE
, p_complemento                    OUT VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE           tempo_gasto_calcular;
--
PROCEDURE            xml_gerar
(
  p_tipo_produto_id                IN  tipo_produto.tipo_produto_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
FUNCTION            id_retornar (
  p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_texto                          IN VARCHAR)
RETURN   INTEGER;
--
END;  -- TIPO_PRODUTO_PKG

/
--------------------------------------------------------
--  DDL for Package TIPO_TAREFA_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "TIPO_TAREFA_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  tipo_tarefa.nome%TYPE
, p_tipo_tarefa_id                 OUT tipo_tarefa.tipo_tarefa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_tarefa_id                 IN  tipo_tarefa.tipo_tarefa_id%TYPE
, p_nome                           IN  tipo_tarefa.nome%TYPE 
, p_flag_ativo                     IN  VARCHAR2
, p_flag_tem_descricao             IN  VARCHAR2
, p_flag_tem_corpo                 IN  VARCHAR2
, p_flag_tem_itens                 IN  VARCHAR2
, p_flag_obriga_item               IN  VARCHAR2
, p_flag_tem_desc_item             IN  VARCHAR2
, p_flag_tem_meta_item             IN  VARCHAR2
, p_flag_auto_ender                IN  VARCHAR2
, p_flag_pode_ender_exec           IN  VARCHAR2
, p_flag_abre_arq_refer            IN  VARCHAR2
, p_flag_abre_arq_exec             IN  VARCHAR2
, p_flag_abre_afazer               IN  VARCHAR2
, p_flag_abre_repet                IN  VARCHAR2 
, p_num_max_itens                  IN  VARCHAR2
, p_num_max_dias_prazo             IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_tarefa_id                 IN  tipo_tarefa.tipo_tarefa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            padrao_definir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_tipo_tarefa_id                 IN  tipo_tarefa.tipo_tarefa_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_gerar
(
  p_tipo_tarefa_id                 IN  tipo_tarefa.tipo_tarefa_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- TIPO_TAREFA_PKG


/
--------------------------------------------------------
--  DDL for Package UNIDADE_NEGOCIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "UNIDADE_NEGOCIO_PKG" 
IS
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_nome                           IN  unidade_negocio.nome%TYPE
, p_cod_ext_unid_neg               IN  VARCHAR2
, p_flag_qualquer_job              IN  VARCHAR2
, p_unidade_negocio_id             OUT unidade_negocio.unidade_negocio_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_nome                           IN  unidade_negocio.nome%TYPE
, p_cod_ext_unid_neg               IN  VARCHAR2
, p_flag_qualquer_job              IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            cliente_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_cliente_id                     IN  unidade_negocio_cli.cliente_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            cliente_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_cliente_id                     IN  unidade_negocio_cli.cliente_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            usuario_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_usuario_id                     IN  unidade_negocio_usu.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            usuario_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_usuario_id                     IN  unidade_negocio_usu.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            usu_ender_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_usuario_id                     IN  unidade_negocio_usu.usuario_id%TYPE
, p_flag_enderecar                 IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            usu_resp_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_usuario_id                     IN  unidade_negocio_usu.usuario_id%TYPE
, p_flag_responsavel               IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            usu_rateio_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  unidade_negocio_usu.usuario_id%TYPE
, p_vetor_unid_neg_id              IN  VARCHAR2
, p_vetor_perc_rateio              IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
--
PROCEDURE            xml_gerar
(
  p_unidade_negocio_id             IN  unidade_negocio.unidade_negocio_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
END;  -- UNIDADE_NEGOCIO_PKG


/
--------------------------------------------------------
--  DDL for Package USUARIO_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USUARIO_PKG" IS
--
FUNCTION             priv_verificar (
 p_usuario_sessao_id          IN  usuario.usuario_id%TYPE,
 p_codigo                     IN  privilegio.codigo%TYPE,
 p_objeto_id                  IN  NUMBER,
 p_outros                     IN  VARCHAR2,
 p_empresa_id                 IN  NUMBER)
RETURN INTEGER;
--
FUNCTION             priv_tipo_pessoa_verificar (
 p_usuario_sessao_id          IN  NUMBER,
 p_cod_priv                   IN  VARCHAR2,
 p_tipo_pessoa                IN  VARCHAR2,
 p_empresa_id                 IN  NUMBER)
RETURN   INTEGER;
--
FUNCTION             acesso_grupo_verificar (
 p_usuario_sessao_id          IN  usuario.usuario_id%TYPE,
 p_grupo                      IN  VARCHAR2,
 p_empresa_id                 IN  NUMBER)
RETURN INTEGER;
--
PROCEDURE            adicionar (
 p_usuario_sessao_id          IN  usuario.usuario_id%TYPE,
 p_empresa_id                 IN  empresa.empresa_id%TYPE,
 p_pessoa_id                  IN  pessoa.pessoa_id%TYPE,
 p_flag_admin                 IN  VARCHAR2,
 p_login                      IN  usuario.login%TYPE,
 p_senha                      IN  usuario.senha%TYPE,
 p_resenha                    IN  usuario.senha%TYPE,
 p_flag_sem_bloq_apont        IN  VARCHAR2,
 p_flag_sem_bloq_aprov        IN  VARCHAR2,
 p_flag_sem_aprov_horas       IN  VARCHAR2,
 p_flag_permite_home          IN  VARCHAR2,
 p_flag_acesso_pri            IN  VARCHAR2,
 p_flag_acesso_cli            IN  VARCHAR2,
 p_flag_acesso_wall           IN  VARCHAR2,
 p_cod_hash_wallboard         IN  VARCHAR2,
 p_painel_wallboard_id        IN  NUMBER,
 p_flag_simula_cli            IN  VARCHAR2,
 p_data_apontam_ini           IN  VARCHAR2,
 p_data_apontam_fim           IN  VARCHAR2,
 p_min_horas_apont_dia        IN  VARCHAR2,
 p_categoria                  IN  VARCHAR2,
 p_tipo_relacao               IN  VARCHAR2,
 p_cod_ext_usuario            IN  usuario.cod_ext_usuario%TYPE,
 p_cod_funcionario            IN  usuario.cod_funcionario%TYPE,
 p_vetor_papeis               IN  VARCHAR2,
 p_vetor_empresas             IN  VARCHAR2,
 p_empresa_padrao_id          IN  empresa.empresa_id%TYPE,
 p_departamento_id            IN  usuario.departamento_id%TYPE,
 p_tab_feriado_id             IN  usuario.tab_feriado_id%TYPE,
 p_funcao                     IN  usuario.funcao%TYPE,
 p_area_id                    IN  usuario.area_id%TYPE,
 p_usuario_id                 OUT usuario.usuario_id%TYPE,
 p_erro_cod                   OUT VARCHAR2,
 p_erro_msg                   OUT VARCHAR2);
--
PROCEDURE            atualizar (
 p_usuario_sessao_id          IN  usuario.usuario_id%TYPE,
 p_empresa_id                 IN  empresa.empresa_id%TYPE,
 p_usuario_id                 IN  usuario.usuario_id%TYPE,
 p_login                      IN  usuario.login%TYPE,
 p_flag_admin                 IN  VARCHAR2,
 p_flag_ativo                 IN  usuario.flag_ativo%TYPE,
 p_flag_notifica_email        IN  usuario.flag_notifica_email%TYPE,
 p_flag_sem_bloq_apont        IN  VARCHAR2,
 p_flag_sem_bloq_aprov        IN  VARCHAR2,
 p_flag_sem_aprov_horas       IN  VARCHAR2,
 p_flag_permite_home          IN  VARCHAR2,
 p_flag_acesso_pri            IN  VARCHAR2,
 p_flag_acesso_cli            IN  VARCHAR2,
 p_flag_acesso_wall           IN  VARCHAR2,
 p_cod_hash_wallboard         IN  VARCHAR2,
 p_painel_wallboard_id        IN  NUMBER,
 p_flag_simula_cli            IN  VARCHAR2,
 p_data_apontam_ini           IN  VARCHAR2,
 p_data_apontam_fim           IN  VARCHAR2,
 p_categoria                  IN  VARCHAR2,
 p_tipo_relacao               IN  VARCHAR2,
 p_cod_ext_usuario            IN  usuario.cod_ext_usuario%TYPE,
 p_cod_funcionario            IN  usuario.cod_funcionario%TYPE,
 p_vetor_papeis               IN  VARCHAR2,
 p_vetor_empresas             IN  VARCHAR2,
 p_empresa_padrao_id          IN  empresa.empresa_id%TYPE,
 p_departamento_id            IN  usuario.departamento_id%TYPE,
 p_tab_feriado_id             IN  usuario.tab_feriado_id%TYPE,
 p_funcao                     IN  usuario.funcao%TYPE,
 p_area_id                    IN  usuario.area_id%TYPE,
 p_erro_cod                   OUT VARCHAR2,
 p_erro_msg                   OUT VARCHAR2);
--
PROCEDURE            min_horas_apont_atualizar (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_id              IN  usuario.usuario_id%TYPE,
    p_min_horas_apont_dia     IN  VARCHAR2,
    p_data_refer              IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            num_horas_prod_atualizar (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_id              IN  usuario.usuario_id%TYPE,
    p_num_horas_prod_dia      IN  VARCHAR2,
    p_data_refer              IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            excluir   (
 p_usuario_sessao_id          IN  usuario.usuario_id%TYPE,
 p_empresa_id                 IN  empresa.empresa_id%TYPE,
 p_usuario_id                 IN  usuario.usuario_id%TYPE,
 p_erro_cod                   OUT VARCHAR2,
 p_erro_msg                   OUT VARCHAR2);
--
PROCEDURE            cargo_adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_cargo_id                       IN  cargo.cargo_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_nivel                          IN  VARCHAR2
, p_usuario_cargo_id               OUT usuario_cargo.usuario_cargo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cargo_atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_cargo_id               IN  usuario_cargo.usuario_cargo_id%TYPE
, p_cargo_id                       IN  usuario_cargo.cargo_id%TYPE
, p_data_ini                       IN  VARCHAR2
, p_nivel                          IN  VARCHAR2
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            cargo_excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_usuario_cargo_id               IN  usuario_cargo.usuario_cargo_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            autenticar (
 p_tipo_acesso             IN  VARCHAR2,
 p_login                   IN  usuario.login%TYPE,
 p_senha                   IN  usuario.senha%TYPE,
 p_cod_hash_wallboard      IN  VARCHAR2,
 p_usuario_id              OUT usuario.usuario_id%TYPE,
 p_apelido                 OUT pessoa.apelido%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            login_registrar (
 p_tipo_acesso             IN  VARCHAR2,
 p_usuario_id              IN  usuario.usuario_id%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            senha_atualizar (
 p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
 p_senha_old               IN  VARCHAR2,
 p_senha_new               IN  usuario.senha%TYPE,
 p_senha_new_conf          IN  usuario.senha%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            senha_configurar (
 p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
 p_empresa_id              IN  empresa.empresa_id%TYPE,
 p_usuario_id              IN  usuario.usuario_id%TYPE,
 p_senha_new               IN  usuario.senha%TYPE,
 p_senha_new_conf          IN  usuario.senha%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            senha_redefinir (
 p_email_login             IN  VARCHAR2,
 p_cod_hash                OUT usuario.cod_hash%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            senha_validar (
 p_empresa_id              IN  empresa.empresa_id%TYPE,
 p_nome_completo           IN  pessoa.nome%TYPE,
 p_apelido_completo        IN  pessoa.apelido%TYPE,
 p_login                   IN  usuario.login%TYPE,
 p_senha                   IN  VARCHAR2,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            desbloquear (
 p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
 p_empresa_id              IN  empresa.empresa_id%TYPE,
 p_usuario_id              IN  usuario.usuario_id%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            email_bloquear (
 p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
 p_empresa_id              IN  empresa.empresa_id%TYPE,
 p_usuario_id              IN  usuario.usuario_id%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            email_desbloquear (
 p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
 p_empresa_id              IN  empresa.empresa_id%TYPE,
 p_usuario_id              IN  usuario.usuario_id%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            inativar_automatico;
--
PROCEDURE            preferencia_atualizar (
 p_usuario_id              IN  usuario.usuario_id%TYPE,
 p_nome_pref               IN  preferencia.nome%TYPE,
 p_valor_usuario           IN  usuario_pref.valor_usuario%TYPE,
 p_erro_cod                OUT VARCHAR2,
 p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            notifica_regra_adicionar (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  notifica_desliga.empresa_id%TYPE,
    p_cliente_id              IN  notifica_desliga.cliente_id%TYPE,
    p_job_id                  IN  notifica_desliga.job_id%TYPE,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            notifica_regra_excluir (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  notifica_desliga.empresa_id%TYPE,
    p_notifica_desliga_id     IN  notifica_desliga.notifica_desliga_id%TYPE,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            enderecar_em_todos_jobs
(
  p_usuario_sessao_id              IN  NUMBER
, p_empresa_id                     IN  job.empresa_id%TYPE
, p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            enderecar_nos_jobs_marcados (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_id              IN  usuario.usuario_id%TYPE,
    p_vetor_job               IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            desenderecar_nos_jobs_marcados (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_id              IN  usuario.usuario_id%TYPE,
    p_vetor_job               IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            substituir_nos_jobs_marcados (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_ori_id          IN  usuario.usuario_id%TYPE,
    p_usuario_sub_id          IN  usuario.usuario_id%TYPE,
    p_vetor_job               IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            substituir_nos_jobs (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_ori_id          IN  usuario.usuario_id%TYPE,
    p_cliente_job_id          IN  job.cliente_id%TYPE,
    p_usuario_sub_id          IN  usuario.usuario_id%TYPE,
    p_pos_resp_int            IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            substituir_nas_ca (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_ori_id          IN  usuario.usuario_id%TYPE,
    p_usuario_sub_id          IN  usuario.usuario_id%TYPE,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            substituir_nas_os (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_ori_id          IN  usuario.usuario_id%TYPE,
    p_tipo_ender              IN  os_usuario.tipo_ender%TYPE,
    p_tipo_os_id              IN  ordem_servico.tipo_os_id%TYPE,
    p_usuario_sub_id          IN  usuario.usuario_id%TYPE,
    p_cliente_id              IN  job.cliente_id%TYPE,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            substituir_nas_tarefas (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_ori_id          IN  usuario.usuario_id%TYPE,
    p_usuario_sub_id          IN  usuario.usuario_id%TYPE,
    p_tipo_usuario            IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            ts_grupo_adicionar (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_usuario_aprov_id        IN  usuario.usuario_id%TYPE,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            ts_grupo_excluir (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_ts_grupo_id             IN  ts_grupo.ts_grupo_id%TYPE,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
-- 
PROCEDURE            ts_aprovador_atualizar (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_ts_grupo_id             IN  ts_grupo.ts_grupo_id%TYPE,
    p_vetor_usuario_id        IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            ts_equipe_atualizar (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_ts_grupo_id             IN  ts_grupo.ts_grupo_id%TYPE,
    p_vetor_usuario_id        IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            ts_sem_aprov_atualizar (
    p_usuario_sessao_id       IN  usuario.usuario_id%TYPE,
    p_empresa_id              IN  empresa.empresa_id%TYPE,
    p_vetor_usuario_id        IN  VARCHAR2,
    p_erro_cod                OUT VARCHAR2,
    p_erro_msg                OUT VARCHAR2);
--
PROCEDURE            xml_gerar
(
  p_usuario_id                     IN  usuario.usuario_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            xml_ts_gerar
(
  p_ts_grupo_id                    IN  ts_grupo.ts_grupo_id%TYPE
, p_xml                            OUT CLOB
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION             numero_enderecamentos_retornar (
 p_usuario_id                     IN  usuario.usuario_id%TYPE,
 p_empresa_id                     IN  empresa.empresa_id%TYPE)
RETURN   INTEGER;
--
FUNCTION             numero_os_executor_retornar (
 p_usuario_id                     IN  usuario.usuario_id%TYPE,
 p_empresa_id                     IN  empresa.empresa_id%TYPE)
RETURN   INTEGER;
--
FUNCTION             preferencia_retornar (
 p_usuario_id                     IN  usuario.usuario_id%TYPE,
 p_nome_pref                      IN  preferencia.nome%TYPE)
RETURN   CLOB;
--
FUNCTION             empresa_padrao_retornar (
 p_usuario_id                     IN  usuario.usuario_id%TYPE)
RETURN   NUMBER;
--
FUNCTION             unid_negocio_retornar (
 p_usuario_id                     IN  usuario.usuario_id%TYPE,
 p_empresa_id                     IN  empresa.empresa_id%TYPE,
 p_cliente_id                     IN  pessoa.pessoa_id%TYPE,
 p_job_id                         IN  job.job_id%TYPE)
RETURN NUMBER;
--
END usuario_pkg;

/
--------------------------------------------------------
--  DDL for Package UTIL_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "UTIL_PKG" 
IS
--
FUNCTION           texto_encriptar
(p_string                            IN  VARCHAR2,
 p_key                               IN  VARCHAR2)
RETURN  VARCHAR2;
--
FUNCTION           texto_desencriptar
(p_string                            IN  VARCHAR2,
 p_key                               IN  VARCHAR2)
RETURN  VARCHAR2;
--
PROCEDURE          oracletext_sincronizar;
--
FUNCTION           desc_retornar
(p_tipo                            IN  VARCHAR2,
 p_codigo                          IN  VARCHAR2)
RETURN     VARCHAR2;
--
--
FUNCTION           prox_dia_util_retornar
(p_data_base                       IN  DATE,
 p_flag_com_data_base              IN  VARCHAR2)
RETURN     DATE;
--
--
FUNCTION           prox_dia_semana_retornar
(p_data_base                       IN  DATE,
 p_prox_dia                        IN  NUMBER)
RETURN     DATE;
--
--
FUNCTION           data_calcular
(p_data_base                       IN  DATE,
 p_tipo_calculo                    IN  VARCHAR2,
 p_num_dias                        IN  INTEGER)
RETURN  DATE;
--
--
FUNCTION           somar
( p_vetor_numero                   IN  VARCHAR2
, p_casas_decimais                 IN  INTEGER)
RETURN  VARCHAR2;
--
--
FUNCTION           keywords_preparar
( p_string                         IN  VARCHAR2)
RETURN  VARCHAR2;
--
FUNCTION           acento_municipio_retirar
( p_string                         IN VARCHAR2)
RETURN  VARCHAR2;
--
--
FUNCTION           transf_montar
(p_num_sai_ini                       IN NUMBER,
 p_pos                               IN NUMBER)
RETURN transf_tab pipelined;
--
--
FUNCTION           num_encode
(p_numero                            IN  NUMBER)
RETURN  NUMBER;
--
FUNCTION           num_decode
(p_numero                            IN  NUMBER,
 p_chave                             IN  VARCHAR2)
RETURN  NUMBER;
--
--
END; -- UTIL_pkg

/
--------------------------------------------------------
--  DDL for Package VOLUME_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "VOLUME_PKG" 
IS
--
PROCEDURE            retornar
(
  p_servidor_arquivo_id            IN  servidor_arquivo.servidor_arquivo_id%TYPE
, p_tipo_objeto                    IN  volume.prefixo%TYPE
, p_volume_id                      OUT volume.volume_id%TYPE
, p_numero                         OUT volume.numero%TYPE
, p_caminho                        OUT volume.caminho%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            adicionar
(
  p_usuario_sessao_id              IN  NUMBER
, p_flag_commit                    IN  VARCHAR2
, p_servidor_arquivo_id            IN  servidor_arquivo.servidor_arquivo_id%TYPE
, p_prefixo                        IN  volume.prefixo%TYPE
, p_numero                         IN  VARCHAR2
, p_caminho                        IN  volume.caminho%TYPE
, p_status                         IN  volume.status%TYPE
, p_volume_id                      OUT volume.volume_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            atualizar
(
  p_usuario_sessao_id              IN  NUMBER
, p_volume_id                      IN  volume.volume_id%TYPE
, p_prefixo                        IN  volume.prefixo%TYPE
, p_numero                         IN  VARCHAR2
, p_caminho                        IN  volume.caminho%TYPE
, p_status                         IN  volume.status%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
PROCEDURE            excluir
(
  p_usuario_sessao_id              IN  NUMBER
, p_volume_id                      IN  volume.volume_id%TYPE
, p_erro_cod                       OUT VARCHAR2
, p_erro_msg                       OUT VARCHAR2
);
--
FUNCTION           caminho_completo_retornar
(
  p_volume_id                      IN  volume.volume_id%TYPE)
RETURN     VARCHAR2;
--
END;  -- VOLUME_PKG


/
--------------------------------------------------------
--  DDL for Package WEBSERVICE_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "WEBSERVICE_PKG" 
IS
--
PROCEDURE          chamar
( p_sistema_externo_id             IN  sistema_externo.sistema_externo_id%TYPE
, p_empresa_id                     IN  empresa.empresa_id%TYPE
, p_metodo                         IN  VARCHAR2
, p_acao                           IN  VARCHAR2
, p_xml_log_id                     IN  xml_log.xml_log_id%TYPE
, p_retorno                        OUT CLOB
, p_erro_msg                       OUT CLOB);
--
--
END; -- WEBSERVICE_PKG


/
--------------------------------------------------------
--  DDL for Package WEBSERVICEUTILS_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "WEBSERVICEUTILS_PKG" AS

-- Public Objects/Types

  SOAP_TAG_11 CONSTANT VARCHAR2(8) := 'SOAP-ENV';
  SOAP_TAG_12 CONSTANT VARCHAR2(7) := 'soapenv';

  -- Type allowing developer to define a web service parameter name,data
  TYPE service_param_type IS RECORD(
       name      VARCHAR2(100),
       data_type VARCHAR2(100),
       value     VARCHAR2(32767)
  );

  -- Collection of SERVICE_PARAM Type allowing developer to bundle service params.
  TYPE service_param_list IS TABLE OF service_param_type;

  -- Type that allows developer to create service end point definition for generic exection of service
  TYPE service_definition_type IS RECORD(
      service_name       VARCHAR2(100),
      service_url        VARCHAR2(100),
      soap_tag           VARCHAR2(10),
      service_action_url VARCHAR2(200),
      service_ns         VARCHAR2(200),
      service_params     service_param_list,
      result_ns          VARCHAR2(200),
      result_target      VARCHAR2(200)
  );


  PROCEDURE addParamToCollection(p_collection IN OUT NOCOPY service_param_list,p_param service_param_type);

  FUNCTION executeWebService(p_service_def service_definition_type) RETURN CLOB;



END;


/
