--------------------------------------------------------
--  Arquivo criado - sexta-feira-julho-14-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View V_ALOC_USU_CONTRATO_MES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_ALOC_USU_CONTRATO_MES" ("EMPRESA_ID", "CONTRATO_ID", "HORAS_PLANEJ", "HORAS_ALOC", "APELIDO", "ATIVO", "MES", "ANO", "USUARIO_ID", "HORAS_MES", "MES_ABREV_DESC", "EQUIPE_ID", "EQUIPE", "CARGO_ID", "CARGO", "NIVEL", "UNIDADE_NEGOCIO_ID", "UNIDADE_NEGOCIO", "HORAS_ALOCADAS", "HORAS_LIVRES", "PLANEJADO_PERIODO") AS 
  SELECT CO.EMPRESA_ID,
       CO.CONTRATO_ID,
       CH.HORAS_PLANEJ,
       HU.HORAS_ALOC,
       PE.APELIDO,
       PE.FLAG_ATIVO AS ATIVO,
       DA.MES,
       DA.ANO,
       PE.USUARIO_ID,
       (select
NVL(USU.NUM_HORAS_PROD_DIA * 20,NUMERO_CONVERTER(empresa_pkg.parametro_retornar(CO.EMPRESA_ID,'QT_HORAS_MENSAIS')))
from USUARIO USU
WHERE USU.USUARIO_ID = PE.USUARIO_ID) AS HORAS_MES,
       MAX(DECODE(DA.MES,1,'Jan',
                     2,'Fev',
                     3,'Mar',
                     4,'Abr',
                     5,'Mai',
                     6,'Jun',
                     7,'Jul',
                     8,'Ago',
                     9,'Set',
                     10,'Out',
                     11,'Nov',
                        'Dez') || '/' || DA.ANO) AS MES_ABREV_DESC,
       MAX((SELECT DISTINCT LISTAGG(E.EQUIPE_ID,', ') WITHIN GROUP (ORDER BY E.EQUIPE_ID)
          FROM EQUIPE E,
               EQUIPE_USUARIO EU
         WHERE E.EQUIPE_ID   = EU.EQUIPE_ID
           AND EU.USUARIO_ID = HU.USUARIO_ID)) AS EQUIPE_ID,
       MAX((SELECT DISTINCT LISTAGG(E.NOME,', ') WITHIN GROUP (ORDER BY E.NOME)
          FROM EQUIPE E,
               EQUIPE_USUARIO EU
         WHERE E.EQUIPE_ID   = EU.EQUIPE_ID
           AND EU.USUARIO_ID = HU.USUARIO_ID)) AS EQUIPE,
       MAX((SELECT C.CARGO_ID
          FROM CARGO C,
               USUARIO_CARGO UC
        WHERE C.CARGO_ID     = UC.CARGO_ID
          AND UC.USUARIO_ID  = HU.USUARIO_ID
          AND UC.DATA_FIM    IS NULL)) AS CARGO_ID,
       MAX((SELECT C.NOME
          FROM CARGO C,
               USUARIO_CARGO UC
        WHERE C.CARGO_ID     = UC.CARGO_ID
          AND UC.USUARIO_ID  = HU.USUARIO_ID
          AND UC.DATA_FIM    IS NULL)) AS CARGO,
       MAX(CH.NIVEL) AS NIVEL,
       MAX((SELECT DISTINCT LISTAGG(UN.UNIDADE_NEGOCIO_ID,', ') WITHIN GROUP (ORDER BY UN.UNIDADE_NEGOCIO_ID)
          FROM UNIDADE_NEGOCIO     UN,
               UNIDADE_NEGOCIO_USU UE
         WHERE UN.UNIDADE_NEGOCIO_ID = UE.UNIDADE_NEGOCIO_ID
           AND UE.USUARIO_ID         = HU.USUARIO_ID
           AND UN.EMPRESA_ID         = CO.EMPRESA_ID)) AS UNIDADE_NEGOCIO_ID,
       MAX((SELECT DISTINCT LISTAGG(UN.NOME,', ') WITHIN GROUP (ORDER BY UN.NOME)
          FROM UNIDADE_NEGOCIO     UN,
               UNIDADE_NEGOCIO_USU UE
         WHERE UN.UNIDADE_NEGOCIO_ID = UE.UNIDADE_NEGOCIO_ID
           AND UE.USUARIO_ID         = HU.USUARIO_ID
           AND UN.EMPRESA_ID         = CO.EMPRESA_ID)) AS UNIDADE_NEGOCIO,
       MAX((SELECT SUM(CH2.HORAS_PLANEJ)
      FROM DIA_ALOCACAO DA2,
           CONTRATO_HORAS_USU CHU2,
           CONTRATO_HORAS CH2
      WHERE DA2.USUARIO_ID = CHU2.USUARIO_ID
      AND CHU2.CONTRATO_HORAS_ID = CH2.CONTRATO_HORAS_ID
      AND TO_CHAR(DA2.DATA,'MM/YY') = TO_CHAR(DA.DATA,'MM/YY')
      AND CHU2.USUARIO_ID = HU.USUARIO_ID)) AS HORAS_ALOCADAS,
      MAX((SELECT(
(select
NVL(NUMERO_CONVERTER(empresa_pkg.parametro_retornar(CO.EMPRESA_ID,'NUM_HORAS_PRODUTIVAS')) * 20,NUMERO_CONVERTER(empresa_pkg.parametro_retornar(CO.EMPRESA_ID,'QT_HORAS_MENSAIS')))
from dual)
-
(SELECT
    SUM(CH2.HORAS_PLANEJ)
FROM DIA_ALOCACAO DA2,
     CONTRATO_HORAS_USU CHU2,
     CONTRATO_HORAS CH2
WHERE DA2.USUARIO_ID = CHU2.USUARIO_ID
AND CHU2.CONTRATO_HORAS_ID = CH2.CONTRATO_HORAS_ID
AND TO_CHAR(DA2.DATA,'MM/YY') = TO_CHAR(DA.DATA,'MM/YY')
AND CHU2.USUARIO_ID = HU.USUARIO_ID))
FROM DUAL))  AS HORAS_LIVRES,
       NULL AS PLANEJADO_PERIODO
  FROM CONTRATO CO,
       CONTRATO_HORAS CH,
       CONTRATO_HORAS_USU HU,
       PESSOA             PE,
       DIA_ALOCACAO       DA
 WHERE CO.CONTRATO_ID       = CH.CONTRATO_ID
   AND CH.CONTRATO_HORAS_ID = HU.CONTRATO_HORAS_ID
   AND HU.USUARIO_ID        = PE.USUARIO_ID
   AND HU.USUARIO_ID        = DA.USUARIO_ID
 GROUP
    BY CO.EMPRESA_ID,
       CO.CONTRATO_ID,
       CH.HORAS_PLANEJ,
       HU.HORAS_ALOC,
       PE.APELIDO,
       PE.FLAG_ATIVO,
       DA.MES,
       DA.ANO,
       PE.USUARIO_ID

;
--------------------------------------------------------
--  DDL for View V_ANALISE_ITENS_ORCAMENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_ANALISE_ITENS_ORCAMENTO" ("TIPO_LINHA", "ORDEM_LINHA", "EMPRESA", "JOB_NUMERO", "JOB_NOME", "JOB_TIPO", "JOB_PRODUTO", "JOB_DATA_ENTRADA", "JOB_DATA_PREVISTA_INICIO", "JOB_DATA_PREVISTA_FIM", "JOB_STATUS", "STATUS_CHECKIN", "STATUS_CHECKIN_DATA", "STATUS_FATURAMENTO", "STATUS_FATURAMENTO_DATA", "CLIENTE", "ORCAMENTO", "ITEM_TIPO", "ITEM_TIPO_DESCRICAO", "ITEM_NUMERO", "ITEM_DESCRICAO", "ORDEM_GRUPO", "GRUPO", "ORDEM_SUBGRUPO", "SUBGRUPO", "PAGO_PELO_CLIENTE", "CARTA_ACORDO_DESCRICAO", "CARTA_ACORDO_STATUS", "CARTA_ACORDO_OK_VERIFICAR", "CARTA_ACORDO_LEGENDA_RETORNAR", "FORNECEDOR", "TIPO_FATURAMENTO_BV_TIP", "NOTA_FISCAL_NUMERO", "NOTA_FISCAL_SERIE", "VALOR_ITEM_APROVADO", "VALOR_ITEM_FORNECEDOR", "VALOR_ITEM_BV", "VALOR_ITEM_TIP", "VALOR_ITEM_EMITIDO", "VALOR_ITEM_SOBRA", "VALOR_ITEM_SALDO", "VALOR_ITEM_UTILIZADO", "VALOR_CA_APROVADO", "VALOR_CA_FORNECEDOR", "VALOR_CA_BV", "VALOR_CA_TIP", "VALOR_NF_APROVADO", "VALOR_NF_FORNECEDOR", "VALOR_NF_BV", "VALOR_NF_TIP") AS 
  SELECT 'ITEM' AS tipo_linha,
             1 AS ordem_linha,
             em.nome AS empresa,
             jo.numero AS job_numero,
             jo.nome AS job_nome,
             tj.nome AS job_tipo,
             pc.nome AS job_produto,
             DATA_MOSTRAR(jo.data_entrada) AS job_data_entrada,
             DATA_MOSTRAR(jo.data_prev_ini) AS job_data_prevista_inicio,
             DATA_MOSTRAR(jo.data_prev_fim) AS job_data_prevista_fim,
             st.descricao AS job_status,
             DECODE(jo.status_checkin,'A','Aberto','F','Fechado') AS status_checkin,
             DATA_MOSTRAR(jo.data_status_checkin) AS status_checkin_data,
             DECODE(jo.status_fatur,'A','Aberto','F','Fechado') AS status_faturamento,
             DATA_MOSTRAR(jo.data_status_fatur) AS status_faturamento_data,
             cl.apelido AS cliente,
             oc.num_orcamento AS orcamento,
             it.tipo_item AS item_tipo,
             util_pkg.desc_retornar('tipo_item',it.tipo_item) AS item_tipo_descricao,
             it.tipo_item || it. num_seq AS item_numero,
             it.tipo_item || it.num_seq || '. ' || tp.nome || ' ' || it.complemento AS item_descricao,
             it.ordem_grupo,
             it.grupo,
             it.ordem_subgrupo,
             it.subgrupo,
             DECODE(it.flag_pago_cliente,'S','Sim','N','Não') AS pago_pelo_cliente,
             'NA' AS carta_acordo_descricao,
             'NA' AS carta_acordo_status,
             0 AS carta_acordo_ok_verificar,
             'NA' carta_acordo_legenda_retornar,
             'NA' fornecedor,
             'NA' tipo_faturamento_bv_tip,
             'NA' AS nota_fiscal_numero,
             'NA' AS nota_fiscal_serie,
             --ITEM
             it.valor_aprovado AS valor_item_aprovado,
             it.valor_fornecedor AS valor_item_fornecedor,
             item_pkg.valor_realizado_retornar(it.item_id,'BV') AS valor_item_bv,
             item_pkg.valor_realizado_retornar(it.item_id,'TIP') AS valor_item_tip,
             item_pkg.valor_retornar(it.item_id,0,'COM_CA') AS valor_item_emitido,
             item_pkg.valor_retornar(it.item_id,0,'SOBRA') AS valor_item_sobra, 
             it.valor_aprovado  - item_pkg.valor_reservado_retornar(it.item_id,'APROVADO') AS valor_item_saldo,
             item_pkg.valor_reservado_retornar(it.item_id,'APROVADO') AS valor_item_utilizado,
             --CARTA_ACORDO
             0 AS valor_ca_aprovado,
             0 AS valor_ca_fornecedor,
             0 AS valor_ca_bv,
             0 AS valor_ca_tip,
             --NOTA_FISCAL
             0 AS valor_nf_aprovado,
             0 AS valor_nf_fornecedor,
             0 AS valor_nf_bv,
             0 AS valor_nf_tip
        FROM item it,
             job jo,
             tipo_produto tp,
             tipo_job tj,
             pessoa cl,
             dicionario st,
             produto_cliente pc,
             empresa em,
             orcamento oc
       WHERE jo.job_id = it.job_id
         AND it.natureza_item = 'CUSTO'
         AND it.tipo_produto_id = tp.tipo_produto_id
         AND tj.tipo_job_id = jo.tipo_job_id
         AND cl.pessoa_id = jo.cliente_id
         AND st.codigo = jo.status
         AND st.tipo = 'status_job'
         AND pc.produto_cliente_id = jo.produto_cliente_id
         AND jo.empresa_id = em.empresa_id
         AND it.orcamento_id = oc.orcamento_id
         AND oc.status = 'APROV'
--
-- CARTA ACORDO
--
UNION
      SELECT 'CARTA ACORDO' AS tipo_linha,
             2 AS ordem_linha,
             em.nome AS empresa,
             jo.numero AS job_numero,
             jo.nome AS job_nome,
             tj.nome AS job_tipo,
             pc.nome AS job_produto,
             DATA_MOSTRAR(jo.data_entrada) AS job_data_entrada,
             DATA_MOSTRAR(jo.data_prev_ini) AS job_data_prevista_inicio,
             DATA_MOSTRAR(jo.data_prev_fim) AS job_data_prevista_fim,
             st.descricao AS job_status,
             DECODE(jo.status_checkin,'A','Aberto','F','Fechado') AS status_checkin,
             DATA_MOSTRAR(jo.data_status_checkin) AS status_checkin_data,
             DECODE(jo.status_fatur,'A','Aberto','F','Fechado') AS status_faturamento,
             DATA_MOSTRAR(jo.data_status_fatur) AS status_faturamento_data,
             cl.apelido AS cliente,
             oc.num_orcamento AS orcamento,
             it.tipo_item AS item_tipo,
             util_pkg.desc_retornar('tipo_item',it.tipo_item) AS item_tipo_descricao,
             it.tipo_item || it. num_seq AS item_numero,
             it.tipo_item || it.num_seq || '. ' || tp.nome || ' ' || it.complemento AS item_descricao,
             it.ordem_grupo,
             it.grupo,
             it.ordem_subgrupo,
             it.subgrupo,
             DECODE(it.flag_pago_cliente,'S','Sim','N','Não') AS pago_pelo_cliente,
             DECODE(ca.status,'EMEMIS','Carta Acordo ','EMITIDA','Carta Acordo ','AO ') ||
                    carta_acordo_pkg.numero_formatar(ca.carta_acordo_id) AS carta_acordo_descricao,
             ca.status AS carta_acordo_status,
             item_pkg.carta_acordo_ok_verificar(it.item_id) AS carta_acordo_ok_verificar,
             carta_acordo_pkg.legenda_retornar(ca.carta_acordo_id) AS carta_acordo_legenda_retornar,
             pe.apelido AS fornecedor,
             DECODE(ca.tipo_fatur_bv,'FAT','A Faturar','ABA','A Abater') AS tipo_faturamento_bv_tip,
             'NA' AS nota_fiscal_numero,
             'NA' AS nota_fiscal_serie,
             --ITEM
             0 AS valor_item_aprovado,
             0 AS valor_item_fornecedor,
             0 AS valor_item_bv,
             0 AS valor_item_tip,
             0 AS valor_item_emitido,
             0 AS valor_item_sobra, 
             0 AS valor_item_saldo,
             0 AS valor_item_utilizado,
             --CARTA_ACORDO
             ca.valor_aprovado AS valor_ca_aprovado,
             ca.valor_fornecedor AS valor_ca_fornecedor,
             item_pkg.valor_retornar(it.item_id,ca.carta_acordo_id,'BV') AS valor_ca_bv,
             item_pkg.valor_retornar(it.item_id,ca.carta_acordo_id,'TIP') AS valor_ca_tip,
             --NOTA_FISCAL
             0 AS valor_nf_aprovado,
             0 AS valor_nf_fornecedor,
             0 AS valor_nf_bv,
             0 AS valor_nf_tip
        FROM item it,
             item_carta ic,
             carta_acordo ca,
             job jo,
             pessoa pe,
             tipo_produto tp,
             tipo_job tj,
             pessoa cl,
             dicionario st,
             produto_cliente pc,
             empresa em,
             orcamento oc
       WHERE jo.job_id = it.job_id
         AND it.natureza_item = 'CUSTO'
         AND it.item_id = ic.item_id (+)
         AND ic.carta_acordo_id = ca.carta_acordo_id (+)
         AND ca.fornecedor_id = pe.pessoa_id (+)
         AND it.tipo_produto_id = tp.tipo_produto_id
         AND tj.tipo_job_id = jo.tipo_job_id
         AND cl.pessoa_id = jo.cliente_id
         AND st.codigo = jo.status
         AND st.tipo = 'status_job'
         AND pc.produto_cliente_id = jo.produto_cliente_id
         AND jo.empresa_id = em.empresa_id
         AND it.orcamento_id = oc.orcamento_id
         AND oc.status = 'APROV'
--
-- NOTA FISCAL
--
UNION
      SELECT 'NOTA FISCAL' AS tipo_linha,
             3 AS ordem_linha,
             em.nome AS empresa,
             jo.numero AS job_numero,
             jo.nome AS job_nome,
             tj.nome AS job_tipo,
             pc.nome AS job_produto,
             DATA_MOSTRAR(jo.data_entrada) AS job_data_entrada,
             DATA_MOSTRAR(jo.data_prev_ini) AS job_data_prevista_inicio,
             DATA_MOSTRAR(jo.data_prev_fim) AS job_data_prevista_fim,
             st.descricao AS job_status,
             DECODE(jo.status_checkin,'A','Aberto','F','Fechado') AS status_checkin,
             DATA_MOSTRAR(jo.data_status_checkin) AS status_checkin_data,
             DECODE(jo.status_fatur,'A','Aberto','F','Fechado') AS status_faturamento,
             DATA_MOSTRAR(jo.data_status_fatur) AS status_faturamento_data,
             cl.apelido AS cliente,
             oc.num_orcamento AS orcamento,
             it.tipo_item AS item_tipo,
             util_pkg.desc_retornar('tipo_item',it.tipo_item) AS item_tipo_descricao,
             it.tipo_item || it. num_seq AS item_numero,
             it.tipo_item || it.num_seq || '. ' || tp.nome || ' ' || it.complemento AS item_descricao,
             it.ordem_grupo,
             it.grupo,
             it.ordem_subgrupo,
             it.subgrupo,
             DECODE(it.flag_pago_cliente,'S','Sim','N','Não') AS pago_pelo_cliente,
             'NA' AS carta_acordo_descricao,
             'NA' AS carta_acordo_status,
             0 AS carta_acordo_ok_verificar,
             'NA' carta_acordo_legenda_retornar,
             'NA' fornecedor,
             'NA' tipo_faturamento_bv_tip,
             nf.num_doc AS nota_fiscal_numero,
             nf.serie AS nota_fiscal_serie,
             --ITEM
             0 AS valor_item_aprovado,
             0 AS valor_item_fornecedor,
             0 AS valor_item_bv,
             0 AS valor_item_tip,
             0 AS valor_item_emitido,
             0 AS valor_item_sobra, 
             0 AS valor_item_saldo,
             0 AS valor_item_utilizado,
             --CARTA_ACORDO
             0 AS valor_ca_aprovado,
             0 AS valor_ca_fornecedor,
             0 AS valor_ca_bv,
             0 AS valor_ca_tip,
             --NOTA_FISCAL
             io.valor_aprovado AS valor_nf_aprovado,
             io.valor_fornecedor AS valor_nf_fornecedor,
             io.valor_bv AS valor_nf_bv,
             io.valor_tip AS valor_nf_tip
        FROM item it,
             item_nota io,
             nota_fiscal nf,
             job jo,
             pessoa pe,
             tipo_produto tp,
             tipo_job tj,
             pessoa cl,
             dicionario st,
             produto_cliente pc,
             empresa em,
             orcamento oc
       WHERE jo.job_id = it.job_id
         AND it.natureza_item = 'CUSTO'
         AND it.item_id = io.item_id (+)
         AND io.nota_fiscal_id = nf.nota_fiscal_id (+)
         AND nf.emp_emissora_id = pe.pessoa_id (+)
         AND it.tipo_produto_id = tp.tipo_produto_id
         AND tj.tipo_job_id = jo.tipo_job_id
         AND cl.pessoa_id = jo.cliente_id
         AND st.codigo = jo.status
         AND st.tipo = 'status_job'
         AND pc.produto_cliente_id = jo.produto_cliente_id
         AND jo.empresa_id = em.empresa_id
         AND it.orcamento_id = oc.orcamento_id
         AND oc.status = 'APROV'
ORDER BY 4, 17, 20, 2
;
--------------------------------------------------------
--  DDL for View V_APONTAM_ADMIN_PESQ
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_APONTAM_ADMIN_PESQ" ("APONTAM_DATA_ID", "DATA", "USUARIO_ID", "PROFISSIONAL", "PAPEL_ID", "EMPRESA_ID", "PAPEL", "HORAS", "CUSTO") AS 
  SELECT
-----------------------------------------------------------------------
-- View para pesquisa de apontamentos de horas admin (nao esta sendo
--   usada).
-----------------------------------------------------------------------
       ad.apontam_data_id,
       ad.data,
       us.usuario_id,
       pe.apelido,
       pa.papel_id,
       pa.empresa_id,
       pa.nome,
       SUM(ho.horas),
       SUM(ho.custo)
  FROM apontam_data ad,
       apontam_hora ho,
       usuario us,
       papel pa,
       pessoa pe
 WHERE ad.apontam_data_id = ho.apontam_data_id
   AND ho.job_id IS NULL
   AND ad.usuario_id = us.usuario_id
   AND ho.papel_id = pa.papel_id
   AND ho.horas > 0
   AND us.usuario_id = pe.usuario_id
 GROUP BY ad.apontam_data_id,
          ad.data,
          us.usuario_id,
          pe.apelido,
          pa.papel_id,
          pa.empresa_id,
          pa.nome
;
--------------------------------------------------------
--  DDL for View V_APONTAM_JOB_PESQ
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_APONTAM_JOB_PESQ" ("APONTAM_DATA_ID", "DATA", "USUARIO_ID", "PROFISSIONAL", "PAPEL_ID", "PAPEL", "JOB_ID", "EMPRESA_ID", "CONTRATO_ID", "NUMERO_JOB", "NOME_JOB", "CLIENTE_ID", "CLIENTE", "HORAS", "CUSTO") AS 
  SELECT
-----------------------------------------------------------------------
-- View para pesquisa de apontamentos de jobs
-----------------------------------------------------------------------
       ad.apontam_data_id,
       ad.data,
       us.usuario_id,
       pu.apelido,
       pa.papel_id,
       pa.nome,
       jo.job_id,
       jo.empresa_id,
       jo.contrato_id,
       jo.numero,
       jo.nome,
       jo.cliente_id,
       pc.apelido,
       SUM(ho.horas),
       SUM(ho.custo)
  FROM apontam_data ad,
       apontam_hora ho,
       job jo,
       usuario us,
       papel pa,
       pessoa pc,
       pessoa pu
 WHERE ad.apontam_data_id = ho.apontam_data_id
   AND ad.usuario_id = us.usuario_id
   AND ho.job_id = jo.job_id
   AND ho.papel_id = pa.papel_id
   AND jo.cliente_id = pc.pessoa_id
   AND us.usuario_id = pu.usuario_id
 GROUP BY ad.apontam_data_id,
          ad.data,
          us.usuario_id,
          pu.apelido,
          pa.papel_id,
          pa.nome,
          jo.job_id,
          jo.contrato_id,
          jo.empresa_id,
          jo.numero,
          jo.nome,
          jo.cliente_id,
          pc.apelido
;
--------------------------------------------------------
--  DDL for View V_ATIVIDADES_JOB
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_ATIVIDADES_JOB" ("EMPRESA_ID", "COD_OBJETO", "OBJETO_ID", "ITEM_CRONO_ID", "CLIENTE_APELIDO", "JOB_ID", "JOB_NUMERO", "JOB_DESCRICAO", "ATIVIDADE_TIPO", "TIPO_WORKFLOW", "ATIVIDADE_DESCRICAO", "ATIVIDADE_DESCRICAO_SEM_NUMERO", "ATIVIDADE_NUMERO", "ATIVIDADE_METADADOS", "STATUS", "STATUS_NEGOCIACAO", "PRAZO", "PRAZO_FMT", "PRAZO_INTERNO", "PRAZO_INTERNO_FMT", "SOLICITANTE", "SOLICITANTE_ID", "EQUIPE", "EXECUTORES", "HORAS", "PRODUTO_CLIENTE", "CONTRATO_NUMERO", "CONTRATO_NOME", "DATA_INICIO_PLANEJADA", "DATA_INICIO_PLANEJADA_FMT", "DATA_FIM_PLANEJADA", "DATA_FIM_PLANEJADA_FMT", "RESPONSAVEL_PELO_JOB", "RESPONSAVEL_PELO_JOB_ID", "CONTATO_JOB", "DATA_ENTRADA_JOB", "DATA_ENTRADA_JOB_FMT", "DATA_ENVIO", "DATA_ENVIO_FMT", "DATA_APRESENTACAO", "DATA_APRESENTACAO_FMT", "DATA_GO_LIVE", "DATA_GO_LIVE_FMT", "COMENT_STATUS_AUTOR", "COMENT_STATUS_DATA", "COMENT_STATUS_DATA_FMT", "COMENT_STATUS", "REFACAO") AS 
  SELECT jo.empresa_id,
         ic.cod_objeto,
         ic.objeto_id,
         ic.item_crono_id,
         cl.apelido AS cliente_apelido,
         jo.job_id,
         jo.numero AS job_numero,
         NVL(jo.numero || ' ' || jo.nome,'-') AS job_descricao,
         CASE ic.cod_objeto
           WHEN 'ORDEM_SERVICO' THEN ts.nome
           WHEN 'TAREFA' THEN 'Task'
           WHEN 'BRIEFING' THEN 'Briefing'
           WHEN 'JOB_HORAS' THEN 'Estimativa de Horas'
           WHEN 'FATUR_CONC' THEN 'Conclusão do Faturamento'
           WHEN 'DATA_APR_CLI' THEN 'Apresentação para o Cliente'
           WHEN 'DOCUMENTO' THEN 'Documento'
           WHEN 'ORCAMENTO' THEN 'Orçamento'
           WHEN 'CRONOGRAMA' THEN 'Cronograma'
           WHEN 'CHECKIN_CONC' THEN 'Conclusão do Check-in'
           WHEN 'JOB_CONC' THEN 'Conclusão do Job'
           ELSE '-'
         END AS atividade_tipo,
         NVL(ts.nome,'N/A') AS tipo_workflow,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN DECODE(objeto_id,NULL,'',ORDEM_SERVICO_PKG.NUMERO_FORMATAR(os.ordem_servico_id)|| ' ') || os.descricao
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NOT NULL  THEN DECODE(objeto_id,NULL,'',TAREFA_PKG.NUMERO_FORMATAR(ta.tarefa_id)|| ' ') || ta.descricao
           WHEN ic.cod_objeto = 'DOCUMENTO' AND ic.objeto_id IS NOT NULL  THEN do.nome
           WHEN ic.cod_objeto = 'ORCAMENTO' AND ic.objeto_id IS NOT NULL  THEN NVL(oc.descricao, 'Descrição Não definida')
           ELSE NVL(ic.nome,'-')
         END AS atividade_descricao,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN os.descricao
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NOT NULL  THEN ta.descricao
           WHEN ic.cod_objeto = 'DOCUMENTO' AND ic.objeto_id IS NOT NULL  THEN do.nome
           WHEN ic.cod_objeto = 'ORCAMENTO' AND ic.objeto_id IS NOT NULL  THEN NVL(oc.descricao, 'Descrição Não definida')
           ELSE NVL(ic.nome,'-')
         END AS atividade_descricao_sem_numero,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN ORDEM_SERVICO_PKG.NUMERO_FORMATAR(os.ordem_servico_id)
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NOT NULL THEN TAREFA_PKG.NUMERO_FORMATAR(ta.tarefa_id)
           WHEN ic.cod_objeto = 'DOCUMENTO' AND ic.objeto_id IS NOT NULL THEN '-'
           WHEN ic.cod_objeto = 'ORCAMENTO' AND ic.objeto_id IS NOT NULL THEN ORCAMENTO_PKG.NUMERO_FORMATAR(oc.orcamento_id)
           WHEN ic.objeto_id IS NULL THEN '-'
           ELSE '-'
         END AS atividade_numero,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN
             (SELECT LISTAGG(v.valor_atributo,', ') WITHIN GROUP (ORDER BY m.ordem)
                FROM os_atributo_valor v
                     INNER JOIN metadado m ON m.metadado_id = v.metadado_id
               WHERE m.flag_na_lista = 'S'
                 AND v.ordem_servico_id = os.ordem_servico_id)
           ELSE '-'
         END AS atividade_metadados,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN DECODE(os.status,'CONC','Concluída',dos.descricao || DECODE(ov.flag_recusa, 'S',' (Recusado)',''))
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NOT NULL THEN dts.descricao
           WHEN ic.cod_objeto = 'BRIEFING' THEN DECODE(bf.status, 'APROV', 'Concluída',dbs.descricao)
           WHEN ic.cod_objeto = 'JOB_HORAS' THEN DECODE(jo.status_horas, 'APROV', 'Concluída', NVL(dhs.descricao,'Não Iniciado'))
           WHEN ic.cod_objeto = 'FATUR_CONC' THEN DECODE(jo.status_fatur, 'A', 'Pendente', 'F', 'Concluída', '-')
           WHEN ic.cod_objeto = 'DATA_APR_CLI' AND ic.data_planej_fim < SYSDATE THEN 'Concluída'
           WHEN ic.cod_objeto = 'DATA_APR_CLI' AND ic.data_planej_fim >= SYSDATE THEN 'Pendente'
           WHEN ic.cod_objeto = 'DOCUMENTO' AND ic.objeto_id IS NOT NULL THEN DECODE(do.status, 'OK', 'Concluída', 'PEND', 'Pendente', '-')
           WHEN ic.cod_objeto = 'ORCAMENTO' AND ic.objeto_id IS NOT NULL THEN DECODE(oc.status, 'APROV', 'Concluída', dms.descricao)
           WHEN ic.cod_objeto = 'CRONOGRAMA' THEN DECODE(cr.status, 'APROV', 'Concluída', dcs.descricao)
           WHEN ic.cod_objeto = 'CHECKIN_CONC' THEN DECODE(jo.status_checkin, 'A', 'Pendente', 'F', 'Concluída', '-')
           WHEN ic.cod_objeto = 'JOB_CONC' THEN DECODE(jo.status, 'CONC', 'Concluída', 'Pendente')
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NULL THEN 'Não Iniciada'
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NULL THEN 'Não Iniciada'
           WHEN ic.cod_objeto = 'DOCUMENTO' AND ic.objeto_id IS NULL THEN 'Não Iniciada'
           WHEN ic.cod_objeto = 'ORCAMENTO' AND ic.objeto_id IS NULL THEN 'Não Iniciada'
           WHEN ic.cod_objeto IS NULL AND ic.data_planej_fim < SYSDATE THEN 'Concluída'
           WHEN ic.cod_objeto IS NULL AND ic.data_planej_fim >= SYSDATE THEN 'Pendente'
           ELSE '-'
         END AS status,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL
            AND os.flag_em_negociacao = 'S' THEN 'ANDA'
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL
            AND os.status IN ('DIST','ACEI','EMEX','AVAL')
            AND os.flag_em_negociacao = 'N'
            AND (SELECT COUNT(*) FROM os_negociacao onx
                  WHERE onx.ordem_servico_id = ic.objeto_id
                    AND onx.num_refacao = os.qtd_refacao) = 0 THEN 'DISP'
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL
            AND os.status IN ('DIST','ACEI','EMEX','AVAL')
            AND os.flag_em_negociacao = 'N'
            AND (SELECT COUNT(*) FROM os_negociacao onx
                  WHERE onx.ordem_servico_id = ic.objeto_id
                    AND onx.num_refacao = os.qtd_refacao) > 0 THEN 'CONC'
           ELSE 'N/A'
         END AS status_negociacao,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN os.data_solicitada
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NOT NULL THEN ta.data_termino
           ELSE NVL(ic.data_planej_fim, jo.data_prev_fim)
         END AS prazo,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN DATA_MOSTRAR(os.data_solicitada)
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NOT NULL THEN DATA_MOSTRAR(ta.data_termino)
           ELSE DATA_MOSTRAR(NVL(ic.data_planej_fim, jo.data_prev_fim))
         END AS prazo_fmt,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN os.data_interna
           ELSE NULL
         END AS prazo_interno,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN DATA_MOSTRAR(os.data_interna)
           ELSE NULL
         END AS prazo_interno_fmt,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO'
            AND ic.objeto_id IS NOT NULL THEN (SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM os_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'SOL')
           WHEN ic.cod_objeto = 'TAREFA'
            AND ic.objeto_id IS NOT NULL THEN (SELECT p.apelido || ' (' || u.funcao || ')'
                                                 FROM pessoa p
                                                      INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                                WHERE p.usuario_id = ta.usuario_de_id)
           WHEN ic.cod_objeto = 'DOCUMENTO'
            AND ic.objeto_id IS NOT NULL THEN (SELECT p.apelido || ' (' || u.funcao || ')'
                                                 FROM pessoa p
                                                      INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                                WHERE p.usuario_id = do.usuario_id)
           WHEN ic.cod_objeto = 'ORCAMENTO'
            AND ic.objeto_id IS NOT NULL THEN (SELECT p.apelido || ' (' || u.funcao || ')'
                                                 FROM pessoa p
                                                      INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                                WHERE p.usuario_id = oc.usuario_autor_id)
           ELSE (SELECT pr.apelido || ' (' || ur.funcao || ')'
            FROM pessoa pr
                 INNER JOIN usuario ur ON pr.usuario_id = ur.usuario_id
                 INNER JOIN job_usuario xr ON xr.usuario_id = ur.usuario_id
                                          AND xr.job_id = jo.job_id
           WHERE xr.flag_responsavel = 'S'
         )
         END AS solicitante,
                  CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO'
            AND ic.objeto_id IS NOT NULL THEN (SELECT MAX(i.usuario_id)
                                              FROM os_usuario i
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'SOL')
           WHEN ic.cod_objeto = 'TAREFA'
            AND ic.objeto_id IS NOT NULL THEN ta.usuario_de_id
           WHEN ic.cod_objeto = 'DOCUMENTO'
            AND ic.objeto_id IS NOT NULL THEN do.usuario_id
           WHEN ic.cod_objeto = 'ORCAMENTO'
            AND ic.objeto_id IS NOT NULL THEN oc.usuario_autor_id
           ELSE (SELECT xr.usuario_id
                   FROM job_usuario xr
                  WHERE xr.job_id = jo.job_id
                    AND xr.flag_responsavel = 'S')
         END AS solicitante_id,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO'
            AND ic.objeto_id IS NOT NULL THEN NVL((SELECT LISTAGG(e.nome,', ') within group (order by e.nome)
                                                     FROM equipe e
                                                          INNER JOIN equipe_usuario x ON x.equipe_id = e.equipe_id
                                                          INNER JOIN os_usuario o ON o.usuario_id = x.usuario_id
                                                    WHERE o.ordem_servico_id = os.ordem_servico_id
                                                      AND o.tipo_ender = 'EXE'),'-')
           WHEN ic.cod_objeto = 'TAREFA'
            AND ic.objeto_id IS NOT NULL THEN NVL((SELECT LISTAGG(e.nome,', ') within group (order by e.nome)
                                                     FROM equipe e
                                                          INNER JOIN equipe_usuario x ON x.equipe_id = e.equipe_id
                                                          INNER JOIN tarefa_usuario i on x.usuario_id = i.usuario_para_id
                                                    WHERE i.tarefa_id = ta.tarefa_id),'-')
           WHEN ic.cod_objeto = 'DOCUMENTO'
            AND ic.objeto_id IS NOT NULL THEN NVL((SELECT LISTAGG(e.nome,', ') within group (order by e.nome)
                                                     FROM equipe e
                                                          INNER JOIN equipe_usuario x ON x.equipe_id = e.equipe_id
                                                          INNER JOIN task i on x.usuario_id = i.usuario_autor_id
                                                          INNER JOIN tipo_objeto t on t.tipo_objeto_id = i.tipo_objeto_id
                                                    WHERE i.objeto_id = do.documento_id
                                                      AND t.codigo = 'DOCUMENTO'),'-')
           WHEN ic.cod_objeto = 'ORCAMENTO' AND ic.objeto_id IS NOT NULL THEN '-'
           ELSE NVL((SELECT LISTAGG(e.nome,', ') within group (order by e.nome)
                       FROM equipe e
                            INNER JOIN equipe_usuario x ON x.equipe_id = e.equipe_id
                            INNER JOIN item_crono_usu i on x.usuario_id = i.usuario_id
                      WHERE i.item_crono_id = ic.item_crono_id),'-')
         END AS equipe,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO'
            AND ic.objeto_id IS NOT NULL THEN NVL((SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM os_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'EXE'),'-')
           WHEN ic.cod_objeto = 'TAREFA'
            AND ic.objeto_id IS NOT NULL THEN NVL((SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM tarefa_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_para_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.tarefa_id = ta.tarefa_id),'-')
           WHEN ic.cod_objeto = 'DOCUMENTO'
            AND ic.objeto_id IS NOT NULL THEN (SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM task i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_autor_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                                   INNER JOIN tipo_objeto t on t.tipo_objeto_id = i.tipo_objeto_id
                                             WHERE i.objeto_id = do.documento_id
                                               AND t.codigo = 'DOCUMENTO')
           WHEN ic.cod_objeto = 'ORCAMENTO' AND ic.objeto_id IS NOT NULL THEN '-'
           ELSE NVL((SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM item_crono_usu i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.item_crono_id = ic.item_crono_id),'-')
         END AS executores,
         CASE
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' AND ic.objeto_id IS NOT NULL THEN
                NVL((SELECT SUM(u.horas_planej)
                       FROM os_usuario u
                            INNER JOIN item_crono i ON i.objeto_id = u.ordem_servico_id AND i.cod_objeto = 'ORDEM_SERVICO'
                      WHERE i.item_crono_id = ic.item_crono_id),0)
           WHEN ic.cod_objeto = 'TAREFA' AND ic.objeto_id IS NOT NULL THEN
                NVL((SELECT SUM(u.horas_totais)
                       FROM tarefa_usuario u
                            INNER JOIN item_crono i ON i.objeto_id = u.tarefa_id AND i.cod_objeto = 'TAREFA'
                      WHERE i.item_crono_id = ic.item_crono_id),0)
           ELSE NVL((SELECT SUM(h.horas_totais) FROM item_crono_usu h WHERE h.item_crono_id = ic.item_crono_id),0)
         END AS horas,
         pc.nome AS produto_cliente,
         DECODE(CONTRATO_PKG.NUMERO_FORMATAR(ct.contrato_id), 'ERRO', '-', CONTRATO_PKG.NUMERO_FORMATAR(ct.contrato_id)) AS contrato_numero,
         DECODE(ct.nome, NULL, '-', ct.nome) AS contrato_nome,
         ic.data_planej_ini AS data_inicio_planejada,
         DATA_MOSTRAR(ic.data_planej_ini) AS data_inicio_planejada_fmt,
         ic.data_planej_fim AS data_fim_planejada,
         DATA_MOSTRAR(ic.data_planej_fim) AS data_fim_planejada_fmt,
         NVL(pr.apelido || ' (' || ur.funcao || ')','-') AS responsavel_pelo_job,
         ur.usuario_id AS responsavel_pelo_job_id,
         NVL(cn.apelido || DECODE(cn.funcao,NULL,'',' (' || cn.funcao || ')'),'-') AS contato_job,
         jo.data_entrada AS data_entrada_job,
         DATA_MOSTRAR(jo.data_entrada) AS data_entrada_job_fmt,
         sysdate AS data_envio,
         DATA_MOSTRAR(sysdate) AS data_envio_fmt,
         jo.data_pri_aprov AS data_apresentacao,
         DATA_MOSTRAR(jo.data_pri_aprov) AS data_apresentacao_fmt,
         sysdate AS data_go_live,
         DATA_MOSTRAR(sysdate) AS data_go_live_fmt,
         NVL(ui.apelido,'-') AS coment_status_autor,
         ic.data_situacao AS coment_status_data,
         DATA_MOSTRAR(ic.data_situacao) AS coment_status_data_fmt,
         NVL(ic.situacao,'-') AS coment_status,
         CASE
            WHEN os.qtd_refacao = '0' OR os.qtd_refacao IS NULL THEN
               '-'
            ELSE
               TO_CHAR(os.qtd_refacao)
          END AS refacao
    FROM item_crono ic
         INNER JOIN cronograma cr      ON ic.cronograma_id = cr.cronograma_id
         INNER JOIN job jo             ON jo.job_id = cr.job_id
         INNER JOIN pessoa cl          ON cl.pessoa_id = jo.cliente_id
          LEFT JOIN produto_cliente pc ON pc.produto_cliente_id = jo.produto_cliente_id
          LEFT JOIN contrato ct        ON ct.contrato_id = jo.contrato_id
          LEFT JOIN pessoa cn          ON cn.pessoa_id = jo.contato_id
          LEFT JOIN ordem_servico os   ON os.ordem_servico_id = ic.objeto_id AND ic.cod_objeto = 'ORDEM_SERVICO'
          LEFT JOIN dicionario dos     ON ic.cod_objeto = 'ORDEM_SERVICO'
                                       AND dos.codigo = os.status
                                       AND dos.tipo = 'status_os'
          LEFT JOIN tipo_os ts         ON ts.tipo_os_id = os.tipo_os_id
          LEFT JOIN tarefa ta          ON ta.tarefa_id = ic.objeto_id AND ic.cod_objeto = 'TAREFA'
          LEFT JOIN dicionario dts     ON ic.cod_objeto = 'TAREFA'
                                       AND dts.codigo = ta.status
                                       AND dts.tipo = 'status_tarefa'
          LEFT JOIN documento do       ON do.documento_id = ic.objeto_id AND ic.cod_objeto = 'DOCUMENTO'
          LEFT JOIN orcamento oc       ON oc.orcamento_id = ic.objeto_id AND ic.cod_objeto = 'ORCAMENTO'
          LEFT JOIN dicionario dms     ON ic.cod_objeto = 'ORCAMENTO'
                                       AND dms.codigo = oc.status
                                       AND dms.tipo = 'status_orcam'
          LEFT JOIN briefing bf        ON bf.job_id = jo.job_id
                                       AND bf.briefing_id = BRIEFING_PKG.ULTIMO_RETORNAR(jo.job_id)
                                       AND ic.cod_objeto = 'BRIEFING'
          LEFT JOIN dicionario dbs     ON ic.cod_objeto = 'BRIEFING'
                                       AND dbs.codigo = bf.status
                                       AND dbs.tipo = 'status_brief'
          LEFT JOIN dicionario dhs     ON ic.cod_objeto = 'JOB_HORAS'
                                       AND dhs.codigo = jo.status_horas
                                       AND dhs.tipo = 'status_job_horas'
          LEFT JOIN dicionario dcs     ON ic.cod_objeto = 'CRONOGRAMA'
                                       AND dcs.codigo = cr.status
                                       AND dcs.tipo = 'status_crono'
          LEFT JOIN pessoa ui          ON ui.usuario_id = ic.usuario_situacao_id
          LEFT JOIN job_usuario xr     ON xr.job_id = jo.job_id
                                       AND xr.flag_responsavel = 'S'
          LEFT JOIN usuario ur         ON ur.usuario_id = xr.usuario_id
          LEFT JOIN pessoa pr          ON pr.usuario_id = xr.usuario_id
          LEFT JOIN os_evento ov       ON ov.os_evento_id = ordem_servico_pkg.ultimo_evento_retornar(os.ordem_servico_id)
   WHERE ic.cod_objeto IN ('ORDEM_SERVICO','TAREFA')
     AND cr.status <> 'ARQUI'
;
--------------------------------------------------------
--  DDL for View V_AVALIACAO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_AVALIACAO" ("CODIGO", "DESCRICAO", "ORDEM") AS 
  SELECT
-----------------------------------------------------------------------
-- lista dados do dicionario: avaliacao
-----------------------------------------------------------------------
       codigo,
       descricao,
       ordem
  FROM dicionario
 WHERE tipo = 'avaliacao'
;
--------------------------------------------------------
--  DDL for View V_CLIENTES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CLIENTES" ("EMPRESA", "EMPRESA_ID", "PESSOA_ID", "APELIDO", "RAZAO_SOCIAL", "GRUPO_CLIENTE", "EMPRESA_RESP_JOB_PADRAO", "EMPRESA_FATUR_PADRAO", "PESSOA_FISICA_JURIDICA", "CNPJ", "INSCR_ESTADUAL", "INSCR_MUNICIPAL", "INSCR_INSS", "CPF", "RG", "RG_ORG_EXP", "RG_DATA_EXP", "RG_UF", "ENDERECO", "NUM_ENDER", "COMPL_ENDER", "ZONA", "BAIRRO", "CEP", "CIDADE", "UF", "PAIS", "DDD_TELEFONE", "NUM_TELEFONE", "DDD_FAX", "NUM_FAX", "DDD_CELULAR", "NUM_CELULAR", "NUM_RAMAL", "WEBSITE", "EMAIL", "NUM_AGENCIA", "NUM_CONTA", "NOME_TITULAR", "CNPJ_CPF_TITULAR", "TIPO_CONTA") AS 
  SELECT em.nome AS empresa,
         em.empresa_id,
         pe.pessoa_id,
         pe.apelido,
         pe.nome AS razao_social,
	     NVL((SELECT LISTAGG(gr.nome,', ') WITHIN GROUP (ORDER BY gr.nome)
                FROM grupo gr
                     INNER JOIN grupo_pessoa gp ON gr.grupo_id = gp.grupo_id 
               WHERE gp.pessoa_id = pe.pessoa_id
                 AND gr.flag_agrupa_cnpj = 'S'),'-') AS grupo_cliente,
         NVL(er.apelido,'Não Definido') AS empresa_resp_job_padrao,
         NVL(ef.apelido,'Não Definido') AS empresa_fatur_padrao,
         DECODE(pe.flag_pessoa_jur,'S','Jurídica','N','Física','Não Definido') AS pessoa_fisica_juridica,
         pe.CNPJ,
         pe.INSCR_ESTADUAL,
         pe.INSCR_MUNICIPAL,
         pe.INSCR_INSS,
         pe.CPF,
         pe.RG,
         pe.RG_ORG_EXP,
         pe.RG_DATA_EXP,
         pe.RG_UF,
         PE.ENDERECO,
         pe.NUM_ENDER,
         pe.COMPL_ENDER,
         pe.ZONA,
         pe.BAIRRO,
         pe.CEP,
         pe.CIDADE,
         pe.UF,
         pe.PAIS,
         pe.DDD_TELEFONE,
         pe.NUM_TELEFONE,
         pe.DDD_FAX,
         pe.NUM_FAX,
         pe.DDD_CELULAR,
         pe.NUM_CELULAR,
         pe.NUM_RAMAL,
         pe.WEBSITE,
         pe.EMAIL,
         pe.NUM_AGENCIA,
         pe.NUM_CONTA,
         pe.NOME_TITULAR,
         pe.CNPJ_CPF_TITULAR,
         pe.TIPO_CONTA
    FROM pessoa pe
         INNER JOIN empresa em ON em.empresa_id = pe.empresa_id
         LEFT JOIN pessoa er ON er.pessoa_id = pe.emp_resp_pdr_id
         LEFT JOIN pessoa ef ON ef.pessoa_id = pe.emp_fatur_pdr_id
   WHERE NOT EXISTS (SELECT 1 FROM relacao r 
                      WHERE r.pessoa_filho_id = pe.pessoa_id)
     AND EXISTS     (SELECT 1 FROM tipific_pessoa x
                                   INNER JOIN tipo_pessoa t ON t.tipo_pessoa_id = x.tipo_pessoa_id
                      WHERE x.pessoa_id = pe.pessoa_id
                        AND t.codigo = 'CLIENTE')
     AND pe.flag_ativo = 'S'
;
--------------------------------------------------------
--  DDL for View V_CONTRATO_CONSUMO_RESUMO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CONTRATO_CONSUMO_RESUMO" ("AREA_ID", "CARGO_ID", "ORDEM", "USUARIO_ID", "AREA", "CARGO", "NIVEL", "DESCRICAO_CLIENTE", "USUARIO", "HORAS_PLANEJ", "HORAS_GASTAS") AS 
  SELECT area_id,
         cargo_id,
         ordem,
         usuario_id,
         area,
         cargo,
         nivel,
         descricao_cliente,
         usuario,
         SUM(horas_planej) AS horas_planej,
         SUM(horas_gastas) AS horas_gastas
    FROM
(    
  SELECT ar.area_id,
         ca.cargo_id,
         ni.ordem,
         pe.usuario_id,
         ar.nome AS area,
         NVL(ca.nome, '-') AS cargo,
         NVL(ni.descricao,'-') AS nivel,
         ch.descricao AS descricao_cliente,
         NVL(pe.apelido,'-') AS usuario,
         SUM(ch.horas_planej) AS horas_planej,
         0 AS horas_gastas
    FROM contrato_horas ch
         INNER JOIN area ar ON ar.area_id = ch.area_id 
          LEFT JOIN cargo ca ON ca.cargo_id = ch.cargo_id
          LEFT JOIN pessoa pe ON pe.usuario_id = ch.usuario_id
          LEFT JOIN dicionario ni ON ni.tipo = 'nivel_usuario' AND ni.codigo = ch.nivel
   WHERE ch.contrato_id = 3
GROUP BY ar.area_id,
         ca.cargo_id,
         ni.ordem,
         pe.usuario_id, 
         ar.nome, 
         ca.nome, 
         ni.descricao, 
         ch.descricao, 
         pe.apelido
UNION ALL  
  SELECT ar.area_id,
         ca.cargo_id,
         ni.ordem,
         0 AS usuario_id,
         NVL(ar.nome,'-') AS area,
         NVL(ca.nome,'-') AS cargo,
         NVL(ni.descricao,'-') AS nivel,
         '' AS descricao_cliente,
         '' AS usuario,
         0 AS horas_planej,
         SUM(ah.horas) AS horas_gastas
    FROM apontam_data ad 
         INNER JOIN apontam_hora ah ON ah.apontam_data_id = ad.apontam_data_id
          LEFT JOIN area ar ON ad.area_cargo_id = ar.area_id
          LEFT JOIN cargo ca ON ca.cargo_id = ad.cargo_id
          LEFT JOIN dicionario ni ON ni.tipo = 'nivel_usuario' AND ni.codigo = ad.nivel
          LEFT JOIN ordem_servico os ON os.ordem_servico_id = ah.ordem_servico_id
          LEFT JOIN tipo_financeiro tf ON tf.tipo_financeiro_id = os.tipo_financeiro_id
   WHERE ah.job_id IN (SELECT job_id FROM job WHERE contrato_id = 3)
     AND tf.flag_consid_hr_os_ctr = 'S'
     AND NOT EXISTS (SELECT 1 FROM contrato_horas WHERE usuario_id = ad.usuario_id)
GROUP BY ar.area_id,
         ca.cargo_id,
         ni.ordem,
         ar.nome,
         ca.nome,
         ni.descricao
UNION ALL
  SELECT ar.area_id,
         0 AS cargo_id,
         0 AS ordem,
         ad.usuario_id,
         NVL(ar.nome,'-') AS area,
         '-' AS cargo,
         '-' AS nivel,
         '' AS descricao_cliente,
         pe.apelido AS usuario,
         0 AS horas_planej,
         SUM(ah.horas) AS horas_gastas
    FROM apontam_data ad 
         INNER JOIN apontam_hora ah ON ah.apontam_data_id = ad.apontam_data_id
         INNER JOIN pessoa pe ON pe.usuario_id = ad.usuario_id
          LEFT JOIN area ar ON ad.area_cargo_id = ar.area_id
          LEFT JOIN ordem_servico os ON os.ordem_servico_id = ah.ordem_servico_id
          LEFT JOIN tipo_financeiro tf ON tf.tipo_financeiro_id = os.tipo_financeiro_id
   WHERE ah.job_id IN (SELECT job_id FROM job WHERE contrato_id = 3)
     AND tf.flag_consid_hr_os_ctr = 'S'
     AND EXISTS (SELECT 1 FROM contrato_horas WHERE usuario_id = ad.usuario_id)
GROUP BY ar.area_id,
         ad.usuario_id,
         ar.nome,
         pe.apelido
)
GROUP BY area_id,
         cargo_id,
         ordem,
         usuario_id,
         area,
         cargo,
         nivel,
         descricao_cliente,
         usuario
ORDER BY area,cargo,ordem
;
--------------------------------------------------------
--  DDL for View V_CONTRATO_ESTIMATIVAS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CONTRATO_ESTIMATIVAS" ("CONTRATO_ID", "CONTRATO_HORAS_ID", "AREA_ID", "AREA", "ORDEM_CARGO_USUARIO", "CARGO", "CARGO_ORDEM", "CARGO_ID", "DESCRICAO", "USUARIO", "USUARIO_ID", "NIVEL", "NIVEL_CODIGO", "NIVEL_ORDEM", "DATA", "MES", "MES_NOME", "ANO", "HORAS_PLANEJ", "PRECO_SUGERIDO", "FATOR", "PRECO_UNITARIO", "SERVICO_NOME", "CONTRATO_SERVICO_ID", "SERVICO_DESCRICAO", "SERVICO_DATA_INICIO", "SERVICO_DATA_TERMINO", "SERVICO_EMPRESA_FATURAMENTO", "SERVICO_CODIGO_EXTERNO") AS 
  SELECT NVL(ch.contrato_id,cs.contrato_id) AS contrato_id,
          ch.contrato_horas_id,
          ar.area_id,
          ar.nome AS area,
          DECODE(us.usuario_id,NULL,1,2) AS ordem_cargo_usuario,
          NVL(ca.nome,'-') AS cargo,
          NVL(ca.ordem,0) AS cargo_ordem,
          ch.cargo_id,
          ch.descricao,
          NVL(us.apelido,'-') AS usuario,
          us.usuario_id,
          nv.descricao AS nivel,
          nv.codigo AS nivel_codigo,
          nv.ordem AS nivel_ordem,
          ch.data,
          to_char(ch.data,'MM') AS mes,
          to_char(ch.data,'MON') AS mes_nome,
          to_char(ch.data,'YYYY') AS ano,
          ch.horas_planej,
          ch.venda_hora_pdr AS preco_sugerido,
          ch.venda_fator_ajuste AS fator,
          ch.venda_hora_rev AS preco_unitario,
          NVL(se.nome,'-') AS servico_nome,
          cs.contrato_servico_id,
          NVL(cs.descricao,'-') AS servico_descricao,
          DATA_MOSTRAR(cs.data_inicio) AS servico_data_inicio,
          DATA_MOSTRAR(cs.data_termino) AS servico_data_termino,
          NVL(ef.nome,'-') AS servico_empresa_faturamento,
          NVL(cs.cod_externo,'-') AS servico_codigo_externo 
     FROM contrato_servico cs
          FULL JOIN contrato_horas ch ON ch.contrato_servico_id = cs.contrato_servico_id
          LEFT JOIN servico se ON se.servico_id = cs.servico_id
          LEFT JOIN pessoa ef ON ef.pessoa_id = cs.emp_faturar_por_id
          LEFT JOIN area ar ON ar.area_id = ch.area_id
          LEFT JOIN cargo ca ON ca.cargo_id = ch.cargo_id
          LEFT JOIN pessoa us ON us.usuario_id = ch.usuario_id
          LEFT JOIN dicionario nv ON nv.tipo = 'nivel_usuario' AND nv.codigo = ch.nivel
;
--------------------------------------------------------
--  DDL for View V_CONTRATOS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CONTRATOS" ("OPORT_NUMERO", "OPORT_NOME", "OPORT_PROSPECT", "OPORT_PRODUTO_CLIENTE_NOME", "OPORT_TIPO_CONTRATO", "OPORT_STATUS", "OPORT_STATUS_AUXILIAR", "OPORT_DATA_STATUS", "OPORT_SERVICOS", "OPORT_VALOR_SERVICOS", "OPORT_STATUS_FMT", "OPORT_DATA_ENTRADA", "OPORT_DATA_ENTRADA_FMT", "OPORT_ABERTO_POR", "OPORT_RESPONSAVEL", "OPORT_ORIGEM", "OPORT_COMPL_ORIGEM", "OPORT_TIPO_NEGOCIO", "OPORT_CONFLITO", "OPORT_CLIENTE_CONFLITO_APELIDO", "OPORT_CONTATO_APELIDO", "OPORT_NUM_PARCELAS", "OPORT_VALOR_PARCELA", "OPORT_DATA_CONCLUSAO", "CONTRATO_NUMERO", "CONTRATO_NOME", "CONTRATO_TIPO_CONTRATO", "CONTRATO_STATUS", "CONTRATO_ID", "CONTRATO_ASSINADO_S_N", "CONTRATO_FISICO", "CONTRATO_DATA_ASSINATURA", "CONTRATO_NUMERO_EXTERNO", "CONTRATO_CONTRATANTE", "CONTRATO_CNPJ", "CONTRATO_VIGENCIA_INICIO", "CONTRATO_VIGENCIA_FIM", "CONTRATO_DURACAO_EM_MESES", "CONTRATO_RENOVAVEL", "CONTRATO_ORDEM_DE_COMPRA", "CONTRATO_EMP_FATURAR_POR_ID", "CONTRATO_EMPRESA_FATURAMENTO", "CONTRATO_COD_EXT_ORDEM", "CONTRATO_SOLICITANTE", "CONTRATO_RESPONSAVEL", "CONTRATO_ENDERECADOS", "CONTRATO_DATA_CONCLUSAO", "CONTRATO_DATA_CANCELAMENTO", "CONTRATO_TIPO_DE_CONTRATO", "CONTRATO_SERVICOS", "CONTRATO_NUMERO_PARCELAS", "CONTRATO_NUMERO_PARCELAS_FATURADAS", "CONTRATO_CONTATO", "EMPRESA_ID", "PRECIF_PROPOSTA_VERIF", "INFO_CLI_VERIF", "INFO_FIS_CLI_VERIF", "HORAS_VERIF", "ALOC_USUARIO_FEITA", "UNIDADE_NEGOCIO_RESP_CONTRATO", "PRECIF_PROPOSTA_STATUS", "INFO_CLIENTE_STATUS", "INFO_FISCAL_CLIENTE_STATUS", "HORAS_VENDIDAS_STATUS", "CONTRATO_FISICO_STATUS", "CONTRATO_FISICO_STATUS_DET", "ALOC_USUARIO_STATUS", "PARCELAMENTO_STATUS", "PRECIF_PROPOSTA_PRAZO", "INFO_CLIENTE_PRAZO", "INFO_FISCAL_CLIENTE_FISC", "VERIF_HORA_PRAZO", "CONTRATO_FISICO_PRAZO", "CONTRATO_FISICO_PRAZO_ACAO", "ALOC_USUARIO_PRAZO", "PARCELAMENTO_PRAZO", "PRECIF_PROPOSTA_PRAZO_COR", "INFO_CLIENTE_PRAZO_COR", "INFO_FISCAL_CLIENTE_FISC_COR", "VERIF_HORA_PRAZO_COR", "CONTRATO_FISICO_PRAZO_COR", "CONTRATO_FISICO_PRAZO_ACAO_COR", "ALOC_USUARIO_PRAZO_COR", "PARCELAMENTO_PRAZO_COR", "RENOVACAO", "VIGENCIA", "GRUPO_PRODUTO_ID", "GRUPO_PRODUTO_NOME") AS 
  SELECT op.numero AS oport_numero,
       op.nome AS oport_nome,
       pi.apelido AS oport_prospect,
       oc.nome AS oport_produto_cliente_nome,
       decode(op.numero, NULL, NULL, tc.nome) AS oport_tipo_contrato,
       do.descricao AS oport_status,
       CASE
         WHEN op.status <> 'CONC' THEN
          ao.nome
         WHEN op.status = 'CONC' THEN
          decode(op.tipo_conc,
                 'GAN',
                 'Ganha',
                 'PER',
                 'Perdida',
                 NULL)
         ELSE
          NULL
       END AS oport_status_auxiliar,
       op.data_status AS oport_data_status,
       (SELECT listagg(se.nome, ', ') within GROUP(ORDER BY se.nome)
          FROM oport_servico oe
         INNER JOIN servico se
            ON se.servico_id = oe.servico_id
           AND se.flag_ativo = 'S'
         WHERE oe.oportunidade_id =
               op.oportunidade_id) AS oport_servicos,
       (SELECT SUM(cs.valor_servico)
          FROM cenario_servico cs
         WHERE op.cenario_escolhido_id =
               cs.cenario_id) AS oport_valor_servicos,
       data_mostrar(op.data_status) AS oport_status_fmt,
       op.data_entrada AS oport_data_entrada,
       data_mostrar(op.data_entrada) AS oport_data_entrada_fmt,
       decode(pu.apelido,
              NULL,
              NULL,
              us.funcao,
              NULL,
              NULL,
              pu.apelido || ' (' || us.funcao || ')') AS oport_aberto_por,
       decode(po.apelido,
              NULL,
              NULL,
              po.apelido || ' (' || uo.funcao || ')') AS oport_responsavel,
       oo.descricao AS oport_origem,
       op.compl_origem AS oport_compl_origem,
       ot.descricao AS oport_tipo_negocio,
       decode(op.flag_conflito,
              'S',
              'Sim',
              'N',
              'Não',
              'ND') AS oport_conflito,
       cc.apelido AS oport_cliente_conflito_apelido,
       ct.apelido AS oport_contato_apelido,
       ce.num_parcelas AS oport_num_parcelas,
       round((SELECT SUM(c.valor_servico)
                FROM cenario_servico c
               WHERE c.cenario_id = ce.cenario_id) /
             ce.num_parcelas,
             2) AS oport_valor_parcela,
       CASE
         WHEN op.status = 'CONC' THEN
          op.data_status
         ELSE
          NULL
       END AS oport_data_conclusao,
       nvl(contrato_pkg.numero_formatar(co.contrato_id),
           '') AS contrato_numero,
       co.nome AS contrato_nome,
       tc.nome AS contrato_tipo_contrato,
       dc.descricao AS contrato_status,
       co.contrato_id AS contrato_id,
       decode(co.flag_assinado,
              'S',
              'Sim',
              'N',
              'Não',
              'ND') AS contrato_assinado_s_n,
       decode(co.flag_ctr_fisico,
              'S',
              'Sim',
              'N',
              'Não',
              'ND') AS contrato_fisico,
       co.data_assinatura AS contrato_data_assinatura,
       co.cod_ext_contrato AS contrato_numero_externo,
       pt.nome AS contrato_contratante,
       pt.cnpj AS contrato_cnpj,
       co.data_inicio AS contrato_vigencia_inicio,
       co.data_termino AS contrato_vigencia_fim,
       (SELECT ceil(months_between(co.data_termino,
                                   data_inicio))
          FROM dual) AS contrato_duracao_em_meses,
       decode(co.flag_renovavel,
              'S',
              'Sim',
              'N',
              'Não',
              'ND') AS contrato_renovavel,
       co.ordem_compra AS contrato_ordem_de_compra,
       co.emp_faturar_por_id AS contrato_emp_faturar_por_id,
       pf.nome AS contrato_empresa_faturamento,
       co.cod_ext_ordem AS contrato_cod_ext_ordem,
       decode(ps.apelido,
              NULL,
              'Não Definido',
              ps.apelido || ' (' || us.funcao || ')') AS contrato_solicitante,
       decode(pr.apelido,
              NULL,
              'Não Definido',
              pr.apelido || ' (' || ur.funcao || ')') AS contrato_responsavel,
       (SELECT listagg(nvl(to_char(u.usuario_id),'-'),', ') within GROUP(ORDER BY u.usuario_id)
          FROM contrato_usuario u
         WHERE u.contrato_id = co.contrato_id) AS contrato_enderecados,
       CASE
         WHEN co.status = 'CONC' THEN
          co.data_status
         ELSE
          NULL
       END AS contrato_data_conclusao,
       CASE
         WHEN co.status = 'CANC' THEN
          co.data_status
         ELSE
          NULL
       END AS contrato_data_cancelamento,
       tc.nome AS contrato_tipo_de_contrato,
       (SELECT listagg(se.nome, ', ') within GROUP(ORDER BY se.nome)
          FROM contrato_servico ce
         INNER JOIN servico se
            ON se.servico_id = ce.servico_id
           AND se.flag_ativo = 'S'
         WHERE ce.contrato_id = co.contrato_id) AS contrato_servicos,
       (SELECT COUNT(1)
          FROM parcela_contrato pc
         WHERE pc.contrato_id = co.contrato_id) AS contrato_numero_parcelas,
       (SELECT COUNT(1)
          FROM parcela_contrato pc
         INNER JOIN parcela_fatur_ctr pf
            ON pf.parcela_contrato_id =
               pc.parcela_contrato_id
         WHERE pc.contrato_id = co.contrato_id) AS contrato_numero_parcelas_faturadas,
       pe.nome AS contrato_contato,
       co.empresa_id,
       tc.flag_verifi_precif AS precif_proposta_verif,
       pt.flag_cad_verif AS info_cli_verif,
       pt.flag_fis_verif AS info_fis_cli_verif,
       tc.flag_verifi_horas AS horas_verif,
       tc.flag_aloc_usuario AS aloc_usuario_feita,
       (SELECT MIN(un.nome)
          FROM unidade_negocio     un,
               unidade_negocio_usu us
         WHERE un.unidade_negocio_id =
               us.unidade_negocio_id
           AND us.usuario_id = ur.usuario_id) AS unidade_negocio_resp_contrato,
       (SELECT CASE e.status
                 WHEN 'PEND' THEN
                  'Pendente'
                 WHEN 'PRON' THEN
                  'Feito'
                 WHEN 'NFEI' THEN
                  'Não será Feito'
               END
          FROM contrato_elab e
         WHERE e.contrato_id = co.contrato_id
           AND e.cod_contrato_elab = 'PREC') AS precif_proposta_status,
       (SELECT CASE e.status
                 WHEN 'PEND' THEN
                  'Pendente'
                 WHEN 'PRON' THEN
                  'Feito'
                 WHEN 'NFEI' THEN
                  'Não será Feito'
               END
          FROM contrato_elab e
         WHERE e.contrato_id = co.contrato_id
           AND e.cod_contrato_elab = 'CLIE') AS info_cliente_status,
       (SELECT CASE e.status
                 WHEN 'PEND' THEN
                  'Pendente'
                 WHEN 'PRON' THEN
                  'Feito'
                 WHEN 'NFEI' THEN
                  'Não será Feito'
               END
          FROM contrato_elab e
         WHERE e.contrato_id = co.contrato_id
           AND e.cod_contrato_elab = 'FISC') AS info_fiscal_cliente_status,
       (SELECT CASE e.status
                 WHEN 'PEND' THEN
                  'Pendente'
                 WHEN 'PRON' THEN
                  'Feito'
                 WHEN 'NFEI' THEN
                  'Não será Feito'
               END
          FROM contrato_elab e
         WHERE e.contrato_id = co.contrato_id
           AND e.cod_contrato_elab = 'HORA') AS horas_vendidas_status,
       (SELECT CASE e.status
                 WHEN 'PEND' THEN
                  'Pendente'
                 WHEN 'PRON' THEN
                  'Feito'
                 WHEN 'NFEI' THEN
                  'Não será Feito'
               END
          FROM contrato_elab e
         WHERE e.contrato_id = co.contrato_id
           AND e.cod_contrato_elab = 'FISI') AS contrato_fisico_status,
       (SELECT CASE f.status
                 WHEN 'EMAP' THEN
                  'Pendente Aprovação'
                 WHEN 'PEND' THEN
                  'Pendente'
                 WHEN 'REPR' THEN
                  'Reprovado'
                 WHEN 'FASS' THEN
                  'Assinado'
                 WHEN 'PASS' THEN
                  'Aguardando Assinatura'
                 WHEN 'APRO' THEN
                  'Aprovado'
                 WHEN 'NASS' THEN
                  'Não será Assinado'
               END
          FROM contrato_fisico f,
               (SELECT cf.contrato_id,
                       MAX(cf.versao) AS versao
                  FROM contrato_fisico cf
                 GROUP BY cf.contrato_id) f2
         WHERE f.contrato_id = co.contrato_id
           AND f.contrato_id = f2.contrato_id
           AND f.versao = f2.versao) AS contrato_fisico_status_det,
       (SELECT CASE e.status
                 WHEN 'PEND' THEN
                  'Pendente'
                 WHEN 'PRON' THEN
                  'Feito'
                 WHEN 'NFEI' THEN
                  'Não será Feito'
               END
          FROM contrato_elab e
         WHERE e.contrato_id = co.contrato_id
           AND e.cod_contrato_elab = 'ALOC') AS aloc_usuario_status,
       decode(co.status_parcel,
              'NAOI',
              'Não Iniciado',
              'PREP',
              'Pendente',
              'PRON',
              'Feito') AS parcelamento_status,
       (SELECT to_date(decode(el.status,
                              'PEND',
                              data_mostrar(el.data_prazo),
                              NULL),
                       'DD/MM/YYYY')
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'PREC') AS precif_proposta_prazo,
       (SELECT to_date(decode(el.status,
                              'PRON',
                              NULL,
                              data_mostrar(el.data_prazo)),
                       'DD/MM/YYYY')
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'CLIE') AS info_cliente_prazo,
       (SELECT to_date(decode(el.status,
                              'PRON',
                              NULL,
                              data_mostrar(el.data_prazo)),
                       'DD/MM/YYYY')
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'FISC') AS info_fiscal_cliente_fisc,
       (SELECT to_date(decode(el.status,
                              'PRON',
                              NULL,
                              data_mostrar(el.data_prazo)),
                       'DD/MM/YYYY')
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'HORA') AS verif_hora_prazo,
       (SELECT to_date(decode(el.status,
                              'PRON',
                              NULL,
                              data_mostrar(el.data_prazo)),
                       'DD/MM/YYYY')
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'FISI') AS contrato_fisico_prazo,
       (SELECT to_date(data_mostrar(f.data_prazo),
                       'DD/MM/YYYY')
          FROM contrato_fisico f,
               (SELECT cf.contrato_id,
                       MAX(cf.versao) AS versao
                  FROM contrato_fisico cf
                 GROUP BY cf.contrato_id) f2
         WHERE f.contrato_id = co.contrato_id
           AND f.contrato_id = f2.contrato_id
           AND f.versao = f2.versao) AS contrato_fisico_prazo_acao,
       (SELECT to_date(decode(el.status,
                              'PRON',
                              NULL,
                              data_mostrar(el.data_prazo)),
                       'DD/MM/YYYY')
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'ALOC') AS aloc_usuario_prazo,
       (SELECT to_date(decode(el.status,
                              'PRON',
                              NULL,
                              data_mostrar(el.data_prazo)),
                       'DD/MM/YYYY')
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'PARC') AS parcelamento_prazo,
       (SELECT CASE
                 WHEN el.data_prazo <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN el.data_prazo =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'PREC') AS precif_proposta_prazo_cor,
       (SELECT CASE
                 WHEN el.data_prazo <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN el.data_prazo =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'CLIE') AS info_cliente_prazo_cor,
       (SELECT CASE
                 WHEN el.data_prazo <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN el.data_prazo =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'FISC') AS info_fiscal_cliente_fisc_cor,
       (SELECT CASE
                 WHEN el.data_prazo <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN el.data_prazo =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'HORA') AS verif_hora_prazo_cor,
       (SELECT CASE
                 WHEN el.data_prazo <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN el.data_prazo =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'FISI') AS contrato_fisico_prazo_cor,
       (SELECT CASE
                 WHEN MAX(f.data_prazo) <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN MAX(f.data_prazo) =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_fisico f
         WHERE f.contrato_id = co.contrato_id) AS contrato_fisico_prazo_acao_cor,
       (SELECT CASE
                 WHEN el.data_prazo <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN el.data_prazo =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'ALOC') AS aloc_usuario_prazo_cor,
       (SELECT CASE
                 WHEN el.data_prazo <
                      trunc(SYSDATE) THEN
                  'vermelho'
                 WHEN el.data_prazo =
                      trunc(SYSDATE) THEN
                  'amarelo'
                 ELSE
                  'branco'
               END
          FROM contrato_elab el
         WHERE el.contrato_id = co.contrato_id
           AND el.cod_contrato_elab = 'PARC') AS parcelamento_prazo_cor,
       (SELECT data_converter(data_mostrar(co2.data_termino -
                                           (SELECT
                                            empresa_pkg.parametro_retornar(co.empresa_id,'NUM_DIAS_NOTIF_RENOV_CTR')
                                            FROM dual)))
          FROM contrato co2
         WHERE co2.contrato_id = co.contrato_id) AS renovacao,
       (SELECT abs(to_date(co2.data_termino) -
                   to_date(SYSDATE))
          FROM contrato co2
         WHERE co2.contrato_id = co.contrato_id) AS vigencia,
        (SELECT listagg(DISTINCT(gs.grupo_servico_id),', ')
        FROM grupo_servico gs
        INNER JOIN servico se
        ON gs.grupo_servico_id = se.grupo_servico_id
        INNER JOIN contrato_servico ce
        ON se.servico_id = ce.servico_id
        AND ce.contrato_id = co.contrato_id) as grupo_produto_id,
        (SELECT LISTAGG(distinct gs.nome, ', ')
        FROM grupo_servico gs
        LEFT JOIN servico se
        ON gs.grupo_servico_id = se.grupo_servico_id
        INNER JOIN contrato_servico ce
        ON se.servico_id = ce.servico_id
        AND ce.contrato_id = co.contrato_id) as grupo_produto_nome
  FROM contrato co
 INNER JOIN tipo_contrato tc
    ON tc.tipo_contrato_id = co.tipo_contrato_id
 INNER JOIN dicionario dc
    ON dc.codigo = co.status
   AND dc.tipo = 'status_contrato'
 INNER JOIN usuario us
    ON us.usuario_id = co.usuario_solic_id
 INNER JOIN pessoa ps
    ON ps.usuario_id = us.usuario_id
  LEFT JOIN pessoa pe
    ON pe.pessoa_id = co.contato_id
  LEFT JOIN pessoa pt
    ON pt.pessoa_id = co.contratante_id
  LEFT JOIN pessoa pf
    ON pf.pessoa_id = co.emp_faturar_por_id
  LEFT JOIN contrato_usuario cr
    ON cr.contrato_id = co.contrato_id
   AND cr.flag_responsavel = 'S'
  LEFT JOIN usuario ur
    ON ur.usuario_id = cr.usuario_id
  LEFT JOIN pessoa pr
    ON pr.usuario_id = cr.usuario_id
  LEFT JOIN oport_contrato opc
    ON opc.contrato_id = co.contrato_id
  LEFT JOIN oportunidade op
    ON op.oportunidade_id = opc.oportunidade_id
  LEFT JOIN pessoa pi
    ON pi.pessoa_id = op.cliente_id
  LEFT JOIN dicionario do
    ON do.codigo = op.status
   AND do.tipo = 'status_oportunidade'
  LEFT JOIN status_aux_oport ao
    ON ao.status_aux_oport_id =
       op.status_aux_oport_id
  LEFT JOIN pessoa cc
    ON cc.pessoa_id = op.cliente_conflito_id
  LEFT JOIN pessoa ct
    ON ct.pessoa_id = op.contato_id
  LEFT JOIN usuario usr
    ON usr.usuario_id = op.usuario_solic_id
  LEFT JOIN pessoa pu
    ON pu.usuario_id = usr.usuario_id
  LEFT JOIN oport_usuario ou
    ON ou.oportunidade_id = op.oportunidade_id
   AND ou.flag_responsavel = 'S'
  LEFT JOIN usuario uo
    ON uo.usuario_id = ou.usuario_id
  LEFT JOIN pessoa po
    ON po.usuario_id = ou.usuario_id
  LEFT JOIN produto_cliente oc
    ON oc.produto_cliente_id =
       op.produto_cliente_id
  LEFT JOIN tipo_contrato tc
    ON tc.tipo_contrato_id = op.tipo_contrato_id
  LEFT JOIN dicionario oo
    ON oo.codigo = op.origem
   AND oo.tipo = 'oportunidade_origem'
  LEFT JOIN dicionario ot
    ON ot.codigo = op.tipo_negocio
   AND ot.tipo = 'oportunidade_tipo_negocio'
  LEFT JOIN cenario ce
    ON ce.oportunidade_id = op.oportunidade_id
   AND ce.flag_padrao = 'S'

;
--------------------------------------------------------
--  DDL for View V_CONTRATO_SERVICOS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CONTRATO_SERVICOS" ("CONTRATO_EMPRESA_ID", "CONTRATO_DATA_ENTRADA", "CONTRATO_RESPONSAVEL", "CONTRATO_NUMERO", "CONTRATO_NOME", "CONTRATO_CLIENTE", "CONTRATO_TIPO_CONTRATO", "CONTRATO_DATA_ASSINATURA", "CONTRATO_VIGENCIA_INICIO", "CONTRATO_VIGENCIA_FIM", "CONTRATO_DURACAO_EM_MESES", "CONTRATO_CODIGO_EXTERNO", "CONTRATO_EMP_FATURAR_POR_ID", "CONTRATO_EMPRESA_FATURAMENTO", "CONTRATO_NUMERO_EXTERNO", "CONTRATO_RENOVAVEL", "CONTRATO_FISICO", "CONTRATO_ASSINADO_S_N", "CONTRATO_STATUS", "CONTRATO_ORDEM_DE_COMPRA", "CONTRATO_COD_EXT_ORDEM", "CONTRATO_CONTATO", "CONTRATO_ID", "CONTRATO_ENDERECADOS", "CONTRATO_DATA_CONCLUSAO", "CONTRATO_COD_EXTERNO", "CONTRATO_DESCRICAO_SERVICOS", "CONTRATO_NUMERO_PARCELAS", "CONTRATO_VALOR_TOTAL_SERVICO", "CONTRATO_STATUS_PARCELAMENTO", "CONTRATO_NUMERO_PARCELAS_FATURADAS", "CONTRATO_QTDE_PARCELAS_PEND", "CONTRATO_COD_EXT_INTEGRACAO", "OPORT_NUMERO", "OPORT_DESCRICAO", "OPORT_PROSPECT", "OPORT_CONFLITO", "OPORT_CLIENTE_CONFLITO_APELIDO", "OPORT_CONTATO_APELIDO", "OPORT_PRODUTO_CLIENTE_NOME", "OPORT_ORIGEM", "OPORT_TIPO_NEGOCIO", "OPORT_COMPL_ORIGEM", "OPORT_TIPO_CONTRATO", "OPORT_DATA_STATUS", "OPORT_STATUS", "OPORT_STATUS_AUXILIAR", "OPORT_ABERTO_POR", "OPORT_DATA_ENTRADA", "OPORT_DATA_FECHAMENTO", "OPORT_RESPONSAVEL_CONDUCAO", "CENARIO_VALOR_SERVICO_EMP_RESP", "OPORT_RESPONSAVEL", "OPORT_UN_RESPONSAVEL") AS 
  SELECT   co.empresa_id                                                                         AS contrato_empresa_id,
         co.data_entrada                                                                       AS contrato_data_entrada,
         DECODE(pr.apelido,NULL,'Não Definido',pr.apelido || ' (' || ur.funcao || ')')         AS contrato_responsavel,
         CONTRATO_PKG.numero_formatar(co.contrato_id)                                          AS contrato_numero,
         co.nome                                                                               AS contrato_nome,
         pt.nome                                                                               AS contrato_cliente,
         tc.nome                                                                               AS contrato_tipo_contrato,
         co.data_assinatura                                                                    AS contrato_data_assinatura,
         co.data_inicio                                                                        AS contrato_vigencia_inicio,
         co.data_termino                                                                       AS contrato_vigencia_fim,
         (SELECT CEIL(MONTHS_BETWEEN(co.data_termino, co.data_inicio)) FROM DUAL)              AS contrato_duracao_em_meses,
         co.cod_ext_contrato                                                                   AS contrato_codigo_externo,
         ce.EMP_FATURAR_POR_ID                                                                 AS contrato_emp_faturar_por_id,
         pf.nome                                                                               AS contrato_empresa_faturamento,
         co.cod_ext_contrato                                                                   AS contrato_numero_externo,
         DECODE(co.flag_renovavel,'S','Sim','N','Não','ND')                                    AS contrato_renovavel,
         DECODE(co.flag_ctr_fisico,'S','Sim','N','Não','ND')                                   AS contrato_fisico,
         DECODE(co.flag_assinado,'S','Sim','N','Não','ND')                                     AS contrato_assinado_s_n,
         dc.descricao                                                                          AS contrato_status,
         co.ordem_compra                                                                       AS contrato_ordem_de_compra,
         co.cod_ext_ordem                                                                      AS contrato_cod_ext_ordem,
         pe.nome                                                                               AS contrato_contato,
         co.contrato_id                                                                        AS contrato_id,
         (SELECT LISTAGG(NVL(TO_CHAR(u.usuario_id),'-'),', ')
                 WITHIN GROUP (ORDER BY u.usuario_id)
            FROM contrato_usuario u WHERE u.contrato_id = co.contrato_id)                      AS contrato_enderecados,
         CASE
           WHEN co.status = 'CONC' THEN co.data_status
           ELSE NULL
         END                                                                                   AS contrato_data_conclusao,
         -- CONTRATO X SERVIÇO
         ce.cod_externo                                                                        AS contrato_cod_externo,
         se.nome                                                                               AS contrato_descricao_servicos,
         (SELECT count(pc.num_parcela)
            FROM parcela_contrato pc
           WHERE pc.contrato_id = co.contrato_id
             AND pc.contrato_servico_id (+) = ce.contrato_servico_id)                          AS contrato_numero_parcelas,
         (SELECT SUM(pc.valor_parcela)
            FROM parcela_contrato pc
           WHERE pc.contrato_id = co.contrato_id
             AND pc.contrato_servico_id (+) = ce.contrato_servico_id)                          AS contrato_valor_total_servico,
         DECODE(co.status_parcel, 'PREP', 'Preparação',
                                  'PRON', 'Pronto',
                                  'NAOI', 'Não informado')                                     AS contrato_status_parcelamento,
         (SELECT COUNT(1)
            FROM parcela_contrato pc
           INNER JOIN contrato_servico  cr ON  cr.contrato_id = pc.contrato_id
                                           AND cr.contrato_servico_id = pc.contrato_servico_id
           INNER JOIN parcela_fatur_ctr pf ON  pf.parcela_contrato_id = pc.parcela_contrato_id
           WHERE pc.contrato_id = co.contrato_id
             AND pc.contrato_servico_id = ce.contrato_servico_id)                              AS contrato_numero_parcelas_faturadas,
         (SELECT COUNT(1)
            FROM parcela_contrato pc
           INNER JOIN contrato_servico  cr ON  cr.contrato_id = pc.contrato_id
                                           AND cr.contrato_servico_id = pc.contrato_servico_id
           WHERE NOT EXISTS (SELECT 1
                               FROM parcela_fatur_ctr pf
                              WHERE pc.parcela_contrato_id = pf.parcela_contrato_id
                                AND cr.contrato_servico_id = pc.contrato_servico_id)
             AND pc.contrato_id         = co.contrato_id
             AND pc.contrato_servico_id = ce.contrato_servico_id)                              AS contrato_qtde_parcelas_pend,
         (SELECT LISTAGG(ce.cod_ext_ctrser, ', ') WITHIN GROUP (ORDER BY ce.cod_ext_ctrser)
            FROM contrato_servico  ce
            INNER JOIN servico      se ON se.servico_id       = ce.servico_id
                                       AND se.flag_ativo = 'S'
           WHERE ce.contrato_id      = co.contrato_id)                                         AS contrato_cod_ext_integracao,
        -- OPORTUNIDADE
        op.numero                                                                              AS oport_numero,
        op.nome                                                                                AS oport_descricao,
        pi.apelido                                                                             AS oport_prospect,
        DECODE(op.flag_conflito,'S','Sim','N','Não','ND')                                      AS oport_conflito,
        cc.apelido                                                                             AS oport_cliente_conflito_apelido,
        ct.apelido                                                                             AS oport_contato_apelido,
        oc.nome                                                                                AS oport_produto_cliente_nome,
        oo.descricao                                                                           AS oport_origem,
        ot.descricao                                                                           AS oport_tipo_negocio,
        op.compl_origem                                                                        AS oport_compl_origem,
        tc.nome                                                                                AS oport_tipo_contrato,
        op.data_status                                                                         AS oport_data_status,
        do.descricao                                                                           AS oport_status,
        ao.nome                                                                                AS oport_status_auxiliar,
        pu.apelido || ' (' || us.funcao || ')'                                                 AS oport_aberto_por,
        op.data_entrada                                                                        AS oport_data_entrada,
        op.data_prov_fech                                                                      AS oport_data_fechamento,
        DECODE(po.apelido,NULL,'Não Definido',po.apelido || ' (' || uo.funcao || ')')          AS oport_responsavel_conducao,
        -- oportunidade x cenario
        ces.valor_servico                                                                      AS cenario_valor_servico_emp_resp,
        DECODE(por.apelido,NULL,'Não Definido',por.apelido || ' (' || uor.funcao || ')')       AS oport_responsavel,
        NVL((SELECT UN.NOME
           FROM UNIDADE_NEGOCIO UN
          WHERE UN.UNIDADE_NEGOCIO_ID = op.unid_negocio_resp_id), '')                          AS oport_un_responsavel
         FROM contrato             co
        INNER JOIN tipo_contrato   tc                                                          ON tc.tipo_contrato_id    = co.tipo_contrato_id
        INNER JOIN usuario         us                                                          ON us.usuario_id          = co.usuario_solic_id
        INNER JOIN dicionario      dc                                                          ON dc.codigo              = co.status                                                                                       AND dc.tipo               = 'status_contrato'
        INNER JOIN contrato_servico ce                                                         ON ce.contrato_id         = co.contrato_id
        INNER JOIN servico          se                                                         ON se.servico_id          = ce.servico_id                                                                                               AND se.flag_ativo         = 'S'
        LEFT JOIN pessoa           ps                                                          ON ps.usuario_id          = us.usuario_id
        LEFT JOIN pessoa           pe                                                          ON pe.pessoa_id           = co.contato_id
        LEFT JOIN pessoa           pf                                                          ON pf.pessoa_id           = ce.emp_faturar_por_id
        LEFT JOIN contrato_usuario cr                                                          ON cr.contrato_id         = co.contrato_id                                                                                          AND cr.flag_responsavel   = 'S'
        LEFT JOIN usuario          ur                                                          ON ur.usuario_id          = cr.usuario_id
        LEFT JOIN pessoa           pr                                                          ON pr.usuario_id          = cr.usuario_id
        LEFT JOIN pessoa           pt                                                          ON pt.pessoa_id           = co.contratante_id
        LEFT JOIN oport_contrato   opc                                                         ON opc.contrato_id        = co.contrato_id
        LEFT JOIN oportunidade     op                                                          ON op.oportunidade_id     = opc.oportunidade_id
        LEFT JOIN pessoa           pi                                                          ON pi.pessoa_id           = op.cliente_id
        LEFT JOIN dicionario       do                                                          ON do.codigo              = op.status                                                                                        AND do.tipo               = 'status_oportunidade'
        LEFT JOIN status_aux_oport ao                                                          ON ao.status_aux_oport_id = op.status_aux_oport_id
        LEFT JOIN pessoa           cc                                                          ON cc.pessoa_id           = op.cliente_conflito_id
        LEFT JOIN pessoa           ct                                                          ON ct.pessoa_id           = op.contato_id
        LEFT JOIN usuario          usr                                                         ON usr.usuario_id         = op.usuario_solic_id
        LEFT JOIN pessoa           pu                                                          ON pu.usuario_id          = usr.usuario_id
        LEFT JOIN oport_usuario    ou                                                          ON ou.oportunidade_id     = op.oportunidade_id                                                                                           AND ou.flag_responsavel   = 'S'
        LEFT JOIN usuario          uo                                                          ON uo.usuario_id          = ou.usuario_id
        LEFT JOIN pessoa           po                                                          ON po.usuario_id          = ou.usuario_id
        LEFT JOIN produto_cliente  oc                                                          ON oc.produto_cliente_id  = op.produto_cliente_id
        LEFT JOIN tipo_contrato    tc                                                          ON tc.tipo_contrato_id    = op.tipo_contrato_id
        LEFT JOIN dicionario       oo                                                          ON oo.codigo              = op.origem                                                                                          AND oo.tipo               = 'oportunidade_origem'
        LEFT JOIN dicionario       ot                                                          ON ot.codigo              = op.tipo_negocio                                                                                           AND ot.tipo               = 'oportunidade_tipo_negocio'
        LEFT JOIN cenario          cn                                                          ON cn.oportunidade_id     = op.oportunidade_id                                                                                           AND cn.flag_padrao        = 'S'
        LEFT JOIN cenario_servico  ces                                                         ON ces.servico_id         = se.servico_id                                                                                        AND ces.cenario_id        = cn.cenario_id
        LEFT JOIN pessoa           por                                                         ON por.usuario_id         = op.usuario_resp_id
        LEFT JOIN usuario          uor                                                         ON uor.usuario_id         = op.usuario_resp_id
;
--------------------------------------------------------
--  DDL for View V_CONTRATO_USU_ALOC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CONTRATO_USU_ALOC" ("USUARIO_ID", "NOME", "ATIVO", "CONTRATO_ID", "EMPRESA_ID", "NIVEL", "MES", "ANO", "MES_ANO", "EQUIPE_ID", "EQUIPE", "CARGO_ID", "CARGO", "UNIDADE_NEGOCIO_ID", "UNIDADE_NEGOCIO", "HORAS_MES", "HORAS_ALOC_PLANEJADA_MES", "HORAS_LIVRES") AS 
  SELECT PE.USUARIO_ID,
       PE.APELIDO AS NOME,
       USU.FLAG_ATIVO AS ATIVO,
       CO.CONTRATO_ID,
       CO.EMPRESA_ID,
       CH.NIVEL AS NIVEL,
       TO_CHAR(CH.DATA, 'MM') AS MES,
       TO_CHAR(CH.DATA, 'YYYY') AS ANO,
       TO_CHAR(CH.DATA, 'MON/YYYY', 'nls_language ="BRAZILIAN PORTUGUESE"')AS MES_ANO,
       (SELECT DISTINCT LISTAGG(E.EQUIPE_ID,', ') WITHIN GROUP (ORDER BY E.EQUIPE_ID)
          FROM EQUIPE E,
               EQUIPE_USUARIO EU
         WHERE E.EQUIPE_ID   = EU.EQUIPE_ID
           AND EU.USUARIO_ID = PE.USUARIO_ID) AS EQUIPE_ID,
       (SELECT DISTINCT LISTAGG(E.NOME,', ') WITHIN GROUP (ORDER BY E.NOME)
          FROM EQUIPE E,
               EQUIPE_USUARIO EU
         WHERE E.EQUIPE_ID   = EU.EQUIPE_ID
           AND EU.USUARIO_ID = PE.USUARIO_ID) AS EQUIPE,
       (SELECT C.CARGO_ID
          FROM CARGO C,
               USUARIO_CARGO UC
        WHERE C.CARGO_ID     = UC.CARGO_ID
          AND UC.USUARIO_ID  = PE.USUARIO_ID
          AND UC.DATA_FIM    IS NULL) AS CARGO_ID,
       (SELECT C.NOME
          FROM CARGO C,
               USUARIO_CARGO UC
        WHERE C.CARGO_ID     = UC.CARGO_ID
          AND UC.USUARIO_ID  = PE.USUARIO_ID
          AND UC.DATA_FIM    IS NULL) AS CARGO,
          (SELECT DISTINCT LISTAGG(UN.UNIDADE_NEGOCIO_ID,', ') WITHIN GROUP (ORDER BY UN.UNIDADE_NEGOCIO_ID)
          FROM UNIDADE_NEGOCIO     UN,
               UNIDADE_NEGOCIO_USU UE
         WHERE UN.UNIDADE_NEGOCIO_ID = UE.UNIDADE_NEGOCIO_ID
           AND UE.USUARIO_ID         = PE.USUARIO_ID
           AND UN.EMPRESA_ID         = CO.EMPRESA_ID) AS UNIDADE_NEGOCIO_ID,
       (SELECT DISTINCT LISTAGG(UN.NOME,', ') WITHIN GROUP (ORDER BY UN.NOME)
          FROM UNIDADE_NEGOCIO     UN,
               UNIDADE_NEGOCIO_USU UE
         WHERE UN.UNIDADE_NEGOCIO_ID = UE.UNIDADE_NEGOCIO_ID
           AND UE.USUARIO_ID         = PE.USUARIO_ID
           AND UN.EMPRESA_ID         = CO.EMPRESA_ID) AS UNIDADE_NEGOCIO,
         (SELECT NVL(USU.NUM_HORAS_PROD_DIA * 20,NUMERO_CONVERTER(empresa_pkg.parametro_retornar(CO.EMPRESA_ID,'QT_HORAS_MENSAIS')))
         FROM USUARIO USU
         WHERE USU.USUARIO_ID = PE.USUARIO_ID) AS HORAS_MES,
         /*
          NULL AS HORAS_PLANEJADAS_PERIODO,
          NULL AS HORAS_LIVRES_PERIODO,
          NULL AS PORC_PLANEJADAS_PERIODO,*/
      (SELECT SUM(CHU2.HORAS_ALOC)
      FROM CONTRATO CON,
           CONTRATO_HORAS_USU CHU2,
           CONTRATO_HORAS CH2
      WHERE CON.CONTRATO_ID = CH2.CONTRATO_ID
      AND CH2.CONTRATO_HORAS_ID = CHU2.CONTRATO_HORAS_ID
      AND TO_CHAR(CH2.DATA,'MM/YY') = TO_CHAR(CH.DATA,'MM/YY')
      AND CHU2.USUARIO_ID = PE.USUARIO_ID
      AND CON.CONTRATO_ID = CO.CONTRATO_ID
      AND CON.EMPRESA_ID = CO.EMPRESA_ID) AS HORAS_ALOC_PLANEJADA_MES,
      (SELECT(
      (SELECT NVL(USU.NUM_HORAS_PROD_DIA * 20,NUMERO_CONVERTER(empresa_pkg.parametro_retornar(CO.EMPRESA_ID,'QT_HORAS_MENSAIS')))
         FROM USUARIO USU
         WHERE USU.USUARIO_ID = PE.USUARIO_ID)
      -
      (SELECT
          SUM(CHU2.HORAS_ALOC)
      FROM CONTRATO CON,
           CONTRATO_HORAS_USU CHU2,
           CONTRATO_HORAS CH2
      WHERE CON.CONTRATO_ID = CH2.CONTRATO_ID
      AND CH2.CONTRATO_HORAS_ID = CHU2.CONTRATO_HORAS_ID
      AND TO_CHAR(CH2.DATA,'MM/YY') = TO_CHAR(CH.DATA,'MM/YY')
      AND CHU2.USUARIO_ID = PE.USUARIO_ID
      AND CON.CONTRATO_ID = CO.CONTRATO_ID))
      FROM DUAL)  AS HORAS_LIVRES
      --NULL AS PLANEJADO_PERIODO
  FROM CONTRATO           CO,
       CONTRATO_HORAS     CH,
       CONTRATO_HORAS_USU HU,
       USUARIO            USU,
       PESSOA             PE
 WHERE CO.CONTRATO_ID       = CH.CONTRATO_ID
   AND CH.CONTRATO_HORAS_ID = HU.CONTRATO_HORAS_ID
   AND HU.USUARIO_ID        = PE.USUARIO_ID
   AND PE.USUARIO_ID        = USU.USUARIO_ID
   GROUP BY
       PE.USUARIO_ID,
       PE.APELIDO,
       USU.FLAG_ATIVO,
       CO.CONTRATO_ID,
       CO.EMPRESA_ID,
       CH.NIVEL,
       CH.DATA

;
--------------------------------------------------------
--  DDL for View V_CONTRATO_USU_ALOC_DETALHE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CONTRATO_USU_ALOC_DETALHE" ("USUARIO_ID", "CONTRATO_ID", "NUMERO", "DESCRICAO", "CLIENTE_NOME", "SERVICO", "HORA_ALOC_PLANEJADA", "MES", "ANO", "MES_ANO", "GRUPO_PRODUTO_NOME") AS 
  select chu.usuario_id,
       co.contrato_id,
       contrato_pkg.numero_formatar(co.contrato_id) as numero,
--co.motivo_desc as descricao,
co.nome as descricao,
pe.apelido as cliente_nome,
ser.nome as servico,
chu.horas_aloc as hora_aloc_planejada,
to_char(ch.data,'MM') as mes,
to_char(ch.data,'YYYY') as ano,
to_char(ch.data, 'MON/YYYY', 'nls_language ="BRAZILIAN PORTUGUESE"')as mes_ano,
(SELECT LISTAGG(DISTINCT(gs.nome), ', ')
  FROM contrato_horas ch
  LEFT JOIN contrato_servico cs
    ON cs.contrato_servico_id = ch.contrato_servico_id
  LEFT JOIN servico se
    ON se.servico_id = cs.servico_id
  LEFT JOIN contrato_horas_usu cu
    ON cu.contrato_horas_id = ch.contrato_horas_id
  LEFT JOIN grupo_servico gs
    ON gs.grupo_servico_id = se.grupo_servico_id
 WHERE ch.contrato_id = co.contrato_id
   AND cu.usuario_id = chu.usuario_id) as grupo_produto_nome
from contrato co,
     contrato_horas ch,
     contrato_horas_usu chu,
     contrato_servico cons,
     servico ser,
     pessoa pe
where co.contrato_id = cons.contrato_id
and co.contrato_id = ch.contrato_id
and ch.contrato_horas_id = chu.contrato_horas_id
and ch.contrato_servico_id = cons.contrato_servico_id
and cons.servico_id = ser.servico_id
and pe.pessoa_id = co.contratante_id

;
--------------------------------------------------------
--  DDL for View V_CUBO_ITEM_JOB
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_CUBO_ITEM_JOB" ("EMPRESA_ID", "EMPRESA_NOME", "EMPRESA_CODIGO", "EMPRESA_COD_EXT", "OPORTUNIDADE_ID", "OPORT_EMPRESA", "OPORT_NUMERO", "OPORT_NOME", "OPORT_CLIENTE_ID", "OPORT_CLIENTE_APELIDO", "OPORT_CLIENTE_NOME", "OPORT_PRODUTO_CLIENTE_NOME", "OPORT_STATUS", "OPORT_STATUS_AUXILIAR", "OPORT_DATA_STATUS", "OPORT_PRODUTO_CLIENTE_COD_EXT", "OPORT_DATA_ENTRADA", "OPORT_ORIGEM", "OPORT_TIPO_NEGOCIO", "OPORT_CONCLUSAO", "CONTRATO_ID", "CONTRATO_NUMERO", "CONTRATO_NOME", "CONTRATO_CLIENTE_ID", "CONTRATO_CLIENTE_APELIDO", "CONTRATO_CLIENTE_NOME", "CONTRATO_CLIENTE_SETOR_NOME", "CONTRATO_CLIENTE_SETOR_CODIGO", "CONTRATO_TIPO_NOME", "CONTRATO_TIPO_COD_EXT", "CONTRATO_EMPR_RESP_ID", "CONTRATO_EMPR_RESP_APELIDO", "CONTRATO_EMPR_RESP_COD_EXT", "JOB_ID", "JOB_NOME", "JOB_NUMERO", "CLIENTE_ID", "CLIENTE_APELIDO", "CLIENTE_NOME", "CLIENTE_DATA_ENTRADA_AGENCIA", "CLIENTE_SETOR_ID", "CLIENTE_SETOR", "CLIENTE_SETOR_CODIGO", "PRODUTO_CLIENTE_ID", "PRODUTO_CLIENTE_NOME", "PRODUTO_CLIENTE_COD_EXT", "CAMPANHA_ID", "CAMPANHA", "CAMPANHA_COD_EXT", "JOB_EMPR_RESP_ID", "JOB_EMPR_RESP_APELIDO", "JOB_EMPR_RESP_COD_EXT", "JOB_TIPO_FINANCEIRO_ID", "JOB_TIPO_FINANCEIRO_NOME", "JOB_UNIDADE_NEGOCIO_ID", "JOB_UNIDADE_NEGOCIO_NOME", "JOB_UNIDADE_NEGOCIO_COD_EXT", "SERVICO_ID", "SERVICO_NOME", "JOB_DATA_ENTRADA", "JOB_DATA_ENTRADA_ANO", "JOB_DATA_ENTRADA_QUARTER", "JOB_DATA_ENTRADA_MES", "JOB_DATA_ENTRADA_MES_EXTENSO", "JOB_DATA_PREV_INI", "JOB_DATA_PREV_FIM", "JOB_DATA_APONT_INI", "JOB_DATA_APONT_FIM", "JOB_DATA_GOLIVE", "JOB_COD_EXT", "JOB_FLAG_CONCORRENCIA", "JOB_STATUS", "JOB_STATUS_AUXILIAR", "JOB_DATA_STATUS", "JOB_COMPLEXIDADE", "ENTREGAVEL_TIPO_PRODUTO_ID", "ENTREGAVEL_NOME", "ENTREGAVEL_COMPLEMENTO", "ENTREGAVEL_CLASSE", "ENTREGAVEL_SUBCLASSE", "ENTREGAVEL_CATEGORIA", "MIDIA_ONLINE", "MIDIA_OFFILINE", "ENTREGUE_CLIENTE", "ENTREGAVEL_CODIGO", "ENTREGAVEL_COD_EXT", "ENTREGAVEL_DATA_ENTRADA", "ENTREGAVEL_DATA_ENTRADA_ANO", "ENTREGAVEL_DATA_ENTRADA_QUARTER", "ENTREGAVEL_DATA_ENTRADA_MES", "ENTREGAVEL_DATA_ENTRADA_MES_EXTENSO", "ENTREGAVEL_DATA_TERMINO", "ENTREGAVEL_DATA_TERMINO_ANO", "ENTREGAVEL_DATA_TERMINO_QUARTER", "ENTREGAVEL_DATA_TERMINO_MES", "ENTREGAVEL_DATA_TERMINO_MES_EXTENSO", "OBJETO_CODIGO", "OBJETO_ID", "OBJETO_NUMERO", "OBJETO_STATUS", "SOLICITANTE", "EXECUTORES", "EQUIPE", "TEMPO_EXECUCAO_INFORMADO", "TEMPO_EXECUCAO_CALCULADO", "QTDE_WORKFLOWS_TASKS", "QTDE_REFACOES", "QTDE_REFACOES_AGENCIA", "QTDE_REFACOES_CLIENTE", "HORAS_GASTAS") AS 
  SELECT --empresa
         jo.empresa_id,
         ep.nome AS empresa_nome,
         ep.codigo AS empresa_codigo,
         ep.cod_ext_empresa AS empresa_cod_ext,
         --oportunidade
         NVL(op.oportunidade_id,-jo.empresa_id) AS oportunidade_id,
         NVL(oe.nome,'Sem Oportunidade') AS oport_empresa,
         NVL(op.numero,'Sem Oportunidade') AS oport_numero,
         NVL(op.nome,'Sem Oportunidade') AS oport_nome,
         NVL(op.cliente_id,-jo.empresa_id) AS oport_cliente_id,
         NVL(co.apelido,'Sem Oportunidade') AS oport_cliente_apelido,
         NVL(co.nome,'Sem Oportunidade') AS oport_cliente_nome,
         NVL(oc.nome,'Sem Oportunidade') AS oport_produto_cliente_nome,
         NVL(do.descricao,'Sem Oportunidade') AS oport_status,
         NVL(ao.nome,'Não Definido') AS oport_status_auxiliar,
         op.data_status AS oport_data_status,
         NVL(oc.cod_ext_produto,'Não Definido') AS oport_produto_cliente_cod_ext,
         op.data_entrada AS oport_data_entrada,
         NVL(oo.descricao,'Sem Oportunidade') AS oport_origem,
         NVL(ot.descricao,'Sem Oportunidade') AS oport_tipo_negocio,
         DECODE(op.tipo_conc,'GAN','Ganha','PER','Perdida','DEC','Declinada','Sem Oportunidade') AS oport_conclusao,
         --contrato
         NVL(jo.contrato_id,-jo.empresa_id) AS contrato_id,
         DECODE(jo.contrato_id,NULL,'Sem Contrato',CONTRATO_PKG.NUMERO_FORMATAR(jo.contrato_id)) AS contrato_numero,
         NVL(ct.nome,'Sem Contrato') AS contrato_nome,
         NVL(ct.contratante_id,-jo.empresa_id) AS contrato_cliente_id,
         NVL(cc.apelido,'Sem Contrato') AS contrato_cliente_apelido,
         NVL(cc.nome,'Sem Contrato') AS contrato_cliente_nome,
         NVL(sc.nome,'Não Definido') AS contrato_cliente_setor_nome,
         NVL(sc.codigo,'Não Definido') AS contrato_cliente_setor_codigo,
         NVL(tc.nome,'Sem Contrato') AS contrato_tipo_nome,
         NVL(tc.cod_ext_tipo, 'Não Definido') AS contrato_tipo_cod_ext,
         NVL(ct.emp_resp_id,-jo.empresa_id) AS contrato_empr_resp_id,
         NVL(cr.apelido,'Sem Contrato') AS contrato_empr_resp_apelido,
         NVL((SELECT MAX(r.cod_ext_resp)
                FROM empr_resp_sist_ext r
               WHERE r.pessoa_id = cr.pessoa_id),'Não Definido') AS contrato_empr_resp_cod_ext,
         --job
         jo.job_id,
         jo.nome AS job_nome,
         jo.numero AS job_numero,
         jo.cliente_id,
         cl.apelido AS cliente_apelido,
         cl.nome AS cliente_nome,
         cl.data_entrada_agencia AS cliente_data_entrada_agencia,
         NVL(sc.setor_id,-jo.empresa_id) AS cliente_setor_id,
         NVL(sc.nome,'Não Definido') AS cliente_setor,
         NVL(sc.codigo,'Não Definido') AS cliente_setor_codigo,
         pc.produto_cliente_id,
         NVL(pc.nome,'Não Definido') AS produto_cliente_nome,
         NVL(pc.cod_ext_produto,'Não Definido') AS produto_cliente_cod_ext,
         NVL(ca.campanha_id,-jo.empresa_id) AS campanha_id,
         NVL(ca.nome,'Não Definido') AS campanha,
         NVL(ca.cod_ext_camp,'Não Definido') AS campanha_cod_ext,
         jo.emp_resp_id AS job_empr_resp_id,
         er.apelido AS job_empr_resp_apelido,
         (SELECT MAX(r.cod_ext_resp)
            FROM empr_resp_sist_ext r
           WHERE r.pessoa_id = er.pessoa_id) AS job_empr_resp_cod_ext,
         tf.tipo_financeiro_id AS job_tipo_financeiro_id,
         NVL(tf.nome,'Não Definido') AS job_tipo_financeiro_nome,
         un.unidade_negocio_id AS job_unidade_negocio_id,
         NVL(un.nome,'Não Definido') AS job_unidade_negocio_nome,
         NVL(un.cod_ext_unid_neg,'Não Definido') AS job_unidade_negocio_cod_ext,
         NVL(se.servico_id,-jo.empresa_id) AS servico_id,
         NVL(se.nome,'Não Definido') AS servico_nome,
         jo.data_entrada AS job_data_entrada,
         TO_CHAR(jo.data_entrada,'YYYY') AS job_data_entrada_ano,
         TO_CHAR(jo.data_entrada,'Q') AS job_data_entrada_quarter,
         TO_CHAR(jo.data_entrada,'MM') AS job_data_entrada_mes,
         MES_MOSTRAR(TO_CHAR(jo.data_entrada,'MM')) AS job_data_entrada_mes_extenso,
         jo.data_prev_ini AS job_data_prev_ini,
         jo.data_prev_fim AS job_data_prev_fim,
         jo.data_apont_ini AS job_data_apont_ini,
         jo.data_apont_fim AS job_data_apont_fim,
         jo.data_golive AS job_data_golive,
         jo.cod_ext_job AS job_cod_ext,
         DECODE(jo.flag_concorrencia,'S','Sim','N','Não','N/D') AS job_flag_concorrencia,
         sj.descricao AS job_status,
         sa.nome AS job_status_auxiliar,
         jo.data_status AS job_data_status,
         cj.descricao AS job_complexidade,
         --item
         tp.tipo_produto_id AS entregavel_tipo_produto_id,
         tp.nome AS entregavel_nome,
         jt.complemento AS entregavel_complemento,
         NVL(cp.nome_classe,'Não Definido') AS entregavel_classe,
         NVL(cp.sub_classe,'Não Definido') AS entregavel_subclasse,
         NVL(ce.descricao,'Não Definido') AS entregavel_categoria,
         DECODE(tp.flag_midia_online,'S','Sim','N','Não','N/D') AS midia_online,
         DECODE(tp.flag_midia_offline,'S','Sim','N','Não','N/D') AS midia_offiline,
         DECODE(tp.flag_cliente,'S','Sim','N','Não','N/D') AS entregue_cliente,
         tp.codigo AS entregavel_codigo,
         tp.cod_ext_produto AS entregavel_cod_ext,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN ttp.data_entrada
           ELSE (SELECT MIN(data_entrada)
                   FROM os_tipo_produto t
                  WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id)
         END AS entregavel_data_entrada,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN TO_CHAR(ttp.data_entrada,'YYYY')
           ELSE TO_CHAR((SELECT MIN(data_entrada)
            FROM os_tipo_produto t
           WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id),'YYYY')
         END AS entregavel_data_entrada_ano,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN TO_CHAR(ttp.data_entrada,'Q')
           ELSE TO_CHAR((SELECT MIN(data_entrada)
            FROM os_tipo_produto t
           WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id),'Q')
         END AS entregavel_data_entrada_quarter,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN TO_CHAR(ttp.data_entrada,'MM')
           ELSE TO_CHAR((SELECT MIN(data_entrada)
            FROM os_tipo_produto t
           WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id),'MM')
         END AS entregavel_data_entrada_mes,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN MES_MOSTRAR(TO_CHAR(ttp.data_entrada,'MM'))
           ELSE MES_MOSTRAR(TO_CHAR((SELECT MIN(data_entrada)
            FROM os_tipo_produto t
           WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id),'MM'))
         END AS entregavel_data_entrada_mes_extenso,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN ta.data_termino
           ELSE CASE
                  WHEN (SELECT COUNT(*)
                          FROM ordem_servico o
                               INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                         WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id
                           AND o.data_termino IS NULL) > 0
                  THEN NULL
                  ELSE (SELECT MAX(o.data_termino)
                          FROM ordem_servico o
                               INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                         WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id)
                END
         END AS entregavel_data_termino,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN TO_CHAR(ta.data_termino,'YYYY')
           ELSE TO_CHAR((CASE
                           WHEN (SELECT COUNT(*)
                                   FROM ordem_servico o
                                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                  WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id
                                    AND o.data_termino IS NULL) > 0
                           THEN NULL
                           ELSE (SELECT MAX(o.data_termino)
                                   FROM ordem_servico o
                                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                  WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id)
                         END),'YYYY')
         END AS entregavel_data_termino_ano,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN TO_CHAR(ta.data_termino,'Q')
           ELSE TO_CHAR((CASE
                           WHEN (SELECT COUNT(*)
                                   FROM ordem_servico o
                                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                  WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id
                                    AND o.data_termino IS NULL) > 0
                           THEN NULL
                           ELSE (SELECT MAX(o.data_termino)
                                   FROM ordem_servico o
                                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                  WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id)
                         END),'Q')
         END AS entregavel_data_termino_quarter,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN TO_CHAR(ta.data_termino,'MM')
           ELSE TO_CHAR((CASE
                           WHEN (SELECT COUNT(*)
                                   FROM ordem_servico o
                                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                  WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id
                                    AND o.data_termino IS NULL) > 0
                           THEN NULL
                           ELSE (SELECT MAX(o.data_termino)
                                   FROM ordem_servico o
                                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                  WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id)
                         END),'MM')
         END AS entregavel_data_termino_mes,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN MES_MOSTRAR(TO_CHAR(ta.data_termino,'MM'))
           ELSE MES_MOSTRAR(TO_CHAR((CASE
                                       WHEN (SELECT COUNT(*)
                                               FROM ordem_servico o
                                                    INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                              WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id
                                                AND o.data_termino IS NULL) > 0
                                       THEN NULL
                                       ELSE (SELECT MAX(o.data_termino)
                                               FROM ordem_servico o
                                                    INNER JOIN os_tipo_produto t ON t.ordem_servico_id = o.ordem_servico_id
                                              WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id)
                                     END),'MM'))
         END AS entregavel_data_termino_mes_extenso,
         --workflow ou task
         CASE
           WHEN os.ordem_servico_id IS NULL THEN 'Task'
           ELSE 'Workflow'
         END AS objeto_codigo,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN ta.tarefa_id
           ELSE os.ordem_servico_id
         END AS objeto_id,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN TAREFA_PKG.NUMERO_FORMATAR(ta.tarefa_id)
           ELSE ORDEM_SERVICO_PKG.NUMERO_FORMATAR(os.ordem_servico_id)
         END AS objeto_numero,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN dos.descricao
           ELSE dts.descricao
         END AS objeto_status,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN (SELECT p.apelido || ' (' || u.funcao || ')'
                                                 FROM pessoa p
                                                      INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                                WHERE p.usuario_id = ta.usuario_de_id)
           ELSE (SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM os_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'SOL')
         END AS solicitante,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN NVL((SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM tarefa_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_para_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.tarefa_id = ta.tarefa_id),'-')
           ELSE NVL((SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM os_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'EXE'),'-')
         END AS executores,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN NVL((SELECT LISTAGG(nome,', ') within group (order by nome)
                                                     FROM (SELECT DISTINCT e.nome FROM equipe e
                                                          INNER JOIN equipe_usuario x ON x.equipe_id = e.equipe_id
                                                          INNER JOIN tarefa_usuario i on (x.usuario_id = i.usuario_para_id OR x.usuario_id = ta.usuario_de_id)
                                                    WHERE i.tarefa_id = ta.tarefa_id
                                                      AND x.flag_membro = 'S')),'-')
           ELSE NVL((SELECT DISTINCT LISTAGG(nome,', ') within group (order by nome)
                                                     FROM (SELECT DISTINCT e.nome FROM equipe e
                                                          INNER JOIN equipe_usuario x ON x.equipe_id = e.equipe_id
                                                          INNER JOIN os_usuario o ON o.usuario_id = x.usuario_id
                                                    WHERE o.ordem_servico_id = os.ordem_servico_id
                                                      AND x.flag_membro = 'S')),'-')
         END AS equipe,
         tp.tempo_exec_info AS tempo_execucao_informado,
         tp.tempo_exec_calc AS tempo_execucao_calculado,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN 1
           ELSE (SELECT COUNT(t.job_tipo_produto_id)
            FROM os_tipo_produto t
           WHERE t.job_tipo_produto_id = jt.job_tipo_produto_id)
         END AS qtde_workflows_tasks,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN CASE ta.flag_devolvida
                            WHEN 'S' THEN 1
                            ELSE 0
                          END
           ELSE (SELECT COUNT(*)
                   FROM os_evento e
                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = e.ordem_servico_id
                        INNER JOIN os_refacao r ON r.ordem_servico_id = t.ordem_servico_id
                                          AND r.num_refacao = e.num_refacao
                  WHERE e.cod_acao = 'REFAZER'
                    AND r.data_conclusao IS NOT NULL
                    AND t.job_tipo_produto_id = jt.job_tipo_produto_id)
         END AS qtde_refacoes,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN CASE ta.flag_devolvida
                            WHEN 'S' THEN 1
                            ELSE 0
                          END
           ELSE (SELECT COUNT(*)
                   FROM os_evento e
                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = e.ordem_servico_id
                        INNER JOIN os_refacao r ON r.ordem_servico_id = t.ordem_servico_id
                                          AND r.num_refacao = e.num_refacao
                  WHERE e.tipo_cliente_agencia = 'AGE'
                    AND e.cod_acao = 'REFAZER'
                    AND r.data_conclusao IS NOT NULL
                    AND t.job_tipo_produto_id = jt.job_tipo_produto_id)
         END AS qtde_refacoes_agencia,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN 0
           ELSE (SELECT COUNT(*)
                   FROM os_evento e
                        INNER JOIN os_tipo_produto t ON t.ordem_servico_id = e.ordem_servico_id
                        INNER JOIN os_refacao r ON r.ordem_servico_id = t.ordem_servico_id
                                          AND r.num_refacao = e.num_refacao
                  WHERE e.tipo_cliente_agencia = 'CLI'
                    AND e.cod_acao = 'REFAZER'
                    AND r.data_conclusao IS NOT NULL
                    AND t.job_tipo_produto_id = jt.job_tipo_produto_id)
         END AS qtde_refacoes_cliente,
         CASE
           WHEN os.ordem_servico_id IS NULL THEN
                (SELECT TRUNC(NVL(SUM(a.horas/(SELECT COUNT(*) FROM tarefa_tipo_produto q WHERE q.tarefa_id = ta.tarefa_id)),0),2)
                   FROM apontam_hora a
                  WHERE a.tarefa_id = ta.tarefa_id)
           ELSE (SELECT TRUNC(NVL(SUM(a.horas/(SELECT COUNT(*) FROM os_tipo_produto q WHERE q.ordem_servico_id = os.ordem_servico_id)),0),2)
                   FROM apontam_hora a
                  WHERE a.ordem_servico_id = os.ordem_servico_id)
         END AS horas_gastas
    FROM job_tipo_produto jt
         INNER JOIN tipo_produto tp ON tp.tipo_produto_id = jt.tipo_produto_id
         INNER JOIN job jo ON jo.job_id = jt.job_id
         INNER JOIN pessoa cl ON cl.pessoa_id = jo.cliente_id
         INNER JOIN pessoa er ON er.pessoa_id = jo.emp_resp_id
         INNER JOIN empresa ep ON ep.empresa_id = jo.empresa_id
         INNER JOIN dicionario sj ON sj.codigo = jo.status AND sj.tipo = 'status_job'
         INNER JOIN status_aux_job sa ON sa.status_aux_job_id = jo.status_aux_job_id
         INNER JOIN dicionario cj ON cj.codigo = jo.complex_job AND cj.tipo = 'complex_job'
          LEFT JOIN classe_produto cp ON cp.classe_produto_id = tp.classe_produto_id
          LEFT JOIN dicionario ce ON ce.codigo = tp.categoria AND ce.tipo = 'categoria_tipo_prod'
          LEFT JOIN produto_cliente pc ON pc.produto_cliente_id = jo.produto_cliente_id
          LEFT JOIN campanha ca ON ca.campanha_id = jo.campanha_id
          LEFT JOIN tipo_financeiro tf ON tf.tipo_financeiro_id = jo.tipo_financeiro_id
          LEFT JOIN unidade_negocio un ON un.unidade_negocio_id = jo.unidade_negocio_id
          LEFT JOIN servico se ON se.servico_id = jo.servico_id
          LEFT JOIN contrato ct ON jo.contrato_id = ct.contrato_id
          LEFT JOIN tipo_contrato tc ON tc.tipo_contrato_id = ct.tipo_contrato_id
          LEFT JOIN pessoa cc ON cc.pessoa_id = ct.contratante_id
          LEFT JOIN setor sc ON sc.setor_id = cc.setor_id
          LEFT JOIN pessoa cr ON cr.pessoa_id = ct.emp_resp_id
          LEFT JOIN oport_contrato oc ON oc.contrato_id = ct.contrato_id
          LEFT JOIN oportunidade op ON op.oportunidade_id = oc.oportunidade_id
          LEFT JOIN empresa oe ON oe.empresa_id = op.empresa_id
          LEFT JOIN dicionario do ON do.codigo = op.status AND do.tipo = 'status_oportunidade'
          LEFT JOIN status_aux_oport ao ON ao.status_aux_oport_id = op.status_aux_oport_id
          LEFT JOIN pessoa co ON co.pessoa_id = op.cliente_id
          LEFT JOIN produto_cliente oc ON oc.produto_cliente_id = op.produto_cliente_id
          LEFT JOIN dicionario oo ON oo.codigo = op.origem AND oo.tipo = 'oportunidade_origem'
          LEFT JOIN dicionario ot ON ot.codigo = op.tipo_negocio AND ot.tipo = 'oportunidade_tipo_negocio'
          LEFT JOIN (SELECT o.job_tipo_produto_id, MIN(o.data_entrada) AS data_entrada, MAX(o.ordem_servico_id) AS ordem_servico_id
                       FROM os_tipo_produto o
                            INNER JOIN job_tipo_produto j ON j.job_tipo_produto_id = o.job_tipo_produto_id
                   GROUP BY o.job_tipo_produto_id, j.job_id) otp ON otp.job_tipo_produto_id = jt.job_tipo_produto_id
          LEFT JOIN ordem_servico os ON os.ordem_servico_id = otp.ordem_servico_id
          LEFT JOIN (SELECT t.job_tipo_produto_id, MIN(t.data_entrada) AS data_entrada, MAX(t.tarefa_id) AS tarefa_id
                       FROM tarefa_tipo_produto t
                            INNER JOIN job_tipo_produto j ON j.job_tipo_produto_id = t.job_tipo_produto_id
                   GROUP BY t.job_tipo_produto_id, j.job_id) ttp ON ttp.job_tipo_produto_id = jt.job_tipo_produto_id
          LEFT JOIN tarefa ta ON ta.tarefa_id = ttp.tarefa_id
          LEFT JOIN dicionario dos ON dos.codigo = os.status AND dos.tipo = 'status_os'
          LEFT JOIN dicionario dts ON dts.codigo = ta.status AND dts.tipo = 'status_tarefa'
    WHERE jo.status <> 'CANC'
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_ALOC_DIA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_ALOC_DIA" ("DATA", "PERC_ALOCACAO", "HORAS_TOTAL", "EQUIPE_ID") AS 
  SELECT da.data,
         CASE SUM(da.horas_diarias)
           WHEN 0 THEN 0
           ELSE ROUND(SUM(da.horas_total) /
                SUM(da.horas_diarias) * 100, 0)
         END AS perc_alocacao,  
         SUM(da.horas_total) AS horas_total,
         eu.equipe_id
    FROM equipe_usuario eu 
         INNER JOIN dia_alocacao da ON da.usuario_id = eu.usuario_id
   WHERE flag_membro = 'S'
     AND TRUNC(da.data) >= TRUNC(SYSDATE)
     AND TRUNC(da.data) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4)
GROUP BY eu.equipe_id, da.data
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_ALOC_DIA_USU
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_ALOC_DIA_USU" ("USUARIO_ID", "APELIDO", "FUNCAO", "DATA", "PERC_ALOCACAO", "HORAS_TOTAL", "EQUIPE_ID") AS 
  SELECT us.usuario_id,
         pe.apelido,
         us.funcao,
         da.data,
         CASE SUM(da.horas_diarias)
           WHEN 0 THEN 0
           ELSE ROUND(SUM(da.horas_total) /
                SUM(da.horas_diarias) * 100, 0)
         END AS perc_alocacao,  
         SUM(da.horas_total) AS horas_total,
         eu.equipe_id
    FROM equipe_usuario eu 
         INNER JOIN dia_alocacao da ON da.usuario_id = eu.usuario_id
         INNER JOIN usuario us ON us.usuario_id = eu.usuario_id
         INNER JOIN pessoa pe ON pe.usuario_id = eu.usuario_id
   WHERE flag_membro = 'S'
     AND TRUNC(da.data) >= TRUNC(SYSDATE)
     AND TRUNC(da.data) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4)
GROUP BY us.usuario_id, pe.apelido, us.funcao, eu.equipe_id, da.data
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_ALOC_TOTAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_ALOC_TOTAL" ("PERC_ALOCACAO", "TOTAL_HORAS_DISPONIVEIS", "TOTAL_HORAS", "TOTAL_HORAS_LIVRE", "TOTAL_HORAS_OVERTIME", "EQUIPE_ID") AS 
  SELECT ROUND(SUM(da.horas_total) /
         SUM(da.horas_diarias) * 100, 0) AS perc_alocacao,  
         SUM(da.horas_diarias) AS total_horas_disponiveis,
         SUM(da.horas_total) AS total_horas,  
         SUM(da.horas_livre) AS total_horas_livre,
         SUM(da.horas_overtime) AS total_horas_overtime,
         eq.equipe_id
    FROM equipe eq
         INNER JOIN equipe_usuario eu ON eu.equipe_id = eq.equipe_id
         INNER JOIN dia_alocacao da ON da.usuario_id = eu.usuario_id
   WHERE flag_membro = 'S'
     AND TRUNC(da.data) >= TRUNC(SYSDATE)
     AND TRUNC(da.data) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4)
GROUP BY eq.equipe_id
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_ALOC_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_ALOC_USUARIO" ("EQUIPE_ID", "USUARIO_ID", "DATA", "APELIDO", "FUNCAO", "NOME_FISICO", "PREFIXO", "NUMERO", "HORAS_DIARIAS", "PERC_ALOCACAO", "SALDO_HORAS", "HORAS_RESERVADO", "HORAS_ALOCADO", "HORAS_AUSENCIA") AS 
  SELECT eq.equipe_id,
         eu.usuario_id,
         da.data,
         pe.apelido,
         us.funcao,
         ar.nome_fisico,
         vo.prefixo,
         vo.numero,
         MAX(da.horas_diarias) AS horas_diarias,
         CASE da.horas_diarias
           WHEN 0 THEN 0
           ELSE ROUND(SUM(da.horas_total) /
                SUM(da.horas_diarias) * 100, 0) 
         END AS perc_alocacao,         
         SUM(da.horas_livre) - SUM(da.horas_overtime) AS saldo_horas,
         SUM(da.horas_reservado) AS horas_reservado,
         SUM(da.horas_alocado) AS horas_alocado,
         SUM(da.horas_ausencia) AS horas_ausencia
    FROM equipe eq
         INNER JOIN equipe_usuario eu ON eu.equipe_id = eq.equipe_id
         INNER JOIN dia_alocacao da ON da.usuario_id = eu.usuario_id
         INNER JOIN usuario us ON us.usuario_id = eu.usuario_id
         INNER JOIN pessoa pe ON pe.usuario_id = eu.usuario_id
          LEFT JOIN arquivo_pessoa ap ON ap.pessoa_id = pe.pessoa_id
                    AND ap.tipo_arq_pessoa = 'FOTO_USU'
                    AND ap.tipo_thumb = 'P'
          LEFT JOIN arquivo ar ON ar.arquivo_id = ap.arquivo_id
          LEFT JOIN volume vo ON vo.volume_id = ar.volume_id
   WHERE flag_membro = 'S'
     AND TRUNC(da.data) >= TRUNC(SYSDATE)
     AND TRUNC(da.data) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4)
GROUP BY eq.equipe_id, eu.usuario_id, da.data, da.horas_diarias,
         pe.apelido, us.funcao, ar.nome_fisico,
         vo.prefixo, vo.numero
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_ATRASOS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_ATRASOS" ("EMPRESA_ID", "EQUIPE_ID", "GRUPO_CLIENTE", "GRUPO_CLIENTE_ID", "APELIDO", "FUNCAO", "USUARIO_ID", "HORAS") AS 
  SELECT       
         jo.empresa_id,   
         CASE 
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' 
            THEN NVL((SELECT LISTAGG(x.equipe_id,', ') WITHIN GROUP (ORDER BY x.equipe_id)
                        FROM equipe_usuario x
                       WHERE x.usuario_id = ou.usuario_id
                         AND x.flag_membro = 'S'),'-')
           WHEN ic.cod_objeto = 'TAREFA' 
            THEN NVL((SELECT LISTAGG(x.equipe_id,', ') WITHIN GROUP (ORDER BY x.equipe_id)
                        FROM equipe_usuario x
                       WHERE x.usuario_id = tu.usuario_id
                         AND x.flag_membro = 'S'),'-')
         END AS equipe_id,
         NVL((SELECT LISTAGG(gr.nome,', ') WITHIN GROUP (ORDER BY gr.nome)
                FROM grupo gr
                     INNER JOIN grupo_pessoa gp ON gr.grupo_id = gp.grupo_id 
               WHERE gp.pessoa_id = cl.pessoa_id
                 AND gr.flag_agrupa_cnpj = 'S'),cl.apelido) AS grupo_cliente,
         NVL((SELECT LISTAGG(gr.grupo_id,', ') WITHIN GROUP (ORDER BY gr.nome)
                FROM grupo gr
                     INNER JOIN grupo_pessoa gp ON gr.grupo_id = gp.grupo_id 
               WHERE gp.pessoa_id = cl.pessoa_id
                 AND gr.flag_agrupa_cnpj = 'S'),cl.pessoa_id) AS grupo_cliente_id,
         CASE 
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' THEN op.apelido
           WHEN ic.cod_objeto = 'TAREFA' THEN tp.apelido
         END AS apelido,
         CASE 
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' THEN ou.funcao
           WHEN ic.cod_objeto = 'TAREFA' THEN tu.funcao
         END AS funcao,
         CASE 
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' THEN ou.usuario_id
           WHEN ic.cod_objeto = 'TAREFA' THEN tu.usuario_id
         END AS usuario_id,
         CASE 
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' THEN 
                NVL((SELECT SUM(u.horas_planej) 
                       FROM os_usuario u 
                      WHERE u.ordem_servico_id = ic.objeto_id),0)
           WHEN ic.cod_objeto = 'TAREFA' THEN 
                NVL((SELECT SUM(u.horas_totais) 
                       FROM tarefa_usuario u 
                      WHERE u.tarefa_id = ic.objeto_id),0)
           ELSE NVL((SELECT SUM(h.horas_totais) 
                       FROM item_crono_usu h 
                      WHERE h.item_crono_id = ic.item_crono_id),0)
         END AS horas
    FROM item_crono ic
         INNER JOIN cronograma cr ON ic.cronograma_id = cr.cronograma_id
         INNER JOIN job jo ON jo.job_id = cr.job_id
         INNER JOIN pessoa cl ON cl.pessoa_id = jo.cliente_id
          LEFT JOIN ordem_servico os ON os.ordem_servico_id = ic.objeto_id AND ic.cod_objeto = 'ORDEM_SERVICO'
          LEFT JOIN os_usuario oi ON oi.ordem_servico_id = os.ordem_servico_id
          LEFT JOIN pessoa op on op.usuario_id = oi.usuario_id
          LEFT JOIN usuario ou on ou.usuario_id = op.usuario_id
          LEFT JOIN tarefa ta ON ta.tarefa_id = ic.objeto_id AND ic.cod_objeto = 'TAREFA'  
          LEFT JOIN tarefa_usuario ti ON ti.tarefa_id = ta.tarefa_id
          LEFT JOIN pessoa tp on tp.usuario_id = ti.usuario_para_id 
          LEFT JOIN usuario tu on tu.usuario_id = tp.usuario_id
   WHERE ic.cod_objeto IN ('ORDEM_SERVICO','TAREFA')  
     AND ic.objeto_id IS NOT NULL
     AND cr.status <> 'ARQUI'
     AND (NVL(os.status,'OK') IN ('DIST','ACEI','EMEX','AVAL') 
         OR NVL(ta.status,'OK') = 'EMEX')
     AND jo.status <> 'CANC'
     --AND oi.tipo_ender = 'EXE'
     AND CASE 
           WHEN ic.cod_objeto = 'ORDEM_SERVICO' THEN os.data_solicitada
           WHEN ic.cod_objeto = 'TAREFA' THEN ta.data_termino
         END < SYSDATE
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_AUSENCIA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_AUSENCIA" ("APELIDO", "FUNCAO", "USUARIO_ID", "NOME_FISICO", "PREFIXO", "NUMERO", "DATA_INI", "DATA_INI_FMT", "HORA_INI", "DATA_FIM", "DATA_FIM_FMT", "HORA_FIM", "TIPO_APONTAM", "FLAG_AUSENCIA_FULL", "APONTAM_PROGR_ID", "EQUIPE_ID") AS 
  SELECT pe.apelido,
         us.funcao,
         us.usuario_id,
         ar.nome_fisico,
         vo.prefixo,
         vo.numero,
         au.data_ini,
         DATA_MOSTRAR(au.data_ini) AS data_ini_fmt,
         TO_CHAR(au.data_ini,'HH24:MI') AS hora_ini,
         au.data_fim,
         DATA_MOSTRAR(au.data_fim) AS data_fim_fmt,
         TO_CHAR(au.data_fim,'HH24:MI') AS hora_fim,
         ta.nome AS tipo_apontam,
         ta.flag_ausencia_full,
         au.apontam_progr_id, 
         eq.equipe_id
    FROM equipe eq
         INNER JOIN equipe_usuario eu ON eu.equipe_id = eq.equipe_id
         INNER JOIN usuario us ON us.usuario_id = eu.usuario_id
         INNER JOIN pessoa pe ON pe.usuario_id = eu.usuario_id
         INNER JOIN apontam_progr au ON au.usuario_id = eu.usuario_id
         INNER JOIN tipo_apontam ta ON ta.tipo_apontam_id = au.tipo_apontam_id
          LEFT JOIN arquivo_pessoa ap ON ap.pessoa_id = pe.pessoa_id
                    AND ap.tipo_arq_pessoa = 'FOTO_USU'
                    AND ap.tipo_thumb = 'P'
          LEFT JOIN arquivo ar ON ar.arquivo_id = ap.arquivo_id
          LEFT JOIN volume vo ON vo.volume_id = ar.volume_id
   WHERE flag_membro = 'S'
     AND ((TRUNC(au.data_ini) >= TRUNC(SYSDATE) AND TRUNC(au.data_ini) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4))
          OR 
          (TRUNC(au.data_ini) < TRUNC(SYSDATE) AND TRUNC(au.data_fim) >= TRUNC(SYSDATE))
         )
ORDER BY au.data_ini
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_OVERTIME_DIA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_OVERTIME_DIA" ("DATA", "TOTAL_HORAS_OVERTIME", "EQUIPE_ID") AS 
  SELECT da.data,
         SUM(da.horas_overtime) AS total_horas_overtime,
         eu.equipe_id
    FROM equipe_usuario eu
         INNER JOIN dia_alocacao da ON da.usuario_id = eu.usuario_id
   WHERE eu.flag_membro = 'S'
     AND TRUNC(da.data) >= TRUNC(SYSDATE)
     AND TRUNC(da.data) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4)
GROUP BY da.data, eu.equipe_id
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_OVERTIME_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_OVERTIME_USUARIO" ("USUARIO_ID", "DATA", "APELIDO", "FUNCAO", "NOME_FISICO", "PREFIXO", "NUMERO", "TOTAL_HORAS_OVERTIME", "EQUIPE_ID", "CARGO_ID", "CARGO_NOME", "HORAS_LIVRES_MESMO_CARGO") AS 
  SELECT eu.usuario_id,
         da.data,
         pe.apelido,
         us.funcao,
         ar.nome_fisico,
         vo.prefixo,
         vo.numero,
         SUM(da.horas_overtime) AS total_horas_overtime,
         eu.equipe_id,
         ca.cargo_id,
         ca.nome AS cargo_nome,
         NVL(
         (SELECT SUM(d.horas_livre)
            FROM dia_alocacao d
                 INNER JOIN equipe_usuario e ON e.usuario_id = d.usuario_id 
           WHERE d.data = da.data
             AND e.equipe_id = eu.equipe_id
             AND CARGO_PKG.do_usuario_retornar(e.usuario_id, SYSDATE) = CARGO_PKG.do_usuario_retornar(eu.usuario_id, SYSDATE) 
             AND d.usuario_id <> eu.usuario_id) 
         ,0) AS horas_livres_mesmo_cargo
    FROM equipe_usuario eu
         INNER JOIN dia_alocacao da ON da.usuario_id = eu.usuario_id
         INNER JOIN usuario us ON us.usuario_id = eu.usuario_id
         INNER JOIN pessoa pe ON pe.usuario_id = eu.usuario_id
         INNER JOIN cargo ca ON ca.cargo_id = CARGO_PKG.do_usuario_retornar(eu.usuario_id, SYSDATE)
          LEFT JOIN arquivo_pessoa ap ON ap.pessoa_id = pe.pessoa_id
                    AND ap.tipo_arq_pessoa = 'FOTO_USU'
                    AND ap.tipo_thumb = 'P'
          LEFT JOIN arquivo ar ON ar.arquivo_id = ap.arquivo_id
          LEFT JOIN volume vo ON vo.volume_id = ar.volume_id
   WHERE eu.flag_membro = 'S'
     AND TRUNC(da.data) >= TRUNC(SYSDATE)
     AND TRUNC(da.data) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4)
     AND da.horas_overtime > 0
GROUP BY da.data, eu.usuario_id, da.data, da.horas_diarias,
         pe.apelido, us.funcao, ar.nome_fisico,
         vo.prefixo, vo.numero, eu.equipe_id, ca.cargo_id, ca.nome
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_OVERTIME_USU_LIVRES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_OVERTIME_USU_LIVRES" ("USUARIO_ID", "DATA", "APELIDO", "FUNCAO", "NOME_FISICO", "PREFIXO", "NUMERO", "EQUIPE_ID", "CARGO_ID", "CARGO_NOME", "HORAS_LIVRES") AS 
  SELECT eu.usuario_id,
         da.data,
         pe.apelido,
         us.funcao,
         ar.nome_fisico,
         vo.prefixo,
         vo.numero,
         eu.equipe_id,
         ca.cargo_id, 
         ca.nome AS cargo_nome,
         da.horas_livre AS horas_livres_mesmo_cargo
    FROM equipe_usuario eu
         INNER JOIN dia_alocacao da ON da.usuario_id = eu.usuario_id
         INNER JOIN usuario us ON us.usuario_id = eu.usuario_id
         INNER JOIN pessoa pe ON pe.usuario_id = eu.usuario_id
         INNER JOIN cargo ca ON ca.cargo_id = CARGO_PKG.do_usuario_retornar(eu.usuario_id, SYSDATE)
          LEFT JOIN arquivo_pessoa ap ON ap.pessoa_id = pe.pessoa_id
                    AND ap.tipo_arq_pessoa = 'FOTO_USU'
                    AND ap.tipo_thumb = 'P'
          LEFT JOIN arquivo ar ON ar.arquivo_id = ap.arquivo_id
          LEFT JOIN volume vo ON vo.volume_id = ar.volume_id
   WHERE eu.flag_membro = 'S'
     AND TRUNC(da.data) >= TRUNC(SYSDATE)
     AND TRUNC(da.data) <= UTIL_PKG.DATA_CALCULAR(TRUNC(SYSDATE),'U',4)
     AND da.horas_livre > 0
;
--------------------------------------------------------
--  DDL for View V_DASH_OPER_TIMESHEET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DASH_OPER_TIMESHEET" ("APELIDO", "FUNCAO", "EMAIL", "NOME_FISICO", "PREFIXO", "NUMERO", "QUANTIDADE_EM_ATRASO", "DATA_DESDE", "EQUIPE_ID") AS 
  SELECT pe.apelido,
         us.funcao,
         pe.email,
         ar.nome_fisico,
         vo.prefixo,
         vo.numero,
         COUNT(*) AS quantidade_em_atraso,
         CASE
           WHEN EXTRACT(YEAR FROM MIN(ad.data)) < EXTRACT(YEAR FROM MIN(SYSDATE))
             THEN DATA_MOSTRAR(MIN(ad.data))
           ELSE TO_CHAR(MIN(ad.data),'dd/mm')
         END AS data_desde,
         eq.equipe_id
    FROM equipe eq
         INNER JOIN equipe_usuario eu ON eu.equipe_id = eq.equipe_id
         INNER JOIN usuario us ON us.usuario_id = eu.usuario_id
         INNER JOIN pessoa pe ON pe.usuario_id = eu.usuario_id
         INNER JOIN apontam_data ad ON ad.usuario_id = eu.usuario_id
          LEFT JOIN arquivo_pessoa ap ON ap.pessoa_id = pe.pessoa_id
                    AND ap.tipo_arq_pessoa = 'FOTO_USU'
                    AND ap.tipo_thumb = 'P'
          LEFT JOIN arquivo ar ON ar.arquivo_id = ap.arquivo_id
          LEFT JOIN volume vo ON vo.volume_id = ar.volume_id
   WHERE flag_membro = 'S'
     AND ad.status IN ('PEND','APON','REPR') 
     AND TRUNC(ad.data) < TRUNC(SYSDATE)
GROUP BY pe.apelido,
         us.funcao,
         pe.email,
         ar.nome_fisico,
         vo.prefixo,
         vo.numero,
         eq.equipe_id     
ORDER BY pe.apelido
;
--------------------------------------------------------
--  DDL for View V_DOCUMENTO_TASK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_DOCUMENTO_TASK" ("JOB_ID", "DOCUMENTO_ID", "PAPEL_ID", "NOME_PAPEL", "USUARIOS_ENDER", "STATUS", "TASK_ID", "DATA_FECHAM", "COMENTARIO", "NOME_PESSOA", "PESSOA_ID") AS 
  SELECT
-----------------------------------------------------------------------
-- seleciona as tasks associadas ao documento
-----------------------------------------------------------------------
       do.job_id,
       do.documento_id,
       pa.papel_id,
       pa.nome,
       job_pkg.usuarios_retornar(do.job_id,pa.papel_id),
       documento_pkg.status_task_retornar(ta.task_id),
       ta.task_id,
       task_pkg.data_evento_retornar(ta.task_id,'FECHAMENTO'),
       task_pkg.ult_comentario_retornar(ta.task_id),
       pe.apelido,
       pe.pessoa_id
  FROM documento do,
       task ta,
       tipo_objeto tb,
       papel pa,
       usuario us,
       pessoa pe
 WHERE do.documento_id = ta.objeto_id
   AND ta.tipo_objeto_id = tb.tipo_objeto_id
   AND tb.codigo = 'DOCUMENTO'
   AND ta.papel_resp_id = pa.papel_id
   AND task_pkg.usuario_id_evento_retornar(ta.task_id,'FECHAMENTO') = us.usuario_id (+)
   AND us.usuario_id = pe.usuario_id (+)
;
--------------------------------------------------------
--  DDL for View V_ESTADO_CIVIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_ESTADO_CIVIL" ("CODIGO", "DESCRICAO", "ORDEM") AS 
  SELECT
-----------------------------------------------------------------------
-- lista dados do dicionario: estado civil
-----------------------------------------------------------------------
       codigo,
       descricao,
       ordem
  FROM dicionario
 WHERE tipo = 'estado_civil'
;
--------------------------------------------------------
--  DDL for View V_EXECUTORES_WORKFLOWS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_EXECUTORES_WORKFLOWS" ("EMPRESA_ID", "JOB_ID", "ORDEM_SERVICO_ID", "CLIENTE", "JOB", "PRODUTO_CLIENTE", "ENTREGA", "TIPO_ENTREGA", "REFACAO", "COMPLEX_REFACAO", "STATUS", "TIPO_PRODUTO", "COMPLEMENTO", "DATA_ENVIO_FMT", "DATA_HORA_ENVIO_FMT", "DATA_ENVIO", "PRAZO_SOLICITADO_FMT", "PRAZO_HORA_SOLICITADO_FMT", "PRAZO_SOLICITADO", "PRAZO_HORA_INTERNO_FMT", "PRAZO_INTERNO", "DATA_TERMINO_EXECUCAO_FMT", "DATA_HORA_TERMINO_EXECUCAO_FMT", "DATA_TERMINO_EXECUCAO", "DIAS_PRAZO", "DIAS_ATRASO", "DIAS_TERMINO_EXECUCAO", "EXECUTORES", "HORAS_TOTAIS", "MOTIVO_RECUSA", "COMPLEMENTO_RECUSA", "ORIGEM_RECUSA", "QUANTIDADE", "USUARIO_SOL", "UNIDADE_NEGOCIO_PROJETO_NOME") AS 
  SELECT jo.empresa_id,
         jo.job_id,
         os.ordem_servico_id,
         cl.apelido AS cliente,
         NVL(jo.numero || ' ' || jo.nome,'-') AS job,
         pc.nome AS produto_cliente,
         ORDEM_SERVICO_PKG.NUMERO_FORMATAR(os.ordem_servico_id) || ' ' || os.descricao AS entrega,
         ts.nome AS tipo_entrega,
         oe.num_refacao AS refacao,
         oe.complex_refacao,
         dos.descricao AS status,
         tp.nome AS tipo_produto,
         ji.complemento AS complemento,
         DATA_MOSTRAR(osr.data_envio) AS data_envio_fmt,
         DATA_HORA_MOSTRAR(osr.data_envio) AS data_hora_envio_fmt,
         osr.data_envio,
         DATA_MOSTRAR(osr.data_solicitada) AS prazo_solicitado_fmt,
         DATA_HORA_MOSTRAR(osr.data_solicitada) AS prazo_hora_solicitado_fmt,
         osr.data_solicitada AS prazo_solicitado,
         DATA_HORA_MOSTRAR(osr.data_interna) AS prazo_hora_interno_fmt,
         osr.data_interna AS prazo_interno,
         DATA_MOSTRAR(osr.data_termino_exec) AS data_termino_execucao_fmt,
         DATA_HORA_MOSTRAR(osr.data_termino_exec) AS data_hora_termino_execucao_fmt,
         osr.data_termino_exec AS data_termino_execucao,
         osr.dias_prazo_solicitado AS dias_prazo,
         osr.dias_atraso_solicitado AS dias_atraso,
         osr.DIAS_TERMINO_EXEC AS dias_termino_execucao,
         (SELECT NVL(LISTAGG(p.apelido || ' (' ||
            (SELECT NVL(SUM(h.horas),0)
               FROM apontam_data d
                    LEFT JOIN apontam_hora h ON d.apontam_data_id = h.apontam_data_id
              WHERE d.usuario_id = u.usuario_id
                AND h.ordem_servico_id = os.ordem_servico_id) || ' horas)'
            ,', ') within group (order by p.apelido),'Não Definido')
            FROM os_usuario i
                 INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                 INNER JOIN usuario u on u.usuario_id = p.usuario_id
           WHERE i.ordem_servico_id = os.ordem_servico_id
             AND i.tipo_ender = 'EXE') AS executores,
         (SELECT SUM(h.horas) FROM apontam_hora h
           WHERE h.ordem_servico_id = os.ordem_servico_id) AS horas_totais,
         oe.motivo as motivo_recusa,
         oe.comentario as complemento_recusa,
         (SELECT DESCRICAO
            FROM DICIONARIO
           WHERE TIPO='tipo_cliente_agencia'
             AND CODIGO = OE.TIPO_CLIENTE_AGENCIA) AS ORIGEM_RECUSA,
         (SELECT SUM(ot.quantidade) FROM os_tipo_produto ot WHERE ot.ordem_servico_id = os.ordem_servico_id) as quantidade,
         (SELECT MAX(P.APELIDO)
           FROM OS_USUARIO UR,
                PESSOA P
          WHERE UR.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID
            AND UR.USUARIO_ID       = P.USUARIO_ID) AS usuario_sol,
         un.nome as unidade_negocio_projeto_nome
    FROM os_evento oe
         INNER JOIN ordem_servico os ON oe.ordem_servico_id = os.ordem_servico_id
                                     AND os.os_evento_id = oe.os_evento_id
         INNER JOIN tipo_os ts ON ts.tipo_os_id = os.tipo_os_id
         INNER JOIN os_refacao osr ON osr.ordem_servico_id = oe.ordem_servico_id
                                   AND osr.num_refacao = oe.num_refacao
         INNER JOIN job jo ON jo.job_id = os.job_id
         INNER JOIN pessoa us ON us.usuario_id = oe.usuario_id
         INNER JOIN pessoa cl ON cl.pessoa_id = jo.cliente_id
         INNER JOIN produto_cliente pc ON pc.produto_cliente_id = jo.produto_cliente_id
         INNER JOIN dicionario dos     ON dos.codigo = os.status
                                       AND dos.tipo = 'status_os'
          LEFT JOIN os_tipo_produto_ref oir ON oir.ordem_servico_id = oe.ordem_servico_id
                                           AND oir.num_refacao = oe.num_refacao
          LEFT JOIN job_tipo_produto ji ON ji.job_tipo_produto_id = oir.job_tipo_produto_id
          LEFT JOIN tipo_produto tp ON tp.tipo_produto_id = ji.tipo_produto_id
          LEFT JOIN unidade_negocio un ON un.unidade_negocio_id = jo.unidade_negocio_id
;
--------------------------------------------------------
--  DDL for View V_EXECUTORES_WORKFLOWS_EXEC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_EXECUTORES_WORKFLOWS_EXEC" ("EMPRESA_ID", "JOB_ID", "ORDEM_SERVICO_ID", "CLIENTE", "JOB", "PRODUTO_CLIENTE", "ENTREGA", "TIPO_ENTREGA", "REFACAO", "STATUS", "ITEM", "COMPLEMENTO", "DATA_ENVIO_FMT", "DATA_HORA_ENVIO_FMT", "DATA_ENVIO", "PRAZO_SOLICITADO_FMT", "PRAZO_HORA_SOLICITADO_FMT", "PRAZO_INTERNO_FMT", "PRAZO_INTERNO", "PRAZO_HORA_INTERNO_FMT", "PRAZO_SOLICITADO", "DATA_TERMINO_EXECUCAO_FMT", "DATA_HORA_TERMINO_EXECUCAO_FMT", "DATA_TERMINO_EXECUCAO", "DIAS_PRAZO", "DIAS_ATRASO", "DIAS_TERMINO_EXECUCAO", "USUARIO_EXE", "FUNCAO", "HORAS_TOTAIS", "MOTIVO_RECUSA", "COMPLEMENTO_RECUSA", "ORIGEM_RECUSA", "QUANTIDADE", "HORAS_ESTIMADAS", "DATA_DIST", "AVAL_SOLICITACAO", "AVAL_EXECUCAO", "USUARIO_SOL", "UNIDADE_NEGOCIO_PROJETO_NOME") AS 
  SELECT jo.empresa_id,
       jo.job_id,
       os.ordem_servico_id,
       cl.apelido AS cliente,
       NVL(jo.numero || ' ' || jo.nome,'-') AS job,
       pc.nome AS produto_cliente,
       ORDEM_SERVICO_PKG.NUMERO_FORMATAR(os.ordem_servico_id) || ' ' || os.descricao AS entrega,
       ts.nome AS tipo_entrega,
       re.num_refacao as refacao,
       CASE os.qtd_refacao
          WHEN re.num_refacao THEN dos.descricao
          ELSE 'Concluido'
       END AS status,
       (SELECT LISTAGG(nome,', ') WITHIN GROUP (ORDER BY nome || complemento)
          FROM
              (SELECT DISTINCT tp.nome, ji.complemento
                 FROM os_tipo_produto_ref oir
                 LEFT JOIN job_tipo_produto ji ON ji.job_tipo_produto_id = oir.job_tipo_produto_id
                 LEFT JOIN tipo_produto tp ON tp.tipo_produto_id = ji.tipo_produto_id
                WHERE oir.ordem_servico_id = os.ordem_servico_id)) AS item,
       (SELECT LISTAGG(complemento,', ') WITHIN GROUP (ORDER BY nome || complemento)
          FROM
              (SELECT DISTINCT tp.nome, ji.complemento
                 FROM os_tipo_produto_ref oir
                 LEFT JOIN job_tipo_produto ji ON ji.job_tipo_produto_id = oir.job_tipo_produto_id
                 LEFT JOIN tipo_produto tp ON tp.tipo_produto_id = ji.tipo_produto_id
                WHERE oir.ordem_servico_id = os.ordem_servico_id)) AS complemento,
         DATA_MOSTRAR((SELECT MIN(data_envio) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id)) AS data_envio_fmt,
         DATA_HORA_MOSTRAR((SELECT MIN(data_envio) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id)) AS data_hora_envio_fmt,
         (SELECT MIN(data_envio) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id) AS data_envio,
         DATA_MOSTRAR((SELECT MAX(data_solicitada) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id)) AS prazo_solicitado_fmt,
         DATA_HORA_MOSTRAR((SELECT MAX(data_solicitada) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id)) AS prazo_hora_solicitado_fmt,
         DATA_MOSTRAR((SELECT MAX(data_interna) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id)) AS prazo_interno_fmt,
     (SELECT MAX(data_interna) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id) AS prazo_interno,
         DATA_HORA_MOSTRAR((SELECT MAX(data_interna) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id)) AS prazo_hora_interno_fmt,
         (SELECT MAX(data_solicitada) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id) AS prazo_solicitado,
         DATA_MOSTRAR(re.data_termino_exec) AS data_termino_execucao_fmt,
         DATA_HORA_MOSTRAR(re.data_termino_exec) AS data_hora_termino_execucao_fmt,
         re.data_termino_exec AS data_termino_execucao,
         (SELECT SUM(dias_prazo_solicitado) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id) AS dias_prazo,
         (SELECT SUM(dias_atraso_solicitado) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id) AS dias_atraso,
         (SELECT SUM(dias_termino_exec) FROM os_refacao WHERE ordem_servico_id = os.ordem_servico_id) AS dias_termino_execucao,
         pu.apelido AS usuario_exe,
         us.funcao,
         (SELECT NVL(SUM(h.horas),0)
            FROM apontam_hora h
                 INNER JOIN apontam_data d ON d.apontam_data_id = h.apontam_data_id
           WHERE h.ordem_servico_id = os.ordem_servico_id
             AND d.usuario_id = ou.usuario_id) AS horas_totais,
         oe.motivo as motivo_recusa,
         oe.comentario as complemento_recusa,
         (SELECT DESCRICAO
            FROM DICIONARIO
           WHERE TIPO='tipo_cliente_agencia'
             AND CODIGO = OE.TIPO_CLIENTE_AGENCIA) AS ORIGEM_RECUSA,
         (SELECT SUM(ot.quantidade)
            FROM os_tipo_produto ot
           WHERE ot.ordem_servico_id = os.ordem_servico_id) as quantidade,
         uf.horas_planej AS horas_estimadas,
       CASE
          WHEN oe.status_para = 'PREP' OR oe.status_para = 'DIST' THEN NULL
          WHEN oe.status_para <> 'PREP' OR oe.status_para <> 'DIST' THEN
             (SELECT MAX(e.data_evento)
                FROM os_evento e
               WHERE e.ordem_servico_id = ou.ordem_servico_id
                 AND e.num_refacao      = re.num_refacao
                 AND e.flag_estim = 'N'
                 AND ((e.status_de = 'DIST' AND e.status_para = 'ACEI') OR
                     (e.status_de = 'DIST' AND e.status_para = 'EMEX')))
         ELSE NULL
       END AS data_dist,
       uf.nota_aval as aval_solicitacao,
       (SELECT UR.NOTA_AVAL
          FROM OS_USUARIO_REFACAO UR,
               USUARIO U
         WHERE UR.ORDEM_SERVICO_ID = os.ordem_servico_id
           AND UR.NUM_REFACAO      = RE.NUM_REFACAO
           AND UR.USUARIO_ID       = U.USUARIO_ID
           AND UR.TIPO_ENDER       = 'SOL') as aval_execucao,
       (SELECT P.APELIDO
          FROM OS_USUARIO_REFACAO UR,
               USUARIO U,
               PESSOA  P
         WHERE UR.ORDEM_SERVICO_ID = os.ordem_servico_id
           AND UR.NUM_REFACAO      = RE.NUM_REFACAO
           AND UR.USUARIO_ID       = U.USUARIO_ID
           AND UR.USUARIO_ID       = P.USUARIO_ID
           AND UR.TIPO_ENDER       = 'SOL'
           ) as usuario_sol,
         un.nome as unidade_negocio_projeto_nome
         FROM os_evento oe
         INNER JOIN ordem_servico os ON oe.ordem_servico_id = os.ordem_servico_id
                                     AND os.OS_EVENTO_ID = oe.os_evento_id
         INNER JOIN tipo_os ts ON ts.tipo_os_id = os.tipo_os_id
         INNER JOIN job jo ON jo.job_id = os.job_id
         INNER JOIN pessoa cl ON cl.pessoa_id = jo.cliente_id
         INNER JOIN produto_cliente pc ON pc.produto_cliente_id = jo.produto_cliente_id
         INNER JOIN dicionario dos     ON dos.codigo = os.status
                                       AND dos.tipo = 'status_os'
         INNER JOIN os_usuario ou ON ou.ordem_servico_id = os.ordem_servico_id
                                     AND ou.tipo_ender = 'EXE'
         INNER JOIN usuario us ON us.usuario_id = ou.usuario_id
         INNER JOIN os_refacao re ON re.ordem_servico_id = os.ordem_servico_id
         LEFT  JOIN os_usuario_refacao uf ON  uf.ordem_servico_id = re.ordem_servico_id
                                          AND uf.num_refacao      = re.num_refacao
                                          AND uf.tipo_ender       = 'EXE'
         LEFT JOIN pessoa pu  ON pu.usuario_id = uf.usuario_id
         LEFT JOIN unidade_negocio un ON un.unidade_negocio_id = jo.unidade_negocio_id
;
--------------------------------------------------------
--  DDL for View V_FORNECEDORES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_FORNECEDORES" ("EMPRESA", "EMPRESA_ID", "PESSOA_ID", "APELIDO", "RAZAO_SOCIAL", "PESSOA_FISICA_JURIDICA", "CNPJ", "INSCR_ESTADUAL", "INSCR_MUNICIPAL", "INSCR_INSS", "CPF", "RG", "RG_ORG_EXP", "RG_DATA_EXP", "RG_UF", "ENDERECO", "NUM_ENDER", "COMPL_ENDER", "ZONA", "BAIRRO", "CEP", "CIDADE", "UF", "PAIS", "DDD_TELEFONE", "NUM_TELEFONE", "DDD_FAX", "NUM_FAX", "DDD_CELULAR", "NUM_CELULAR", "NUM_RAMAL", "WEBSITE", "EMAIL", "NUM_AGENCIA", "NUM_CONTA", "NOME_TITULAR", "CNPJ_CPF_TITULAR", "TIPO_CONTA", "PERC_BV", "TIPO_FATUR_BV", "PERC_IMPOSTO", "DESC_SERVICOS") AS 
  SELECT em.nome AS empresa,
         em.empresa_id,
         pe.pessoa_id,
         pe.apelido,
         pe.nome AS razao_social,
         DECODE(pe.flag_pessoa_jur,'S','Jurídica','N','Física','Não Definido') AS pessoa_fisica_juridica,
         pe.CNPJ,
         pe.INSCR_ESTADUAL,
         pe.INSCR_MUNICIPAL,
         pe.INSCR_INSS,
         pe.CPF,
         pe.RG,
         pe.RG_ORG_EXP,
         pe.RG_DATA_EXP,
         pe.RG_UF,
         PE.ENDERECO,
         pe.NUM_ENDER,
         pe.COMPL_ENDER,
         pe.ZONA,
         pe.BAIRRO,
         pe.CEP,
         pe.CIDADE,
         pe.UF,
         pe.PAIS,
         pe.DDD_TELEFONE,
         pe.NUM_TELEFONE,
         pe.DDD_FAX,
         pe.NUM_FAX,
         pe.DDD_CELULAR,
         pe.NUM_CELULAR,
         pe.NUM_RAMAL,
         pe.WEBSITE,
         pe.EMAIL,
         pe.NUM_AGENCIA,
         pe.NUM_CONTA,
         pe.NOME_TITULAR,
         pe.CNPJ_CPF_TITULAR,
         pe.TIPO_CONTA,
         pe.perc_bv, 
         pe.tipo_fatur_bv, 
         pe.perc_imposto, 
         pe.desc_servicos
    FROM pessoa pe
         INNER JOIN empresa em ON em.empresa_id = pe.empresa_id
   WHERE NOT EXISTS (SELECT 1 FROM relacao r 
                      WHERE r.pessoa_filho_id = pe.pessoa_id)
     AND EXISTS     (SELECT 1 FROM tipific_pessoa x
                                   INNER JOIN tipo_pessoa t ON t.tipo_pessoa_id = x.tipo_pessoa_id
                      WHERE x.pessoa_id = pe.pessoa_id
                        AND t.codigo = 'FORNECEDOR')
     AND pe.flag_ativo = 'S'
;
--------------------------------------------------------
--  DDL for View V_HISTORICO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_HISTORICO" ("HISTORICO_ID", "EMPRESA_ID", "USUARIO_ID", "EVENTO_ID", "APELIDO_USUARIO", "NOME_USUARIO", "DATA_EVENTO", "DESC_EVENTO", "COMPLEMENTO", "COD_OBJETO", "DESC_OBJETO", "COD_ACAO", "DESC_ACAO", "IDENTIF_OBJETO", "OBJETO_ID", "JUSTIFICATIVA", "XML_ANTES", "XML_ATUAL") AS 
  SELECT
-----------------------------------------------------------------------
-- lista dados do historico
-----------------------------------------------------------------------
       hi.historico_id,
       hi.empresa_id,
       hi.usuario_id,
       hi.evento_id,
       pe.apelido,
       pe.nome,
       hi.data_evento,
       ev.descricao,
       hi.complemento,
       tb.codigo,
       tb.nome,
       ta.codigo,
       ta.nome,
       hi.identif_objeto,
       hi.objeto_id,
       hi.justificativa,
       hi.xml_antes,
       hi.xml_atual
  FROM historico hi,
       evento ev,
       tipo_objeto tb,
       tipo_acao ta,
       usuario us,
       pessoa pe
 WHERE hi.evento_id = ev.evento_id
   AND hi.usuario_id = us.usuario_id
   AND us.usuario_id = pe.usuario_id
   AND ev.tipo_objeto_id = tb.tipo_objeto_id
   AND ev.tipo_acao_id = ta.tipo_acao_id
;
--------------------------------------------------------
--  DDL for View V_JOB_CONTATO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOB_CONTATO" ("JOB_ID", "PESSOA_ID", "APELIDO", "NOME") AS 
  SELECT
-----------------------------------------------------------------------
-- para cada job, seleciona os possiveis contados ativos do cliente
-----------------------------------------------------------------------
       jo.job_id,
       co.pessoa_id,
       co.apelido,
       co.nome
  FROM job jo,
       pessoa co,
       relacao re
 WHERE jo.cliente_id = re.pessoa_pai_id
   AND re.pessoa_filho_id = co.pessoa_id
   AND co.flag_ativo = 'S'
;
--------------------------------------------------------
--  DDL for View V_JOB_DOCUMENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOB_DOCUMENTO" ("JOB_ID", "DOCUMENTO_ID", "TIPO_DOCUMENTO_ID", "NOME_TIPO_DOC", "COD_TIPO_DOC", "NOME_DOC", "DESCRICAO_DOC", "COMENTARIO_VERSAO", "COMENTARIO_CONSOL", "VERSAO", "FLAG_ATUAL", "TIPO_FLUXO", "STATUS", "ARQUIVO_ID", "VOLUME_ID", "NUMERO_VOLUME", "CAMINHO", "NOME_ORIGINAL", "NOME_FISICO", "MIME_TYPE", "TAMANHO", "DATA_CRIACAO", "NOME_PESSOA", "PESSOA_ID", "FLAG_CONSOLIDAR", "QTD_ARQUIVO", "PAPEL_ID", "NOME_PAPEL") AS 
  SELECT
-----------------------------------------------------------------------
-- seleciona os documentos de cada job
-----------------------------------------------------------------------
       do.job_id,
       do.documento_id,
       td.tipo_documento_id,
       td.nome,
       td.codigo,
       do.nome,
       do.descricao,
       do.comentario,
       do.consolidacao,
       do.versao,
       do.flag_atual,
       do.tipo_fluxo,
       documento_pkg.status_retornar(do.documento_id),
       aq.arquivo_id,
       aq.volume_id,
       vo.numero,
       vo.caminho || '/' || vo.prefixo,
       aq.nome_original,
       aq.nome_fisico,
       aq.mime_type,
       aq.tamanho,
       aq.data_criacao,
       pe.apelido,
       pe.pessoa_id,
       DECODE(do.status,'PEND','S','N'),
       documento_pkg.qtd_arquivo_retornar(do.documento_id),
       pa.papel_id,
       pa.nome
  FROM documento do,
       tipo_documento td,
       arquivo aq,
       pessoa pe,
       volume vo,
       papel pa
 WHERE do.tipo_documento_id = td.tipo_documento_id
   AND do.papel_resp_id = pa.papel_id
   AND do.usuario_id = pe.usuario_id 
   AND documento_pkg.prim_arquivo_id_retornar(do.documento_id) = aq.arquivo_id (+)
   AND aq.volume_id = vo.volume_id (+)
;
--------------------------------------------------------
--  DDL for View V_JOBS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOBS" ("JOB_ID", "EMPRESA_ID", "NUMERO", "NOME", "TIPO_JOB_NOME", "GRUPO_CLIENTE", "CRONOGRAMA_ID", "DATA_PLANEJ_FIM_FMT", "DATA_HOJE_FMT", "QTDE_ENTREGA_ATRASO", "CONTATO", "CLIENTE_PROJETO", "PRODUTO_CLIENTE", "CAMPANHA", "SERVICO", "UNIDADE_NEGOCIO", "TIPO_FINANCEIRO", "TIPO_PROJETO", "COMPLEXIDADE", "EMPRESA_RESPONSAVEL", "DATA_ENTRADA", "DATA_INICIO", "DATA_FIM", "DATA_APRESENTACAO_CLIENTE", "DATA_GOLIVE", "PERIODO_PLANEJADO_OFICIAL", "STATUS", "STATUS_ESTENDIDO", "STATUS_DATA", "STATUS_AUTOR", "STATUS_BRIEFING", "STATUS_CRONOGRAMA", "STATUS_ESTIMATIVA_HORAS", "STATUS_CHECKIN", "STATUS_FATUR", "CONTEXTO_ALTERACAO_CRONOGRAMA", "CONCORRENTES", "CONCORRENTE", "GANHA_PERDIDA", "RESPONSAVEL_PROJETO", "BUDGET", "RECEITA_PREVISTA_CONTRATO", "CONTRATO_FATURAMENTO", "ITENS_A_PAGOS_PELO_CLIENTE", "BLOQUEAIA_NEGOCIACAO_BV_TP", "USA_BV_PADRAO_FORNECEDOR", "FATURAR_PROJETO_POR", "NUMERO_CONTRATO", "DESCRICAO_CONTRATO", "RESPONSAVEL_PELO_CONTRATO", "STATUS_CONTRATO", "VIGENCIA_CONTRATO_INICIO", "VIGENCIA_CONTRATO_FIM", "TIPO_CONTRATO", "JOB_ENDERECADOS", "JOB_USUARIO_ID", "GRUPO_PRODUTO_ID", "GRUPO_PRODUTO_NOME") AS 
  SELECT jo.job_id,
       jo.empresa_id,
       jo.numero,
       jo.nome,
       tj.nome AS tipo_job_nome,
       --pe.apelido AS cliente_apelido,
       nvl((SELECT listagg(g.nome, ', ') within GROUP(ORDER BY g.nome)
             FROM grupo_pessoa gp,
                  grupo        g
            WHERE gp.grupo_id = g.grupo_id
              AND gp.pessoa_id = pe.pessoa_id),
           pe.apelido) AS grupo_cliente,
       nvl((SELECT MAX(c1.cronograma_id)
             FROM cronograma c1
            WHERE c1.job_id = jo.job_id
              AND c1.status IN ('PREP', 'APROV')),
           0) AS cronograma_id,
       (SELECT data_mostrar(MAX(ic.data_planej_fim))
          FROM cronograma cr,
               item_crono ic
         WHERE cr.job_id = jo.job_id
           AND ic.cronograma_id = cr.cronograma_id
           AND ic.cod_objeto = 'JOB_CONC'
           AND cr.cronograma_id =
               (SELECT MAX(c1.cronograma_id)
                  FROM cronograma c1
                 WHERE c1.job_id = jo.job_id
                   AND c1.status IN
                       ('PREP', 'APROV'))) AS data_planej_fim_fmt,
       data_mostrar(SYSDATE) AS data_hoje_fmt,
       (SELECT COUNT(*)
          FROM ordem_servico os
         WHERE os.job_id = jo.job_id
           AND os.data_solicitada < SYSDATE
           AND EXISTS
         (SELECT 1
                  FROM item_crono it
                 WHERE it.cod_objeto =
                       'ORDEM_SERVICO'
                   AND it.objeto_id =
                       os.ordem_servico_id)) + CASE
         WHEN job_pkg.sla_data_termino_retornar(jo.job_id) IS NOT NULL AND
              job_pkg.sla_data_termino_retornar(jo.job_id) >
              job_pkg.sla_data_limite_retornar(jo.job_id) THEN
          1
         ELSE
          0
       END + CASE
         WHEN job_pkg.sla_data_termino_retornar(jo.job_id) IS NULL AND
              job_pkg.sla_data_limite_retornar(jo.job_id) IS NOT NULL AND
              job_pkg.sla_data_limite_retornar(jo.job_id) >
              SYSDATE THEN
          1
         ELSE
          0
       END AS qtde_entrega_atraso,
       pc.nome AS contato,
       pe.apelido AS cliente_projeto,
       pr.nome AS produto_cliente,
       ca.nome AS campanha,
       se.nome AS servico,
       un.nome AS unidade_negocio,
       tf.nome AS tipo_financeiro,
       tj.nome AS tipo_projeto,
       jo.complex_job AS complexidade,
       er.nome AS empresa_responsavel,
       jo.data_entrada AS data_entrada,
       jo.data_prev_ini AS data_inicio,
       --DECODE(jo.data_prev_ini, NULL, NULL, TO_DATE(TO_CHAR(jo.data_prev_ini, 'DD/MM/YYYY'), 'DD/MM/YYYY')) AS data_inicio,
       jo.data_prev_fim AS data_fim,
       --DECODE(jo.data_prev_fim, NULL, NULL, TO_DATE(jo.data_prev_fim, 'DD/MM/YYYY')) AS data_fim,
       --DECODE(jo.data_pri_aprov, NULL, NULL, data_mostrar(jo.data_pri_aprov)) AS data_apresentacao_cliente,
       jo.data_pri_aprov AS data_apresentacao_cliente,
       -- DECODE(jo.data_golive, NULL, NULL, data_mostrar(jo.data_golive)) AS data_golive,
       jo.data_golive AS data_golive,
       decode(jo.tipo_data_prev,
              'EST',
              'Planejado',
              'OFI',
              'Oficial',
              jo.tipo_data_prev) AS periodo_planejado_oficial,
       jo.status AS status,
       (SELECT s.nome
          FROM status_aux_job s
         WHERE s.status_aux_job_id =
               jo.status_aux_job_id
           AND s.empresa_id = jo.empresa_id) AS status_estendido,
       jo.data_status AS status_data,
       (SELECT v.apelido_usuario
          FROM v_historico v,
               (SELECT v1.objeto_id,
                       v1.evento_id,
                       MAX(v1.data_evento) AS data_evento
                  FROM v_historico v1,
                       evento      ev,
                       tipo_acao   ta
                 WHERE v1.usuario_id =
                       jp.usuario_id
                   AND v1.evento_id = ev.evento_id
                   AND ev.tipo_acao_id =
                       ta.tipo_acao_id
                   AND ta.codigo = 'ALTERAR'
                   AND v1.cod_objeto = 'JOB'
                   AND v1.objeto_id = jo.job_id
                   AND v1.empresa_id =
                       jo.empresa_id
                 GROUP BY v1.objeto_id,
                          v1.evento_id) v2
         WHERE v.objeto_id = v2.objeto_id
           AND v.data_evento = v2.data_evento
           AND v.evento_id = 6) AS status_autor,
       --                AND (UPPER(v.complemento) LIKE '%STATUS%' OR
       --                     UPPER(v.complemento) LIKE '%REABERTURA%' OR
       --                     UPPER(v.complemento) LIKE '%FECHAMENTO%' OR
       --                     UPPER(v.desc_evento) LIKE '%ALTERAÇÃO%')) status_autor,
       CASE
         WHEN br.flag_com_aprov = 'S' THEN
          util_pkg.desc_retornar('status_brief',
                                 br.status)
         ELSE
          CASE
            WHEN br.status = 'APROV' THEN
             'Pronto'
            ELSE
             util_pkg.desc_retornar('status_brief',
                                    br.status)
          END
       END AS status_briefing,
       CASE
         WHEN cr.flag_com_aprov = 'S' THEN
          util_pkg.desc_retornar('status_crono',
                                 cr.status)
         ELSE
          CASE
            WHEN cr.status IS NULL THEN
             'Não Iniciado'
            WHEN cr.status = 'APROV' THEN
             'Pronto'
            ELSE
             util_pkg.desc_retornar('status_crono',
                                    cr.status)
          END
       END AS status_cronograma,
       CASE
         WHEN jo.flag_com_aprov_horas = 'S' THEN
          util_pkg.desc_retornar('status_job_horas',
                                 jo.status_horas)
         ELSE
          CASE
            WHEN jo.status_horas = 'APROV' THEN
             'Pronta'
            ELSE
             util_pkg.desc_retornar('status_job_horas',
                                    jo.status_horas)
          END
       END AS status_estimativa_horas,
       jo.status_checkin AS status_checkin,
       jo.status_fatur,
       cc.nome AS contexto_alteracao_cronograma,
       jo.contra_quem AS concorrentes,
       decode(jo.flag_concorrencia,
              'S',
              'Sim',
              'N',
              'Não') AS concorrente,
       decode(jo.flag_conc_perdida,
              NULL,
              'Não Definido',
              'S',
              'Perdido',
              'N',
              'Ganho') AS ganha_perdida,
       decode(jp.apelido,
              NULL,
              'Não Definido',
              jp.apelido || ' (' || jp.funcao || ')') AS responsavel_projeto,
       jo.budget AS budget,
       jo.receita_prevista AS receita_prevista_contrato,
       cf.nome AS contrato_faturamento,
       jo.flag_pago_cliente AS itens_a_pagos_pelo_cliente,
       jo.flag_bloq_negoc AS bloqueaia_negociacao_bv_tp,
       jo.flag_bv_fornec AS usa_bv_padrao_fornecedor,
       (SELECT p.nome
          FROM pessoa p
         WHERE p.pessoa_id = jo.emp_faturar_por_id
           AND p.empresa_id = jo.empresa_id) AS faturar_projeto_por,
       CASE
         WHEN ct.contrato_id IS NOT NULL THEN
          contrato_pkg.numero_formatar(ct.contrato_id)
         ELSE
          NULL
       END AS numero_contrato,
       ct.nome AS descricao_contrato,
       decode(ca.apelido,
              NULL,
              'Não Definido',
              ca.apelido || ' (' || ca.funcao || ')') AS responsavel_pelo_contrato,
       ct.status AS status_contrato,
       ct.data_inicio AS vigencia_contrato_inicio,
       ct.data_termino AS vigencia_contrato_fim,
       tc.nome AS tipo_contrato,
       (SELECT listagg(nvl(to_char(u.usuario_id),
                           '-'),
                       ', ') within GROUP(ORDER BY u.usuario_id)
          FROM job_usuario u
         WHERE u.job_id = jo.job_id) AS job_enderecados,
       jp.usuario_id AS job_usuario_id,
       (SELECT gs.grupo_servico_id
       FROM grupo_servico gs
       where grupo_servico_id = se.grupo_servico_id) as grupo_produto_id,
       (SELECT gs.nome
       FROM grupo_servico gs
       where grupo_servico_id = se.grupo_servico_id) as grupo_produto_nome
  FROM job jo,
       tipo_job tj,
       pessoa pe,
       contrato ct,
       tipo_contrato tc,
       pessoa pc,
       produto_cliente pr,
       campanha ca,
       servico se,
       unidade_negocio un,
       tipo_financeiro tf,
       pessoa er,
       contexto_crono cc,
       pessoa cf,
       (SELECT c.cronograma_id,
               c.job_id,
               c.status,
               c.flag_com_aprov
          FROM cronograma c
         WHERE c.status <> 'ARQUI') cr,
       (SELECT b.briefing_id,
               b.job_id,
               b.status,
               b.flag_com_aprov
          FROM briefing b
         WHERE b.status <> 'ARQUI') br,
       (SELECT j.job_id,
               u.usuario_id,
               u.funcao,
               p.apelido
          FROM job_usuario j,
               usuario     u,
               pessoa      p
         WHERE j.usuario_id = u.usuario_id
           AND j.usuario_id = p.usuario_id
           AND j.flag_responsavel = 'S') jp,
       (SELECT c.contrato_id,
               u.funcao,
               p.apelido
          FROM contrato_usuario c,
               usuario          u,
               pessoa           p
         WHERE c.usuario_id = u.usuario_id
           AND c.usuario_id = p.usuario_id
           AND c.flag_responsavel = 'S') ca
 WHERE jo.tipo_job_id = tj.tipo_job_id
   AND jo.cliente_id = pe.pessoa_id
   AND ct.contrato_id(+) = jo.contrato_id
   AND tc.tipo_contrato_id(+) =
       ct.tipo_contrato_id
   AND pc.pessoa_id(+) = jo.contato_id
   AND pr.produto_cliente_id(+) =
       jo.produto_cliente_id
   AND ca.campanha_id(+) = jo.campanha_id
   AND se.servico_id(+) = jo.servico_id
   AND un.unidade_negocio_id(+) =
       jo.unidade_negocio_id
   AND tf.tipo_financeiro_id(+) =
       jo.tipo_financeiro_id
   AND er.pessoa_id(+) = jo.emp_resp_id
   AND cc.contexto_crono_id(+) =
       jo.contexto_crono_id
   AND cf.pessoa_id(+) = jo.contato_fatur_id
   AND cr.job_id(+) = jo.job_id
   AND br.job_id(+) = jo.job_id
   AND jp.job_id(+) = jo.job_id
   AND ca.contrato_id(+) = ct.contrato_id

;
--------------------------------------------------------
--  DDL for View V_JOBS_ANDAMENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOBS_ANDAMENTO" ("JOB_ID", "EMPRESA_ID", "USUARIO_ID", "NUMERO_JOB", "NOME_JOB", "DESCRICAO", "BUDGET", "CLIENTE_ID", "NOME_CLIENTE", "DATA_ENTRADA", "NOME_TIPO_JOB") AS 
  SELECT
-----------------------------------------------------------------------
-- view de acompanhamento de jobs em andamento enderecados ao usuario,
-----------------------------------------------------------------------
       jo.job_id,
       jo.empresa_id,
       ju.usuario_id,
       jo.numero,
       jo.nome,
       jo.descricao,
       jo.budget,
       pe.pessoa_id,
       pe.apelido,
       jo.data_entrada,
       tp.nome
  FROM job jo,
       pessoa pe,
       job_usuario ju,
       tipo_job tp
 WHERE jo.cliente_id = pe.pessoa_id
   AND jo.status =  'ANDA'
   AND jo.job_id = ju.job_id
   AND jo.tipo_job_id = tp.tipo_job_id
;
--------------------------------------------------------
--  DDL for View V_JOBS_ANDAMENTO_ALL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOBS_ANDAMENTO_ALL" ("JOB_ID", "EMPRESA_ID", "NUMERO_JOB", "NOME_JOB", "DESCRICAO", "BUDGET", "CLIENTE_ID", "NOME_CLIENTE", "DATA_ENTRADA", "NOME_TIPO_JOB") AS 
  SELECT
-----------------------------------------------------------------------
-- view de acompanhamento de todos os jobs em andamento
-----------------------------------------------------------------------
       jo.job_id,
       jo.empresa_id,
       jo.numero,
       jo.nome,
       jo.descricao,
       jo.budget,
       pe.pessoa_id,
       pe.apelido,
       jo.data_entrada,
       tp.nome
  FROM job jo,
       pessoa pe,
       tipo_job tp
 WHERE jo.cliente_id = pe.pessoa_id
   AND jo.status =  'ANDA'
   AND jo.tipo_job_id = tp.tipo_job_id
;
--------------------------------------------------------
--  DDL for View V_JOBS_PREPARACAO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOBS_PREPARACAO" ("JOB_ID", "EMPRESA_ID", "USUARIO_ID", "NUMERO_JOB", "NOME_JOB", "DESCRICAO", "BUDGET", "CLIENTE_ID", "NOME_CLIENTE", "DATA_ENTRADA", "NOME_TIPO_JOB") AS 
  SELECT
-----------------------------------------------------------------------
-- view de acompanhamento de jobs em preparacao enderecados ao usuario
-----------------------------------------------------------------------
       jo.job_id,
       jo.empresa_id,
       ju.usuario_id,
       jo.numero,
       jo.nome,
       jo.descricao,
       jo.budget,
       pe.pessoa_id,
       pe.apelido,
       jo.data_entrada,
       tp.nome
  FROM job jo,
       pessoa pe,
       tipo_job tp,
       job_usuario ju
 WHERE jo.cliente_id = pe.pessoa_id
   AND jo.status =  'PREP'
   AND jo.tipo_job_id = tp.tipo_job_id
   AND ju.job_id = jo.job_id
;
--------------------------------------------------------
--  DDL for View V_JOBS_PREPARACAO_ALL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOBS_PREPARACAO_ALL" ("JOB_ID", "EMPRESA_ID", "NUMERO_JOB", "NOME_JOB", "DESCRICAO", "BUDGET", "CLIENTE_ID", "NOME_CLIENTE", "DATA_ENTRADA", "NOME_TIPO_JOB") AS 
  SELECT
-----------------------------------------------------------------------
-- view de acompanhamento de todos os jobs em preparacao
-----------------------------------------------------------------------
       jo.job_id,
       jo.empresa_id,
       jo.numero,
       jo.nome,
       jo.descricao,
       jo.budget,
       pe.pessoa_id,
       pe.apelido,
       jo.data_entrada,
       tp.nome
  FROM job jo,
       pessoa pe,
       tipo_job tp
 WHERE jo.cliente_id = pe.pessoa_id
   AND jo.status =  'PREP'
   AND jo.tipo_job_id = tp.tipo_job_id
;
--------------------------------------------------------
--  DDL for View V_JOB_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOB_USUARIO" ("JOB_ID", "USUARIO_ID", "EMPRESA_ID", "APELIDO_USUARIO", "NOME_USUARIO", "FLAG_USUARIO_ATIVO", "FUNCAO") AS 
  SELECT
-----------------------------------------------------------------------
-- para cada job, seleciona os usuarios enderecados
-----------------------------------------------------------------------
       ju.job_id,
       ju.usuario_id,
       jo.empresa_id,
       pe.apelido,
       pe.nome,
       us.flag_ativo,
       us.funcao
  FROM job_usuario ju,
       usuario us,
       pessoa pe, 
       job jo
 WHERE ju.usuario_id = us.usuario_id
   AND us.usuario_id = pe.usuario_id
   AND ju.job_id = jo.job_id
;
--------------------------------------------------------
--  DDL for View V_JOB_USUARIO_QTD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_JOB_USUARIO_QTD" ("JOB_ID", "USUARIO_ID", "EMPRESA_ID", "AREA_ID", "NOME_AREA", "APELIDO_USUARIO", "NOME_USUARIO", "FLAG_USUARIO_ATIVO", "NUMERO_ENDERECAMENTOS", "FUNCAO") AS 
  SELECT
-----------------------------------------------------------------------
-- para cada job, seleciona os usuarios enderecados, com as qtds de 
-- endereçamentos.
-----------------------------------------------------------------------
       ju.job_id,
       ju.usuario_id,
       jo.empresa_id,
       ar.area_id,
       ar.nome,
       pe.apelido,
       pe.nome,
       us.flag_ativo,
       USUARIO_PKG.NUMERO_ENDERECAMENTOS_RETORNAR(ju.usuario_id,jo.empresa_id),
       us.funcao
  FROM job_usuario ju,
       usuario us,
       pessoa pe,
       area ar,
       job jo
 WHERE ju.usuario_id = us.usuario_id
   AND ju.job_id = jo.job_id
   AND us.usuario_id = pe.usuario_id
   AND us.area_id = ar.area_id
;
--------------------------------------------------------
--  DDL for View V_MONITORA_DOCUMENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_MONITORA_DOCUMENTO" ("USUARIO_ID", "EMPRESA_ID", "CONTRATO_ID", "JOB_ID", "NUMERO_JOB", "NOME_JOB", "CLIENTE_ID", "NOME_CLIENTE", "DOCUMENTO_ID", "NOME_DOCUMENTO", "VERSAO", "DATA_CRIACAO", "AUTOR_ID", "NOME_AUTOR", "STATUS", "FLAG_CONSOLIDAR") AS 
  SELECT
 -----------------------------------------------------------------------
 -- view de monitoracao de documentos do job (ainda nao consolidados).
 -----------------------------------------------------------------------
        ju.usuario_id,
        jo.empresa_id,
        jo.contrato_id,
        jo.job_id,
        jo.numero,
        jo.nome,
        pe.pessoa_id,
        pe.apelido,
        do.documento_id,
        td.nome || ' - ' || do.nome,
        do.versao,
        do.data_versao,
        pd.pessoa_id,
        pd.apelido,
        documento_pkg.status_retornar(do.documento_id),
        DECODE(vt.objeto_id, NULL , 'S', 'N')
   FROM job jo,
        pessoa pe,
        documento do,
        tipo_documento td,
        pessoa pd,
        job_usuario ju,
        (SELECT DISTINCT ta.objeto_id
           FROM task ta,
                tipo_objeto tb
          WHERE ta.flag_fechado = 'N'
            AND ta.tipo_objeto_id = tb.tipo_objeto_id
            AND tb.codigo = 'DOCUMENTO') vt
  WHERE jo.cliente_id = pe.pessoa_id
    AND jo.status = 'ANDA'
    AND jo.job_id = do.job_id
    AND do.status = 'PEND'
    AND do.tipo_documento_id = td.tipo_documento_id
    AND do.usuario_id = pd.usuario_id
    AND do.job_id = ju.job_id
    AND do.documento_id = vt.objeto_id (+)
    AND EXISTS (SELECT 1
                  FROM usuario_papel up
                 WHERE up.usuario_id = ju.usuario_id
                   AND up.papel_id = do.papel_resp_id)
;
--------------------------------------------------------
--  DDL for View V_MONITORA_FATURAMENTO_PEND
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_MONITORA_FATURAMENTO_PEND" ("ORCAMENTO_ID", "JOB_ID", "NUMERO_JOB", "NOME_JOB", "PARCELA_ITEM", "VALOR_APROVADO", "DATA_STATUS_MOSTRAR", "VALOR_A_FATURAR", "VALOR_A_FATURAR_MOSTRAR", "ESTIMATIVA_CUSTO", "STATUS_DESC", "CLIENTE_ID", "NOME_CLIENTE", "CONTRATO_ID", "NOME_CONTRATO", "NOME_AUTOR", "NOME_CRIADOR", "GRUPO_CLIENTE", "EMPRESA_FATURAMENTO", "DATA_VENCIMENTO", "EMPRESA_ID") AS 
  WITH select1 AS
 (SELECT /*+ first_rows (1) */
   o.orcamento_id,
   jo.job_id,
   jo.numero AS numero_job,
   jo.numero || ' - ' || jo.nome AS nome_job,
   'Item ' || it.tipo_item || to_char(it.num_seq) || ' ' ||
   substr(char_especial_retirar(REPLACE(tp.nome || ' ' ||
                                        it.complemento,
                                        '"',
                                        ' ')),
          1,
          100) AS parcela_item,
   moeda_mostrar(it.valor_aprovado, 'S') AS valor_aprovado,
   data_mostrar(o.data_status) AS data_status_mostrar,
   it.valor_afaturar AS valor_a_faturar,
   moeda_mostrar(it.valor_afaturar, 'S') AS valor_a_faturar_mostrar,
   decode((SELECT COUNT(1)
            FROM servico s
           WHERE s.servico_id = o.servico_id),
          0,
          orcamento_pkg.numero_formatar(o.orcamento_id),
          (SELECT s.nome
             FROM servico s
            WHERE s.servico_id = o.servico_id) ||
          ' + ' ||
          orcamento_pkg.numero_formatar(o.orcamento_id)) AS estimativa_custo,
   decode(o.status,
          'PREP',
          'Em Preparação',
          'PRON',
          'Pronta',
          'ARQUI',
          'Arquivada',
          'APROV',
          'Aprovada') AS status_desc,
   jo.cliente_id,
   pe.apelido AS nome_cliente,
   jo.contrato_id,
   CASE
     WHEN ct.contrato_id IS NULL THEN
      NULL
     ELSE
      contrato_pkg.numero_formatar(ct.contrato_id) ||
      ' - ' || ct.nome
   END AS nome_contrato,
   pa.nome AS nome_autor,
   (SELECT au.nome
      FROM pessoa        au,
           orcam_usuario ou
     WHERE ou.orcamento_id = o.orcamento_id
       AND au.usuario_id = ou.usuario_id
       AND ou.atuacao = 'CRIA') AS nome_criador,
   (SELECT listagg(g.nome, ', ') within GROUP(ORDER BY g.nome)
      FROM grupo        g,
           grupo_pessoa gp
     WHERE g.grupo_id = gp.grupo_id
       AND gp.pessoa_id = ct.contratante_id
       AND g.empresa_id = ct.empresa_id) AS grupo_cliente,
   (SELECT p.nome
      FROM pessoa p
     WHERE p.pessoa_id = ct.emp_resp_id) AS empresa_faturamento,
   NULL AS data_vencimento,
   pe.empresa_id
    FROM orcamento    o,
         job          jo,
         item         it,
         tipo_produto tp,
         pessoa       pe,
         pessoa       pa,
         contrato     ct
   WHERE pe.pessoa_id = jo.cliente_id
     AND pa.pessoa_id = o.usuario_autor_id
     AND o.job_id = jo.job_id
     AND o.orcamento_id = it.orcamento_id
     AND it.tipo_produto_id = tp.tipo_produto_id
     AND ct.contrato_id(+) = jo.contrato_id
     AND it.valor_afaturar > 0
     AND o.status = 'APROV'),
select2 AS
 (SELECT /*+ first_rows (1) */
   o.orcamento_id,
   jo.job_id,
   jo.numero AS numero_job,
   jo.numero || ' - ' || jo.nome AS nome_job,
   'Parcela ' || to_char(pc.num_parcela) AS parcela_item,
   moeda_mostrar(pc.valor_parcela, 'S') valor_aprovado,
   data_mostrar(o.data_status) AS data_status_mostrar,
   NULL AS valor_a_faturar,
   NULL AS valor_a_faturar_mostrar,
   decode((SELECT COUNT(1)
            FROM servico s
           WHERE s.servico_id = o.servico_id),
          0,
          orcamento_pkg.numero_formatar(o.orcamento_id),
          (SELECT s.nome
             FROM contrato_servico c,
                  servico          s
            WHERE c.contrato_id = ct.contrato_id
              AND c.servico_id = s.servico_id
              AND c.contrato_servico_id =
                  pc.contrato_servico_id) || ' + ' ||
          orcamento_pkg.numero_formatar(o.orcamento_id)) AS estimativa_custo,
   decode(o.status,
          'PREP',
          'Em Preparação',
          'PRON',
          'Pronta',
          'ARQUI',
          'Arquivada',
          'APROV',
          'Aprovada') AS status_desc,
   jo.cliente_id,
   pe.apelido AS nome_cliente,
   jo.contrato_id,
   CASE
     WHEN ct.contrato_id IS NULL THEN
      NULL
     ELSE
      contrato_pkg.numero_formatar(ct.contrato_id) ||
      ' - ' || ct.nome
   END AS nome_contrato,
   pa.nome AS nome_autor,
   (SELECT au.nome
      FROM pessoa        au,
           orcam_usuario ou
     WHERE ou.orcamento_id = o.orcamento_id
       AND au.usuario_id = ou.usuario_id
       AND ou.atuacao = 'CRIA') AS nome_criador,
   (SELECT listagg(g.nome, ', ') within GROUP(ORDER BY g.nome)
      FROM grupo        g,
           grupo_pessoa gp
     WHERE g.grupo_id = gp.grupo_id
       AND gp.pessoa_id = ct.contratante_id
       AND g.empresa_id = ct.empresa_id) AS grupo_cliente,
   (SELECT p.nome
      FROM pessoa p
     WHERE p.pessoa_id = ct.emp_resp_id) AS empresa_faturamento,
   pc.data_vencim AS data_vencimento,
   pe.empresa_id
    FROM orcamento        o,
         job              jo,
         pessoa           pe,
         pessoa           pa,
         contrato         ct,
         parcela_contrato pc
   WHERE ct.contrato_id = pc.contrato_id
     AND ct.contrato_id = jo.contrato_id
     AND pe.pessoa_id = jo.cliente_id
     AND o.job_id = jo.job_id
     AND pa.pessoa_id = o.usuario_autor_id
     AND o.status = 'APROV'),
select3 AS
 (SELECT /*+ first_rows (1) */
   NULL AS orcamento_id,
   NULL AS job_id,
   NULL AS numero_job,
   NULL AS nome_job,
   'Parcela ' || to_char(pc.num_parcela) AS parcela_item,
   moeda_mostrar(pc.valor_parcela, 'S') valor_aprovado,
   NULL AS data_status_mostrar,
   NULL AS valor_a_faturar,
   NULL AS valor_a_faturar_mostrar,
   (SELECT s.nome
      FROM servico          s,
           contrato_servico cs
     WHERE s.servico_id = cs.servico_id
       AND cs.contrato_id = ct.contrato_id
       AND cs.contrato_servico_id =
           pc.contrato_servico_id) AS estimativa_custo,
   NULL AS status_desc,
   ct.contratante_id,
   pe.apelido AS nome_cliente,
   ct.contrato_id,
   CASE
     WHEN ct.contrato_id IS NULL THEN
      NULL
     ELSE
      contrato_pkg.numero_formatar(ct.contrato_id) ||
      ' - ' || ct.nome
   END AS nome_contrato,
   NULL AS nome_autor,
   NULL AS nome_criador,
   (SELECT listagg(g.nome, ', ') within GROUP(ORDER BY g.nome)
      FROM grupo        g,
           grupo_pessoa gp
     WHERE g.grupo_id = gp.grupo_id
       AND gp.pessoa_id = ct.contratante_id
       AND g.empresa_id = ct.empresa_id) AS grupo_cliente,
   (SELECT p.nome
      FROM pessoa p
     WHERE p.pessoa_id = ct.emp_resp_id) AS empresa_faturamento,
   pc.data_vencim AS data_vencimento,
   pe.empresa_id
    FROM job              jo,
         contrato         ct,
         parcela_contrato pc,
         pessoa           pe
   WHERE ct.contrato_id = pc.contrato_id
     AND pe.pessoa_id = ct.contratante_id
     AND jo.contrato_id(+) = ct.contrato_id
     AND contrato_pkg.status_parcela_retornar(pc.parcela_contrato_id) =
         'PEND')
SELECT "ORCAMENTO_ID","JOB_ID","NUMERO_JOB","NOME_JOB","PARCELA_ITEM","VALOR_APROVADO","DATA_STATUS_MOSTRAR","VALOR_A_FATURAR","VALOR_A_FATURAR_MOSTRAR","ESTIMATIVA_CUSTO","STATUS_DESC","CLIENTE_ID","NOME_CLIENTE","CONTRATO_ID","NOME_CONTRATO","NOME_AUTOR","NOME_CRIADOR","GRUPO_CLIENTE","EMPRESA_FATURAMENTO","DATA_VENCIMENTO","EMPRESA_ID"
  FROM select1
UNION ALL
SELECT "ORCAMENTO_ID","JOB_ID","NUMERO_JOB","NOME_JOB","PARCELA_ITEM","VALOR_APROVADO","DATA_STATUS_MOSTRAR","VALOR_A_FATURAR","VALOR_A_FATURAR_MOSTRAR","ESTIMATIVA_CUSTO","STATUS_DESC","CLIENTE_ID","NOME_CLIENTE","CONTRATO_ID","NOME_CONTRATO","NOME_AUTOR","NOME_CRIADOR","GRUPO_CLIENTE","EMPRESA_FATURAMENTO","DATA_VENCIMENTO","EMPRESA_ID"
  FROM select2
UNION ALL
SELECT "ORCAMENTO_ID","JOB_ID","NUMERO_JOB","NOME_JOB","PARCELA_ITEM","VALOR_APROVADO","DATA_STATUS_MOSTRAR","VALOR_A_FATURAR","VALOR_A_FATURAR_MOSTRAR","ESTIMATIVA_CUSTO","STATUS_DESC","CONTRATANTE_ID","NOME_CLIENTE","CONTRATO_ID","NOME_CONTRATO","NOME_AUTOR","NOME_CRIADOR","GRUPO_CLIENTE","EMPRESA_FATURAMENTO","DATA_VENCIMENTO","EMPRESA_ID"
  FROM select3

;
--------------------------------------------------------
--  DDL for View V_NEGOCIACAO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_NEGOCIACAO" ("ORDEM_SERVICO_ID", "NUM_REFACAO", "QTDE") AS 
  SELECT ORDEM_SERVICO_ID,
       NUM_REFACAO,
       QTDE
  FROM MV_NEGOCIACAO
;
--------------------------------------------------------
--  DDL for View V_NIVEL_IDIOMA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_NIVEL_IDIOMA" ("CODIGO", "DESCRICAO", "ORDEM") AS 
  SELECT
-----------------------------------------------------------------------
-- lista dados do dicionario: nivel do idioma
-----------------------------------------------------------------------
       codigo,
       descricao,
       ordem
  FROM dicionario
 WHERE tipo = 'nivel_idioma'
;
--------------------------------------------------------
--  DDL for View V_OPORT_GANHAS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_OPORT_GANHAS" ("OPORTUNDIADE_ID", "CONTRATO_ID", "OPORT_EMPRESA_GRUPO", "OPORT_CLIENTE", "OPORT_NUMERO", "OPORT_NOME", "OPORT_CENARIO_ESCOLHIDO_NUMERO", "OPORT_CENARIO_ESCOLHIDO_NOME", "OPORT_SERVICOS", "OPORT_NUM_PARCELAS", "OPORT_VALOR", "OPORT_USUARIO_RESPONSAVEL", "OPORT_DATA_ENTRADA", "OPORT_DATA_ATU_STATUS", "OPORT_TIPO_NEGOCIO", "OPORT_ORIGEM", "CONTRATO_NUMERO", "CONTRATO_NOME", "CONTRATO_TIPO", "CONTRATO_USUARIO_RESPONSAVEL", "CONTRATO_DATA_ENTRADA", "CONTRATO_DATA_INICIO", "CONTRATO_DATA_TERMINO", "CONTRATO_RENOVAVEL", "CONTRATO_EMPRESA_RESPONSAVEL", "CONTRATO_CODIGO_EXTERNO", "CONTRATO_UNIDADE_NEGOCIO_USU_RESP", "CONTRATO_STATUS", "CONTRATO_DATA_STATUS") AS 
  SELECT op.oportunidade_id,
         ct.contrato_id,
         ep.nome AS oport_empresa_grupo,
         pe.nome AS oport_cliente,
         op.numero AS oport_numero,
         op.nome AS oport_nome,
         ce.num_cenario AS oport_cenario_escolhido_numero,
         ce.nome AS oport_cenario_escolhido_nome,
         (SELECT LISTAGG(se1.nome,', ') within group (order by se1.nome)
           FROM cenario_servico cs1
                INNER JOIN servico se1 ON se1.servico_id = cs1.servico_id
          WHERE cs1.cenario_id = op.cenario_escolhido_id) AS oport_servicos,
          ce.num_parcelas AS oport_num_parcelas,
          op.valor_oportun AS oport_valor,
          NVL((SELECT pe2.apelido || ' (' || us2.funcao || ') '
            FROM oport_usuario ou2
                 INNER JOIN pessoa pe2 ON pe2.usuario_id = ou2.usuario_id
                 INNER JOIN usuario us2 ON us2.usuario_id = ou2.usuario_id
           WHERE ou2.oportunidade_id = op.oportunidade_id
             AND ou2.flag_responsavel = 'S'),'Não definido') AS oport_usuario_responsavel,
         DATA_MOSTRAR(op.data_entrada) AS oport_data_entrada,
         DATA_MOSTRAR(op.data_status) AS oport_data_atu_status,
         tn.descricao AS oport_tipo_negocio,
         oi.descricao AS oport_origem,
         CONTRATO_PKG.NUMERO_FORMATAR(ct.contrato_id) AS contrato_numero,
         ct.nome AS contrato_nome,
         tc.nome AS contrato_tipo,
         NVL((SELECT LISTAGG(pe3.apelido || ' (' || us3.funcao || ') ',', ') within group (order by pe3.apelido)  
            FROM contrato_usuario ou3
                 INNER JOIN pessoa pe3 ON pe3.usuario_id = ou3.usuario_id
                 INNER JOIN usuario us3 ON us3.usuario_id = ou3.usuario_id
           WHERE ou3.contrato_id = ct.contrato_id
             AND ou3.flag_responsavel = 'S'),'Não definido') AS contrato_usuario_responsavel,
         DATA_MOSTRAR(ct.data_entrada) AS contrato_data_abertura,
         DATA_MOSTRAR(ct.data_inicio) AS contrato_data_inicio,
         DATA_MOSTRAR(ct.data_termino) AS contrato_data_termino,
         DECODE(ct.flag_renovavel,'S','Sim','N','Não') AS contrato_renovavel,
         er.apelido AS contrato_empresa_responsavel,
         ct.cod_ext_contrato AS contrato_codigo_externo,
         NVL((SELECT LISTAGG(un4.nome,', ') within group (order by un4.nome)
            FROM contrato_usuario ou4
                 INNER JOIN unidade_negocio_usu uu4 ON uu4.usuario_id = ou4.usuario_id
                 INNER JOIN unidade_negocio un4 ON un4.unidade_negocio_id = uu4.unidade_negocio_id
           WHERE ou4.contrato_id = ct.contrato_id --ct.contrato_id
             AND ou4.flag_responsavel = 'S'),'Não definido') AS contrato_unidade_negocio_usu_resp,
         sc.descricao AS contrato_status,
         DATA_MOSTRAR(ct.data_status) AS contrato_data_status
    FROM oportunidade op
         INNER JOIN oport_contrato oc ON oc.oportunidade_id = op.oportunidade_id
         INNER JOIN contrato ct ON ct.contrato_id = oc.contrato_id
         INNER JOIN empresa ep ON ep.empresa_id = op.empresa_id
         INNER JOIN pessoa pe ON pe.pessoa_id = op.cliente_id
         INNER JOIN cenario ce ON ce.cenario_id = op.cenario_escolhido_id
         INNER JOIN dicionario tn ON tn.codigo = op.tipo_negocio
                                  AND tn.tipo = 'oportunidade_tipo_negocio'
         INNER JOIN dicionario oi ON oi.codigo = op.origem
                                  AND oi.tipo = 'oportunidade_origem'
         INNER JOIN tipo_contrato tc ON tc.tipo_contrato_id = ct.tipo_contrato_id
         INNER JOIN pessoa er ON er.pessoa_id = ct.emp_resp_id
         INNER JOIN dicionario sc ON sc.codigo = ct.status
                                  AND sc.tipo = 'status_contrato'
   WHERE op.status = 'CONC'
     AND op.tipo_conc = 'GAN'
;
--------------------------------------------------------
--  DDL for View V_OPORTUNIDADES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_OPORTUNIDADES" ("OPORTUNIDADE_ID", "OPORT_EMPRESA", "OPORT_NUMERO", "OPORT_NOME", "OPORT_CLIENTE_ID", "OPORT_CLIENTE_APELIDO", "OPORT_CLIENTE_CNPJ", "OPORT_CLIENTE_NOME", "OPORT_PRODUTO_CLIENTE_NOME", "OPORT_TIPO_CONTRATO", "OPORT_STATUS", "OPORT_STATUS_AUXILIAR", "OPORT_DATA_STATUS", "OPORT_PRODUTO_CLIENTE_COD_EXT", "OPORT_DATA_ENTRADA", "OPORT_ABERTO_POR", "OPORT_ORIGEM", "OPORT_COMPL_ORIGEM", "OPORT_TIPO_NEGOCIO", "OPORT_CONFLITO", "OPORT_CLIENTE_CONFLITO_APELIDO", "OPORT_CONTATO_APELIDO", "OPORT_PROB_FECHAMENTO", "OPORT_DATA_PROV_FECHAMENTO", "OPORT_DATA_PROV_FECHAMENTO_FMT", "OPORT_ENDERECADOS", "OPORT_DATA_PROX_FOLLOWUP", "OPORT_DATA_PROX_FOLLOWUP_FMT", "OPORT_DATA_ULT_FOLLOWUP", "OPORT_DATA_ULT_FOLLOWUP_FMT", "OPORT_USUARIO_FOLLOWUP", "OPORT_FOLLOWUP_DESCRICAO", "OPORT_FOLLOWUP_MAIOR_90DIAS", "OPORT_CENARIO_NOME", "OPORT_SERVICOS", "OPORT_VALOR", "OPORT_NUM_PARCELAS", "OPORT_VALOR_PARCELA", "OPORT_DATA_CONCLUSAO", "OPORT_DATA_CONCLUSAO_FMT", "OPORT_CONCLUSAO", "EMPRESA_ID", "OPORT_DATA_GANHA", "OPORT_DATA_CANC", "OPORT_RESPONSAVEL", "OPORT_UN_RESPONSAVEL", "OPORT_POSSUI_CENARIO", "OPORT_PRODUTO_ID", "OPORT_PRODUTO_NOME") AS 
  SELECT op.oportunidade_id,
       oe.nome                                                           AS oport_empresa,
       op.numero                                                         AS oport_numero,
       op.nome                                                           AS oport_nome,
       op.cliente_id                                                     AS oport_cliente_id,
       co.apelido                                                        AS oport_cliente_apelido,
       nvl(co.cnpj, '-')                                                 AS oport_cliente_cnpj,
       co.nome                                                           AS oport_cliente_nome,
       oc.nome                                                           AS oport_produto_cliente_nome,
       tc.nome                                                           AS oport_tipo_contrato,
       do.descricao                                                      AS oport_status,
       CASE
          WHEN op.status <> 'CONC' THEN ao.nome
          WHEN op.status = 'CONC'  THEN DECODE(op.tipo_conc,'GAN','Ganha','PER','Perdida',NULL)
       ELSE NULL
       END AS oport_status_auxiliar,
       --ao.nome                                                           AS oport_status_auxiliar,
       op.data_status                                                    AS oport_data_status,
       oc.cod_ext_produto                                                AS oport_produto_cliente_cod_ext,
       op.data_entrada                                                   AS oport_data_entrada,
       pu.apelido || ' (' || us.funcao || ')'                            AS oport_aberto_por,
       oo.descricao                                                      AS oport_origem,
       op.compl_origem                                                   AS oport_compl_origem,
       ot.descricao                                                      AS oport_tipo_negocio,
       DECODE(op.flag_conflito,'S','Sim','N','Não','ND')                 AS oport_conflito,
       cc.apelido                                                        AS oport_cliente_conflito_apelido,
       ct.apelido                                                        AS oport_contato_apelido,
       it.perc_prob_fech                                                 AS oport_prob_fechamento,
       it.data_prov_fech                                                 AS oport_data_prov_fechamento,
       DATA_MOSTRAR(it.data_prov_fech)                                   AS oport_data_prov_fechamento_fmt,
       (SELECT LISTAGG(NVL(TO_CHAR(u.usuario_id),'-'),', ') within group (order by u.usuario_id)
          FROM oport_usuario u
         INNER JOIN pessoa p ON p.usuario_id = u.usuario_id
         WHERE u.oportunidade_id = op.oportunidade_id)                   AS oport_enderecados,
       it.data_prox_int                                                  AS oport_data_prox_followup,
       DATA_MOSTRAR(it.data_prox_int)                                    AS oport_data_prox_followup_fmt,
       it.data_interacao                                                 AS oport_data_ult_followup,
       DATA_MOSTRAR(it.data_interacao)                                   AS oport_data_ult_followup_fmt,
       pi.apelido || ' (' || ui.funcao || ')'                            AS oport_usuario_followup,
       it.descricao                                                      AS oport_followup_descricao,
       CASE
         WHEN (SYSDATE - it.data_interacao) > 90 THEN 'Sim'
         ELSE 'Não'
       END                                                               AS oport_followup_maior_90dias,
       CASE
          WHEN ce.nome IS NULL THEN 'Oportunidade sem Cenário'
          ELSE ce.nome
       END                                                               AS oport_cenario_nome,
       (SELECT LISTAGG(NVL(s.nome,'-'),', ') within group (order by s.nome)
          FROM cenario_servico c
         INNER JOIN servico s ON s.servico_id = c.servico_id
         WHERE c.cenario_id = ce.cenario_id)                             AS oport_servicos,
       NVL((SELECT SUM(c.valor_servico)
          FROM cenario_servico c
         WHERE c.cenario_id = ce.cenario_id), 0)                         AS oport_valor,
       NVL(ce.num_parcelas, 0)                                           AS oport_num_parcelas,
       NVL(ROUND((SELECT SUM(c.valor_servico)
                 FROM cenario_servico c
                WHERE c.cenario_id = ce.cenario_id) / ce.num_parcelas,2), 0) AS oport_valor_parcela,
        CASE
           WHEN op.status = 'CONC' THEN op.data_status
           ELSE NULL
        END                                                              AS oport_data_conclusao,
        CASE
           WHEN op.status = 'CONC' THEN DATA_MOSTRAR(op.data_status)
           ELSE NULL
        END                                                              AS oport_data_conclusao_fmt,
        DECODE(op.tipo_conc,'GAN','Ganha',
                             'PER','Perdida',
                             'DEC','Declinada',
                             'Sem Oportunidade')                         AS oport_conclusao,
        oe.empresa_id,
        CASE
          WHEN op.status = 'CONC'
           AND op.tipo_conc = 'GAN' THEN op.data_status
          ELSE NULL
        END                                                              AS oport_data_ganha,
        CASE
          WHEN op.status = 'CANC' THEN op.data_status
          ELSE NULL
        END                                                              AS oport_data_canc,
        DECODE(po.apelido,NULL,'Não Definido',
                        po.apelido || ' (' || uo.funcao || ')')          AS oport_responsavel,
        NVL((SELECT UN.NOME
           FROM UNIDADE_NEGOCIO UN
          WHERE UN.UNIDADE_NEGOCIO_ID = op.UNID_NEGOCIO_RESP_ID),'')     AS oport_un_responsavel,
        NVL2(ce.nome, 'Sim', 'Não')                                      AS oport_possui_cenario,
        (SELECT  listagg(gs.grupo_servico_id, ', ')
        FROM grupo_servico gs
        INNER JOIN servico se
        ON gs.grupo_servico_id = se.grupo_servico_id
        INNER JOIN cenario_servico cs
        ON se.servico_id = cs.servico_id
        WHERE cs.cenario_id = ce.cenario_id) as oport_produto_id,
        (SELECT  listagg(gs.nome, ', ')
        FROM grupo_servico gs
        INNER JOIN servico se
        ON gs.grupo_servico_id = se.grupo_servico_id
        INNER JOIN cenario_servico cs
        ON se.servico_id = cs.servico_id
        WHERE cs.cenario_id = ce.cenario_id) as oport_produto_nome
    FROM oportunidade                op
         INNER JOIN empresa          oe                                  ON oe.empresa_id          = op.empresa_id
         INNER JOIN dicionario       do                                  ON do.codigo              = op.status
                                                                         AND do.tipo               = 'status_oportunidade'
         INNER JOIN pessoa           ct                                  ON ct.pessoa_id           = op.contato_id
         INNER JOIN usuario          us                                  ON us.usuario_id          = op.usuario_solic_id
         INNER JOIN produto_cliente  oc                                  ON oc.produto_cliente_id  = op.produto_cliente_id
         INNER JOIN tipo_contrato    tc                                  ON tc.tipo_contrato_id    = op.tipo_contrato_id
         INNER JOIN dicionario       oo                                  ON oo.codigo              = op.origem
                                                                         AND oo.tipo               = 'oportunidade_origem'
         INNER JOIN dicionario       ot                                  ON ot.codigo              = op.tipo_negocio
         INNER JOIN interacao        it                                  ON it.interacao_id        = (SELECT MAX(i.interacao_id)
                                                                                                        FROM interacao i
                                                                                                       WHERE i.oportunidade_id = op.oportunidade_id)
         INNER JOIN usuario          ui                                  ON ui.usuario_id          = it.usuario_resp_id
         LEFT JOIN cenario          ce                                  ON ce.oportunidade_id     = op.oportunidade_id
                                                                         AND ce.flag_padrao        = 'S'
         LEFT JOIN pessoa           co                                  ON co.pessoa_id           = op.cliente_id
         LEFT JOIN status_aux_oport  ao                                  ON ao.status_aux_oport_id = op.status_aux_oport_id
         LEFT JOIN pessoa            cc                                  ON cc.pessoa_id           = op.cliente_conflito_id
         LEFT JOIN pessoa            pu                                  ON pu.usuario_id          = us.usuario_id
         LEFT JOIN pessoa            pi                                  ON pi.usuario_id          = ui.usuario_id
         LEFT JOIN oport_usuario     ou                                  ON ou.oportunidade_id     = op.oportunidade_id
                                                                         AND ou.flag_responsavel   = 'S'
         LEFT JOIN usuario           uo                                  ON uo.usuario_id          = op.usuario_resp_id
         LEFT JOIN pessoa            po                                  ON po.usuario_id          = op.usuario_resp_id
;
--------------------------------------------------------
--  DDL for View V_OS_EQUIPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_OS_EQUIPE" ("EQUIPE_ID", "EQUIPE", "ORDEM_SERVICO_ID") AS 
  SELECT DISTINCT
        eq.equipe_id,
        eq.nome as equipe,
        os.ordem_servico_id
   FROM equipe eq,
        equipe_usuario eu,
        os_usuario ou,
        ordem_servico os,
        job jo
  WHERE eq.equipe_id = eu.equipe_id
    AND eu.usuario_id = ou.usuario_id
    AND eu.flag_membro = 'S'
    AND ou.ordem_servico_id = os.ordem_servico_id
    AND os.job_id = jo.job_id
    AND jo.empresa_id = eq.empresa_id
;
--------------------------------------------------------
--  DDL for View V_PAPEL_PRIV
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_PAPEL_PRIV" ("PAPEL_ID", "EMPRESA_ID", "PRIVILEGIO_ID", "CODIGO_PRIV", "NOME_PRIV", "DESCRICAO_PRIV", "ORDEM_PRIV", "GRUPO_PRIV", "ABRANGENCIA") AS 
  SELECT
-----------------------------------------------------------------------
-- lista os privilegios de cada papel
-----------------------------------------------------------------------
       pp.papel_id,
       pa.empresa_id,
       pr.privilegio_id,
       pr.codigo,
       pr.nome,
       pr.descricao,
       pr.ordem,
       pr.grupo,
       pp.abrangencia
  FROM papel_priv pp,
       privilegio pr,
       papel pa
 WHERE pp.privilegio_id = pr.privilegio_id
   AND pp.papel_id = pa.papel_id
;
--------------------------------------------------------
--  DDL for View V_PAUTA_ATIVIDADES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_PAUTA_ATIVIDADES" ("EMPRESA_ID", "COD_OBJETO", "OBJETO_ID", "ITEM_CRONO_ID", "CLIENTE_ESPECIFICO", "CLIENTE", "JOB_ID", "JOB_DESCRICAO", "JOB_STATUS_CODIGO", "ATIVIDADE_TIPO", "ATIVIDADE_COR_NO_QUADRO", "ATIVIDADE_NUMERO", "ATIVIDADE_DESCRICAO", "ATIVIDADE_DESCRICAO_SEM_NUMERO", "ATIVIDADE_METADADOS", "STATUS", "STATUS_CODIGO", "STATUS_NEGOCIACAO", "PRAZO", "PRAZO_FMT", "PRAZO_COR", "PRAZO_INTERNO", "PRAZO_INTERNO_FMT", "PRAZO_INTERNO_COR", "SOLICITANTE", "SOLICITANTE_DETALHE", "EQUIPE", "EQUIPE_ID", "AREA", "EXECUTORES", "EXECUTORES_DETALHE", "HORAS", "PRODUTO_CLIENTE", "CONTRATO_NUMERO", "CONTRATO_NOME", "DATA_INICIO_PLANEJADA", "DATA_INICIO_PLANEJADA_FMT", "DATA_FIM_PLANEJADA", "DATA_FIM_PLANEJADA_FMT", "RESPONSAVEL_PELO_JOB", "RESPONSAVEL_PELO_JOB_DETALHE", "RESPONSAVEL_PELO_JOB_ID", "CONTATO_JOB", "DATA_ENTRADA_JOB", "DATA_ENTRADA_JOB_FMT", "DATA_ENVIO", "DATA_ENVIO_FMT", "DATA_APRESENTACAO", "DATA_APRESENTACAO_FMT", "DATA_GO_LIVE", "DATA_GO_LIVE_FMT", "EXECUTOR_ID", "EXECUTOR_COR", "COMENT_STATUS_AUTOR", "COMENT_STATUS_DATA", "COMENT_STATUS_DATA_FMT", "COMENT_STATUS", "DATA_CONCLUSAO", "FILTRO_PRAZO", "TIPO_OS_ID", "DATA_ALOC_USUARIO", "INICIAR_SOMENTE_EM", "DATA_INICIO_ND", "REFACAO") AS 
  WITH ordem_servico AS
 (SELECT /*+ first_rows (100) */
   mos.empresa_id,
   mos.cod_objeto,
   mos.objeto_id,
   mos.item_crono_id,
   mos.cliente_especifico AS cliente_especifico,
   nvl((SELECT listagg(gr.nome, ', ') within GROUP(ORDER BY gr.nome)
         FROM grupo gr
        INNER JOIN grupo_pessoa gp
           ON gr.grupo_id = gp.grupo_id
        WHERE gp.pessoa_id = mos.cliente
          AND gr.flag_agrupa_cnpj = 'S'),
       mos.cliente_especifico) AS cliente,
   mos.job_id,
   mos.job_descricao,
   mos.job_status_codigo,
   mos.atividade_tipo,
   mos.atividade_cor_no_quadro,
   ordem_servico_pkg.numero_formatar(mos.objeto_id) AS atividade_numero,
   ordem_servico_pkg.numero_formatar(mos.objeto_id) || ' ' ||
   mos.atividade_descricao_sem_numero AS atividade_descricao,
   mos.atividade_descricao_sem_numero,
   (SELECT listagg(v.valor_atributo, ', ') within GROUP(ORDER BY m.ordem)
      FROM os_atributo_valor v
     INNER JOIN metadado m
        ON m.metadado_id = v.metadado_id
     WHERE m.flag_na_lista = 'S'
       AND v.ordem_servico_id = mos.objeto_id) AS atividade_metadados,
   decode(mos.status,
          'CONC',
          'Concluída',
          'EXEC',
          'Executada',
          util_pkg.desc_retornar('status_os',
                                 mos.status) ||
          decode(mos.flag_recusada,
                 'S',
                 ' (Recusado)',
                 '')) AS status,
   mos.status_codigo,
   CASE
     WHEN mos.flag_em_negociacao = 'S' THEN
      'ANDA'
     WHEN mos.status_codigo IN
          ('DIST', 'ACEI', 'EMEX', 'AVAL') AND
          mos.flag_em_negociacao = 'N' AND
          (SELECT COUNT(1)
             FROM os_negociacao onx
            WHERE onx.ordem_servico_id =
                  mos.objeto_id
              AND onx.num_refacao = mos.qtd_refacao) = 0 THEN
      'DISP'
     WHEN mos.status_codigo IN
          ('DIST', 'ACEI', 'EMEX', 'AVAL') AND
          mos.flag_em_negociacao = 'N' AND
          (SELECT COUNT(1)
             FROM os_negociacao onx
            WHERE onx.ordem_servico_id =
                  mos.objeto_id
              AND onx.num_refacao = mos.qtd_refacao) > 0 THEN
      'CONC'
     ELSE
      'N/A'
   END AS status_negociacao,
   mos.prazo,
   data_mostrar(mos.prazo) AS prazo_fmt,
   CASE
     WHEN mos.status_codigo IN
          ('PREP',
           'DIST',
           'ACEI',
           'EMEX',
           'AVAL',
           'EXEC',
           'EMAP',
           'STAN') THEN
      CASE
        WHEN mos.prazo <= SYSDATE THEN
         'vermelho'
        WHEN mos.prazo > SYSDATE AND
             mos.prazo < trunc(SYSDATE + 1) THEN
         'amarelo'
        ELSE
         'branco'
      END
     WHEN mos.status_codigo = 'CONC' AND
          mos.prazo IS NOT NULL THEN
      'verde'
     ELSE
      'branco'
   END AS prazo_cor,
   mos.prazo_interno,
   data_mostrar(mos.prazo_interno) AS prazo_interno_fmt,
   CASE
     WHEN mos.status_codigo NOT IN ('CONC', 'EXEC') THEN
      CASE
        WHEN mos.prazo_interno <= SYSDATE THEN
         'vermelho'
        WHEN mos.prazo_interno > SYSDATE AND
             mos.prazo_interno < trunc(SYSDATE + 1) THEN
         'amarelo'
        ELSE
         'branco'
      END
     WHEN (mos.status_codigo = 'CONC' OR
          mos.status_codigo = 'EXEC') AND
          mos.prazo_interno IS NOT NULL THEN
      'verde'
     ELSE
      'branco'
   END AS prazo_interno_cor,
    (SELECT listagg(mu.apelido || ' (' || mu.funcao ||')' ,', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario mu,
           os_usuario i
     WHERE i.usuario_id = mu.usuario_id
       AND i.ordem_servico_id = mos.objeto_id
       AND i.tipo_ender = 'SOL') AS solicitante,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||
                   ') |' || mu.usuario_id || '|' ||
                   mu.nome_fisico || '|' ||
                   mu.prefixo || '|' || mu.numero || '|',
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario mu,
           os_usuario i
     WHERE i.usuario_id = mu.usuario_id
       AND i.ordem_servico_id = mos.objeto_id
       AND i.tipo_ender = 'SOL') AS solicitante_detalhe,
   nvl((SELECT DISTINCT listagg(nome, ', ') within GROUP(ORDER BY nome)
         FROM (SELECT DISTINCT e.nome
                 FROM equipe e
                INNER JOIN equipe_usuario x
                   ON x.equipe_id = e.equipe_id
                INNER JOIN os_usuario o
                   ON o.usuario_id = x.usuario_id
                WHERE o.ordem_servico_id =
                      mos.objeto_id
                  AND e.empresa_id = mos.empresa_id
                  AND x.flag_membro = 'S')),
       '-') AS equipe,
   nvl((SELECT DISTINCT to_char(',' ||
                               listagg(equipe_id,
                                       ',') within
                               GROUP(ORDER BY nome) || ',')
         FROM (SELECT DISTINCT e.equipe_id,
                               e.nome
                 FROM equipe e
                INNER JOIN equipe_usuario x
                   ON x.equipe_id = e.equipe_id
                INNER JOIN os_usuario o
                   ON o.usuario_id = x.usuario_id
                WHERE o.ordem_servico_id =
                      mos.objeto_id
                  AND e.empresa_id = mos.empresa_id
                  AND x.flag_membro = 'S')),
       '-') AS equipe_id,
   nvl((SELECT DISTINCT listagg(nome, ', ') within GROUP(ORDER BY nome)
         FROM (SELECT DISTINCT a.nome
                 FROM area a
                INNER JOIN cargo c
                   ON c.area_id = a.area_id
                INNER JOIN usuario_cargo x
                   ON x.cargo_id = c.cargo_id
                INNER JOIN os_usuario o
                   ON o.usuario_id = x.usuario_id
                WHERE o.ordem_servico_id =
                      mos.objeto_id
                  AND a.empresa_id = mos.empresa_id
                  AND x.data_fim IS NULL)),
       '-') AS area,
       (SELECT listagg(mu.apelido || ' (' || mu.funcao ||')',', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario mu,
           os_usuario i
     WHERE i.usuario_id = mu.usuario_id
       AND i.ordem_servico_id = mos.objeto_id
       AND i.tipo_ender = 'EXE') AS executores,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||
                   ') |' || mu.usuario_id || '|' ||
                   mu.nome_fisico || '|' ||
                   mu.prefixo || '|' || mu.numero || '|',
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario mu,
           os_usuario i
     WHERE i.usuario_id = mu.usuario_id
       AND i.ordem_servico_id = mos.objeto_id
       AND i.tipo_ender = 'EXE') AS executores_detalhe,
   nvl((SELECT SUM(u.horas_planej)
         FROM os_usuario u
        WHERE u.ordem_servico_id = mos.objeto_id),
       0) AS horas,
   mos.produto_cliente,
   decode(contrato_pkg.numero_formatar(mos.contrato_numero),
          'ERRO',
          '-',
          contrato_pkg.numero_formatar(mos.contrato_numero)) AS contrato_numero,
   decode(mos.contrato_nome,
          NULL,
          '-',
          mos.contrato_nome) AS contrato_nome,
   mos.data_inicio_planejada AS data_inicio_planejada,
   data_mostrar(mos.data_inicio_planejada_fmt) AS data_inicio_planejada_fmt,
   mos.data_fim_planejada AS data_fim_planejada,
   data_mostrar(mos.data_fim_planejada_fmt) AS data_fim_planejada_fmt,
    (SELECT listagg(mu.apelido || ' (' || mu.funcao ||')',', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario  mu,
           job_usuario i
     WHERE i.job_id = mos.job_id
       AND i.usuario_id = mu.usuario_id
       AND i.flag_responsavel = 'S') AS responsavel_pelo_job,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||
                   ') |' || mu.usuario_id || '|' ||
                   mu.nome_fisico || '|' ||
                   mu.prefixo || '|' || mu.numero || '|',
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario  mu,
           job_usuario i
     WHERE i.job_id = mos.job_id
       AND i.usuario_id = mu.usuario_id
       AND i.flag_responsavel = 'S') AS responsavel_pelo_job_detalhe,
   nvl((SELECT listagg(ju.usuario_id, ', ')
         FROM mv_usuario  mu,
              job_usuario ju
        WHERE ju.job_id = mos.job_id
          AND ju.usuario_id = mu.usuario_id
          AND ju.flag_responsavel = 'S'),
       0) AS responsavel_pelo_job_id,
   nvl((SELECT p.apelido ||
              decode(p.funcao,
                     NULL,
                     '',
                     ' (' || p.funcao || ')')
         FROM pessoa p
        WHERE p.pessoa_id = mos.contato_id),
       '-') AS contato_job,
   mos.data_entrada_job AS data_entrada_job,
   data_mostrar(mos.data_entrada_job_fmt) AS data_entrada_job_fmt,
   CASE
     WHEN mos.status_codigo IN
          ('DIST',
           'ACEI',
           'EMEX',
           'EXEC',
           'CONC',
           'EMAP',
           'AVAL') THEN
      ordem_servico_pkg.data_retornar(mos.objeto_id,
                                      'ENVI')
     WHEN mos.status_codigo IN
          ('DESC', 'PREP', 'CANC', 'STAN') THEN
      NULL
   END AS data_envio,
   CASE
     WHEN mos.status_codigo IN
          ('DIST',
           'ACEI',
           'EMEX',
           'EXEC',
           'CONC',
           'EMAP',
           'AVAL') THEN
      data_mostrar(ordem_servico_pkg.data_retornar(mos.objeto_id,
                                                   'ENVI'))
     WHEN mos.status_codigo IN
          ('DESC', 'PREP', 'CANC', 'STAN') THEN
      NULL
   END AS data_envio_fmt,
   mos.data_apresentacao AS data_apresentacao,
   data_mostrar(mos.data_apresentacao_fmt) AS data_apresentacao_fmt,
   mos.data_go_live AS data_go_live,
   data_mostrar(mos.data_go_live_fmt) AS data_go_live_fmt,
   (SELECT listagg(mu.usuario_id, ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario mu,
           os_usuario ou
     WHERE mu.usuario_id = ou.usuario_id
       AND ou.ordem_servico_id = mos.objeto_id
       AND ou.tipo_ender = 'EXE') AS executor_id,
   (SELECT listagg(CASE ou.status
                     WHEN 'EXEC' THEN
                      'cinza'
                     ELSE
                      'branco'
                   END,
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM os_usuario ou,
           mv_usuario mu
     WHERE ou.ordem_servico_id = mos.objeto_id
       AND ou.usuario_id = mu.usuario_id
       AND ou.tipo_ender = 'EXE') AS executor_cor,
   nvl((SELECT p.apelido
         FROM pessoa p
        WHERE p.usuario_id =
              mos.usuario_situacao_id),
       '-') AS coment_status_autor,
   mos.coment_status_data AS coment_status_data,
   data_mostrar(mos.coment_status_data_fmt) AS coment_status_data_fmt,
   nvl(mos.coment_status, '-') AS coment_status,
   mos.data_conclusao AS data_conclusao,
   mos.filtro_prazo,
   mos.tipo_os_id,
   (SELECT MIN(ou.data)
      FROM os_usuario_data ou
     WHERE ou.ordem_servico_id = mos.objeto_id) AS data_aloc_usuario,
   mos.data_demanda AS iniciar_somente_em,
   CASE
     WHEN mos.data_demanda IS NULL THEN
      'DATA INICIO NAO DEFINIDA'
   END AS data_inicio_nd,
   CASE
     WHEN mos.qtd_refacao = 0 OR
          mos.qtd_refacao IS NULL THEN
      '-'
     ELSE
      to_char(mos.qtd_refacao)
   END AS refacao
    FROM mv_ordem_servico mos),
tarefa AS
 (SELECT /*+ first_rows (100) */
   mta.empresa_id,
   mta.cod_objeto,
   mta.objeto_id,
   mta.item_crono_id,
   mta.cliente_especifico AS cliente_especifico,
   nvl((SELECT listagg(gr.nome, ', ') within GROUP(ORDER BY gr.nome)
         FROM grupo gr
        INNER JOIN grupo_pessoa gp
           ON gr.grupo_id = gp.grupo_id
        WHERE gp.pessoa_id = mta.cliente
          AND gr.flag_agrupa_cnpj = 'S'),
       mta.cliente_especifico) AS cliente,
   mta.job_id,
   mta.job_descricao,
   mta.job_status_codigo,
   mta.atividade_tipo,
   mta.atividade_cor_no_quadro,
   tarefa_pkg.numero_formatar(mta.objeto_id) AS atividade_numero,
   tarefa_pkg.numero_formatar(mta.objeto_id) || ' ' ||
   mta.atividade_descricao_sem_numero AS atividade_descricao,
   mta.atividade_descricao_sem_numero,
   (SELECT listagg(v.valor_atributo, ', ') within GROUP(ORDER BY m.ordem)
      FROM tarefa_tp_atrib_valor v
     INNER JOIN tarefa_tipo_produto t
        ON t.tarefa_tipo_produto_id =
           v.tarefa_tipo_produto_id
     INNER JOIN metadado m
        ON m.metadado_id = v.metadado_id
     WHERE m.flag_na_lista = 'S'
       AND t.tarefa_id = mta.objeto_id) AS atividade_metadados,
   util_pkg.desc_retornar('status_tarefa',
                          mta.status) AS status,
   mta.status_codigo,
   mta.status_negociacao,
   mta.prazo,
   data_mostrar(mta.prazo) AS prazo_fmt,
   CASE
     WHEN mta.status_codigo NOT IN ('CONC', 'EXEC') THEN
      CASE
        WHEN mta.prazo <= SYSDATE THEN
         'vermelho'
        WHEN mta.prazo > SYSDATE AND
             mta.prazo < trunc(SYSDATE + 1) THEN
         'amarelo'
        ELSE
         'branco'
      END
     WHEN (mta.status_codigo = 'CONC' OR
          mta.status_codigo = 'EXEC') AND
          mta.prazo IS NOT NULL THEN
      'verde'
     ELSE
      'branco'
   END AS prazo_cor,
   NULL AS prazo_interno,
   NULL AS prazo_interno_fmt,
   'branco' AS prazo_interno_cor,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||')',', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario mu
     WHERE mu.usuario_id = mta.solicitante_id) AS solicitante,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||
                   ') |' || mu.usuario_id || '|' ||
                   mu.nome_fisico || '|' ||
                   mu.prefixo || '|' || mu.numero || '|',
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario mu
     WHERE mu.usuario_id = mta.solicitante_id) AS solicitante_detalhe,
   nvl((SELECT listagg(nome, ', ') within GROUP(ORDER BY nome)
         FROM (SELECT DISTINCT e.nome
                 FROM equipe e
                INNER JOIN equipe_usuario x
                   ON x.equipe_id = e.equipe_id
                INNER JOIN tarefa_usuario i
                   ON (x.usuario_id =
                      i.usuario_para_id OR
                      x.usuario_id =
                      mta.solicitante_id)
                WHERE i.tarefa_id = mta.objeto_id
                  AND e.empresa_id = mta.empresa_id
                  AND x.flag_membro = 'S')),
       '-') AS equipe,
   nvl((SELECT to_char(',' ||
                      listagg(equipe_id, ',')
                      within
                      GROUP(ORDER BY nome) || ',')
         FROM (SELECT DISTINCT e.equipe_id,
                               e.nome
                 FROM equipe e
                INNER JOIN equipe_usuario x
                   ON x.equipe_id = e.equipe_id
                INNER JOIN tarefa_usuario i
                   ON (x.usuario_id =
                      i.usuario_para_id OR
                      x.usuario_id =
                      mta.solicitante_id)
                WHERE i.tarefa_id = mta.objeto_id
                  AND e.empresa_id = mta.empresa_id
                  AND x.flag_membro = 'S')),
       '-') AS equipe_id,
   nvl((SELECT DISTINCT listagg(area_nome, ', ') within GROUP(ORDER BY area_nome)
         FROM (SELECT DISTINCT mu.area_nome
                 FROM mv_usuario mu
                INNER JOIN tarefa_usuario tu
                   ON tu.usuario_para_id =
                      mu.usuario_id
                   OR mu.usuario_id =
                      mta.solicitante_id
                WHERE tu.tarefa_id = mta.objeto_id)),
       '-') AS area,
       (SELECT listagg(mu.apelido || ' (' || mu.funcao ||')',', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario     mu,
           tarefa_usuario z
     WHERE z.usuario_para_id = mu.usuario_id
       AND z.tarefa_id = mta.objeto_id) AS executores,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||
                   ') |' || mu.usuario_id || '|' ||
                   mu.nome_fisico || '|' ||
                   mu.prefixo || '|' || mu.numero || '|',
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario     mu,
           tarefa_usuario z
     WHERE z.usuario_para_id = mu.usuario_id
       AND z.tarefa_id = mta.objeto_id) AS executores_detalhe,
   nvl((SELECT SUM(tu.horas_totais)
         FROM tarefa_usuario tu
        WHERE tu.tarefa_id = mta.objeto_id),
       0) AS horas,
   mta.produto_cliente,
   decode(contrato_pkg.numero_formatar(mta.contrato_numero),
          'ERRO',
          '-',
          contrato_pkg.numero_formatar(mta.contrato_numero)) AS contrato_numero,
   decode(mta.contrato_nome,
          NULL,
          '-',
          mta.contrato_nome) AS contrato_nome,
   mta.data_inicio_planejada AS data_inicio_planejada,
   data_mostrar(mta.data_inicio_planejada_fmt) AS data_inicio_planejada_fmt,
   mta.data_fim_planejada AS data_fim_planejada,
   data_mostrar(mta.data_fim_planejada_fmt) AS data_fim_planejada_fmt,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||')',', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario  mu,
           job_usuario i
     WHERE i.job_id = mta.job_id
       AND i.usuario_id = mu.usuario_id
       AND i.flag_responsavel = 'S') AS responsavel_pelo_job,
   (SELECT listagg(mu.apelido || ' (' || mu.funcao ||
                   ') |' || mu.usuario_id || '| ' ||
                   mu.nome_fisico || '|' ||
                   mu.prefixo || '|' || mu.numero || '|',
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario  mu,
           job_usuario i
     WHERE i.job_id = mta.job_id
       AND i.usuario_id = mu.usuario_id
       AND i.flag_responsavel = 'S') AS responsavel_pelo_job_detalhe,
   nvl((SELECT listagg(ju.usuario_id, ', ')
         FROM mv_usuario  mu,
              job_usuario ju
        WHERE ju.job_id = mta.job_id
          AND ju.usuario_id = mu.usuario_id
          AND ju.flag_responsavel = 'S'),
       0) AS responsavel_pelo_job_id,
   nvl((SELECT p.apelido ||
              decode(p.funcao,
                     NULL,
                     '',
                     ' (' || p.funcao || ')')
         FROM pessoa p
        WHERE p.pessoa_id = mta.contato_id),
       '-') AS contato_job,
   mta.data_entrada_job AS data_entrada_job,
   data_mostrar(mta.data_entrada_job_fmt) AS data_entrada_job_fmt,
   mta.data_envio AS data_envio,
   data_mostrar(mta.data_envio_fmt) AS data_envio_fmt,
   mta.data_apresentacao AS data_apresentacao,
   data_mostrar(mta.data_apresentacao_fmt) AS data_apresentacao_fmt,
   mta.data_go_live AS data_go_live,
   data_mostrar(mta.data_go_live_fmt) AS data_go_live_fmt,
   (SELECT listagg(mu.usuario_id, ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario     mu,
           tarefa_usuario tu
     WHERE mu.usuario_id = tu.usuario_para_id
       AND tu.tarefa_id = mta.objeto_id) AS executor_id,
   (SELECT listagg(decode(tu.status,
                          'EXEC',
                          'cinza',
                          'branco'),
                   ', ') within GROUP(ORDER BY mu.apelido)
      FROM mv_usuario     mu,
           tarefa_usuario tu
     WHERE mu.usuario_id = tu.usuario_para_id
       AND tu.tarefa_id = mta.objeto_id) AS executor_cor,
   nvl((SELECT p.apelido
         FROM pessoa p
        WHERE p.usuario_id =
              mta.usuario_situacao_id),
       '-') AS coment_status_autor,
   mta.coment_status_data AS coment_status_data,
   data_mostrar(mta.coment_status_data_fmt) AS coment_status_data_fmt,
   nvl(mta.coment_status, '-') AS coment_status,
   mta.data_conclusao AS data_conclusao,
   mta.filtro_prazo,
   NULL AS tipo_os_id,
   NULL AS data_aloc_usuario,
   NULL AS iniciar_somente_em,
   NULL AS data_inicio_nd,
   '-' AS refacao
    FROM mv_tarefa mta)
SELECT "EMPRESA_ID","COD_OBJETO","OBJETO_ID","ITEM_CRONO_ID","CLIENTE_ESPECIFICO","CLIENTE","JOB_ID","JOB_DESCRICAO","JOB_STATUS_CODIGO","ATIVIDADE_TIPO","ATIVIDADE_COR_NO_QUADRO","ATIVIDADE_NUMERO","ATIVIDADE_DESCRICAO","ATIVIDADE_DESCRICAO_SEM_NUMERO","ATIVIDADE_METADADOS","STATUS","STATUS_CODIGO","STATUS_NEGOCIACAO","PRAZO","PRAZO_FMT","PRAZO_COR","PRAZO_INTERNO","PRAZO_INTERNO_FMT","PRAZO_INTERNO_COR","SOLICITANTE","SOLICITANTE_DETALHE","EQUIPE","EQUIPE_ID","AREA","EXECUTORES","EXECUTORES_DETALHE","HORAS","PRODUTO_CLIENTE","CONTRATO_NUMERO","CONTRATO_NOME","DATA_INICIO_PLANEJADA","DATA_INICIO_PLANEJADA_FMT","DATA_FIM_PLANEJADA","DATA_FIM_PLANEJADA_FMT","RESPONSAVEL_PELO_JOB","RESPONSAVEL_PELO_JOB_DETALHE","RESPONSAVEL_PELO_JOB_ID","CONTATO_JOB","DATA_ENTRADA_JOB","DATA_ENTRADA_JOB_FMT","DATA_ENVIO","DATA_ENVIO_FMT","DATA_APRESENTACAO","DATA_APRESENTACAO_FMT","DATA_GO_LIVE","DATA_GO_LIVE_FMT","EXECUTOR_ID","EXECUTOR_COR","COMENT_STATUS_AUTOR","COMENT_STATUS_DATA","COMENT_STATUS_DATA_FMT","COMENT_STATUS","DATA_CONCLUSAO","FILTRO_PRAZO","TIPO_OS_ID","DATA_ALOC_USUARIO","INICIAR_SOMENTE_EM","DATA_INICIO_ND","REFACAO"
  FROM ordem_servico
UNION ALL
SELECT "EMPRESA_ID","COD_OBJETO","OBJETO_ID","ITEM_CRONO_ID","CLIENTE_ESPECIFICO","CLIENTE","JOB_ID","JOB_DESCRICAO","JOB_STATUS_CODIGO","ATIVIDADE_TIPO","ATIVIDADE_COR_NO_QUADRO","ATIVIDADE_NUMERO","ATIVIDADE_DESCRICAO","ATIVIDADE_DESCRICAO_SEM_NUMERO","ATIVIDADE_METADADOS","STATUS","STATUS_CODIGO","STATUS_NEGOCIACAO","PRAZO","PRAZO_FMT","PRAZO_COR","PRAZO_INTERNO","PRAZO_INTERNO_FMT","PRAZO_INTERNO_COR","SOLICITANTE","SOLICITANTE_DETALHE","EQUIPE","EQUIPE_ID","AREA","EXECUTORES","EXECUTORES_DETALHE","HORAS","PRODUTO_CLIENTE","CONTRATO_NUMERO","CONTRATO_NOME","DATA_INICIO_PLANEJADA","DATA_INICIO_PLANEJADA_FMT","DATA_FIM_PLANEJADA","DATA_FIM_PLANEJADA_FMT","RESPONSAVEL_PELO_JOB","RESPONSAVEL_PELO_JOB_DETALHE","RESPONSAVEL_PELO_JOB_ID","CONTATO_JOB","DATA_ENTRADA_JOB","DATA_ENTRADA_JOB_FMT","DATA_ENVIO","DATA_ENVIO_FMT","DATA_APRESENTACAO","DATA_APRESENTACAO_FMT","DATA_GO_LIVE","DATA_GO_LIVE_FMT","EXECUTOR_ID","EXECUTOR_COR","COMENT_STATUS_AUTOR","COMENT_STATUS_DATA","COMENT_STATUS_DATA_FMT","COMENT_STATUS","DATA_CONCLUSAO","FILTRO_PRAZO","TIPO_OS_ID","DATA_ALOC_USUARIO","INICIAR_SOMENTE_EM","DATA_INICIO_ND","REFACAO"
  FROM tarefa
;
--------------------------------------------------------
--  DDL for View V_PAUTA_ATIVIDADES_EQUIPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_PAUTA_ATIVIDADES_EQUIPE" ("EMPRESA_ID", "COD_OBJETO", "OBJETO_ID", "ITEM_CRONO_ID", "CLIENTE_ESPECIFICO", "CLIENTE", "JOB_ID", "JOB_DESCRICAO", "JOB_STATUS_CODIGO", "ATIVIDADE_TIPO", "ATIVIDADE_COR_NO_QUADRO", "ATIVIDADE_NUMERO", "ATIVIDADE_DESCRICAO", "ATIVIDADE_DESCRICAO_SEM_NUMERO", "ATIVIDADE_METADADOS", "STATUS", "STATUS_CODIGO", "STATUS_NEGOCIACAO", "PRAZO", "PRAZO_FMT", "PRAZO_COR", "PRAZO_INTERNO", "PRAZO_INTERNO_FMT", "PRAZO_INTERNO_COR", "SOLICITANTE", "EQUIPE", "EQUIPE_ID", "AREA", "EXECUTORES", "HORAS", "PRODUTO_CLIENTE", "CONTRATO_NUMERO", "CONTRATO_NOME", "DATA_INICIO_PLANEJADA", "DATA_INICIO_PLANEJADA_FMT", "DATA_FIM_PLANEJADA", "DATA_FIM_PLANEJADA_FMT", "RESPONSAVEL_PELO_JOB", "RESPONSAVEL_PELO_JOB_ID", "CONTATO_JOB", "DATA_ENTRADA_JOB", "DATA_ENTRADA_JOB_FMT", "DATA_ENVIO", "DATA_ENVIO_FMT", "DATA_APRESENTACAO", "DATA_APRESENTACAO_FMT", "DATA_GO_LIVE", "DATA_GO_LIVE_FMT", "COMENT_STATUS_AUTOR", "COMENT_STATUS_DATA", "COMENT_STATUS_DATA_FMT", "COMENT_STATUS", "DATA_CONCLUSAO", "FILTRO_PRAZO") AS 
  SELECT MOS.EMPRESA_ID,
       MOS.COD_OBJETO,
       MOS.OBJETO_ID,
       MOS.ITEM_CRONO_ID,
       MOS.CLIENTE_ESPECIFICO AS CLIENTE_ESPECIFICO,
       NVL((SELECT LISTAGG(GR.NOME,', ') WITHIN GROUP (ORDER BY GR.NOME)
              FROM GRUPO GR
             INNER
              JOIN GRUPO_PESSOA GP ON GR.GRUPO_ID = GP.GRUPO_ID
             WHERE GP.PESSOA_ID = MOS.CLIENTE
               AND GR.FLAG_AGRUPA_CNPJ = 'S'), MOS.CLIENTE_ESPECIFICO) AS CLIENTE,
       MOS.JOB_ID,
       MOS.JOB_DESCRICAO,
       MOS.JOB_STATUS_CODIGO,
       MOS.ATIVIDADE_TIPO,
       MOS.ATIVIDADE_COR_NO_QUADRO,
       ORDEM_SERVICO_PKG.NUMERO_FORMATAR(MOS.OBJETO_ID) AS ATIVIDADE_NUMERO,
       ORDEM_SERVICO_PKG.NUMERO_FORMATAR(MOS.OBJETO_ID) || ' ' || MOS.ATIVIDADE_DESCRICAO_SEM_NUMERO AS ATIVIDADE_DESCRICAO,
       MOS.ATIVIDADE_DESCRICAO_SEM_NUMERO,
       (SELECT LISTAGG(V.VALOR_ATRIBUTO,', ') WITHIN GROUP (ORDER BY M.ORDEM)
          FROM OS_ATRIBUTO_VALOR V
         INNER
          JOIN METADADO M ON M.METADADO_ID = V.METADADO_ID
         WHERE M.FLAG_NA_LISTA = 'S'
           AND V.ORDEM_SERVICO_ID = MOS.OBJETO_ID) AS ATIVIDADE_METADADOS,
       DECODE(MOS.STATUS,'CONC',UTIL_PKG.DESC_RETORNAR('status_os',MOS.STATUS),
                                UTIL_PKG.DESC_RETORNAR('status_os',MOS.STATUS) ||
                                DECODE(MOS.FLAG_RECUSADA, 'S',' (Recusado)','')) AS STATUS,
       MOS.STATUS_CODIGO,
       CASE
          WHEN MOS.FLAG_EM_NEGOCIACAO = 'S' THEN 'ANDA'
          WHEN MOS.STATUS_CODIGO IN ('DIST','ACEI','EMEX','AVAL')
           AND MOS.FLAG_EM_NEGOCIACAO = 'N'
           AND (SELECT COUNT(1)
                  FROM OS_NEGOCIACAO ONX
                 WHERE ONX.ORDEM_SERVICO_ID = MOS.OBJETO_ID
                   AND ONX.NUM_REFACAO = MOS.QTD_REFACAO) = 0 THEN 'DISP'
          WHEN MOS.STATUS_CODIGO IN ('DIST','ACEI','EMEX','AVAL')
           AND MOS.FLAG_EM_NEGOCIACAO = 'N'
           AND (SELECT COUNT(1)
                  FROM OS_NEGOCIACAO ONX
                 WHERE ONX.ORDEM_SERVICO_ID = MOS.OBJETO_ID
                   AND ONX.NUM_REFACAO = MOS.QTD_REFACAO) > 0 THEN 'CONC'
          ELSE 'N/A'
       END AS STATUS_NEGOCIACAO,
       MOS.PRAZO,
       DATA_MOSTRAR(MOS.PRAZO) AS PRAZO_FMT,
       CASE
          WHEN MOS.STATUS_CODIGO IN ('PREP','DIST','ACEI','EMEX','AVAL','EXEC','EMAP','STAN') THEN
             CASE
                WHEN MOS.PRAZO <= SYSDATE THEN 'vermelho'
                WHEN MOS.PRAZO > SYSDATE AND MOS.PRAZO < TRUNC(SYSDATE+1) THEN 'amarelo'
                ELSE 'branco'
             END
           WHEN MOS.STATUS_CODIGO = 'CONC' AND MOS.PRAZO IS NOT NULL
             THEN 'verde'
          ELSE 'branco'
       END AS PRAZO_COR,
       MOS.PRAZO_INTERNO,
       DATA_MOSTRAR(MOS.PRAZO_INTERNO) AS PRAZO_INTERNO_FMT,
       CASE
          WHEN MOS.STATUS_CODIGO NOT IN ('CONC', 'EXEC') THEN
             CASE
                WHEN MOS.PRAZO_INTERNO <= SYSDATE THEN 'vermelho'
                WHEN MOS.PRAZO_INTERNO > SYSDATE AND MOS.PRAZO_INTERNO < TRUNC(SYSDATE+1) THEN 'amarelo'
             ELSE 'branco'
             END
           WHEN (MOS.STATUS_CODIGO = 'CONC' OR MOS.STATUS_CODIGO = 'EXEC') AND MOS.PRAZO_INTERNO IS NOT NULL
             THEN 'verde'
           ELSE 'branco'
       END AS PRAZO_INTERNO_COR,
       (SELECT LISTAGG(MU.APELIDO || ' (' || MU.FUNCAO || ') |' || MU.USUARIO_ID || '|' || MU.NOME_FISICO || '|' || MU.PREFIXO || '|' || MU.NUMERO || '|',', ') WITHIN GROUP (ORDER BY MU.APELIDO)
          FROM MV_USUARIO MU,
               OS_USUARIO I
         WHERE I.USUARIO_ID = MU.USUARIO_ID
           AND I.ORDEM_SERVICO_ID = MOS.OBJETO_ID
           AND I.TIPO_ENDER = 'SOL') AS SOLICITANTE,
       VOE.equipe    AS EQUIPE,
       VOE.equipe_id AS EQUIPE_ID,
       NVL((SELECT DISTINCT LISTAGG(NOME,', ') WITHIN GROUP (ORDER BY NOME)
              FROM (SELECT DISTINCT A.NOME
                      FROM AREA A
                     INNER
                      JOIN CARGO C ON C.AREA_ID = A.AREA_ID
                     INNER
                      JOIN USUARIO_CARGO X ON X.CARGO_ID = C.CARGO_ID
                     INNER
                      JOIN OS_USUARIO O ON O.USUARIO_ID = X.USUARIO_ID
                     WHERE O.ORDEM_SERVICO_ID = MOS.OBJETO_ID
                       AND A.EMPRESA_ID       = MOS.EMPRESA_ID
                       AND X.DATA_FIM IS NULL)),'-') AS AREA,
       (SELECT LISTAGG(MU.APELIDO || ' (' || MU.FUNCAO || ') |' || MU.USUARIO_ID || '|' || MU.NOME_FISICO || '|' || MU.PREFIXO || '|' || MU.NUMERO || '|',', ') WITHIN GROUP (ORDER BY MU.APELIDO)
          FROM MV_USUARIO MU,
               OS_USUARIO I
         WHERE I.USUARIO_ID = MU.USUARIO_ID
           AND I.ORDEM_SERVICO_ID = MOS.OBJETO_ID
           AND I.TIPO_ENDER = 'EXE') AS EXECUTORES,
       NVL((SELECT SUM(U.HORAS_PLANEJ)
              FROM OS_USUARIO U
             WHERE U.ORDEM_SERVICO_ID = MOS.OBJETO_ID),0) AS HORAS,
       MOS.PRODUTO_CLIENTE,
       DECODE(CONTRATO_PKG.NUMERO_FORMATAR(MOS.CONTRATO_NUMERO), 'ERRO', '-',
              CONTRATO_PKG.NUMERO_FORMATAR(MOS.CONTRATO_NUMERO)) AS CONTRATO_NUMERO,
       DECODE(MOS.CONTRATO_NOME, NULL, '-', MOS.CONTRATO_NOME) AS CONTRATO_NOME,
       MOS.DATA_INICIO_PLANEJADA AS DATA_INICIO_PLANEJADA,
       DATA_MOSTRAR(MOS.DATA_INICIO_PLANEJADA_FMT) AS DATA_INICIO_PLANEJADA_FMT,
       MOS.DATA_FIM_PLANEJADA AS DATA_FIM_PLANEJADA,
       DATA_MOSTRAR(MOS.DATA_FIM_PLANEJADA_FMT) AS DATA_FIM_PLANEJADA_FMT,
       (SELECT LISTAGG(MU.APELIDO || ' (' || MU.FUNCAO || ') |' || MU.USUARIO_ID || '|' || MU.NOME_FISICO || '|' || MU.PREFIXO || '|' || MU.NUMERO || '|',', ') WITHIN GROUP (ORDER BY MU.APELIDO)
          FROM MV_USUARIO MU,
               JOB_USUARIO I
         WHERE I.JOB_ID            = MOS.JOB_ID
           AND I.USUARIO_ID        = MU.USUARIO_ID
           AND I.FLAG_RESPONSAVEL  = 'S') AS RESPONSAVEL_PELO_JOB,
       NVL((SELECT JU.USUARIO_ID
              FROM MV_USUARIO MU,
                   JOB_USUARIO JU
             WHERE JU.JOB_ID     = MOS.JOB_ID
               AND JU.USUARIO_ID = MU.USUARIO_ID
               AND JU.FLAG_RESPONSAVEL = 'S'), 0) AS RESPONSAVEL_PELO_JOB_ID,
       NVL((SELECT P.APELIDO || DECODE(P.FUNCAO,NULL,'',' (' || P.FUNCAO || ')')
              FROM PESSOA P
             WHERE P.PESSOA_ID = MOS.CONTATO_ID),'-') AS CONTATO_JOB,
       MOS.DATA_ENTRADA_JOB AS DATA_ENTRADA_JOB,
       DATA_MOSTRAR(MOS.DATA_ENTRADA_JOB_FMT) AS DATA_ENTRADA_JOB_FMT,
       CASE
          WHEN MOS.STATUS_CODIGO IN ('DIST','ACEI','EMEX','EXEC','CONC','EMAP','AVAL') THEN
            ORDEM_SERVICO_PKG.DATA_RETORNAR(MOS.OBJETO_ID,'ENVI')
          WHEN MOS.STATUS_CODIGO IN ('DESC','PREP','CANC','STAN') THEN
            NULL
       END AS DATA_ENVIO,
       CASE
          WHEN MOS.STATUS_CODIGO IN ('DIST','ACEI','EMEX','EXEC','CONC','EMAP','AVAL') THEN
            DATA_MOSTRAR(ORDEM_SERVICO_PKG.DATA_RETORNAR(MOS.OBJETO_ID,'ENVI'))
          WHEN MOS.STATUS_CODIGO IN ('DESC','PREP','CANC','STAN') THEN
            NULL
       END AS DATA_ENVIO_FMT,
       MOS.DATA_APRESENTACAO AS DATA_APRESENTACAO,
       DATA_MOSTRAR(MOS.DATA_APRESENTACAO_FMT) AS DATA_APRESENTACAO_FMT,
       MOS.DATA_GO_LIVE AS DATA_GO_LIVE,
       DATA_MOSTRAR(MOS.DATA_GO_LIVE_FMT) AS DATA_GO_LIVE_FMT,
       NVL((SELECT P.APELIDO
              FROM PESSOA P
             WHERE P.USUARIO_ID = MOS.USUARIO_SITUACAO_ID),'-') AS COMENT_STATUS_AUTOR,
       MOS.COMENT_STATUS_DATA AS COMENT_STATUS_DATA,
       DATA_MOSTRAR(MOS.COMENT_STATUS_DATA_FMT) AS COMENT_STATUS_DATA_FMT,
       NVL(MOS.COMENT_STATUS,'-') AS COMENT_STATUS,
       MOS.DATA_CONCLUSAO AS DATA_CONCLUSAO,
       MOS.FILTRO_PRAZO
FROM MV_ORDEM_SERVICO MOS,
     V_OS_EQUIPE VOE
WHERE MOS.OBJETO_ID = VOE.ORDEM_SERVICO_ID
UNION ALL
SELECT MTA.EMPRESA_ID,
       MTA.COD_OBJETO,
       MTA.OBJETO_ID,
       MTA.ITEM_CRONO_ID,
       MTA.CLIENTE_ESPECIFICO  AS CLIENTE_ESPECIFICO,
       NVL((SELECT LISTAGG(GR.NOME,', ') WITHIN GROUP (ORDER BY GR.NOME)
              FROM GRUPO GR
             INNER
              JOIN GRUPO_PESSOA GP ON GR.GRUPO_ID = GP.GRUPO_ID
             WHERE GP.PESSOA_ID = MTA.CLIENTE
               AND GR.FLAG_AGRUPA_CNPJ = 'S'), MTA.CLIENTE_ESPECIFICO) AS CLIENTE,
       MTA.JOB_ID,
       MTA.JOB_DESCRICAO,
       MTA.JOB_STATUS_CODIGO,
       MTA.ATIVIDADE_TIPO,
       MTA.ATIVIDADE_COR_NO_QUADRO,
       TAREFA_PKG.NUMERO_FORMATAR(MTA.OBJETO_ID) AS ATIVIDADE_NUMERO,
       TAREFA_PKG.NUMERO_FORMATAR(MTA.OBJETO_ID) || ' ' || MTA.ATIVIDADE_DESCRICAO_SEM_NUMERO AS ATIVIDADE_DESCRICAO,
       MTA.ATIVIDADE_DESCRICAO_SEM_NUMERO,
       (SELECT LISTAGG(V.VALOR_ATRIBUTO,', ') WITHIN GROUP (ORDER BY M.ORDEM)
          FROM TAREFA_TP_ATRIB_VALOR V
         INNER
          JOIN TAREFA_TIPO_PRODUTO T ON T.TAREFA_TIPO_PRODUTO_ID = V.TAREFA_TIPO_PRODUTO_ID
         INNER
          JOIN METADADO M ON M.METADADO_ID = V.METADADO_ID
         WHERE M.FLAG_NA_LISTA = 'S'
           AND T.TAREFA_ID = MTA.OBJETO_ID) AS ATIVIDADE_METADADOS,
       util_pkg.desc_retornar('status_tarefa',MTA.status) AS STATUS,
       MTA.STATUS_CODIGO,
       MTA.STATUS_NEGOCIACAO,
       MTA.PRAZO,
       DATA_MOSTRAR(MTA.PRAZO) AS PRAZO_FMT,
       CASE
         WHEN MTA.STATUS_CODIGO NOT IN ('CONC', 'EXEC') THEN
           CASE
            WHEN MTA.PRAZO <= SYSDATE THEN 'vermelho'
            WHEN MTA.PRAZO > SYSDATE AND MTA.PRAZO < TRUNC(SYSDATE+1) THEN 'amarelo'
           ELSE 'branco'
           END
         WHEN (MTA.STATUS_CODIGO = 'CONC' OR MTA.STATUS_CODIGO = 'EXEC') AND MTA.PRAZO IS NOT NULL THEN 'verde'
         ELSE 'branco'
       END AS PRAZO_COR,
       NULL AS PRAZO_INTERNO,
       NULL AS PRAZO_INTERNO_FMT,
       'branco' AS PRAZO_INTERNO_COR,
       (SELECT LISTAGG(MU.APELIDO || ' (' || MU.FUNCAO || ') |' || MU.USUARIO_ID || '|' || MU.NOME_FISICO || '|' || MU.PREFIXO || '|' || MU.NUMERO || '|',', ') WITHIN GROUP (ORDER BY MU.APELIDO)
          FROM MV_USUARIO MU
         WHERE MU.USUARIO_ID = MTA.SOLICITANTE_ID)  AS SOLICITANTE,
       VTE.equipe    AS EQUIPE,
       VTE.equipe_id AS EQUIPE_ID,
       NVL((SELECT DISTINCT LISTAGG(AREA_NOME,', ') WITHIN GROUP (ORDER BY AREA_NOME)
              FROM (SELECT DISTINCT MU.AREA_NOME
                      FROM MV_USUARIO MU
                     INNER
                      JOIN TAREFA_USUARIO TU ON TU.USUARIO_PARA_ID = MU.USUARIO_ID OR MU.USUARIO_ID = MTA.SOLICITANTE_ID
                     WHERE TU.TAREFA_ID = MTA.OBJETO_ID)), '-') AS AREA,
       (SELECT LISTAGG(MU.APELIDO || ' (' || MU.FUNCAO || ') |' || MU.USUARIO_ID || '|' || MU.NOME_FISICO || '|' || MU.PREFIXO  || '|' || MU.NUMERO || '|',', ') WITHIN GROUP (ORDER BY MU.APELIDO)
          FROM MV_USUARIO MU,
               TAREFA_USUARIO Z
         WHERE Z.USUARIO_PARA_ID = MU.USUARIO_ID
           AND Z.TAREFA_ID  = MTA.OBJETO_ID) AS EXECUTORES,
       NVL((SELECT SUM(TU.HORAS_TOTAIS)
              FROM TAREFA_USUARIO TU
             WHERE TU.TAREFA_ID = MTA.OBJETO_ID),0) AS HORAS,
       MTA.PRODUTO_CLIENTE,
       DECODE(CONTRATO_PKG.NUMERO_FORMATAR(MTA.CONTRATO_NUMERO), 'ERRO', '-',
              CONTRATO_PKG.NUMERO_FORMATAR(MTA.CONTRATO_NUMERO)) AS CONTRATO_NUMERO,
       DECODE(MTA.CONTRATO_NOME, NULL, '-', MTA.CONTRATO_NOME) AS CONTRATO_NOME,
       MTA.DATA_INICIO_PLANEJADA AS DATA_INICIO_PLANEJADA,
       DATA_MOSTRAR(MTA.DATA_INICIO_PLANEJADA_FMT) AS DATA_INICIO_PLANEJADA_FMT,
       MTA.DATA_FIM_PLANEJADA AS DATA_FIM_PLANEJADA,
       DATA_MOSTRAR(MTA.DATA_FIM_PLANEJADA_FMT) AS DATA_FIM_PLANEJADA_FMT,
       (SELECT LISTAGG(MU.APELIDO || ' (' || MU.FUNCAO || ') |' || MU.USUARIO_ID || '| ' || MU.NOME_FISICO || '|' || MU.PREFIXO  || '|' || MU.NUMERO || '|',', ') WITHIN GROUP (ORDER BY MU.APELIDO)
          FROM MV_USUARIO MU,
               JOB_USUARIO I
         WHERE I.JOB_ID     = MTA.JOB_ID
           AND I.USUARIO_ID = MU.USUARIO_ID
           AND I.FLAG_RESPONSAVEL  = 'S') AS RESPONSAVEL_PELO_JOB,
       NVL((SELECT JU.USUARIO_ID
              FROM MV_USUARIO MU,
                   JOB_USUARIO JU
             WHERE JU.JOB_ID = MTA.JOB_ID
               AND JU.USUARIO_ID = MU.USUARIO_ID
               AND JU.FLAG_RESPONSAVEL = 'S'), 0) AS RESPONSAVEL_PELO_JOB_ID,
       NVL((SELECT P.APELIDO || DECODE(P.FUNCAO,NULL,'',' (' || P.FUNCAO || ')')
              FROM PESSOA P
             WHERE P.PESSOA_ID = MTA.CONTATO_ID),'-') AS CONTATO_JOB,
       MTA.DATA_ENTRADA_JOB AS DATA_ENTRADA_JOB,
       DATA_MOSTRAR(MTA.DATA_ENTRADA_JOB_FMT) AS DATA_ENTRADA_JOB_FMT,
       MTA.DATA_ENVIO AS DATA_ENVIO,
       DATA_MOSTRAR(MTA.DATA_ENVIO_FMT) AS DATA_ENVIO_FMT,
       MTA.DATA_APRESENTACAO AS DATA_APRESENTACAO,
       DATA_MOSTRAR(MTA.DATA_APRESENTACAO_FMT) AS DATA_APRESENTACAO_FMT,
       MTA.DATA_GO_LIVE AS DATA_GO_LIVE,
       DATA_MOSTRAR(MTA.DATA_GO_LIVE_FMT) AS DATA_GO_LIVE_FMT,
       NVL((SELECT P.APELIDO
              FROM PESSOA P
             WHERE P.USUARIO_ID = MTA.USUARIO_SITUACAO_ID),'-') AS COMENT_STATUS_AUTOR,
       MTA.COMENT_STATUS_DATA AS COMENT_STATUS_DATA,
       DATA_MOSTRAR(MTA.COMENT_STATUS_DATA_FMT) AS COMENT_STATUS_DATA_FMT,
       NVL(MTA.COMENT_STATUS,'-') AS COMENT_STATUS,
       MTA.DATA_CONCLUSAO AS DATA_CONCLUSAO,
       MTA.FILTRO_PRAZO
  FROM MV_TAREFA MTA,
       V_TAREFA_EQUIPE VTE
 WHERE MTA.OBJETO_ID = VTE.TAREFA_ID
;
--------------------------------------------------------
--  DDL for View V_PAUTA_ATIVIDADES_EXECUTOR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_PAUTA_ATIVIDADES_EXECUTOR" ("EMPRESA_ID", "COD_OBJETO", "OBJETO_ID", "ITEM_CRONO_ID", "CLIENTE_ESPECIFICO", "CLIENTE", "JOB_ID", "ATIVIDADE_TIPO", "ATIVIDADE_COR_NO_QUADRO", "ATIVIDADE_NUMERO", "ATIVIDADE_DESCRICAO", "ATIVIDADE_DESCRICAO_SEM_NUMERO", "ATIVIDADE_METADADOS", "STATUS", "STATUS_CODIGO", "PRAZO", "PRAZO_FMT", "PRAZO_COR", "PRAZO_INTERNO", "PRAZO_INTERNO_FMT", "PRAZO_INTERNO_COR", "EQUIPE", "EQUIPE_ID", "EXECUTOR_ID", "EXECUTOR_COR", "COMENT_STATUS", "COMENT_STATUS_AUTOR", "COMENT_STATUS_DATA", "COMENT_STATUS_DATA_FMT", "DATA_CONCLUSAO", "DATA_ALOC_USUARIO", "INICIAR_SOMENTE_EM", "DATA_INICIO_ND", "REFACAO") AS 
  SELECT MOS.EMPRESA_ID,
       MOS.COD_OBJETO,
       MOS.OBJETO_ID,
       MOS.ITEM_CRONO_ID,
       MOS.CLIENTE_ESPECIFICO AS CLIENTE_ESPECIFICO,
       NVL((SELECT LISTAGG(GR.NOME,', ') WITHIN GROUP (ORDER BY GR.NOME)
              FROM GRUPO GR
             INNER
              JOIN GRUPO_PESSOA GP ON GR.GRUPO_ID = GP.GRUPO_ID
             WHERE GP.PESSOA_ID = MOS.CLIENTE
               AND GR.FLAG_AGRUPA_CNPJ = 'S'), MOS.CLIENTE_ESPECIFICO) AS CLIENTE,
       MOS.JOB_ID,
       MOS.ATIVIDADE_TIPO,
       MOS.ATIVIDADE_COR_NO_QUADRO,
       ORDEM_SERVICO_PKG.NUMERO_FORMATAR(MOS.OBJETO_ID) AS ATIVIDADE_NUMERO,
       ORDEM_SERVICO_PKG.NUMERO_FORMATAR(MOS.OBJETO_ID) || ' ' || MOS.ATIVIDADE_DESCRICAO_SEM_NUMERO AS ATIVIDADE_DESCRICAO,
       MOS.ATIVIDADE_DESCRICAO_SEM_NUMERO,
       (SELECT LISTAGG(V.VALOR_ATRIBUTO,', ') WITHIN GROUP (ORDER BY M.ORDEM)
          FROM OS_ATRIBUTO_VALOR V
         INNER
          JOIN METADADO M ON M.METADADO_ID = V.METADADO_ID
         WHERE M.FLAG_NA_LISTA = 'S'
           AND V.ORDEM_SERVICO_ID = MOS.OBJETO_ID) AS ATIVIDADE_METADADOS,
       DECODE(MOS.STATUS,'CONC',UTIL_PKG.DESC_RETORNAR('status_os',MOS.STATUS),
                                UTIL_PKG.DESC_RETORNAR('status_os',MOS.STATUS) ||
                                DECODE(MOS.FLAG_RECUSADA, 'S',' (Recusado)','')) AS STATUS,
       MOS.STATUS_CODIGO,
       MOS.PRAZO,
       DATA_MOSTRAR(MOS.PRAZO) AS PRAZO_FMT,
       CASE
          WHEN MOS.STATUS_CODIGO IN ('PREP','DIST','ACEI','EMEX','AVAL','EXEC','EMAP','STAN') THEN
             CASE
                WHEN MOS.PRAZO <= SYSDATE THEN 'vermelho'
                WHEN MOS.PRAZO > SYSDATE AND MOS.PRAZO < TRUNC(SYSDATE+1) THEN 'amarelo'
             ELSE 'branco'
             END
          ELSE 'branco'
       END AS PRAZO_COR,
       MOS.PRAZO_INTERNO,
       DATA_MOSTRAR(MOS.PRAZO_INTERNO) AS PRAZO_INTERNO_FMT,
       CASE
          WHEN MOS.STATUS IN ('DIST','ACEI','EMEX','AVAL') THEN
             CASE
                WHEN MOS.PRAZO_INTERNO <= SYSDATE THEN 'vermelho'
                WHEN MOS.PRAZO_INTERNO > SYSDATE AND MOS.PRAZO_INTERNO < TRUNC(SYSDATE+1) THEN 'amarelo'
             ELSE 'branco'
             END
           ELSE 'branco'
       END AS PRAZO_INTERNO_COR,
       NVL((SELECT DISTINCT LISTAGG(NOME,', ') WITHIN GROUP (ORDER BY NOME)
              FROM (SELECT DISTINCT E.NOME
                      FROM EQUIPE E
                     INNER
                      JOIN EQUIPE_USUARIO X ON X.EQUIPE_ID = E.EQUIPE_ID
                     INNER
                      JOIN OS_USUARIO O ON O.USUARIO_ID = X.USUARIO_ID
                     WHERE O.ORDEM_SERVICO_ID = MOS.OBJETO_ID
                       AND E.EMPRESA_ID = MOS.EMPRESA_ID
                       AND O.USUARIO_ID = EX.USUARIO_ID
                       AND X.FLAG_MEMBRO = 'S')),'-') AS EQUIPE,
       NVL((SELECT DISTINCT LISTAGG(EQUIPE_ID,', ') WITHIN GROUP (ORDER BY NOME)
              FROM (SELECT DISTINCT E.EQUIPE_ID, E.NOME
                      FROM EQUIPE E
                     INNER
                      JOIN EQUIPE_USUARIO X ON X.EQUIPE_ID = E.EQUIPE_ID
                     INNER
                      JOIN OS_USUARIO O ON O.USUARIO_ID = X.USUARIO_ID
                     WHERE O.ORDEM_SERVICO_ID = MOS.OBJETO_ID
                       AND E.EMPRESA_ID = MOS.EMPRESA_ID
                       AND O.USUARIO_ID = EX.USUARIO_ID
                       AND X.FLAG_MEMBRO = 'S')),'-') AS EQUIPE_ID,
       EX.USUARIO_ID AS EXECUTOR_ID,
       EX.EXECUTOR_COR,
       NVL(MOS.COMENT_STATUS,'-') AS COMENT_STATUS,
       NVL((SELECT P.APELIDO
              FROM PESSOA P
             WHERE P.USUARIO_ID = MOS.USUARIO_SITUACAO_ID),'-') AS COMENT_STATUS_AUTOR,
       MOS.COMENT_STATUS_DATA AS COMENT_STATUS_DATA,
       DATA_MOSTRAR(MOS.COMENT_STATUS_DATA_FMT) AS COMENT_STATUS_DATA_FMT,
       MOS.DATA_CONCLUSAO AS DATA_CONCLUSAO,
       (SELECT MIN(OU.DATA)
         FROM OS_USUARIO_DATA OU
        WHERE OU.ORDEM_SERVICO_ID = MOS.OBJETO_ID) AS DATA_ALOC_USUARIO,
       MOS.DATA_DEMANDA AS INICIAR_SOMENTE_EM,
       CASE
         WHEN MOS.DATA_DEMANDA IS NULL THEN
           'DATA INICIO NAO DEFINIDA'
       END AS DATA_INICIO_ND,
         CASE
            WHEN MOS.QTD_REFACAO = 0 OR MOS.QTD_REFACAO IS NULL THEN
               '-'
            ELSE
               TO_CHAR(MOS.QTD_REFACAO)
          END AS REFACAO
  FROM MV_ORDEM_SERVICO MOS,
      (SELECT DISTINCT
              MU.USUARIO_ID,
              OS.ORDEM_SERVICO_ID,
              DECODE(OU.STATUS, 'EXEC', 'cinza', 'branco') AS EXECUTOR_COR
         FROM MV_USUARIO     MU,
              OS_USUARIO     OU,
              ORDEM_SERVICO  OS,
              JOB            JO
        WHERE (MU.USUARIO_ID       = OU.USUARIO_ID AND OU.TIPO_ENDER = 'EXE')
          AND OU.ORDEM_SERVICO_ID = OS.ORDEM_SERVICO_ID
          AND OS.JOB_ID           = JO.JOB_ID) EX
 WHERE MOS.OBJETO_ID = EX.ORDEM_SERVICO_ID
UNION ALL
SELECT MTA.EMPRESA_ID,
       MTA.COD_OBJETO,
       MTA.OBJETO_ID,
       MTA.ITEM_CRONO_ID,
       MTA.CLIENTE_ESPECIFICO  AS CLIENTE_ESPECIFICO,
       NVL((SELECT LISTAGG(GR.NOME,', ') WITHIN GROUP (ORDER BY GR.NOME)
              FROM GRUPO GR
             INNER
              JOIN GRUPO_PESSOA GP ON GR.GRUPO_ID = GP.GRUPO_ID
             WHERE GP.PESSOA_ID = MTA.CLIENTE
               AND GR.FLAG_AGRUPA_CNPJ = 'S'), MTA.CLIENTE_ESPECIFICO) AS CLIENTE,
       MTA.JOB_ID,
       MTA.ATIVIDADE_TIPO,
       MTA.ATIVIDADE_COR_NO_QUADRO,
       TAREFA_PKG.NUMERO_FORMATAR(MTA.OBJETO_ID) AS ATIVIDADE_NUMERO,
       TAREFA_PKG.NUMERO_FORMATAR(MTA.OBJETO_ID) || ' ' || MTA.ATIVIDADE_DESCRICAO_SEM_NUMERO AS ATIVIDADE_DESCRICAO,
       MTA.ATIVIDADE_DESCRICAO_SEM_NUMERO,
       (SELECT LISTAGG(V.VALOR_ATRIBUTO,', ') WITHIN GROUP (ORDER BY M.ORDEM)
          FROM TAREFA_TP_ATRIB_VALOR V
         INNER
          JOIN TAREFA_TIPO_PRODUTO T ON T.TAREFA_TIPO_PRODUTO_ID = V.TAREFA_TIPO_PRODUTO_ID
         INNER
          JOIN METADADO M ON M.METADADO_ID = V.METADADO_ID
         WHERE M.FLAG_NA_LISTA = 'S'
           AND T.TAREFA_ID = MTA.OBJETO_ID) AS ATIVIDADE_METADADOS,
       util_pkg.desc_retornar('status_tarefa',MTA.status) AS STATUS,
       MTA.STATUS_CODIGO,
       MTA.PRAZO,
       DATA_MOSTRAR(MTA.PRAZO) AS PRAZO_FMT,
       CASE
          WHEN MTA.PRAZO <= SYSDATE THEN 'vermelho'
          WHEN MTA.PRAZO > SYSDATE AND MTA.PRAZO < TRUNC(SYSDATE+1) THEN 'amarelo'
          ELSE 'branco'
       END AS PRAZO_COR,
       NULL AS PRAZO_INTERNO,
       NULL AS PRAZO_INTERNO_FMT,
       'branco' AS PRAZO_INTERNO_COR,
       NVL((SELECT LISTAGG(NOME,', ') WITHIN GROUP (ORDER BY NOME)
              FROM (SELECT DISTINCT E.NOME
                      FROM EQUIPE E
                     INNER
                      JOIN EQUIPE_USUARIO X ON X.EQUIPE_ID = E.EQUIPE_ID
                     INNER
                      JOIN TAREFA_USUARIO I ON (X.USUARIO_ID = I.USUARIO_PARA_ID OR X.USUARIO_ID = MTA.SOLICITANTE_ID)
                     WHERE I.TAREFA_ID = MTA.OBJETO_ID
                       AND E.EMPRESA_ID = MTA.EMPRESA_ID
                       AND X.USUARIO_ID = ET.USUARIO_ID
                       AND X.FLAG_MEMBRO = 'S')),'-') AS EQUIPE,
       NVL((SELECT LISTAGG(EQUIPE_ID,', ') WITHIN GROUP (ORDER BY NOME)
              FROM (SELECT DISTINCT E.EQUIPE_ID, E.NOME
                      FROM EQUIPE E
                     INNER
                      JOIN EQUIPE_USUARIO X ON X.EQUIPE_ID = E.EQUIPE_ID
                     INNER
                      JOIN TAREFA_USUARIO I ON (X.USUARIO_ID = I.USUARIO_PARA_ID OR X.USUARIO_ID = MTA.SOLICITANTE_ID)
                     WHERE I.TAREFA_ID  = MTA.OBJETO_ID
                       AND E.EMPRESA_ID = MTA.EMPRESA_ID
                       AND X.USUARIO_ID = ET.USUARIO_ID
                       AND X.FLAG_MEMBRO = 'S')),'-') AS EQUIPE_ID,
       ET.USUARIO_ID AS EXECUTOR_ID,
       ET.EXECUTOR_COR,
       NVL(MTA.COMENT_STATUS,'-') AS COMENT_STATUS,
       NVL((SELECT P.APELIDO
              FROM PESSOA P
             WHERE P.USUARIO_ID = MTA.USUARIO_SITUACAO_ID),'-') AS COMENT_STATUS_AUTOR,
       MTA.COMENT_STATUS_DATA AS COMENT_STATUS_DATA,
       DATA_MOSTRAR(MTA.COMENT_STATUS_DATA_FMT) AS COMENT_STATUS_DATA_FMT,
       MTA.DATA_CONCLUSAO AS DATA_CONCLUSAO,
       NULL AS DATA_ALOC_USUARIO,
       NULL AS ASINICIAR_SOMENTE_EM,
       NULL AS DATA_INICIO_ND,
       '-' AS REFACAO
  FROM MV_TAREFA MTA,
       (SELECT DISTINCT
               MU.USUARIO_ID,
               TA.TAREFA_ID,
               DECODE(TU.STATUS, 'EXEC', 'cinza', 'branco') AS EXECUTOR_COR
          FROM MV_USUARIO     MU,
               TAREFA_USUARIO TU,
               TAREFA         TA
        WHERE (MU.USUARIO_ID  = TU.USUARIO_PARA_ID OR (MU.USUARIO_ID = TA.USUARIO_DE_ID AND TA.STATUS = 'EXEC'))
          AND TU.TAREFA_ID    = TA.TAREFA_ID) ET
 WHERE MTA.OBJETO_ID = ET.TAREFA_ID
;
--------------------------------------------------------
--  DDL for View V_PESSOAS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_PESSOAS" ("EMPRESA_ID", "PESSOA_ID", "USUARIO_ID", "APELIDO", "NOME", "GRUPO_CLIENTE", "TIPO_PESSOA", "PUBLICO_PRIVADO", "CONTATO", "CONTATO_DE", "POSSUI_DOCUMENTO", "SEXO", "DATA_NASCIMENTO", "ESTADO_CIVIL", "CARGO", "PRODUTO_CLIENTE", "CODIGO_EXTERNO_PESSOA", "PESSOA", "SIMPLES_NACIONAL", "CPOM", "CNPJ", "CPF", "INSCRICAO_ESTADUAL", "INSCRICAO_MUNICIPAL", "INSCRICAO_INSS", "RG", "DIAS_FATURAMENTO", "PAGTO_CLIENTE", "CODIGO_PROJETO", "NUMERO_PRIMEIRO_PROJETO", "DATA_ENTRADA_AGENCIA", "EMPRESA_PROJETO_PADRAO", "EMPRESA_FATURAMENTO_PADRAO", "SETOR", "BV_PADRAO", "IMPOSTO_FORNECEDOR", "NIVEL_EXCELENCIA", "NIVEL_PARCERIA", "FORNECEDOR_HOMOLOGADO", "SERVICOS", "FORNECEDOR_INTERNO", "PESSOA_ATIVA", "EMPRESA_RESPONSAVEL_PROJETO", "CODIGO_EXTERNO_EMPRESA_RESP", "EMPRESA_UTILIZADA_FATURAMENTO", "CODIGO_EXTERNO_EMPRESA_FATUR", "BANCO", "NUMERO_AGENCIA", "NUMERO_CONTA", "TIPO_CONTA", "DOC_DADOS_BANCARIOS", "TITULAR", "ENDERECO", "CIDADE", "UF", "CEP", "PAIS", "DDD_TELEFONE", "NUM_TELEFONE", "RAMAL", "FAX", "DDD_CELULAR", "NUM_CELULAR", "EMAIL", "URL", "CADASTRO_VERIFICADO", "INFO_FISCAL_VERIFICADA", "OBSERVACAO", "FLAG_ADMIN", "FLAG_ADMIN_SISTEMA") AS 
  SELECT pe.empresa_id                                                      AS empresa_id,
       pe.pessoa_id                                                       AS pessoa_id,
       pe.usuario_id                                                      AS usuario_id,
       pe.Apelido                                                         AS apelido,
       pe.Nome                                                            AS nome,
       (SELECT LISTAGG(gr.nome, ', ') WITHIN GROUP (ORDER BY gr.nome)
          FROM grupo gr
         INNER
          JOIN grupo_pessoa gp ON  gp.grupo_id  = gr.grupo_id
                               AND gp.pessoa_id = pe.pessoa_id
         WHERE gr.empresa_id = pe.empresa_id)                             AS grupo_cliente,
       (SELECT LISTAGG(tp.nome, ', ') WITHIN GROUP (ORDER BY tp.nome)
          FROM tipo_pessoa tp
         INNER
          JOIN tipific_pessoa ip ON  tp.tipo_pessoa_id = ip.tipo_pessoa_id
                                 AND ip.pessoa_id = pe.pessoa_id)         AS tipo_pessoa,
       DECODE(pe.Tipo_Publ_Priv, 'PRIV', 'Privado', 'PUBL', 'Público')    AS publico_privado,
       CASE
          WHEN (SELECT COUNT(1)
                  FROM pessoa p,
                       relacao r
                 WHERE r.pessoa_filho_id = pe.pessoa_id
                   AND p.empresa_id      = pe.empresa_id
                   AND r.pessoa_pai_id   = p.pessoa_id
                   AND p.flag_ativo      = 'S') = 0 THEN 'N'
          ELSE 'S'
       END contato,
       (SELECT LISTAGG(p.apelido, ', ') WITHIN GROUP (ORDER BY p.apelido)
          FROM pessoa p,
               relacao r
         WHERE r.pessoa_filho_id = pe.pessoa_id
           AND p.empresa_id      = pe.empresa_id
           AND r.pessoa_pai_id   = p.pessoa_id
           AND p.flag_ativo      = 'S')                                   AS contato_de,
       pe.flag_sem_docum                                                  AS possui_documento,
       pe.sexo                                                            AS sexo,
       pe.data_nasc                                                       AS data_nascimento,
       pe.estado_civil                                                    AS estado_civil,
       pe.funcao                                                          AS cargo,
       (SELECT LISTAGG(pc.nome, ', ' ON OVERFLOW TRUNCATE) WITHIN GROUP (ORDER BY pc.nome)
          FROM produto_cliente pc
         WHERE pc.pessoa_id = pe.pessoa_id)                               AS produto_cliente,
       pe.cod_ext_pessoa                                                  AS codigo_externo_pessoa,
       pe.flag_pessoa_jur                                                 AS pessoa,
       pe.flag_simples                                                    AS simples_nacional,
       pe.flag_cpom                                                       AS cpom,
       pe.cnpj                                                            AS cnpj,
       pe.cpf                                                             AS cpf,
       pe.inscr_estadual                                                  AS inscricao_estadual,
       pe.inscr_municipal                                                 AS inscricao_municipal,
       pe.inscr_inss                                                      AS inscricao_inss,
       pe.rg                                                              AS rg,
       pe.num_dias_fatur                                                  AS dias_faturamento,
       pe.flag_pago_cliente                                               AS pagto_cliente,
       pe.cod_job                                                         AS codigo_projeto,
       pe.num_primeiro_job                                                AS numero_primeiro_projeto,
       pe.data_entrada_agencia                                            AS data_entrada_agencia,
       (SELECT e.apelido
          FROM pessoa e
         WHERE e.pessoa_id  = pe.emp_resp_pdr_id)                        AS empresa_projeto_padrao,
       (SELECT e.apelido
          FROM pessoa e
         WHERE e.pessoa_id = pe.emp_fatur_pdr_id)                        AS empresa_faturamento_padrao,
       (SELECT s.nome
          FROM setor s
         WHERE s.setor_id   = pe.setor_id
           AND s.empresa_id = pe.empresa_id)                              AS setor,
       pe.perc_bv AS bv_padrao,
       pe.perc_imposto                                                    AS imposto_fornecedor, -- Imposto do Fornecedor,
       (SELECT ROUND(NVL(AVG(nota),0),1)
          FROM aval_fornec af
         WHERE af.pessoa_id = pe.pessoa_id
           AND af.tipo_aval = 'EXC')                                      AS nivel_excelencia,
       (SELECT ROUND(NVL(AVG(nota),0),1)
          FROM aval_fornec af
         WHERE af.pessoa_id = pe.pessoa_id
           AND af.tipo_aval = 'PAR')                                      AS nivel_parceria,
       pe.flag_fornec_homolog                                             AS fornecedor_homologado, --Fornecedor Homologado (S/N),
       pe.desc_servicos                                                   AS servicos, --Serviços,
       pe.flag_fornec_interno                                             AS fornecedor_interno, --Fornecedor Interno (S/N),
       pe.flag_ativo                                                      AS pessoa_ativa, --Pessoa Ativa (S/N),
       pe.flag_emp_resp                                                   AS empresa_responsavel_projeto, --Empresa Responsável pelo Projeto (S/N),
       (SELECT e.cod_ext_empresa
          FROM empresa e
         WHERE e.empresa_id = pe.emp_resp_pdr_id)                         AS codigo_externo_empresa_resp,
       pe.flag_emp_fatur                                                  AS empresa_utilizada_faturamento, --Empresa Utilizada no Faturamento (S/N),
       (SELECT e.cod_ext_empresa
          FROM empresa e
         WHERE e.empresa_id = pe.emp_fatur_pdr_id)                        AS codigo_externo_empresa_fatur,
       (SELECT bc.nome
          FROM fi_banco bc
         WHERE bc.fi_banco_id = pe.fi_banco_id)                           AS banco,
       pe.num_agencia                                                     AS numero_agencia,
       pe.num_conta                                                       AS numero_conta,
       pe.tipo_conta                                                      AS tipo_conta,
       pe.cnpj_cpf_titular                                                AS doc_dados_bancarios, --CPF/CNPJ dos Dados Bancários,
       pe.nome_titular                                                    AS titular, --Titular,
       pe.endereco || ' ' || pe.num_ender || ' ' || pe.compl_ender || ' ' || pe.zona || ' ' || pe.bairro AS endereco,
       pe.cidade                                                          AS cidade,
       pe.uf                                                              AS uf,
       pe.cep                                                             AS cep,
       pe.pais                                                            AS pais,
       pe.ddd_telefone                                                    AS ddd_telefone,
       pe.num_telefone                                                    AS num_telefone,
       pe.num_ramal                                                       AS ramal,
       pe.ddd_fax || pe.num_fax                                           AS fax,
       pe.ddd_celular                                                     AS ddd_celular,
       pe.num_celular                                                     AS num_celular,
       pe.email                                                           AS email,
       pe.website                                                         AS url,
       pe.flag_cad_verif                                                  AS cadastro_verificado,
       pe.flag_fis_verif                                                  AS info_fiscal_verificada,
       pe.obs                                                             AS observacao,
       (SELECT us.flag_admin
          FROM usuario us
         WHERE pe.usuario_id = us.usuario_id)                             AS flag_admin,
       (SELECT us.flag_admin_sistema
          FROM usuario us
         WHERE pe.usuario_id = us.usuario_id)                             AS flag_admin_sistema
FROM PESSOA pe
;
--------------------------------------------------------
--  DDL for View V_PESSOA_TIPO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_PESSOA_TIPO" ("PESSOA_ID", "APELIDO_PESSOA", "NOME_PESSOA", "FLAG_ATIVO", "COD_TIPO_PESSOA", "APELIDO_PESSOA_PAI") AS 
  SELECT
-----------------------------------------------------------------------
-- lista os varios tipos de cada pessoa (pessoas sem tipificacao nao
--   aparecem nessa view).
-----------------------------------------------------------------------
       p.pessoa_id,
       p.apelido,
       p.nome,
       p.flag_ativo,
       t.codigo,
       pessoa_pkg.pai_retornar(p.pessoa_id,'AP')
  FROM pessoa p,
       tipific_pessoa tp,
       tipo_pessoa t
 WHERE p.pessoa_id = tp.pessoa_id
   AND tp.tipo_pessoa_id = t.tipo_pessoa_id
;
--------------------------------------------------------
--  DDL for View V_STATUS_JOB
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_STATUS_JOB" ("CODIGO", "DESCRICAO", "ORDEM") AS 
  SELECT
-----------------------------------------------------------------------
-- lista dados do dicionario: status do job
-----------------------------------------------------------------------
       codigo,
       descricao,
       ordem
  FROM dicionario
 WHERE tipo = 'status_job'
;
--------------------------------------------------------
--  DDL for View V_TAREFA_EQUIPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_TAREFA_EQUIPE" ("EQUIPE_ID", "EQUIPE", "TAREFA_ID") AS 
  SELECT DISTINCT
        eq.equipe_id,
        eq.nome as equipe,
        ta.tarefa_id
   FROM equipe eq,
        equipe_usuario eu,
        tarefa_usuario tu,
        tarefa ta
  WHERE eq.equipe_id = eu.equipe_id
    AND (eu.usuario_id = tu.usuario_para_id OR eu.usuario_id = ta.usuario_de_id)
    AND eu.flag_membro = 'S'
    AND tu.tarefa_id = ta.tarefa_id
    AND ta.empresa_id = eq.empresa_id
;
--------------------------------------------------------
--  DDL for View V_TIMELINE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_TIMELINE" ("STATUS_ALOCACAO", "APELIDO", "USUARIO_ID", "FUNCAO", "ATIVO_DESC", "NOME_ATIVIDADE", "DATA_INI_FMT", "DATA_FIM_FMT", "DATA_INI", "DATA_FIM", "NV_M", "PRE_M", "NOME_FISICO_M", "TIPO_ATIVIDADE", "COD_OBJETO", "FLAG_PLANEJADO", "ITEM_ID", "OBJETO_ID", "FLAG_OS_APROV_AUTO", "TIPO_APONTAM_ID", "JOB_ID", "NOME_JOB", "NUMERO_JOB", "NOME_CLIENTE", "OBS", "NOME_CARGO", "EQUIPE_ID", "STATUS", "CODIGO_STATUS", "FLAG_RECUSADA", "FLAG_ATRASADO") AS 
  WITH ausente AS
 (SELECT /*+ first_rows (1) */
   'AUSENTE' AS status_alocacao,
   pe.apelido,
   pe.usuario_id,
   us.funcao,
   decode(us.flag_ativo,
          'S',
          'Ativo',
          'N',
          'Inativo') AS ativo_desc,
   ta.nome AS nome_atividade,
   data_hora_mostrar(ap.data_ini) AS data_ini_fmt,
   data_hora_mostrar(ap.data_fim) AS data_fim_fmt,
   ap.data_ini AS data_ini,
   ap.data_fim AS data_fim,
   nvl(vo_m.numero, 0) AS nv_m,
   nvl(vo_m.prefixo, 0) AS pre_m,
   nvl(ar_m.nome_fisico, 0) AS nome_fisico_m,
   'AUS' AS tipo_atividade,
   '' AS cod_objeto,
   '' AS flag_planejado,
   ap.apontam_progr_id AS item_id,
   ap.apontam_progr_id AS objeto_id,
   ap.flag_os_aprov_auto AS flag_os_aprov_auto,
   ap.tipo_apontam_id AS tipo_apontam_id,
   0 AS job_id,
   '' AS nome_job,
   '' AS numero_job,
   '' AS nome_cliente,
   ap.obs AS obs,
   ca.nome AS nome_cargo,
   eu.equipe_id,
   '' AS status,
   '' AS codigo_status,
   'N' AS flag_recusada,
   'N' AS flag_atrasado/*,
   (SELECT listagg(to_char(nvl(h.horas, 0),
                           '999990D99'),
                   ', ') within GROUP(ORDER BY v.data) AS horas
      FROM (SELECT (trunc(ap.data_fim) - LEVEL + 1) AS data
              FROM dual
            CONNECT BY LEVEL <=
                       (trunc(ap.data_fim) -
                       trunc(ap.data_ini) + 1)) v
     INNER JOIN apontam_data d
        ON d.data = v.data
       AND d.usuario_id = ap.usuario_id
     INNER JOIN apontam_hora h
        ON h.apontam_data_id = d.apontam_data_id
     INNER JOIN tipo_apontam t
        ON t.tipo_apontam_id = h.tipo_apontam_id
       AND t.flag_ausencia = 'S') AS horas_fmt*/
    FROM pessoa pe
   INNER JOIN usuario us
      ON us.usuario_id = pe.usuario_id
   INNER JOIN apontam_progr ap
      ON ap.usuario_id = pe.usuario_id
   INNER JOIN tipo_apontam ta
      ON ta.tipo_apontam_id = ap.tipo_apontam_id
   INNER JOIN cargo ca
      ON ca.cargo_id =
         cargo_pkg.do_usuario_retornar(pe.usuario_id,
                                       SYSDATE)
   INNER JOIN equipe_usuario eu
      ON eu.usuario_id = pe.usuario_id
    LEFT JOIN arquivo_pessoa ap_m
      ON ap_m.pessoa_id = pe.pessoa_id
     AND ap_m.tipo_thumb = 'M'
     AND ap_m.tipo_arq_pessoa = 'FOTO_USU'
    LEFT JOIN arquivo ar_m
      ON ar_m.arquivo_id = ap_m.arquivo_id
    LEFT JOIN volume vo_m
      ON vo_m.volume_id = ar_m.volume_id
   WHERE ta.flag_ausencia = 'S'
     AND eu.flag_membro = 'S'
     AND (trunc(ap.data_ini) >= trunc(add_months(SYSDATE, -1), 'mm') OR
         trunc(ap.data_fim) <= trunc(last_day(add_months(SYSDATE, 2))))),
reservado AS
 (
  --Reserva no Cronograma
  SELECT /*+ first_rows (1) */
   'RESERVADO' AS status_alocacao,
    pe.apelido,
    pe.usuario_id,
    us.funcao,
    decode(us.flag_ativo,
           'S',
           'Ativo',
           'N',
           'Inativo') AS ativo_desc,
    ic.nome AS nome_atividade,
    data_hora_mostrar(ic.data_planej_ini) AS data_ini_fmt,
    data_hora_mostrar(ic.data_planej_fim) AS data_fim_fmt,
    ic.data_planej_ini AS data_ini,
    ic.data_planej_fim AS data_fim,
    nvl(vo_m.numero, 0) AS nv_m,
    nvl(vo_m.prefixo, 0) AS pre_m,
    nvl(ar_m.nome_fisico, 0) AS nome_fisico_m,
    'RES' AS tipo_atividade,
    ic.cod_objeto AS cod_objeto,
    ic.flag_planejado AS flag_planejado,
    ic.item_crono_id AS item_id,
    ic.item_crono_id AS objeto_id,
    '' AS flag_os_aprov_auto,
    0 AS tipo_apontam_id,
    cr.job_id AS job_id,
    jo.nome AS nome_job,
    jo.numero AS numero_job,
    cl.apelido AS nome_cliente,
    ic.obs AS obs,
    ca.nome AS nome_cargo,
    eu.equipe_id,
    '' AS status,
    '' AS codigo_status,
    'N' AS flag_recusada,
    'N' AS flag_atrasado/*,
    (SELECT listagg(to_char(icu2.horas_diarias,
                            '999990D99') || '/' ||
                    ltrim(to_char(icu2.horas_totais,
                                  '999990D99')))
       FROM item_crono     ic2,
            item_crono_usu icu2
      WHERE ic2.item_crono_id = icu2.item_crono_id
        AND icu2.usuario_id = pe.usuario_id
        AND ic2.item_crono_id = ic.item_crono_id) horas_fmt*/
    FROM pessoa pe
   INNER JOIN usuario us
      ON us.usuario_id = pe.usuario_id
   INNER JOIN item_crono_usu icu
      ON icu.usuario_id = pe.usuario_id
   INNER JOIN item_crono ic
      ON ic.item_crono_id = icu.item_crono_id
   INNER JOIN cronograma cr
      ON cr.cronograma_id = ic.cronograma_id
   INNER JOIN job jo
      ON jo.job_id = cr.job_id
   INNER JOIN pessoa cl
      ON cl.pessoa_id = jo.cliente_id
   INNER JOIN cargo ca
      ON ca.cargo_id =
         cargo_pkg.do_usuario_retornar(pe.usuario_id,
                                       SYSDATE)
   INNER JOIN equipe_usuario eu
      ON eu.usuario_id = pe.usuario_id
    LEFT JOIN arquivo_pessoa ap_m
      ON ap_m.pessoa_id = pe.pessoa_id
     AND ap_m.tipo_thumb = 'M'
     AND ap_m.tipo_arq_pessoa = 'FOTO_USU'
    LEFT JOIN arquivo ar_m
      ON ar_m.arquivo_id = ap_m.arquivo_id
    LEFT JOIN volume vo_m
      ON vo_m.volume_id = ar_m.volume_id
   WHERE ic.objeto_id IS NULL
     AND ic.data_planej_ini IS NOT NULL
     AND ic.data_planej_fim IS NOT NULL
     AND eu.flag_membro = 'S'
     AND (trunc(ic.data_planej_ini) >= trunc(add_months(SYSDATE, -1), 'mm') OR
         trunc(ic.data_planej_fim) <=trunc(last_day(add_months(SYSDATE, 2))))),
os AS
 (
  -- Alocacao em ordem_servico
  SELECT /*+ first_rows (1) */
   CASE
      WHEN os.status = 'PREP' THEN
       'PRE-ALOCADO'
      WHEN os.status = 'STAN' THEN
       'PRE-ALOCADO'
      WHEN os.status = 'DIST' AND os.qtd_refacao > 0 THEN
       'PRE-ALOCADO'
      WHEN os.status = 'DIST' THEN
       'PRE-ALOCADO'
      WHEN os.status = 'ACEI' THEN
       'ALOCADO'
      WHEN os.status = 'EMEX' THEN
       'ALOCADO'
      WHEN os.status = 'AVAL' THEN
       'CONCLUIDO'
      WHEN os.status = 'EXEC' THEN
       'CONCLUIDO'
      WHEN os.status = 'EMAP' THEN
       'CONCLUIDO'
      WHEN os.status = 'CONC' THEN
       'CONCLUIDO'
    END AS status_alocacao,
    pe.apelido,
    pe.usuario_id,
    us.funcao,
    decode(us.flag_ativo,
           'S',
           'Ativo',
           'N',
           'Inativo') AS ativo_desc,
    ic.nome AS nome_atividade,
    data_hora_mostrar(ou.data_inicio) AS data_ini_fmt,
    data_hora_mostrar(ou.data_termino) AS data_fim_fmt,
    ou.data_inicio AS data_ini,
    ou.data_termino AS data_fim,
    nvl(vo_m.numero, 0) AS nv_m,
    nvl(vo_m.prefixo, 0) AS pre_m,
    nvl(ar_m.nome_fisico, 0) AS nome_fisico_m,
    'ALO' AS tipo_atividade,
    ic.cod_objeto AS cod_objeto,
    ic.flag_planejado AS flag_planejado,
    ic.item_crono_id AS item_id,
    ic.objeto_id AS objeto_id,
    '' AS flag_os_aprov_auto,
    0 AS tipo_apontam_id,
    cr.job_id AS job_id,
    jo.nome AS nome_job,
    jo.numero AS numero_job,
    cl.apelido AS nome_cliente,
    ic.obs AS obs,
    ca.nome AS nome_cargo,
    eu.equipe_id,
    st.descricao AS status,
    os.status AS codigo_status,
    os.flag_recusada AS flag_recusada,
    CASE
      WHEN os.data_interna < SYSDATE THEN
       'AT'
      ELSE
       'NN'
    END AS flag_atrasado/*,
       (select listagg(to_char(oud.data,'dd') || '|' || oud.horas, ', ' ON OVERFLOW TRUNCATE '* Mais registros *')
       WITHIN GROUP (ORDER BY oud.data)
       FROM os_usuario_data oud,
            ordem_servico   os2,
            item_crono      ic2
      WHERE oud.ordem_servico_id =
            os2.ordem_servico_id
        AND os2.ordem_servico_id = ic2.objeto_id
        AND ic2.cod_objeto LIKE 'ORDEM_SERVICO'
        AND ic2.objeto_id = ic.objeto_id
        AND os2.job_id = cr.job_id
        AND oud.usuario_id = pe.usuario_id
        AND oud.data <= data_converter(sysdate)
        AND oud.data >= data_converter(sysdate)) as horas_fmt*/
    FROM pessoa pe
   INNER JOIN usuario us
      ON us.usuario_id = pe.usuario_id
   INNER JOIN (SELECT MIN(ou1.data) AS data_inicio,
                      MAX(ou1.data) AS data_termino,
                      os1.data_execucao,
                      ou1.ordem_servico_id,
                      ou1.usuario_id
                 FROM os_usuario_data ou1,
                      ordem_servico   os1
                WHERE os1.ordem_servico_id =
                      ou1.ordem_servico_id
                GROUP BY os1.data_execucao,
                         ou1.ordem_servico_id,
                         ou1.usuario_id) ou
      ON ou.usuario_id = us.usuario_id
   INNER JOIN item_crono ic
      ON ic.objeto_id = ou.ordem_servico_id
     AND ic.cod_objeto = 'ORDEM_SERVICO'
   INNER JOIN cronograma cr
      ON cr.cronograma_id = ic.cronograma_id
     AND cr.cronograma_id =
         cronograma_pkg.ultimo_retornar(cr.job_id)
   INNER JOIN ordem_servico os
      ON os.ordem_servico_id = ic.objeto_id
   INNER JOIN dicionario st
      ON st.tipo = 'status_os'
     AND st.codigo = os.status
   INNER JOIN job jo
      ON jo.job_id = cr.job_id
   INNER JOIN pessoa cl
      ON cl.pessoa_id = jo.cliente_id
   INNER JOIN cargo ca
      ON ca.cargo_id =
         cargo_pkg.do_usuario_retornar(pe.usuario_id,
                                       SYSDATE)
   INNER JOIN equipe_usuario eu
      ON eu.usuario_id = pe.usuario_id
    LEFT JOIN arquivo_pessoa ap_m
      ON ap_m.pessoa_id = pe.pessoa_id
     AND ap_m.tipo_thumb = 'M'
     AND ap_m.tipo_arq_pessoa = 'FOTO_USU'
    LEFT JOIN arquivo ar_m
      ON ar_m.arquivo_id = ap_m.arquivo_id
    LEFT JOIN volume vo_m
      ON vo_m.volume_id = ar_m.volume_id
      WHERE eu.flag_membro = 'S'
      /*AND (TRUNC(ou.data_inicio) >= to_date(trunc(sysdate,'YYYY')- interval '1' year)
      or TRUNC(ou.data_termino) <= to_date(trunc(sysdate,'YYYY')+ interval '1' year))*/
      --AND TRUNC(ou.data_inicio) >= to_date(trunc(sysdate,'YYYY') - interval '1' year)
      --AND TRUNC(ou.data_termino) <= to_date(trunc(sysdate,'YYYY')+ interval '1' year)
      ),
task AS
 (
  -- Alocacao em tarefa
  SELECT /*+ first_rows (1) */
   CASE ta.status
      WHEN 'EMEX' THEN
       'ALOCADO'
      WHEN 'EXEC' THEN
       'CONCLUIDO'
      WHEN 'CONC' THEN
       'CONCLUIDO'
    END AS status_alocacao,
    pe.apelido,
    pe.usuario_id,
    us.funcao,
    decode(us.flag_ativo,
           'S',
           'Ativo',
           'N',
           'Inativo') AS ativo_desc,
    ic.nome AS nome_atividade,
    data_hora_mostrar(ou.data_inicio) AS data_ini_fmt,
    data_hora_mostrar(ou.data_termino) AS data_fim_fmt,
    ou.data_inicio AS data_ini,
    ou.data_termino AS data_fim,
    nvl(vo_m.numero, 0) AS nv_m,
    nvl(vo_m.prefixo, 0) AS pre_m,
    nvl(ar_m.nome_fisico, 0) AS nome_fisico_m,
    'ALO' AS tipo_atividade,
    ic.cod_objeto AS cod_objeto,
    ic.flag_planejado AS flag_planejado,
    ic.item_crono_id AS item_id,
    ic.objeto_id AS objeto_id,
    '' AS flag_os_aprov_auto,
    0 AS tipo_apontam_id,
    jo.job_id AS job_id,
    jo.nome AS nome_job,
    jo.numero AS numero_job,
    cl.apelido AS nome_cliente,
    ic.obs AS obs,
    ca.nome AS nome_cargo,
    eu.equipe_id,
    st.descricao AS status,
    ta.status AS codigo_status,
    CASE
      WHEN ta.status = 'RECU' THEN
       'S'
      ELSE
       'N'
    END AS flag_recusada,
    CASE
      WHEN ta.data_termino < SYSDATE THEN
       'AT'
      ELSE
       'NN'
    END AS flag_atrasado/*,
    (select listagg(to_char(tud.data,'dd') || '|' || tud.horas, ', ' ON OVERFLOW TRUNCATE '* Mais registros *')
    WITHIN GROUP (ORDER BY tud.data)
       FROM tarefa_usuario      tu,
            tarefa_usuario_data tud
      WHERE tu.usuario_para_id = tud.usuario_para_id
        AND tu.usuario_para_id = us.usuario_id
        AND tu.tarefa_id = ta.tarefa_id
        AND tud.usuario_para_id = us.usuario_id
        AND tud.tarefa_id = ta.tarefa_id
        AND tud.data <= data_converter(sysdate)
        AND tud.data >= data_converter(sysdate)) as horas_fmt*/
    FROM pessoa pe
   INNER JOIN usuario us
      ON us.usuario_id = pe.usuario_id
   INNER JOIN (SELECT MIN(ou.data) AS data_inicio,
                      MAX(ou.data) AS data_termino,
                      ta.data_execucao,
                      ou.tarefa_id,
                      ou.usuario_para_id
                 FROM tarefa_usuario_data ou,
                      tarefa              ta
                WHERE ta.tarefa_id = ou.tarefa_id
                GROUP BY ta.data_execucao,
                         ou.tarefa_id,
                         ou.usuario_para_id) ou
      ON ou.usuario_para_id = us.usuario_id
   INNER JOIN item_crono ic
      ON ic.objeto_id = ou.tarefa_id
     AND ic.cod_objeto = 'TAREFA'
   INNER JOIN tarefa ta
      ON ta.tarefa_id = ic.objeto_id
   INNER JOIN dicionario st
      ON st.tipo = 'status_tarefa'
     AND codigo = ta.status
   INNER JOIN cronograma cr
      ON cr.cronograma_id = ic.cronograma_id
     AND cr.cronograma_id =
         cronograma_pkg.ultimo_retornar(cr.job_id)
   INNER JOIN job jo
      ON jo.job_id = cr.job_id
   INNER JOIN pessoa cl
      ON cl.pessoa_id = jo.cliente_id
   INNER JOIN cargo ca
      ON ca.cargo_id =
         cargo_pkg.do_usuario_retornar(pe.usuario_id,
                                       SYSDATE)
   INNER JOIN equipe_usuario eu
      ON eu.usuario_id = pe.usuario_id
    LEFT JOIN arquivo_pessoa ap_m
      ON ap_m.pessoa_id = pe.pessoa_id
     AND ap_m.tipo_thumb = 'M'
     AND ap_m.tipo_arq_pessoa = 'FOTO_USU'
    LEFT JOIN arquivo ar_m
      ON ar_m.arquivo_id = ap_m.arquivo_id
    LEFT JOIN volume vo_m
      ON vo_m.volume_id = ar_m.volume_id
   WHERE eu.flag_membro = 'S'
     --AND ou.data_termino BETWEEN
     --trunc(add_months(SYSDATE, -1), 'mm') AND trunc(last_day(add_months(SYSDATE, 2))))
     --AND TRUNC(ou.data_inicio) >= to_date(trunc(sysdate,'YYYY') - interval '1' year))
     )
SELECT "STATUS_ALOCACAO","APELIDO","USUARIO_ID","FUNCAO","ATIVO_DESC","NOME_ATIVIDADE","DATA_INI_FMT","DATA_FIM_FMT","DATA_INI","DATA_FIM","NV_M","PRE_M","NOME_FISICO_M","TIPO_ATIVIDADE","COD_OBJETO","FLAG_PLANEJADO","ITEM_ID","OBJETO_ID","FLAG_OS_APROV_AUTO","TIPO_APONTAM_ID","JOB_ID","NOME_JOB","NUMERO_JOB","NOME_CLIENTE","OBS","NOME_CARGO","EQUIPE_ID","STATUS","CODIGO_STATUS","FLAG_RECUSADA","FLAG_ATRASADO"
  FROM ausente
UNION ALL
SELECT "STATUS_ALOCACAO","APELIDO","USUARIO_ID","FUNCAO","ATIVO_DESC","NOME_ATIVIDADE","DATA_INI_FMT","DATA_FIM_FMT","DATA_INI","DATA_FIM","NV_M","PRE_M","NOME_FISICO_M","TIPO_ATIVIDADE","COD_OBJETO","FLAG_PLANEJADO","ITEM_ID","OBJETO_ID","FLAG_OS_APROV_AUTO","TIPO_APONTAM_ID","JOB_ID","NOME_JOB","NUMERO_JOB","NOME_CLIENTE","OBS","NOME_CARGO","EQUIPE_ID","STATUS","CODIGO_STATUS","FLAG_RECUSADA","FLAG_ATRASADO"
  FROM reservado
UNION ALL
SELECT "STATUS_ALOCACAO","APELIDO","USUARIO_ID","FUNCAO","ATIVO_DESC","NOME_ATIVIDADE","DATA_INI_FMT","DATA_FIM_FMT","DATA_INI","DATA_FIM","NV_M","PRE_M","NOME_FISICO_M","TIPO_ATIVIDADE","COD_OBJETO","FLAG_PLANEJADO","ITEM_ID","OBJETO_ID","FLAG_OS_APROV_AUTO","TIPO_APONTAM_ID","JOB_ID","NOME_JOB","NUMERO_JOB","NOME_CLIENTE","OBS","NOME_CARGO","EQUIPE_ID","STATUS","CODIGO_STATUS","FLAG_RECUSADA","FLAG_ATRASADO"
  FROM os
UNION ALL
SELECT "STATUS_ALOCACAO","APELIDO","USUARIO_ID","FUNCAO","ATIVO_DESC","NOME_ATIVIDADE","DATA_INI_FMT","DATA_FIM_FMT","DATA_INI","DATA_FIM","NV_M","PRE_M","NOME_FISICO_M","TIPO_ATIVIDADE","COD_OBJETO","FLAG_PLANEJADO","ITEM_ID","OBJETO_ID","FLAG_OS_APROV_AUTO","TIPO_APONTAM_ID","JOB_ID","NOME_JOB","NUMERO_JOB","NOME_CLIENTE","OBS","NOME_CARGO","EQUIPE_ID","STATUS","CODIGO_STATUS","FLAG_RECUSADA","FLAG_ATRASADO"
  FROM task

;
--------------------------------------------------------
--  DDL for View V_TIMELINE_JOINS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_TIMELINE_JOINS" ("VOLUME_ID", "ARQUIVO_ID", "PESSOA_ID", "USUARIO_ID", "EMPRESA_ID", "FI_BANCO_ID", "EMP_FATUR_PDR_ID", "EMP_RESP_PDR_ID", "SETOR_ID", "APELIDO", "NOME", "FLAG_PESSOA_JUR", "CNPJ", "INSCR_ESTADUAL", "INSCR_MUNICIPAL", "INSCR_INSS", "CPF", "RG", "RG_ORG_EXP", "RG_DATA_EXP", "RG_UF", "FLAG_SEM_DOCUM", "SEXO", "DATA_NASC", "ESTADO_CIVIL", "FUNCAO", "ENDERECO", "NUM_ENDER", "COMPL_ENDER", "ZONA", "BAIRRO", "CEP", "CIDADE", "UF", "PAIS", "DDD_TELEFONE", "NUM_TELEFONE", "DDD_FAX", "NUM_FAX", "DDD_CELULAR", "NUM_CELULAR", "NUM_RAMAL", "WEBSITE", "EMAIL", "NUM_AGENCIA", "NUM_CONTA", "NOME_TITULAR", "CNPJ_CPF_TITULAR", "TIPO_CONTA", "OBS", "NUM_DIAS_FATUR", "TIPO_NUM_DIAS_FATUR", "PERC_BV", "TIPO_FATUR_BV", "PERC_IMPOSTO", "DESC_SERVICOS", "ATIVO_DESC", "FLAG_EMP_RESP", "FLAG_EMP_FATUR", "FLAG_EMP_SCP", "FLAG_EMP_INCENTIVO", "COD_EXT_PESSOA", "VALOR_FAIXA_RETENCAO", "FLAG_PAGO_CLIENTE", "FLAG_FORNEC_INTERNO", "FLAG_FORNEC_HOMOLOG", "LATITUDE", "LONGITUDE", "COD_JOB", "NUM_PRIMEIRO_JOB", "DATA_ENTRADA_AGENCIA", "FLAG_SIMPLES", "FLAG_CPOM", "TIPO_PUBL_PRIV", "USU_CAD_VERIF_ID", "USU_FIS_VERIF_ID", "FLAG_CAD_VERIF", "COMENT_CAD_VERIF", "DATA_CAD_VERIF", "FLAG_FIS_VERIF", "COMENT_FIS_VERIF", "DATA_FIS_VERIF", "STATUS_FIS_VERIF", "FLAG_CLI_APROV_OS", "FLAG_CLI_AVAL_OS", "TAB_FERIADO_ID", "DEPARTAMENTO_ID", "AREA_ID", "LOGIN", "QTD_LOGIN_INVALIDO", "FLAG_BLOQUEADO", "FLAG_ADMIN", "FLAG_EMAIL_BLOQ", "DATA_ULT_LOGIN", "FLAG_SEM_BLOQ_APONT", "FLAG_SEM_BLOQ_APROV", "FLAG_SEM_APROV_HORAS", "FLAG_PERMITE_HOME", "DATA_APONTAM_INI", "DATA_APONTAM_FIM", "MIN_HORAS_APONT_DIA", "FLAG_NOTIFICA_EMAIL", "DATA_INATIVACAO", "COD_EXT_USUARIO", "COD_HASH", "DATA_HASH", "COD_FUNCIONARIO", "CATEGORIA", "TIPO_RELACAO", "FLAG_ACESSO_PRI", "FLAG_ACESSO_CLI", "FLAG_ACESSO_WALL", "FLAG_SIMULA_CLI", "COD_HASH_WALLBOARD", "DATA_EXP_SENHA", "NUM_HORAS_PROD_DIA", "SENHA", "FLAG_ADMIN_SISTEMA", "EQUIPE_ID", "FLAG_MEMBRO", "FLAG_RESPONSAVEL", "FLAG_GUIDE", "TIPO_ARQ_PESSOA", "FLAG_THUMB", "CHAVE_THUMB", "TIPO_THUMB", "USUARIO_ALT_ID", "TIPO_ARQUIVO_ID", "DATA_CRIACAO", "NOME_ORIGINAL", "NOME_FISICO", "DESCRICAO", "MIME_TYPE", "TAMANHO", "PALAVRAS_CHAVE", "PALAVRAS_ARQUIVO", "SERVIDOR_ARQUIVO_ID", "PREFIXO", "NUMERO", "CAMINHO", "CARGO_ID", "NOME_CARGO", "ORDEM", "QTD_VAGAS_APROV", "FLAG_ALOC_USU_CTR") AS 
  with join_comum as
(
select 
VOLUME_ID,
ARQUIVO_ID,
PE.PESSOA_ID,
USUARIO_ID,
PE.EMPRESA_ID,
FI_BANCO_ID,
EMP_FATUR_PDR_ID,
EMP_RESP_PDR_ID,
SETOR_ID,
APELIDO,
PE.NOME,
FLAG_PESSOA_JUR,
CNPJ,
INSCR_ESTADUAL,
INSCR_MUNICIPAL,
INSCR_INSS,
CPF,
RG,
RG_ORG_EXP,
RG_DATA_EXP,
RG_UF,
FLAG_SEM_DOCUM,
SEXO,
DATA_NASC,
ESTADO_CIVIL,
US.FUNCAO,
ENDERECO,
NUM_ENDER,
COMPL_ENDER,
ZONA,
BAIRRO,
CEP,
CIDADE,
UF,
PAIS,
DDD_TELEFONE,
NUM_TELEFONE,
DDD_FAX,
NUM_FAX,
DDD_CELULAR,
NUM_CELULAR,
NUM_RAMAL,
WEBSITE,
EMAIL,
NUM_AGENCIA,
NUM_CONTA,
NOME_TITULAR,
CNPJ_CPF_TITULAR,
TIPO_CONTA,
OBS,
NUM_DIAS_FATUR,
TIPO_NUM_DIAS_FATUR,
PERC_BV,
TIPO_FATUR_BV,
PERC_IMPOSTO,
DESC_SERVICOS,
decode(
US.flag_ativo,
'S',
'Ativo',
'N',
'Inativo') AS ativo_desc,
FLAG_EMP_RESP,
FLAG_EMP_FATUR,
FLAG_EMP_SCP,
FLAG_EMP_INCENTIVO,
COD_EXT_PESSOA,
VALOR_FAIXA_RETENCAO,
FLAG_PAGO_CLIENTE,
FLAG_FORNEC_INTERNO,
FLAG_FORNEC_HOMOLOG,
LATITUDE,
LONGITUDE,
COD_JOB,
NUM_PRIMEIRO_JOB,
DATA_ENTRADA_AGENCIA,
FLAG_SIMPLES,
FLAG_CPOM,
TIPO_PUBL_PRIV,
USU_CAD_VERIF_ID,
USU_FIS_VERIF_ID,
FLAG_CAD_VERIF,
COMENT_CAD_VERIF,
DATA_CAD_VERIF,
FLAG_FIS_VERIF,
COMENT_FIS_VERIF,
DATA_FIS_VERIF,
STATUS_FIS_VERIF,
FLAG_CLI_APROV_OS,
FLAG_CLI_AVAL_OS,
TAB_FERIADO_ID,
DEPARTAMENTO_ID,
CA.AREA_ID,
LOGIN,
QTD_LOGIN_INVALIDO,
FLAG_BLOQUEADO,
FLAG_ADMIN,
FLAG_EMAIL_BLOQ,
DATA_ULT_LOGIN,
FLAG_SEM_BLOQ_APONT,
FLAG_SEM_BLOQ_APROV,
FLAG_SEM_APROV_HORAS,
FLAG_PERMITE_HOME,
DATA_APONTAM_INI,
DATA_APONTAM_FIM,
MIN_HORAS_APONT_DIA,
FLAG_NOTIFICA_EMAIL,
DATA_INATIVACAO,
COD_EXT_USUARIO,
COD_HASH,
DATA_HASH,
COD_FUNCIONARIO,
CATEGORIA,
TIPO_RELACAO,
FLAG_ACESSO_PRI,
FLAG_ACESSO_CLI,
FLAG_ACESSO_WALL,
FLAG_SIMULA_CLI,
COD_HASH_WALLBOARD,
DATA_EXP_SENHA,
NUM_HORAS_PROD_DIA,
SENHA,
FLAG_ADMIN_SISTEMA,
EQUIPE_ID,
FLAG_MEMBRO,
FLAG_RESPONSAVEL,
FLAG_GUIDE,
TIPO_ARQ_PESSOA,
FLAG_THUMB,
CHAVE_THUMB,
TIPO_THUMB,
USUARIO_ALT_ID,
TIPO_ARQUIVO_ID,
DATA_CRIACAO,
NOME_ORIGINAL,
NOME_FISICO,
DESCRICAO,
MIME_TYPE,
TAMANHO,
PALAVRAS_CHAVE,
PALAVRAS_ARQUIVO,
SERVIDOR_ARQUIVO_ID,
PREFIXO,
NUMERO,
CAMINHO,
CARGO_ID,
CA.NOME AS NOME_CARGO,
ORDEM,
QTD_VAGAS_APROV,
FLAG_ALOC_USU_CTR
FROM usuario us
INNER JOIN pessoa pe
USING(usuario_id)
INNER JOIN equipe_usuario eu
USING (usuario_id)
LEFT JOIN arquivo_pessoa ap_m
ON ap_m.pessoa_id = pe.pessoa_id
AND ap_m.tipo_thumb = 'M'
AND ap_m.tipo_arq_pessoa = 'FOTO_USU'
LEFT JOIN arquivo ar_m
USING (arquivo_id)
LEFT JOIN VOLUME vo_m
USING (volume_id)
INNER JOIN cargo ca
ON ca.cargo_id = cargo_pkg.do_usuario_retornar(usuario_id,sysdate)
)

select "VOLUME_ID","ARQUIVO_ID","PESSOA_ID","USUARIO_ID","EMPRESA_ID","FI_BANCO_ID","EMP_FATUR_PDR_ID","EMP_RESP_PDR_ID","SETOR_ID","APELIDO","NOME","FLAG_PESSOA_JUR","CNPJ","INSCR_ESTADUAL","INSCR_MUNICIPAL","INSCR_INSS","CPF","RG","RG_ORG_EXP","RG_DATA_EXP","RG_UF","FLAG_SEM_DOCUM","SEXO","DATA_NASC","ESTADO_CIVIL","FUNCAO","ENDERECO","NUM_ENDER","COMPL_ENDER","ZONA","BAIRRO","CEP","CIDADE","UF","PAIS","DDD_TELEFONE","NUM_TELEFONE","DDD_FAX","NUM_FAX","DDD_CELULAR","NUM_CELULAR","NUM_RAMAL","WEBSITE","EMAIL","NUM_AGENCIA","NUM_CONTA","NOME_TITULAR","CNPJ_CPF_TITULAR","TIPO_CONTA","OBS","NUM_DIAS_FATUR","TIPO_NUM_DIAS_FATUR","PERC_BV","TIPO_FATUR_BV","PERC_IMPOSTO","DESC_SERVICOS","ATIVO_DESC","FLAG_EMP_RESP","FLAG_EMP_FATUR","FLAG_EMP_SCP","FLAG_EMP_INCENTIVO","COD_EXT_PESSOA","VALOR_FAIXA_RETENCAO","FLAG_PAGO_CLIENTE","FLAG_FORNEC_INTERNO","FLAG_FORNEC_HOMOLOG","LATITUDE","LONGITUDE","COD_JOB","NUM_PRIMEIRO_JOB","DATA_ENTRADA_AGENCIA","FLAG_SIMPLES","FLAG_CPOM","TIPO_PUBL_PRIV","USU_CAD_VERIF_ID","USU_FIS_VERIF_ID","FLAG_CAD_VERIF","COMENT_CAD_VERIF","DATA_CAD_VERIF","FLAG_FIS_VERIF","COMENT_FIS_VERIF","DATA_FIS_VERIF","STATUS_FIS_VERIF","FLAG_CLI_APROV_OS","FLAG_CLI_AVAL_OS","TAB_FERIADO_ID","DEPARTAMENTO_ID","AREA_ID","LOGIN","QTD_LOGIN_INVALIDO","FLAG_BLOQUEADO","FLAG_ADMIN","FLAG_EMAIL_BLOQ","DATA_ULT_LOGIN","FLAG_SEM_BLOQ_APONT","FLAG_SEM_BLOQ_APROV","FLAG_SEM_APROV_HORAS","FLAG_PERMITE_HOME","DATA_APONTAM_INI","DATA_APONTAM_FIM","MIN_HORAS_APONT_DIA","FLAG_NOTIFICA_EMAIL","DATA_INATIVACAO","COD_EXT_USUARIO","COD_HASH","DATA_HASH","COD_FUNCIONARIO","CATEGORIA","TIPO_RELACAO","FLAG_ACESSO_PRI","FLAG_ACESSO_CLI","FLAG_ACESSO_WALL","FLAG_SIMULA_CLI","COD_HASH_WALLBOARD","DATA_EXP_SENHA","NUM_HORAS_PROD_DIA","SENHA","FLAG_ADMIN_SISTEMA","EQUIPE_ID","FLAG_MEMBRO","FLAG_RESPONSAVEL","FLAG_GUIDE","TIPO_ARQ_PESSOA","FLAG_THUMB","CHAVE_THUMB","TIPO_THUMB","USUARIO_ALT_ID","TIPO_ARQUIVO_ID","DATA_CRIACAO","NOME_ORIGINAL","NOME_FISICO","DESCRICAO","MIME_TYPE","TAMANHO","PALAVRAS_CHAVE","PALAVRAS_ARQUIVO","SERVIDOR_ARQUIVO_ID","PREFIXO","NUMERO","CAMINHO","CARGO_ID","NOME_CARGO","ORDEM","QTD_VAGAS_APROV","FLAG_ALOC_USU_CTR"
from join_comum
;
--------------------------------------------------------
--  DDL for View V_TIMELINE_JOIN_3
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_TIMELINE_JOIN_3" ("APELIDO", "JOB_ID", "CRONOGRAMA_ID", "ITEM_CRONO_ID", "ITEM_CRONO_PAI_ID", "COD_OBJETO", "OBJETO_ID", "FREQUENCIA_ID", "PAPEL_RESP_ID", "NUM_SEQ", "NOME", "DATA_PLANEJ_INI", "DATA_PLANEJ_FIM", "ORDEM", "NIVEL", "OPER", "FLAG_OBRIGATORIO", "TIPO_OBJETO_ID", "SUB_TIPO_OBJETO", "FLAG_ENVIAR", "NUM_VERSAO", "FLAG_PLANEJADO", "DURACAO_ORI", "DEMANDA", "REPET_GRUPO", "REPET_SEQ", "REPET_A_CADA", "REPET_TERM_TIPO", "REPET_TERM_OCOR", "DATA_TERM_REPET", "NUM_GANTT", "OBS", "USUARIO_SITUACAO_ID", "SITUACAO", "DATA_SITUACAO", "USUARIO_STATUS_ID", "NUMERO", "STATUS", "DATA_STATUS", "DATA_APROV_LIMITE", "DATA_CRIACAO", "FLAG_COM_APROV", "EMPRESA_ID", "CLIENTE_ID", "CONTATO_ID", "CONTATO_FATUR_ID", "TIPO_JOB_ID", "EMP_FATURAR_POR_ID", "PRODUTO_CLIENTE_ID", "TIPO_FINANCEIRO_ID", "EMP_RESP_ID", "USUARIO_SOLIC_ID", "CONTRATO_ID", "USU_STATUS_HORAS_ID", "USU_AUTOR_HORAS_ID", "STATUS_AUX_JOB_ID", "CAMPANHA_ID", "UNIDADE_NEGOCIO_ID", "CONTEXTO_CRONO_ID", "DESCRICAO", "DESCRICAO_CLIENTE", "DATA_ENTRADA", "DATA_PRI_APROV", "BUDGET", "RECEITA_PREVISTA", "FLAG_BUDGET_ND", "DATA_PREV_INI", "DATA_PREV_FIM", "TIPO_DATA_PREV", "PERC_BV", "FLAG_BV_FORNEC", "FLAG_PAGO_CLIENTE", "COD_EXT_JOB", "FLAG_CONCORRENCIA", "CONTRA_QUEM", "FLAG_CONC_PERDIDA", "PERDIDA_PARA", "MOTIVO_CANCEL", "STATUS_CHECKIN", "DATA_STATUS_CHECKIN", "STATUS_FATUR", "DATA_STATUS_FATUR", "VALOR_AJUSTE_FINAL", "FLAG_BLOQ_NEGOC", "CAMINHO_ARQ_EXTERNO", "DATA_APONT_INI", "DATA_APONT_FIM", "STATUS_HORAS", "DATA_STATUS_HORAS", "MOTIVO_STATUS_HORAS", "COMPL_STATUS_HORAS", "DATA_APROV_HORAS_LIMITE", "FLAG_COM_APROV_HORAS", "COMPLEX_JOB", "ESTRAT_JOB", "DATA_DIST_LIMITE", "TIPO_NUM_JOB", "FLAG_OBRIGA_DESC_HORAS", "FLAG_USA_BUDGET", "FLAG_USA_RECEITA_PREV", "FLAG_OBRIGA_CONTRATO", "FLAG_RESTRINGE_ALT_CRONO", "DATA_GOLIVE", "SERVICO_ID") AS 
  WITH join_3 AS (
SELECT 
C1.APELIDO,
JOB_ID,
CRONOGRAMA_ID,
ITEM_CRONO_ID,
ITEM_CRONO_PAI_ID,
COD_OBJETO,
OBJETO_ID,
FREQUENCIA_ID,
PAPEL_RESP_ID,
NUM_SEQ,
IC.NOME,
DATA_PLANEJ_INI,
DATA_PLANEJ_FIM,
ORDEM,
NIVEL,
OPER,
FLAG_OBRIGATORIO,
TIPO_OBJETO_ID,
SUB_TIPO_OBJETO,
FLAG_ENVIAR,
NUM_VERSAO,
FLAG_PLANEJADO,
DURACAO_ORI,
DEMANDA,
REPET_GRUPO,
REPET_SEQ,
REPET_A_CADA,
REPET_TERM_TIPO,
REPET_TERM_OCOR,
DATA_TERM_REPET,
NUM_GANTT,
IC.OBS,
USUARIO_SITUACAO_ID,
SITUACAO,
DATA_SITUACAO,
USUARIO_STATUS_ID,
CR.NUMERO,
CR.STATUS,
CR.DATA_STATUS,
DATA_APROV_LIMITE,
DATA_CRIACAO,
FLAG_COM_APROV,
JO.EMPRESA_ID,
JO.CLIENTE_ID,
CONTATO_ID,
CONTATO_FATUR_ID,
TIPO_JOB_ID,
EMP_FATURAR_POR_ID,
PRODUTO_CLIENTE_ID,
TIPO_FINANCEIRO_ID,
EMP_RESP_ID,
USUARIO_SOLIC_ID,
CONTRATO_ID,
USU_STATUS_HORAS_ID,
USU_AUTOR_HORAS_ID,
STATUS_AUX_JOB_ID,
CAMPANHA_ID,
UNIDADE_NEGOCIO_ID,
CONTEXTO_CRONO_ID,
DESCRICAO,
DESCRICAO_CLIENTE,
DATA_ENTRADA,
DATA_PRI_APROV,
BUDGET,
RECEITA_PREVISTA,
FLAG_BUDGET_ND,
DATA_PREV_INI,
DATA_PREV_FIM,
TIPO_DATA_PREV,
JO.PERC_BV,
FLAG_BV_FORNEC,
JO.FLAG_PAGO_CLIENTE,
COD_EXT_JOB,
FLAG_CONCORRENCIA,
CONTRA_QUEM,
FLAG_CONC_PERDIDA,
PERDIDA_PARA,
MOTIVO_CANCEL,
STATUS_CHECKIN,
DATA_STATUS_CHECKIN,
STATUS_FATUR,
DATA_STATUS_FATUR,
VALOR_AJUSTE_FINAL,
FLAG_BLOQ_NEGOC,
CAMINHO_ARQ_EXTERNO,
DATA_APONT_INI,
DATA_APONT_FIM,
STATUS_HORAS,
DATA_STATUS_HORAS,
MOTIVO_STATUS_HORAS,
COMPL_STATUS_HORAS,
DATA_APROV_HORAS_LIMITE,
FLAG_COM_APROV_HORAS,
COMPLEX_JOB,
ESTRAT_JOB,
DATA_DIST_LIMITE,
TIPO_NUM_JOB,
FLAG_OBRIGA_DESC_HORAS,
FLAG_USA_BUDGET,
FLAG_USA_RECEITA_PREV,
FLAG_OBRIGA_CONTRATO,
FLAG_RESTRINGE_ALT_CRONO,
DATA_GOLIVE,
SERVICO_ID
FROM
item_crono ic 
INNER JOIN cronograma cr
USING (cronograma_id)
INNER JOIN JOB jo
USING (job_id)
INNER JOIN PESSOA C1
ON JO.CLIENTE_ID = C1.PESSOA_ID
)

SELECT "APELIDO","JOB_ID","CRONOGRAMA_ID","ITEM_CRONO_ID","ITEM_CRONO_PAI_ID","COD_OBJETO","OBJETO_ID","FREQUENCIA_ID","PAPEL_RESP_ID","NUM_SEQ","NOME","DATA_PLANEJ_INI","DATA_PLANEJ_FIM","ORDEM","NIVEL","OPER","FLAG_OBRIGATORIO","TIPO_OBJETO_ID","SUB_TIPO_OBJETO","FLAG_ENVIAR","NUM_VERSAO","FLAG_PLANEJADO","DURACAO_ORI","DEMANDA","REPET_GRUPO","REPET_SEQ","REPET_A_CADA","REPET_TERM_TIPO","REPET_TERM_OCOR","DATA_TERM_REPET","NUM_GANTT","OBS","USUARIO_SITUACAO_ID","SITUACAO","DATA_SITUACAO","USUARIO_STATUS_ID","NUMERO","STATUS","DATA_STATUS","DATA_APROV_LIMITE","DATA_CRIACAO","FLAG_COM_APROV","EMPRESA_ID","CLIENTE_ID","CONTATO_ID","CONTATO_FATUR_ID","TIPO_JOB_ID","EMP_FATURAR_POR_ID","PRODUTO_CLIENTE_ID","TIPO_FINANCEIRO_ID","EMP_RESP_ID","USUARIO_SOLIC_ID","CONTRATO_ID","USU_STATUS_HORAS_ID","USU_AUTOR_HORAS_ID","STATUS_AUX_JOB_ID","CAMPANHA_ID","UNIDADE_NEGOCIO_ID","CONTEXTO_CRONO_ID","DESCRICAO","DESCRICAO_CLIENTE","DATA_ENTRADA","DATA_PRI_APROV","BUDGET","RECEITA_PREVISTA","FLAG_BUDGET_ND","DATA_PREV_INI","DATA_PREV_FIM","TIPO_DATA_PREV","PERC_BV","FLAG_BV_FORNEC","FLAG_PAGO_CLIENTE","COD_EXT_JOB","FLAG_CONCORRENCIA","CONTRA_QUEM","FLAG_CONC_PERDIDA","PERDIDA_PARA","MOTIVO_CANCEL","STATUS_CHECKIN","DATA_STATUS_CHECKIN","STATUS_FATUR","DATA_STATUS_FATUR","VALOR_AJUSTE_FINAL","FLAG_BLOQ_NEGOC","CAMINHO_ARQ_EXTERNO","DATA_APONT_INI","DATA_APONT_FIM","STATUS_HORAS","DATA_STATUS_HORAS","MOTIVO_STATUS_HORAS","COMPL_STATUS_HORAS","DATA_APROV_HORAS_LIMITE","FLAG_COM_APROV_HORAS","COMPLEX_JOB","ESTRAT_JOB","DATA_DIST_LIMITE","TIPO_NUM_JOB","FLAG_OBRIGA_DESC_HORAS","FLAG_USA_BUDGET","FLAG_USA_RECEITA_PREV","FLAG_OBRIGA_CONTRATO","FLAG_RESTRINGE_ALT_CRONO","DATA_GOLIVE","SERVICO_ID"
FROM join_3
;
--------------------------------------------------------
--  DDL for View V_TIPO_FLUXO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_TIPO_FLUXO" ("CODIGO", "DESCRICAO", "ORDEM") AS 
  SELECT
-----------------------------------------------------------------------
-- lista dados do dicionario: tipo de fluxo dos documentos
-----------------------------------------------------------------------
       codigo,
       descricao,
       ordem
  FROM dicionario
 WHERE tipo = 'tipo_fluxo'
;
--------------------------------------------------------
--  DDL for View V_UNIDADE_FREQ
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_UNIDADE_FREQ" ("CODIGO", "DESCRICAO", "ORDEM") AS 
  SELECT
-----------------------------------------------------------------------
-- lista dados do dicionario: unidade de frequencia
-----------------------------------------------------------------------
       codigo,
       descricao,
       ordem
  FROM dicionario
 WHERE tipo = 'unidade_freq'
;
--------------------------------------------------------
--  DDL for View V_USU_APONTAM_ATRASADOS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_USU_APONTAM_ATRASADOS" ("USUARIO_ID", "EMPRESA_ID", "NOME", "EMAIL", "BLOQUEADO", "DATA_ULT_APONTAM", "NUM_DIAS_PEND") AS 
  SELECT DISTINCT
-----------------------------------------------------------------------
-- View de INBOX: usuarios c/ apontamentos atrasados
-----------------------------------------------------------------------
       us.usuario_id,
       pa.empresa_id,
       pe.apelido,
       pe.email,
       DECODE(apontam_pkg.em_dia_verificar(us.usuario_id,'APONT'),1,'N',0,'S'),
       apontam_pkg.data_ult_apontam_retornar(us.usuario_id),
       apontam_pkg.num_dias_status_retornar(us.usuario_id,'PEND')
  FROM usuario us,
       pessoa pe,
       usuario_papel up,
       papel pa
 WHERE apontam_pkg.num_dias_status_retornar(us.usuario_id,'PEND') >= 
       TO_NUMBER(empresa_pkg.parametro_retornar(usuario_pkg.empresa_padrao_retornar(us.usuario_id),
                                               'NUM_DIAS_UTEIS_SEM_APONTAM') )
   AND us.flag_ativo = 'S'
   AND us.usuario_id = pe.usuario_id
   AND us.usuario_id = up.usuario_id
   AND up.papel_id = pa.papel_id
   AND pa.flag_apontam_form = 'S'
;
--------------------------------------------------------
--  DDL for View V_USU_APONTAM_DETALHADO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_USU_APONTAM_DETALHADO" ("USUARIO_ID", "EMPRESA_ID", "USUARIO", "PAPEL_ID", "PAPEL", "JOB_ID", "JOB_NUMERO", "JOB_NOME", "CLIENTE", "HORAS", "DATA", "MES_ANO", "DIA", "MES", "ANO", "DIA_SEMANA", "DIA_SEMANA_DESC", "TRIMESTRE", "SEMESTRE", "CUSTO_HORA_CONTABIL", "CUSTO_HORA_GERENCIAL", "CUSTO_TOTAL_CONTABIL", "CUSTO_TOTAL_GERENCIAL", "TIPO") AS 
  SELECT
-----------------------------------------------------------------------
-- View para relatorio de detalhamento de apontamentos (nao esta sendo
--   usada).
-----------------------------------------------------------------------
         ad.usuario_id,
         pa.empresa_id,
         pu.apelido,
         ah.papel_id,
         pa.nome,
         ah.job_id,
         jo.numero,
         jo.numero || ' - ' || job_pkg.nome_retornar(ah.job_id) AS nome_job,
         pc.apelido,
         ah.horas,
         DATA_MOSTRAR(ad.data),
         TO_CHAR(ad.data,'MM/YYYY'),
         TO_CHAR(ad.data,'DD'),
         TO_CHAR(ad.data,'MM'),
         TO_CHAR(ad.data,'YYYY'),
         TO_CHAR(ad.data,'D'),
         dia_semana_mostrar(ad.data),
         TRUNC(TO_NUMBER(TO_CHAR(ad.data,'MM'))/3 + 1),
         TRUNC(TO_NUMBER(TO_CHAR(ad.data,'MM'))/6 + 1),
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'CON',TO_CHAR(ad.data,'MM/YYYY')),
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'GER',TO_CHAR(ad.data,'MM/YYYY')),
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'CON',TO_CHAR(ad.data,'MM/YYYY')) * ah.horas,
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'GER',TO_CHAR(ad.data,'MM/YYYY')) * ah.horas,
         ti.nome
    FROM apontam_data ad,
         apontam_hora ah,
         job jo,
         pessoa pu,
         pessoa pc,
         papel pa,
         tipo_apontam ti
   WHERE ad.apontam_data_id = ah.apontam_data_id
     AND ah.job_id = jo.job_id
     AND ad.usuario_id = pu.usuario_id
     AND jo.cliente_id = pc.pessoa_id   
     AND ah.papel_id = pa.papel_id
     AND ah.tipo_apontam_id = ti.tipo_apontam_id
   UNION
  SELECT ad.usuario_id,
         pa.empresa_id,
         pu.apelido,
         ah.papel_id,
         pa.nome,
         0,
         '0',
         ti.nome,
         NVL(pc.apelido,'N/A'),
         ah.horas,
         DATA_MOSTRAR(ad.data),
         TO_CHAR(ad.data,'MM/YYYY'),
         TO_CHAR(ad.data,'DD'),
         TO_CHAR(ad.data,'MM'),
         TO_CHAR(ad.data,'YYYY'),
         TO_CHAR(ad.data,'D'),
         dia_semana_mostrar(ad.data),
         TRUNC(TO_NUMBER(TO_CHAR(ad.data,'MM'))/3 + 1),
         TRUNC(TO_NUMBER(TO_CHAR(ad.data,'MM'))/6 + 1),
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'CON',TO_CHAR(ad.data,'MM/YYYY')),
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'GER',TO_CHAR(ad.data,'MM/YYYY')),
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'CON',TO_CHAR(ad.data,'MM/YYYY')) * ah.horas,
         APONTAM_PKG.custo_horario_retornar(ad.usuario_id,'GER',TO_CHAR(ad.data,'MM/YYYY')) * ah.horas,
         ti.nome
    FROM apontam_data ad,
         apontam_hora ah,
         pessoa pu,
         pessoa pc,
         papel pa,
         tipo_apontam ti
   WHERE ad.apontam_data_id = ah.apontam_data_id
     AND ah.job_id IS NULL
     AND ah.cliente_id = pc.pessoa_id (+)
     AND ad.usuario_id = pu.usuario_id
     AND ah.papel_id = pa.papel_id
     AND ah.tipo_apontam_id = ti.tipo_apontam_id
;
--------------------------------------------------------
--  DDL for View V_USUARIOS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_USUARIOS" ("EMPRESA_ID", "USUARIO_ID", "APELIDO", "NOME", "USUARIO_LOGIN", "FUNCAO", "PAPEL_NOME", "AREA", "CARGO_NOME", "FLAG_EMAIL_BLOQ", "FLAG_ATIVO", "COD_EXT_USUARIO", "DEPARTAMENTO_NOME", "AREA_USUARIO", "CATEGORIA", "TIPO_RELACAO", "COD_FUNCIONARIO", "EMPRESA_PADRAO", "FERIADOS", "DATA_APONTAM_INI", "DATA_APONTAM_FIM", "FLAG_SEM_BLOQ_APONT", "FLAG_SEM_BLOQ_APROV", "SUBMETER_HORAS_APROV", "FLAG_PERMITE_HOME", "MIN_HORAS_APONT_DIA", "NUM_HORAS_PROD_DIA", "FLAG_ADMIN", "FLAG_ADMIN_SISTEMA", "EMAIL") AS 
  SELECT em.empresa_id,
       us.usuario_id,
       pe.apelido,
       pe.nome,
       us.login as usuario_login,
       us.funcao,
       (SELECT LISTAGG(p.nome,', ') WITHIN GROUP (ORDER BY p.nome)
          FROM papel         p,
               area          a,
               usuario_papel up
         WHERE p.empresa_id   = em.empresa_id
           AND p.papel_id     = up.papel_id
           AND p.area_id      = a.area_id
           AND up.usuario_id  = us.usuario_id) AS papel_nome,
       (SELECT LISTAGG(a.nome, ', ') WITHIN GROUP (ORDER BY a.nome)
          FROM area          a,
               papel         p,
               usuario_papel up
         WHERE a.empresa_id = em.empresa_id
           AND a.area_id    = p.area_id
           AND p.papel_id   = up.papel_id
           AND up.usuario_id = us.usuario_id) as area,
       (SELECT c.nome
          FROM cargo   c,
               usuario_cargo uc
         WHERE c.cargo_id = uc.cargo_id
           AND c.empresa_id = em.empresa_id
           AND uc.usuario_id = us.usuario_id
           AND uc.data_fim   IS NULL) AS cargo_nome,
       us.flag_email_bloq,
       us.flag_ativo,
       us.cod_ext_usuario,
       (SELECT de.nome
          FROM departamento de
         WHERE de.departamento_id = us.departamento_id) AS departamento_nome,
       (SELECT ar.nome
          FROM area ar
         WHERE ar.empresa_id = em.empresa_id
           AND ar.area_id    = us.area_id) AS area_usuario,
       us.categoria,
       CASE
          WHEN us.tipo_relacao = 'CPGAGE' THEN
             'Colaborador Pago Pela Agência'
          WHEN us.tipo_relacao = 'CPGCLI' THEN
             'Colaborador Pago Pelo Cliente'
          WHEN us.tipo_relacao = 'FREELA' THEN
             'Freelancer'
       END AS tipo_relacao,
       us.cod_funcionario,
       (SELECT e.nome
          FROM empresa e,
               usuario_empresa ue
         WHERE e.empresa_id    = ue.empresa_id
           AND e.empresa_id    = em.empresa_id
           AND ue.usuario_id   = us.usuario_id
           AND ue.empresa_id   = em.empresa_id
           AND ue.flag_padrao  = 'S') AS empresa_padrao,
       (SELECT LISTAGG(f.nome,', ') WITHIN GROUP (ORDER BY f.nome)
          FROM tab_feriado f
         WHERE f.tab_feriado_id = us.tab_feriado_id
           AND f.empresa_id     = em.empresa_id) AS feriados,
        data_mostrar(us.data_apontam_ini) AS data_apontam_ini,
        data_mostrar(us.data_apontam_fim) AS data_apontam_fim,
        DECODE(us.flag_sem_bloq_apont, 'S', 'Não Bloquear', 'N', 'Bloquear') AS flag_sem_bloq_apont,
        DECODE(us.flag_sem_bloq_aprov, 'S', 'Não Bloquear', 'N', 'Bloquear') AS flag_sem_bloq_aprov,
        DECODE(us.flag_sem_aprov_horas, 'S', 'Não', 'N', 'Sim') AS submeter_horas_aprov,
        us.flag_permite_home,
        CASE
          WHEN numero_mostrar(us.min_horas_apont_dia, 2,'S') IS NULL THEN
            numero_mostrar(EMPRESA_PKG.parametro_retornar(em.empresa_id, 'NUM_MIN_HORAS_APONTADAS_DIA'), 2,'S')
          ELSE
            numero_mostrar(us.min_horas_apont_dia, 2,'S')
        END AS min_horas_apont_dia,
        CASE
          WHEN to_char(us.num_horas_prod_dia) IS NULL THEN
             numero_mostrar(EMPRESA_PKG.parametro_retornar(em.empresa_id, 'NUM_HORAS_PRODUTIVAS'), 2,'S')
          ELSE
             numero_mostrar(us.num_horas_prod_dia, 2, 'S')
         END AS num_horas_prod_dia,
         us.flag_admin,
         us.flag_admin_sistema AS flag_admin_sistema,
         pe.email as email
   FROM usuario         us,
        empresa         em,
        pessoa          pe
  WHERE pe.empresa_id = em.empresa_id
    AND us.usuario_id = pe.usuario_id

;
--------------------------------------------------------
--  DDL for View V_USU_PAPEL_ENDER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_USU_PAPEL_ENDER" ("USUARIO_ID", "EMPRESA_ID", "APELIDO_USUARIO", "PAPEL_ID", "AREA_ID", "NOME_AREA", "NOME_PAPEL", "ORDEM_PAPEL", "FLAG_USUARIO_ATIVO", "NUMERO_ENDERECAMENTOS", "NUMERO_TASKS") AS 
  SELECT
-----------------------------------------------------------------------
-- lista usuarios ativos associados a papeis enderecaveis.
-----------------------------------------------------------------------
       us.usuario_id,
       pa.empresa_id,
       pe.apelido,
       up.papel_id,
       pa.area_id,
       ar.nome,
       pa.nome,
       pa.ordem,
       us.flag_ativo,
       USUARIO_PKG.NUMERO_ENDERECAMENTOS_RETORNAR(us.usuario_id,pa.empresa_id) AS numero_enderecamentos,
       0
      -- USUARIO_PKG.NUMERO_TASKS_RETORNAR(us.usuario_id,pa.empresa_id) AS numero_tasks
  FROM usuario_papel up,
       usuario us,
       papel pa,
       pessoa pe,
       area ar
 WHERE up.usuario_id = us.usuario_id
   AND us.usuario_id = pe.usuario_id
   AND up.papel_id = pa.papel_id
   AND pa.area_id = ar.area_id
   AND pa.flag_ender = 'S'
   AND us.flag_ativo = 'S'
;
--------------------------------------------------------
--  DDL for View V_USU_SEM_APONTAM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_USU_SEM_APONTAM" ("USUARIO_ID", "EMPRESA_ID", "NOME", "EMAIL") AS 
  SELECT DISTINCT
-----------------------------------------------------------------------
-- View de INBOX: usuarios que nunca apontaram
-----------------------------------------------------------------------
       us.usuario_id,
       pa.empresa_id,
       pe.apelido,
       pe.email
  FROM usuario us,
       usuario_papel up,
       papel pa,
       pessoa pe
 WHERE us.usuario_id = up.usuario_id
   AND us.flag_ativo = 'S'
   AND up.papel_id = pa.papel_id
   AND pa.flag_apontam_form = 'S'
   AND us.usuario_id = pe.usuario_id
   AND NOT EXISTS (SELECT 1
                     FROM apontam_data ad
                    WHERE ad.usuario_id = us.usuario_id)
;
--------------------------------------------------------
--  DDL for View V_WORKFLOW_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "V_WORKFLOW_STATUS" ("EMPRESA_ID", "COD_OBJETO", "OBJETO_ID", "ITEM_CRONO_ID", "CLIENTE_ESPECIFICO_ID", "GRUPO_ID", "CLIENTE_ESPECIFICO", "CLIENTE", "JOB_ID", "JOB_DESCRICAO", "ATIVIDADE_TIPO", "ATIVIDADE_DESCRICAO", "STATUS", "STATUS_CODIGO", "NUM_REFACAO", "STATUS_NEGOCIACAO", "PRAZO", "PRAZO_FMT", "PRAZO_INTERNO", "PRAZO_INTERNO_FMT", "SOLICITANTE", "SOLICITANTE_ID", "EQUIPE", "AREA", "EXECUTORES", "EXECUTORES_ID", "HORAS", "PRODUTO_CLIENTE", "CONTRATO_NUMERO", "CONTRATO_NOME", "DATA_INICIO_PLANEJADA", "DATA_INICIO_PLANEJADA_FMT", "DATA_FIM_PLANEJADA", "DATA_FIM_PLANEJADA_FMT", "RESPONSAVEL_PELO_JOB", "RESPONSAVEL_PELO_JOB_ID", "CONTATO_JOB", "DATA_ENTRADA_JOB", "DATA_ENTRADA_JOB_FMT", "DATA_ENVIO", "DATA_ENVIO_FMT", "DATA_APRESENTACAO", "DATA_APRESENTACAO_FMT", "DATA_GO_LIVE", "DATA_GO_LIVE_FMT", "COMENT_STATUS_AUTOR", "COMENT_STATUS_DATA", "COMENT_STATUS_DATA_FMT", "COMENT_STATUS") AS 
  SELECT jo.empresa_id,
         ic.cod_objeto,
         ic.objeto_id,
         ic.item_crono_id,
         jo.cliente_id AS cliente_especifico_id,
         NVL((SELECT LISTAGG(gr.grupo_id,', ') WITHIN GROUP (ORDER BY gr.grupo_id)
                FROM grupo gr
                     INNER JOIN grupo_pessoa gp ON gr.grupo_id = gp.grupo_id 
               WHERE gp.pessoa_id = cl.pessoa_id
                 AND gr.flag_agrupa_cnpj = 'S'),0) AS grupo_id,
         cl.apelido AS cliente_especifico,
         NVL((SELECT LISTAGG(gr.nome,', ') WITHIN GROUP (ORDER BY gr.nome)
                FROM grupo gr
                     INNER JOIN grupo_pessoa gp ON gr.grupo_id = gp.grupo_id 
               WHERE gp.pessoa_id = cl.pessoa_id
                 AND gr.flag_agrupa_cnpj = 'S'),cl.apelido) AS cliente,
         jo.job_id,
         NVL(jo.numero || ' ' || jo.nome,'-') AS job_descricao,
         ts.nome AS atividade_tipo,
         DECODE(objeto_id,NULL,'',ORDEM_SERVICO_PKG.NUMERO_FORMATAR(os.ordem_servico_id)|| ' ') || os.descricao AS atividade_descricao,
         dos.descricao || DECODE(ov.flag_recusa, 'S',' (Recusado)','') AS status,
         dos.codigo AS status_codigo,
         os.qtd_refacao AS num_refacao,
         CASE
           WHEN os.flag_em_negociacao = 'S' THEN 'ANDA'
           WHEN os.status IN ('DIST','ACEI','EMEX','AVAL')
            AND os.flag_em_negociacao = 'N'
            AND (SELECT COUNT(*) 
                   FROM os_negociacao onx
                  WHERE onx.ordem_servico_id = ic.objeto_id
                    AND onx.num_refacao = os.qtd_refacao) = 0 THEN 'DISP'
           WHEN os.status IN ('DIST','ACEI','EMEX','AVAL')
            AND os.flag_em_negociacao = 'N'
            AND (SELECT COUNT(*) 
                   FROM os_negociacao onx
                  WHERE onx.ordem_servico_id = ic.objeto_id
                    AND onx.num_refacao = os.qtd_refacao) > 0 THEN 'CONC' 
           ELSE 'N/A'
         END AS status_negociacao,
         os.data_solicitada AS prazo,
         DATA_MOSTRAR(os.data_solicitada) AS prazo_fmt,
         os.data_interna AS prazo_interno,
         DATA_MOSTRAR(os.data_interna) AS prazo_interno_fmt,
         (SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM os_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'SOL') AS solicitante,
         (SELECT LISTAGG(i.usuario_id,', ') within group (order by i.usuario_id)
                                              FROM os_usuario i
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'SOL') AS solicitante_id,
         NVL((SELECT DISTINCT LISTAGG(nome,', ') within group (order by nome)
                                                     FROM (SELECT DISTINCT e.nome FROM equipe e
                                                          INNER JOIN equipe_usuario x ON x.equipe_id = e.equipe_id
                                                          INNER JOIN os_usuario o ON o.usuario_id = x.usuario_id
                                                    WHERE o.ordem_servico_id = os.ordem_servico_id)),'-') AS equipe,
         NVL((SELECT DISTINCT LISTAGG(nome,', ') within group (order by nome)
                                                     FROM (SELECT DISTINCT a.nome 
                                                             FROM area a
                                                                  INNER JOIN cargo c ON c.area_id = a.area_id
                                                                  INNER JOIN usuario_cargo x ON x.cargo_id = c.cargo_id
                                                                  INNER JOIN os_usuario o ON o.usuario_id = x.usuario_id
                                                            WHERE o.ordem_servico_id = os.ordem_servico_id
                                                              AND x.data_fim IS NULL)),'-') AS area,
         NVL((SELECT LISTAGG(p.apelido || ' (' || u.funcao || ')',', ') within group (order by p.apelido)
                                              FROM os_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'EXE'),'-') AS executores,
         NVL((SELECT LISTAGG(p.usuario_id,', ') within group (order by p.usuario_id)
                                              FROM os_usuario i
                                                   INNER JOIN pessoa p on p.usuario_id = i.usuario_id
                                                   INNER JOIN usuario u on u.usuario_id = p.usuario_id
                                             WHERE i.ordem_servico_id = os.ordem_servico_id
                                               AND i.tipo_ender = 'EXE'),'-') AS executores_id,
         NVL((SELECT SUM(u.horas_planej) 
                       FROM os_usuario u 
                            INNER JOIN item_crono i ON i.objeto_id = u.ordem_servico_id AND i.cod_objeto = 'ORDEM_SERVICO'
                      WHERE i.item_crono_id = ic.item_crono_id),0) AS horas,
         pc.nome AS produto_cliente,
         DECODE(CONTRATO_PKG.NUMERO_FORMATAR(ct.contrato_id), 'ERRO', '-', CONTRATO_PKG.NUMERO_FORMATAR(ct.contrato_id)) AS contrato_numero,
         DECODE(ct.nome, NULL, '-', ct.nome) AS contrato_nome,
         ic.data_planej_ini AS data_inicio_planejada,
         DATA_MOSTRAR(ic.data_planej_ini) AS data_inicio_planejada_fmt,
         ic.data_planej_fim AS data_fim_planejada,
         DATA_MOSTRAR(ic.data_planej_fim) AS data_fim_planejada_fmt,
         NVL(pr.apelido || ' (' || ur.funcao || ')','-') AS responsavel_pelo_job,
         ur.usuario_id AS responsavel_pelo_job_id,
         NVL(cn.apelido || DECODE(cn.funcao,NULL,'',' (' || cn.funcao || ')'),'-') AS contato_job,
         jo.data_entrada AS data_entrada_job,
         DATA_MOSTRAR(jo.data_entrada) AS data_entrada_job_fmt,
         sysdate AS data_envio,
         DATA_MOSTRAR(sysdate) AS data_envio_fmt,
         jo.data_pri_aprov AS data_apresentacao,
         DATA_MOSTRAR(jo.data_pri_aprov) AS data_apresentacao_fmt,
         sysdate AS data_go_live,
         DATA_MOSTRAR(sysdate) AS data_go_live_fmt,
         NVL(ui.apelido,'-') AS coment_status_autor,
         ic.data_situacao AS coment_status_data,
         DATA_MOSTRAR(ic.data_situacao) AS coment_status_data_fmt,
         NVL(ic.situacao,'-') AS coment_status
         --SELECT COUNT(*)
    FROM item_crono ic
         INNER JOIN cronograma cr      ON ic.cronograma_id = cr.cronograma_id
         INNER JOIN job jo             ON jo.job_id = cr.job_id
         INNER JOIN pessoa cl          ON cl.pessoa_id = jo.cliente_id
          LEFT JOIN produto_cliente pc ON pc.produto_cliente_id = jo.produto_cliente_id
          LEFT JOIN contrato ct        ON ct.contrato_id = jo.contrato_id
          LEFT JOIN pessoa cn          ON cn.pessoa_id = jo.contato_id
          LEFT JOIN ordem_servico os   ON os.ordem_servico_id = ic.objeto_id AND ic.cod_objeto = 'ORDEM_SERVICO'
          LEFT JOIN dicionario dos     ON ic.cod_objeto = 'ORDEM_SERVICO' 
                                       AND dos.codigo = os.status
                                       AND dos.tipo = 'status_os'
          LEFT JOIN tipo_os ts         ON ts.tipo_os_id = os.tipo_os_id
          LEFT JOIN pessoa ui          ON ui.usuario_id = ic.usuario_situacao_id
          LEFT JOIN job_usuario xr     ON xr.job_id = jo.job_id
                                       AND xr.flag_responsavel = 'S'
          LEFT JOIN usuario ur         ON ur.usuario_id = xr.usuario_id
          LEFT JOIN pessoa pr          ON pr.usuario_id = xr.usuario_id
          LEFT JOIN os_evento ov       ON ov.os_evento_id = ordem_servico_pkg.ultimo_evento_retornar(os.ordem_servico_id)
   WHERE ic.cod_objeto IN ('ORDEM_SERVICO')
     AND ic.cod_objeto IS NOT NULL
     AND cr.status <> 'ARQUI'
     AND jo.status NOT IN ('CANC')
;
