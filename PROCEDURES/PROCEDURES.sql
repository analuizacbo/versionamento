--------------------------------------------------------
--  Arquivo criado - sexta-feira-julho-14-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure RECOMPILE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RECOMPILE" 
-----------------------------------------------------------------------
--   recompile
--
--   Descricao: recompile objetos c/ status INVALID
-----------------------------------------------------------------------
   (status_in IN VARCHAR2 := 'INVALID')
IS
   v_objtype             VARCHAR2(100);
   v_comando             VARCHAR2(2000);
   v_cid                 INTEGER;
   v_qt_reg              INTEGER;
--
   CURSOR obj_cur IS
      SELECT object_name, object_type
        FROM USER_OBJECTS
       WHERE status LIKE UPPER (status_in)
         AND object_type NOT IN ('SYNONYM','VIEW','MATERIALIZED VIEW')
      ORDER BY
         DECODE (object_type,
            'PACKAGE', 1, 'PACKAGE BODY', 4,
            'FUNCTION', 2, 'PROCEDURE', 3);
--
   CURSOR view_cur IS
      SELECT object_name
        FROM USER_OBJECTS
       WHERE status LIKE UPPER (status_in)
         AND object_type = 'VIEW';       
--
   CURSOR mview_cur IS
      SELECT object_name
        FROM USER_OBJECTS
       WHERE status LIKE UPPER (status_in)
         AND object_type = 'MATERIALIZED VIEW';
--
   CURSOR syn_cur IS
      SELECT object_name
        FROM USER_OBJECTS
       WHERE status LIKE UPPER (status_in)
         AND object_type = 'SYNONYM';
--
BEGIN
   FOR rec IN obj_cur
   LOOP
      IF rec.object_type = 'PACKAGE'
      THEN
         v_objtype := 'PACKAGE SPECIFICATION';
      ELSE
         v_objtype := rec.object_type;
      END IF;

      DBMS_DDL.ALTER_COMPILE (v_objtype, user, rec.object_name);

      DBMS_OUTPUT.PUT_LINE
         ('Compiled ' || v_objtype || ' of ' ||
          user || '.' || rec.object_name);
   END LOOP;
--
   FOR rec IN view_cur
   LOOP
      v_comando := 'ALTER VIEW ' || rec.object_name || ' COMPILE';
      v_cid := dbms_sql.open_cursor;
      dbms_sql.parse(v_cid, v_comando,2);
      v_qt_reg := dbms_sql.execute(v_cid);
      dbms_sql.close_cursor(v_cid);

      DBMS_OUTPUT.PUT_LINE
         ('Compiled VIEW of ' || user || '.' || rec.object_name);
   END LOOP;
--
   FOR rec IN mview_cur
   LOOP
      v_comando := 'ALTER MATERIALIZED VIEW ' || rec.object_name || ' COMPILE';
      v_cid := dbms_sql.open_cursor;
      dbms_sql.parse(v_cid, v_comando,2);
      v_qt_reg := dbms_sql.execute(v_cid);
      dbms_sql.close_cursor(v_cid);

      DBMS_OUTPUT.PUT_LINE
         ('Compiled VIEW of ' || user || '.' || rec.object_name);
   END LOOP;
--
   FOR rec IN syn_cur
   LOOP
      v_comando := 'ALTER SYNONYM ' || rec.object_name || ' COMPILE';
      v_cid := dbms_sql.open_cursor;
      dbms_sql.parse(v_cid, v_comando,2);
      v_qt_reg := dbms_sql.execute(v_cid);
      dbms_sql.close_cursor(v_cid);

      DBMS_OUTPUT.PUT_LINE
         ('Compiled VIEW of ' || user || '.' || rec.object_name);
   END LOOP;
--
END;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_HTML_FROM_URL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SHOW_HTML_FROM_URL" (
  p_url  IN  VARCHAR2,
  p_username IN VARCHAR2 DEFAULT NULL,
  p_password IN VARCHAR2 DEFAULT NULL
) AS
  l_http_request   UTL_HTTP.req;
  l_http_response  UTL_HTTP.resp;
  l_text           VARCHAR2(32767);
BEGIN
  -- Make a HTTP request and get the response.
  l_http_request  := UTL_HTTP.begin_request(p_url);

  -- Use basic authentication if required.
  IF p_username IS NOT NULL and p_password IS NOT NULL THEN
    UTL_HTTP.set_authentication(l_http_request, p_username, p_password);
  END IF;

  l_http_response := UTL_HTTP.get_response(l_http_request);

  -- Loop through the response.
  BEGIN
    LOOP
      UTL_HTTP.read_text(l_http_response, l_text, 32766);
      DBMS_OUTPUT.put_line (l_text);
    END LOOP;
  EXCEPTION
    WHEN UTL_HTTP.end_of_body THEN
      UTL_HTTP.end_response(l_http_response);
  END;
EXCEPTION
  WHEN OTHERS THEN
    UTL_HTTP.end_response(l_http_response);
    RAISE;
END show_html_from_url;

/
--------------------------------------------------------
--  DDL for Procedure SP_EXPURGO_DPZT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SP_EXPURGO_DPZT" AS

   CURSOR CUR_PESSOA IS
   SELECT PE.PESSOA_ID
     FROM PESSOA PE
    INNER
     JOIN GRUPO_PESSOA GP ON GP.PESSOA_ID = PE.PESSOA_ID
    WHERE GP.GRUPO_ID NOT IN (15,20,19,999999);

   RCUR_PESSOA CUR_PESSOA%ROWTYPE;

   VN_USUARIO_ID      USUARIO.USUARIO_ID%TYPE;
   VN_EMPRESA_ID      EMPRESA.EMPRESA_ID%TYPE;
   VC_ERRO_COD        VARCHAR2(32672);
   VC_ERRO_MSG        VARCHAR2(32672);

BEGIN
      OPEN CUR_PESSOA;
      LOOP
         FETCH CUR_PESSOA INTO RCUR_PESSOA;
         EXIT WHEN CUR_PESSOA%NOTFOUND;

         FOR RJOB IN (SELECT JOB_ID
                        FROM JOB
                       WHERE CLIENTE_ID = RCUR_PESSOA.PESSOA_ID)
         LOOP              
         -- EXCLUI JOB

            SELECT NVL(PE.USUARIO_ID, 0)
              INTO VN_USUARIO_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

            SELECT NVL(PE.EMPRESA_ID, 0)
              INTO VN_EMPRESA_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

            LIMPEZA_PKG.job_apagar(VN_USUARIO_ID, VN_EMPRESA_ID, RJOB.JOB_ID, VC_ERRO_COD, VC_ERRO_MSG);
         
         END LOOP;

         FOR RCONTRATO IN (SELECT CONTRATO_ID
                             FROM CONTRATO
                            WHERE CONTRATANTE_ID = RCUR_PESSOA.PESSOA_ID)
         LOOP
	         -- EXCLUI CONTRATO

            SELECT NVL(PE.USUARIO_ID, 0)
              INTO VN_USUARIO_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

            SELECT NVL(PE.EMPRESA_ID, 0)
              INTO VN_EMPRESA_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

         LIMPEZA_PKG.CONTRATO_APAGAR(VN_USUARIO_ID, VN_EMPRESA_ID, RCONTRATO.CONTRATO_ID, VC_ERRO_COD, VC_ERRO_MSG);

         -- EXCLUI PESSOA

         SELECT NVL(PE.USUARIO_ID, 0)
           INTO VN_USUARIO_ID
           FROM PESSOA PE
          WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

         SELECT NVL(PE.EMPRESA_ID, 0)
           INTO VN_EMPRESA_ID
           FROM PESSOA PE
          WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

          LIMPEZA_PKG.PESSOA_APAGAR(VN_USUARIO_ID, VN_EMPRESA_ID, RCUR_PESSOA.PESSOA_ID, VC_ERRO_COD, VC_ERRO_MSG);
         
         END LOOP;
      END LOOP;
      CLOSE CUR_PESSOA;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.put_line(SQLERRM);
      DBMS_OUTPUT.put_line(VC_ERRO_COD);
      DBMS_OUTPUT.put_line(VC_ERRO_MSG);
END SP_EXPURGO_DPZT;

/
--------------------------------------------------------
--  DDL for Procedure SP_EXPURGO_GALERIA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SP_EXPURGO_GALERIA" AS

-----------------------------------------------------------------------
--- EMPRESA     : PROCESSMIND
--- SISTEMA     : JOBONE
--- OBJETO      : PROCEDURE
--- DESCRICAO   : ROTINA PARA REALIZACAO DO EXPURGO DE DADOS DA EMPRESA
---               GALERIA
--- SGDB        : Oracle Database 18c Express Edition 
---               Release 18.0.0.0.0 - Production
--- AUTOR       : 
--- CRIACAO     : 29/09/2021
--- OBSERVACAO  : 
-----------------------------------------------------------------------

/*
19	1	Itaú
43	1	Itaú Vivasix
27	1	McDonald's LATAM
15	1	McDonald's
37	1	McDonald’s LATAM PACKAGING
20	1	Natura
49	1	ByteDance Brasil
*/


   CURSOR CUR_PESSOA IS
   SELECT PE.PESSOA_ID
     FROM PESSOA PE
    INNER
     JOIN GRUPO_PESSOA GP ON GP.PESSOA_ID = PE.PESSOA_ID
    WHERE GP.GRUPO_ID NOT IN (19,43,27,15,37,20,49);

   RCUR_PESSOA CUR_PESSOA%ROWTYPE;

   VN_USUARIO_ID      USUARIO.USUARIO_ID%TYPE := 1;
   VN_EMPRESA_ID      EMPRESA.EMPRESA_ID%TYPE;
   VC_ERRO_COD        VARCHAR2(32672);
   VC_ERRO_MSG        VARCHAR2(32672);  
   
BEGIN
      OPEN CUR_PESSOA;
      LOOP
         FETCH CUR_PESSOA INTO RCUR_PESSOA;
         EXIT WHEN CUR_PESSOA%NOTFOUND;

         FOR RJOB IN (SELECT JOB_ID
                        FROM JOB
                       WHERE CLIENTE_ID = RCUR_PESSOA.PESSOA_ID)
         LOOP              
         -- EXCLUI JOB

/*
            SELECT NVL(PE.USUARIO_ID, 0)
              INTO VN_USUARIO_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;
*/
            SELECT NVL(PE.EMPRESA_ID, 0)
              INTO VN_EMPRESA_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

            LIMPEZA_PKG.job_apagar(VN_USUARIO_ID, VN_EMPRESA_ID, RJOB.JOB_ID, VC_ERRO_COD, VC_ERRO_MSG);
         
         END LOOP;

         FOR RCONTRATO IN (SELECT CONTRATO_ID
                             FROM CONTRATO
                            WHERE CONTRATANTE_ID = RCUR_PESSOA.PESSOA_ID)
         LOOP
	         -- EXCLUI CONTRATO
           
/*
            SELECT NVL(PE.USUARIO_ID, 0)
              INTO VN_USUARIO_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;
*/
            SELECT NVL(PE.EMPRESA_ID, 0)
              INTO VN_EMPRESA_ID
              FROM PESSOA PE
             WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

         LIMPEZA_PKG.CONTRATO_APAGAR(VN_USUARIO_ID, VN_EMPRESA_ID, RCONTRATO.CONTRATO_ID, VC_ERRO_COD, VC_ERRO_MSG);

         -- EXCLUI PESSOA
         
/*
         SELECT NVL(PE.USUARIO_ID, 0)
           INTO VN_USUARIO_ID
           FROM PESSOA PE
          WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;
*/
         SELECT NVL(PE.EMPRESA_ID, 0)
           INTO VN_EMPRESA_ID
           FROM PESSOA PE
          WHERE PE.PESSOA_ID = RCUR_PESSOA.PESSOA_ID;

          LIMPEZA_PKG.PESSOA_APAGAR(VN_USUARIO_ID, VN_EMPRESA_ID, RCUR_PESSOA.PESSOA_ID, VC_ERRO_COD, VC_ERRO_MSG);
         
         END LOOP;
      END LOOP;
      CLOSE CUR_PESSOA;

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.put_line(SQLERRM);
      DBMS_OUTPUT.put_line(VC_ERRO_COD);
      DBMS_OUTPUT.put_line(VC_ERRO_MSG);
END SP_EXPURGO_GALERIA;

/
