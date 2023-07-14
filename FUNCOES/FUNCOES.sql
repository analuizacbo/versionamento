--------------------------------------------------------
--  Arquivo criado - sexta-feira-julho-14-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function ACENTO_CORRIGIR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ACENTO_CORRIGIR" -----------------------------------------------------------------------
-- acento_corrigir
--
--   Descricao: dado um string, corrige palavras com problemas de
--      acentuacao.
-----------------------------------------------------------------------
  (p_string in varchar2)
RETURN  varchar2 IS

v_string LONG;

BEGIN
  v_string := p_string;
  --
  v_string := REPLACE(v_string,' ¿s ',' às ');
  --
  v_string := REPLACE(v_string,'1¿','1º');
  v_string := REPLACE(v_string,'2¿','2º');
  v_string := REPLACE(v_string,'3¿','3º');
  --
  v_string := REPLACE(v_string,'combust¿vel','combustível');
  v_string := REPLACE(v_string,'Combust¿vel','Combustível');
  --
  v_string := REPLACE(v_string,'di¿metro','diâmetro');
  v_string := REPLACE(v_string,'Di¿metro','Diâmetro');
  --
  v_string := REPLACE(v_string,'ep¿xi','epóxi');
  v_string := REPLACE(v_string,'Ep¿xi','Epóxi');
  --
  v_string := REPLACE(v_string,'escrit¿rio','escritório');
  v_string := REPLACE(v_string,'Escrit¿rio','Escritório');
  --
  v_string := REPLACE(v_string,'relat¿rio','relatório');
  v_string := REPLACE(v_string,'Relat¿rio','Relatório');
  --
  v_string := REPLACE(v_string,'pl¿stico','plástico');
  v_string := REPLACE(v_string,'Pl¿stico','Plástico');
  --
  v_string := REPLACE(v_string,'r¿dio','rádio');
  v_string := REPLACE(v_string,'R¿dio','Rádio');
  --
  v_string := REPLACE(v_string,'v¿deo','vídeo');
  v_string := REPLACE(v_string,'V¿deo','Vídeo');
  v_string := REPLACE(v_string,'V¿DEO','VÍDEO');
  --
  v_string := REPLACE(v_string,'ribeir¿o','ribeirão');
  v_string := REPLACE(v_string,'Ribeir¿o','Ribeirão');
  --
  v_string := REPLACE(v_string,'l¿mina','lâmina');
  v_string := REPLACE(v_string,'L¿mina','Lâmina');
  --
  v_string := REPLACE(v_string,'met¿lica','metálica');
  v_string := REPLACE(v_string,'Met¿lica','Metálica');
  --
  v_string := REPLACE(v_string,'s¿bado','sábado');
  v_string := REPLACE(v_string,'S¿bado','Sábado');
  --
  v_string := REPLACE(v_string,'balc¿o','balcão');
  v_string := REPLACE(v_string,'Balc¿o','Balcão');
  --
  v_string := REPLACE(v_string,'cach¿','cachê');
  v_string := REPLACE(v_string,'Cach¿','Cachê');
  --
  v_string := REPLACE(v_string,'Camar¿o','Camarão');
  v_string := REPLACE(v_string,'camar¿o','camarão');
  --
  v_string := REPLACE(v_string,'card¿pio','cardápio');
  v_string := REPLACE(v_string,'Card¿pio','Cardápio');
  v_string := REPLACE(v_string,'CARD¿PIO','CARDÁPIO');
  --
  v_string := REPLACE(v_string,'t¿cnico','técnico');
  v_string := REPLACE(v_string,'T¿cnico','Técnico');
  v_string := REPLACE(v_string,'t¿cnica','técnica');
  v_string := REPLACE(v_string,'T¿cnica','Técnica');
  --
  v_string := REPLACE(v_string,' ¿nico',' único');
  v_string := REPLACE(v_string,' ¿NICO',' ÚNICO');
  v_string := REPLACE(v_string,' ¿nica',' única');
  v_string := REPLACE(v_string,' ¿NICA',' ÚNICA');
  --
  v_string := REPLACE(v_string,'di¿ria','diária');
  v_string := REPLACE(v_string,'Di¿ria','Diária');
  --
  v_string := REPLACE(v_string,'troc¿nio','trocínio');
  v_string := REPLACE(v_string,'PATROC¿NIO','PATROCÍNIO');
  --
  v_string := REPLACE(v_string,'cess¿ria','cessária');
  --
  v_string := REPLACE(v_string,'cart¿veis','cartáveis');
  --
  v_string := REPLACE(v_string,'ar¿on','arçon');
  --
  v_string := REPLACE(v_string,'gu¿s','guês');
  v_string := REPLACE(v_string,'gl¿s','glês');
  v_string := REPLACE(v_string,'ortugu¿','ortuguê');
  v_string := REPLACE(v_string,'ingl¿','inglê');
  --
  v_string := REPLACE(v_string,'en¿a','ença');
  --
  v_string := REPLACE(v_string,'an¿a','ança');
  --
  v_string := REPLACE(v_string,'f¿nica','fônica');
  v_string := REPLACE(v_string,'f¿nico','fônico');
  --
  v_string := REPLACE(v_string,'fer¿ncia','ferência');
  --
  v_string := REPLACE(v_string,'dere¿o','dereço');
  --
  v_string := REPLACE(v_string,'espons¿vel','esponsável');
  --
  v_string := REPLACE(v_string,'u¿¿o','ução');
  --
  v_string := REPLACE(v_string,'i¿¿o','ição');
  --
  v_string := REPLACE(v_string,'en¿¿o','enção');
  --
  v_string := REPLACE(v_string,'or¿a','orça');
  v_string := REPLACE(v_string,'Or¿a','Orça');
  --
  v_string := REPLACE(v_string,'ou¿a','ouça');
  --
  v_string := REPLACE(v_string,'st¿o','stão');
  --
  v_string := REPLACE(v_string,'queir¿o','queirão');
  --
  v_string := REPLACE(v_string,'r¿odo','ríodo');
  --
  v_string := REPLACE(v_string,'t¿gica','tégica');
  v_string := REPLACE(v_string,'t¿gico','tégico');
  --
  v_string := REPLACE(v_string,'m¿tica','mática');
  --
  v_string := REPLACE(v_string,'a¿¿o','ação');
  v_string := REPLACE(v_string,'A¿¿o','Ação');
  v_string := REPLACE(v_string,'A¿¿O','AÇÃO');
  --
  v_string := REPLACE(v_string,'¿¿es','ções');
  v_string := REPLACE(v_string,'¿¿ES','ÇÕES');
  --
  v_string := REPLACE(v_string,'m¿o','mão');
  v_string := REPLACE(v_string,'M¿o','Mão');
  --
  v_string := REPLACE(v_string,' m¿s',' mês');
  v_string := REPLACE(v_string,' M¿s',' Mês');
  --
  v_string := REPLACE(v_string,' v¿o ',' vôo ');
  v_string := REPLACE(v_string,' V¿o ',' Vôo ');
  v_string := REPLACE(v_string,' v¿o.',' vôo.');
  v_string := REPLACE(v_string,' V¿o.',' Vôo.');
  --
  v_string := REPLACE(v_string,'a¿rea','aérea');
  v_string := REPLACE(v_string,'A¿rea','Aérea');
  v_string := REPLACE(v_string,'a¿reo','aéreo');
  v_string := REPLACE(v_string,'A¿reo','Aéreo');
  --
  v_string := REPLACE(v_string,'s¿o','são');
  v_string := REPLACE(v_string,'S¿o','São');
  v_string := REPLACE(v_string,'S¿O','SÃO');
  --
  v_string := REPLACE(v_string,'s¿es','sões');
  v_string := REPLACE(v_string,'S¿ES','SÕES');
  --
  v_string := REPLACE(v_string,'ser¿ ','será ');
  v_string := REPLACE(v_string,'Ser¿ ','Será ');
  --

--
  RETURN v_string;
--
EXCEPTION
  WHEN OTHERS THEN
    v_string := 'ERRO string';
    RETURN v_string;
END;

/
--------------------------------------------------------
--  DDL for Function ACENTO_RETIRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ACENTO_RETIRAR" (p_string in varchar2)
RETURN  varchar2 IS

v_string varchar2(32000);

BEGIN
  v_string := LTRIM(RTRIM(LOWER(p_string)));
  v_string := TRANSLATE(v_string,
              'áéíóúâêîôûàèìòùãõüç','aeiouaeiouaeiouaouc');
  RETURN v_string;

EXCEPTION
  WHEN OTHERS THEN
    v_string := 'ERRO string';
    RETURN v_string;
END;

/
--------------------------------------------------------
--  DDL for Function BYTES_NOTACAO_RETORNAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BYTES_NOTACAO_RETORNAR" (
-----------------------------------------------------------------------
--   MOEDA_MOSTRAR
--
--   Descricao: retorna um string com a notacao em bytes,KB,MB,GB
-----------------------------------------------------------------------
  p_bytes                      IN NUMBER)
RETURN  VARCHAR2
IS
  TYPE t_notacao IS VARRAY(4) OF VARCHAR2(10);
  v_ok                         INTEGER;
  v_retorno                    VARCHAR2(100);
  v_numero                     NUMBER;
  v_ind                        NUMBER(10);
  v_notacao                    t_notacao;
BEGIN
--
  v_notacao := t_notacao('bytes', 'KB', 'MB', 'GB');
  v_numero := p_bytes;
  v_ind := 1;
  v_retorno := NULL;
--
  WHILE v_numero/1024 >= 1 AND v_ind < 4 LOOP
    v_numero := v_numero / 1024;
    v_ind := v_ind + 1;
  END LOOP;
--
  IF p_bytes IS NOT NULL THEN
     v_retorno := TO_CHAR(v_numero,'99999999999999999999D99', 'NLS_NUMERIC_CHARACTERS = '',.'' ') ||
                  ' ' || v_notacao(v_ind);
  END IF;
--
  RETURN v_retorno;
EXCEPTION
  WHEN OTHERS THEN
    v_retorno := 'ERRO';
    RETURN v_retorno;
END;

/
--------------------------------------------------------
--  DDL for Function CAP_INICIAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CAP_INICIAR" -----------------------------------------------------------------------
-- cap_iniciar
--
--   Descricao: dado um string, inicializa as palavras com maiuscula,
--   com excecao das preposicoes.
-----------------------------------------------------------------------
  (p_string in varchar2)
RETURN  varchar2 IS

v_string varchar2(2000);

BEGIN
  v_string := INITCAP(p_string);
  v_string := REPLACE(v_string,' Da ',' da ');
  v_string := REPLACE(v_string,' De ',' de ');
  v_string := REPLACE(v_string,' Do ',' do ');
  v_string := REPLACE(v_string,' Das ',' das ');
  v_string := REPLACE(v_string,' Dos ',' dos ');
  v_string := REPLACE(v_string,' E ',' e ');
  v_string := REPLACE(v_string,' Em ',' em ');
  v_string := REPLACE(v_string,' No ',' no ');
  v_string := REPLACE(v_string,' Na ',' na ');
  v_string := REPLACE(v_string,' À ',' à ');
  v_string := REPLACE(v_string,' Ao ',' ao ');
  RETURN v_string;

EXCEPTION
  WHEN OTHERS THEN
    v_string := 'ERRO string';
    RETURN v_string;
END;

/
--------------------------------------------------------
--  DDL for Function CHAR_ESPECIAL_RETIRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CHAR_ESPECIAL_RETIRAR" (
-----------------------------------------------------------------------
--   char_especial_retirar
--
--   Descricao: retira eventuais caracteres especiais de um dado string
-----------------------------------------------------------------------
  p_string in varchar2)
RETURN  varchar2 IS
--
v_string varchar2(4000);
--
BEGIN
  v_string := TRIM(p_string);
--
  v_string := TRIM(REPLACE(v_string, chr(13), ''));
  v_string := TRIM(REPLACE(v_string, chr(10), '|'));
--
  --v_string := TRIM(REPLACE(v_string, '&', '&amp;'));
  --v_string := TRIM(REPLACE(v_string, '>', '&gt;'));
  --v_string := TRIM(REPLACE(v_string, '<', '&lt;'));
  --v_string := TRIM(REPLACE(v_string, '"', '&quot;'));
--
  --v_string := TRIM(REPLACE(v_string, chr(147), '&ldquo;'));
  --v_string := TRIM(REPLACE(v_string, chr(148), '&rdquo;'));
  --v_string := TRIM(REPLACE(v_string, chr(145), '&lsquo;'));
  --v_string := TRIM(REPLACE(v_string, chr(146), '&rsquo;'));
--
  RETURN v_string;
--
EXCEPTION
  WHEN OTHERS THEN
    v_string := 'ERRO string';
    RETURN v_string;
END;

/
--------------------------------------------------------
--  DDL for Function CHARSET_RETORNAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CHARSET_RETORNAR" 
-----------------------------------------------------------------------
--   charset_retornar
--
--   Descricao: retorna o charset do banco
-----------------------------------------------------------------------
RETURN  VARCHAR2 IS
--
v_string  VARCHAR2(50);
--
BEGIN
  SELECT value
    INTO v_string
    FROM nls_database_parameters
   WHERE parameter = 'NLS_CHARACTERSET';
--
  RETURN v_string;
--
EXCEPTION
  WHEN OTHERS THEN
    v_string := 'ERRO string';
    RETURN v_string;
END;

/
--------------------------------------------------------
--  DDL for Function COMPARAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "COMPARAR"  (p_numero in number, p_condicao in varchar2, p_constante in number)
-----------------------------------------------------------------------
--   COMPARAR
--
--   Descricao: funcao que compara um numero com uma constante baseado numa
--   condicao. Retorna 1 caso a comparacao seja verdadeira e 0 caso nao.
-----------------------------------------------------------------------
RETURN  integer IS

v_ok number;

BEGIN
  v_ok := 0;
  IF p_condicao = '=' THEN
     IF p_numero = p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '>' THEN
     IF p_numero > p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '>=' THEN
     IF p_numero >= p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '<' THEN
     IF p_numero < p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '<=' THEN
     IF p_numero <= p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '<>' OR p_condicao = '!=' THEN
     IF p_numero <> p_constante THEN
        v_ok := 1;
     END IF;
  END IF;

  RETURN v_ok;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function COMPARAR_DATA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "COMPARAR_DATA"  (p_data in DATE, p_condicao in varchar2, p_constante in DATE)
-----------------------------------------------------------------------
--   COMPARAR
--
--   Descricao: funcao que compara uma data com uma constante baseado numa
--   condicao. Retorna 1 caso a comparacao seja verdadeira e 0 caso nao.
-----------------------------------------------------------------------
RETURN  integer IS

v_ok number;

BEGIN
  v_ok := 0;
  IF p_condicao = '=' THEN
     IF p_data = p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '>' THEN
     IF p_data > p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '>=' THEN
     IF p_data >= p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '<' THEN
     IF p_data < p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '<=' THEN
     IF p_data <= p_constante THEN
        v_ok := 1;
     END IF;
  ELSIF p_condicao = '<>' OR p_condicao = '!=' THEN
     IF p_data <> p_constante THEN
        v_ok := 1;
     END IF;
  END IF;

  RETURN v_ok;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function COORD_CONVERTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "COORD_CONVERTER" -----------------------------------------------------------------------
-- COORD_CONVERTER
--
--   Descricao: função que converte um string previamente validado
--   em numero. O string pode estar tanto no formato
--   '99999.9999999'.
-----------------------------------------------------------------------
     (p_numero IN VARCHAR2)
RETURN   NUMBER
IS
v_ok             INTEGER;
v_numero         NUMBER;
v_numero_char    VARCHAR2(30);
--
BEGIN
  v_numero := NULL;
  v_numero_char := RTRIM(REPLACE(p_numero,',',''));
--
  v_numero := TO_NUMBER(v_numero_char,'99999D9999999', 'NLS_NUMERIC_CHARACTERS = ''.,'' ');
--
  RETURN v_numero;
EXCEPTION
  WHEN OTHERS THEN
    v_numero := 99999999;
    RETURN v_numero;
END;

/
--------------------------------------------------------
--  DDL for Function COORD_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "COORD_VALIDAR" (p_numero in varchar2)
RETURN    INTEGER
IS
v_ok               INTEGER;
v_numero_char      VARCHAR2(30);
v_numero           NUMBER;
v_pos              INTEGER;
BEGIN
  v_ok := 0;
--
  IF INSTR(p_numero,',') > 0 THEN
     RETURN v_ok;
  END IF;
--
  v_numero_char := RTRIM(p_numero);
--
  v_numero := to_number(v_numero_char,'99999D9999999','NLS_NUMERIC_CHARACTERS = ''.,'' ');
  v_ok := 1;
--
  RETURN v_ok;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_CONVERTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_CONVERTER" -----------------------------------------------------------------------
-- DATA_CONVERTER
--
--   Descricao: funcao que converte um string contendo uma data no
--   formato 'DD/MM/YYYY'.
-----------------------------------------------------------------------
  (p_data in varchar2)
RETURN  DATE IS
--
v_data date;
--
BEGIN
  v_data := NULL;
  v_data := to_date(p_data,'dd/mm/yyyy');

  RETURN v_data;
--
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_data;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_DIF_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_DIF_MOSTRAR" (
-----------------------------------------------------------------------
-- DATA_DIF_MOSTRAR
--
--   Descricao: mostra a diferenca entre duas datas no formato 
--    HH:MI:SS
-----------------------------------------------------------------------
  p_data_menor              IN    DATE,
  p_data_maior              IN    DATE)
RETURN  VARCHAR2 IS
--
v_ok integer;
v_dif varchar2(20);
--
BEGIN
  IF p_data_menor IS NULL OR p_data_maior IS NULL OR
     p_data_menor > p_data_maior THEN
     v_dif := NULL;
  ELSE
     v_dif := TRIM(TO_CHAR(trunc((p_data_maior-p_data_menor) * 24),'999900')) || ':' ||
              TRIM(TO_CHAR(mod(trunc((p_data_maior-p_data_menor) * 1440), 60 ),'00')) || ':' ||
              TRIM(TO_CHAR(mod(trunc((p_data_maior-p_data_menor) * 86400), 60 ),'00'));
  END IF;
--
  RETURN v_dif;
--
EXCEPTION
  WHEN OTHERS THEN
    v_dif := 'Erro DIF';
    RETURN v_dif;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_HORA_CONVERTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_HORA_CONVERTER" -----------------------------------------------------------------------
-- DATA_HORA_CONVERTER
--
--   Descricao: funcao que converte um string contendo uma data no
--   formato 'DD/MM/YYYY HH24:MI'.
-----------------------------------------------------------------------
  (p_data in varchar2)
RETURN  DATE IS
--
v_data date;
--
BEGIN
  v_data := NULL;
  v_data := to_date(p_data,'dd/mm/yyyy hh24:mi');

  RETURN v_data;
--
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_data;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_HORA_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_HORA_MOSTRAR" -----------------------------------------------------------------------
-- DATA_HORA_MOSTRAR
--
--   Descricao: funcao que converte uma data para o formato CHAR,
--   usando a mascara de saida 'DD/MM/YYYY HH:MI'. So' deve ser usada
--   em colunas/variaveis do tipo DATE. Caso o valor da coluna/variavel
--   seja NULL, a funcao tambem retorna NULL.
-----------------------------------------------------------------------
  (p_data in date)
RETURN  varchar2 IS
--
v_ok integer;
v_data varchar2(20);
--
BEGIN
  v_ok := 0;
  v_data := to_char(p_data,'dd/mm/yyyy hh24:mi');
  v_ok := 1;
  RETURN v_data;
--
EXCEPTION
  WHEN OTHERS THEN
    v_data := 'Erro DATA';
    RETURN v_data;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_MOSTRAR" -----------------------------------------------------------------------
-- DATA_MOSTRAR
--
--   Descricao: funcao que converte uma data para o formato CHAR,
--   usando a mascara de saida 'DD/MM/YYYY'. So' deve ser usada em
--   colunas/variaveis do tipo DATE. Caso o valor da  coluna/variavel
--   seja NULL, a funcao tambem retorna NULL.
-----------------------------------------------------------------------
  (p_data in date)
RETURN  varchar2 IS
--
v_ok integer;
v_data varchar2(10);
--
BEGIN
  v_ok := 0;
  v_data := to_char(p_data,'dd/mm/yyyy');
  v_ok := 1;
  RETURN v_data;
--
EXCEPTION
  WHEN OTHERS THEN
    v_data := 'Erro DATA';
    RETURN v_data;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_NASC_CONVERTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_NASC_CONVERTER" -----------------------------------------------------------------------
-- DATA_NASC_CONVERTER
--
--   Descricao: funcao que converte um string contendo uma data no
--   formato 'DD/MM/YYYY' ou 'DD/MM'.
-----------------------------------------------------------------------
  (p_data in varchar2)
RETURN  DATE IS
--
v_data               date;
v_data_char          varchar(30);
--
BEGIN
  v_data := NULL;
--
  IF RTRIM(p_data) IS NOT NULL AND LENGTH(RTRIM(p_data)) <= 5 THEN
     v_data_char := RTRIM(p_data) || '/1904';
  ELSE
     v_data_char := RTRIM(p_data);
  END IF;

  v_data := TO_DATE(v_data_char,'dd/mm/yyyy');

  RETURN v_data;
--
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_data;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_NASC_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_NASC_MOSTRAR" -----------------------------------------------------------------------
-- DATA_NASC_MOSTRAR
--
--   Descricao: funcao que converte uma data para o formato CHAR,
--   usando a mascara de saida 'DD/MM/YYYY' ou 'DD/MM' (caso o ano seja
--   igual a 1904).
--   So' deve ser usada em colunas/variaveis do tipo DATE. Caso o valor
--   da  coluna/variavel seja NULL, a funcao tambem retorna NULL.
-----------------------------------------------------------------------
  (p_data in date)
RETURN  varchar2 IS
--
v_ok                   integer;
v_data                 varchar2(10);
v_ano                  integer;
--
BEGIN
  v_ok := 0;
  v_ano := TO_NUMBER(TO_CHAR(p_data,'yyyy'));
--
  IF v_ano = 1904 THEN
     v_data := TO_CHAR(p_data,'dd/mm');
  ELSE
     v_data := TO_CHAR(p_data,'dd/mm/yyyy');
  END IF;
--
  v_ok := 1;
  RETURN v_data;
--
EXCEPTION
  WHEN OTHERS THEN
    v_data := 'Erro DATA';
    RETURN v_data;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_NASC_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_NASC_VALIDAR" -----------------------------------------------------------------------
-- DATA_NASC_VALIDAR
--
--   Descricao: funcao que consiste um string contendo uma data no
--   formato 'DD/MM/YYYY' ou 'DD/MM'. Caso a data esteja no formato
--   DD/MM, usa-se o ano bisexto 1904 como base.
--   Retorna '1' caso o string seja uma data valida, e '0' caso nao
--   seja. Para um string igual a NULL, retorna '1'.
-----------------------------------------------------------------------
  (p_data in varchar2)
RETURN  integer IS
--
v_ok             integer;
v_data           date;
v_ano            integer;
v_data_char      varchar(30);
--
BEGIN
  v_ok := 0;
--
  IF RTRIM(p_data) IS NOT NULL AND LENGTH(RTRIM(p_data)) <= 5 THEN
     v_data_char := RTRIM(p_data) || '/1904';
  ELSE
     v_data_char := RTRIM(p_data);
  END IF;
--
  v_data := TO_DATE(v_data_char,'dd/mm/yyyy');
--
  IF RTRIM(p_data) IS NOT NULL THEN
     v_ano := TO_NUMBER(TO_CHAR(v_data,'yyyy'));
     IF v_ano > 1000 THEN
        v_ok := 1;
     END IF;
  ELSE
     v_ok := 1;
  END IF;
  RETURN v_ok;
--
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function DATA_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DATA_VALIDAR" -----------------------------------------------------------------------
-- DATA_VALIDAR
--
--   Descricao: funcao que consiste um string contendo uma data no
--   formato 'DD/MM/YYYY'. Retorna '1' caso o string seja uma data
--   valida, e '0' caso nao seja. Para um string igual a NULL,
--   retorna '1'.
-----------------------------------------------------------------------
  (p_data in varchar2)
RETURN  integer IS
--
v_ok integer;
v_data date;
v_ano integer;
--
BEGIN
  v_ok := 0;
  v_data := to_date(p_data,'dd/mm/yyyy');
  IF RTRIM(p_data) IS NOT NULL THEN
     v_ano := to_number(to_char(v_data,'yyyy'));
     IF v_ano > 1000 THEN
        v_ok := 1;
     END IF;
  ELSE
     v_ok := 1;
  END IF;
  RETURN v_ok;
--
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function DIA_SEMANA_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DIA_SEMANA_MOSTRAR" (
  p_data             IN DATE,
  p_flag_extenso     IN VARCHAR2 DEFAULT 'N')
RETURN  VARCHAR2 IS
--
v_ok      INTEGER;
v_dia     VARCHAR2(30);
v_int     INTEGER;
--
BEGIN
  v_ok := 0;
  IF p_flag_extenso = 'N' THEN
     -- mostra dia da semana abreviado (default qdo o parametro nao for
     -- passado).
     SELECT  DECODE(TO_CHAR(p_data,'D'),
               '1','Dom','2','Seg','3','Ter',
               '4','Qua','5','Qui','6','Sex','7','Sab')
     INTO v_dia FROM DUAL;
  ELSE
     -- mostra dia da semana por extenso
     SELECT  DECODE(TO_CHAR(p_data,'D'),
            '1','Domingo','2','Segunda-Feira','3','Terça-Feira',
            '4','Quarta-Feira','5','Quinta-Feira','6','Sexta-Feira','7','Sábado')
     INTO v_dia FROM DUAL;
  END IF;
--
  SELECT to_char(p_data,'DD')
    INTO v_int FROM DUAL;
--
--  v_dia := TRIM(TO_CHAR(v_int,'00')) || ' (' || v_dia || ')';
--
  v_ok := 1;
  RETURN v_dia;
--
EXCEPTION
  WHEN OTHERS THEN
    v_dia := 'Erro DATA';
    RETURN v_dia;
END;

/
--------------------------------------------------------
--  DDL for Function DIG_MOD11_RETORNAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DIG_MOD11_RETORNAR" 
-----------------------------------------------------------------------
--   DIG_MOD11_RETORNAR
--
-- O parâmetro pCodigo deve estar sem o dígito para o cálculo
-----------------------------------------------------------------------
(pCodigo VARCHAR2)

RETURN NUMBER
IS
lnmbSoma      NUMBER := 0;
lnmbFator     NUMBER := 9;
lnmbTamCodigo NUMBER;
BEGIN
--
  -- Seleciona o tamanho do código para saber quantas vezes é necessário iterar no loop
  lnmbTamCodigo := LENGTH(TRIM(pCodigo));
--
  -- Loop dos cálculos
  FOR i IN REVERSE 1..lnmbTamCodigo LOOP
    --
    IF (lnmbFator = 9) THEN
       lnmbFator := 2;
    ELSE
       lnmbFator := lnmbFator + 1;
    END IF;
    --
    lnmbSoma := lnmbSoma + (lnmbFator *
          SUBSTR(pCodigo, i, 1));
  END LOOP;
  --
  -- Se o dígito for maior que 9, retornar zero ...
  IF (11 - (lnmbSoma MOD 11)) > 9 THEN
      RETURN 0;
  -- ... Caso contrário, o dígito
  ELSE
      RETURN 11 - (lnmbSoma MOD 11);
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    RETURN 999;
--
END;

/
--------------------------------------------------------
--  DDL for Function EMAIL_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "EMAIL_VALIDAR" (p_email IN VARCHAR2)
-----------------------------------------------------------------------
--   EMAIL_VALIDAR
--
--   Descricao: funcao que valida email. Retorna '1' caso o string seja
--   um email num formato valido e'0' caso nao seja. Para um string
--   igual a NULL, retorna '1'.
-----------------------------------------------------------------------
RETURN  integer IS

v_letras                  VARCHAR2(255);
v_email                   VARCHAR2(255);
v_idx                     INTEGER;
v_max                     INTEGER;
v_ok                      INTEGER;
v_exception               EXCEPTION;
--
BEGIN
  v_letras := 'abcdefghijklmnopqrstuvwxyz1234567890_-.@';
  v_email := LTRIM(RTRIM(LOWER(p_email)));
  v_max := LENGTH(v_email);
  v_idx := 0;
  v_ok := 1;
--
  IF v_email IS NOT NULL THEN
     IF NOT v_email LIKE '_%@_%.__%' THEN
        RAISE v_exception;
     END IF;
     --
     -- nao aceita ponto-ponto junto
     IF INSTR(v_email,'..',1) > 0 THEN
        RAISE v_exception;
     END IF;
     --
     -- nao aceita ponto no final
     IF SUBSTR(v_email,v_max,1) = '.' THEN
        RAISE v_exception;
     END IF;
     --
     WHILE v_idx < v_max AND v_ok = 1
     LOOP
       v_idx := v_idx+ 1;
       IF NOT v_letras LIKE '%' || SUBSTR(v_email, v_idx, 1) || '%'  THEN
          v_ok := 0;
       END IF;
     END LOOP;
  END IF;
--
  RETURN v_ok;
EXCEPTION
  WHEN v_exception THEN
    v_ok := 0;
    RETURN v_ok;
  WHEN OTHERS THEN
    v_ok := 0;
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function FLAG_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FLAG_VALIDAR" -----------------------------------------------------------------------
-- FLAG_VALIDAR
--
--   Descricao: funcao que consiste valores validos para um atributo
--   do tipo flag.
-----------------------------------------------------------------------
  (p_flag in varchar2)
RETURN  integer IS
--
v_ok integer;
--
BEGIN
  v_ok := 0;
  IF RTRIM(p_flag) IN ('S','N') THEN
     v_ok := 1;
  END IF;
  RETURN v_ok;
--
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function FORMATO_RETIRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FORMATO_RETIRAR" -----------------------------------------------------------------------
-- formato_retirar
--
--   Descricao: retira eventual formatação de um dado string contendo
--     numeros
-----------------------------------------------------------------------
  (p_string in varchar2)
RETURN  varchar2 IS

v_string varchar2(500);

BEGIN
  v_string := TRIM(REPLACE(p_string,'-',''));
  v_string := TRIM(REPLACE(v_string,'.',''));
  v_string := TRIM(REPLACE(v_string,' ',''));
  v_string := TRIM(REPLACE(v_string,',000000',''));
  v_string := TRIM(REPLACE(v_string,',00000',''));
  v_string := TRIM(REPLACE(v_string,',0000',''));
  v_string := TRIM(REPLACE(v_string,',000',''));
  v_string := TRIM(REPLACE(v_string,',00',''));
  v_string := TRIM(REPLACE(v_string,',0',''));
  RETURN v_string;

EXCEPTION
  WHEN OTHERS THEN
    v_string := 'ERRO string';
    RETURN v_string;
END;

/
--------------------------------------------------------
--  DDL for Function HORA_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "HORA_MOSTRAR" (
-----------------------------------------------------------------------
--   Descricao: funcao que converte uma data para o formato CHAR,
--   usando a mascara de saida 'HH:MI'. So' deve ser usada
--   em colunas/variaveis do tipo DATE. Caso o valor da coluna/variavel
--   seja NULL, a funcao tambem retorna NULL.
-----------------------------------------------------------------------
p_data                        IN DATE)
RETURN  VARCHAR2
IS
v_ok                          INTEGER;
v_hora                        VARCHAR2(10);
BEGIN
  v_ok := 0;
  v_hora := to_char(p_data,'HH24:MI');
  v_ok := 1;
  RETURN v_hora;
EXCEPTION
  WHEN OTHERS THEN
    v_hora := 'Erro HORA';
    RETURN v_hora;
END;

/
--------------------------------------------------------
--  DDL for Function HORA_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "HORA_VALIDAR" -----------------------------------------------------------------------
-- HORA_VALIDAR
--
--   Descricao: funcao que consiste um string contendo uma hora no
--   formato 'HH:MI'. Retorna '1' caso o string seja uma hora
--   valida, e '0' caso nao seja. Para um string igual a NULL,
--   retorna '1'.
-----------------------------------------------------------------------
  (p_hora in varchar2)
RETURN  integer IS

v_ok           integer;
v_data         date;
v_hora         VARCHAR2(20);

BEGIN
  v_ok := 0;
  v_hora := RTRIM(REPLACE(p_hora, ' ',''));
  --
  IF RTRIM(v_hora) IS NULL THEN
     v_ok := 1;
     RETURN v_ok;
  END IF;
  --
  IF LENGTH(RTRIM(v_hora)) <> 5 OR INSTR(v_hora,':') <> 3 THEN
     v_ok := 0;
     RETURN v_ok;
  END IF;
  --
  v_data := to_date(v_hora,'hh24:mi');
  v_ok := 1;
  RETURN v_ok;

EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function IDADE_CALCULAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "IDADE_CALCULAR" -----------------------------------------------------------------------
-- IDADE_CALCULAR
--
--   Descricao: funcao que calcula o intervalo de tempo entre uma data
--   de referencia (SYSDATE) e a data de nascimento. Retorna um
--   valor numerico, em anos.
-----------------------------------------------------------------------
  (p_data_nasc in date)
RETURN  NUMBER IS

v_tot_meses number;
v_anos      number;
v_idade     number;
v_data_ref  date;

e_ERRO      exception;

BEGIN
v_anos := 0;
v_data_ref := SYSDATE;

IF v_data_ref IS NULL OR
   p_data_nasc IS NULL OR
   v_data_ref < p_data_nasc THEN
   RAISE e_ERRO;
END IF;

-- calcula intervalo de meses entre a data de referencia e a de nascimento
  v_tot_meses := nvl(months_between(v_data_ref,p_data_nasc),0);

-- transforma total de meses em anos
   v_anos := ROUND(v_tot_meses / 12,3);


  v_idade := v_anos ;
  RETURN v_idade;

EXCEPTION
  WHEN e_ERRO THEN
    v_idade := NULL;
    RETURN v_idade;
  WHEN OTHERS THEN
    v_idade := NULL;
    RETURN v_idade;
END;

/
--------------------------------------------------------
--  DDL for Function INTEIRO_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "INTEIRO_VALIDAR" -----------------------------------------------------------------------
-- INTEIRO_VALIDAR
--
--   Descricao: funcao que verifica se um string e' um numero inteiro
--   valido, com ate' 20 digitos. Retorna '1' caso seja valido, e '0'
--   caso nao seja. Para um string igual a NULL, retorna '1'.
-----------------------------------------------------------------------
  (p_numero in varchar2)
RETURN  integer IS
--
v_ok integer;
v_numero number;
--
BEGIN
  v_ok := 0;
  v_numero := to_number(p_numero);
  v_numero := to_number(p_numero,'99999999999999999999');
  v_ok := 1;
  RETURN v_ok;
--
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function LEFT_STRING
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "LEFT_STRING" (p_string      IN  VARCHAR2,
                      p_delimitador IN  CHAR DEFAULT ',')
-----------------------------------------------------------------------
--   LEFT_STRING
--
--   Descricao: retorna o string a esquerda do delimitador.
-----------------------------------------------------------------------
RETURN VARCHAR2
IS

v_pos     INTEGER;
v_string  VARCHAR2(2000);

BEGIN
--Coloca o delimitador no final do string caso o string não tenha
  IF (RTRIM(p_string) IS NOT NULL) AND
     (SUBSTR(p_string,length(p_string)) <> p_delimitador) THEN
     v_string := RTRIM(p_string) || p_delimitador;
  ELSE
     v_string := RTRIM(p_string);
  END IF;
--
  -- localiza a posicao do primeiro delimitador no string
  v_pos := INSTR(v_string, p_delimitador, 1, 1);
--
  -- isola o grupo que vem antes do delimitador
  v_string := RTRIM(SUBSTR(v_string, 1, v_pos - 1));
--
  RETURN v_string;
END; -- PROX_VALOR_RETORNAR

/
--------------------------------------------------------
--  DDL for Function MES_ABREV_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MES_ABREV_MOSTRAR" -----------------------------------------------------------------------
-- MES_ABREV_MOSTRAR
--
--   Descricao: funcao que retorna o mes por abreviado, dado um determinado
--   mes numerico (1 a 12). Caso o valor do mes
--   seja NULL ou zero, a funcao tambem retorna NULL.
-----------------------------------------------------------------------
  (p_mes in VARCHAR2)
RETURN  varchar2 IS
--
v_ok        integer;
v_mes       varchar2(40);
--
BEGIN
--
  SELECT DECODE(TO_NUMBER(RTRIM(p_mes)),
         1,'Jan',2,'Fev',3,'Mar',4,'Abr',
         5,'Mai',6,'Jun',7,'Jul',8,'Ago',
         9,'Set',10,'Out',11,'Nov',12,'Dez','')
    INTO v_mes
    FROM dual;
--
  RETURN v_mes;
--
EXCEPTION
  WHEN OTHERS THEN
    v_mes := '';
    RETURN v_mes;
END;

/
--------------------------------------------------------
--  DDL for Function MES_ANO_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MES_ANO_MOSTRAR" -----------------------------------------------------------------------
-- MES_ANO_MOSTRAR
--
--   Descricao: funcao que converte uma data para o formato CHAR,
--   usando a mascara de saida 'MMM/YYYY', onde MMM indica o mes
--   abreviado. So' deve ser usada em
--   colunas/variaveis do tipo DATE. Caso o valor da  coluna/variavel
--   seja NULL, a funcao tambem retorna NULL.
-----------------------------------------------------------------------
  (p_data in date)
RETURN  varchar2 IS
--
v_data varchar2(10);
--
BEGIN
  v_data := to_char(p_data,'dd/mm/yyyy');
--
  SELECT DECODE(TO_NUMBER(TO_CHAR(p_data,'mm')),
         1,'Jan',2,'Fev',3,'Mar',4,'Abr',
         5,'Mai',6,'Jun',7,'Jul',8,'Ago',
         9,'Set',10,'Out',11,'Nov',12,'Dez','') || '/' ||
         TO_CHAR(p_data,'yyyy')
    INTO v_data
    FROM dual;
--
  RETURN v_data;
--
EXCEPTION
  WHEN OTHERS THEN
    v_data := 'Erro DATA';
    RETURN v_data;
END;

/
--------------------------------------------------------
--  DDL for Function MES_ANO_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MES_ANO_VALIDAR" (
-----------------------------------------------------------------------
--   MES_ANO_VALIDAR
--
--   Descricao: funcao que consiste um string contendo uma data no
--   formato 'mm/yyyy'. Retorna '1' caso o string seja ok e '0'
--   caso nao. Para um string igual a NULL, retorna '1'.
-----------------------------------------------------------------------
p_mes_ano IN VARCHAR2
)
RETURN  INTEGER IS

v_ok              INTEGER;
v_data            DATE;
v_mes_ano         VARCHAR2(20);

BEGIN
  v_ok := 0;
  --
  IF RTRIM(p_mes_ano) IS NULL THEN
     v_ok := 1;
     RETURN v_ok;
  END IF;
  --
  IF LENGTH(RTRIM(p_mes_ano)) <> 7 OR INSTR(p_mes_ano,'/') <> 3 THEN
     v_ok := 0;
     RETURN v_ok;
  END IF;
  --
  v_data := to_date('01/'||p_mes_ano,'dd/mm/yyyy');
  v_ok := 1;
  RETURN v_ok;

EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function MES_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MES_MOSTRAR" -----------------------------------------------------------------------
-- MES_MOSTRAR
--
--   Descricao: funcao que retorna o mes por extenso, dado um determinado
--   mes numerico (1 a 12). Caso o valor do mes
--   seja NULL ou zero, a funcao tambem retorna NULL.
-----------------------------------------------------------------------
  (p_mes in VARCHAR2)
RETURN  varchar2 IS
--
v_ok        integer;
v_mes       varchar2(40);
--
BEGIN
--
  SELECT DECODE(TO_NUMBER(RTRIM(p_mes)),
         1,'Janeiro',2,'Fevereiro',3,'Março',4,'Abril',
         5,'Maio',6,'Junho',7,'Julho',8,'Agosto',
         9,'Setembro',10,'Outubro',11,'Novembro',12,'Dezembro','')
    INTO v_mes
    FROM dual;
--
  RETURN v_mes;
--
EXCEPTION
  WHEN OTHERS THEN
    v_mes := '';
    RETURN v_mes;
END;

/
--------------------------------------------------------
--  DDL for Function MOEDA_CONVERTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MOEDA_CONVERTER" -----------------------------------------------------------------------
-- MOEDA_CONVERTER
--
--   Descricao: função que converte um string previamente validado
--   em moeda. O string pode estar tanto no formato
--   '99999999999999999999,99' como no formato
--   '99.999.999.999.999.999.999,99'
-----------------------------------------------------------------------
     (p_numero IN VARCHAR2)
RETURN   NUMBER
IS
v_ok            INTEGER;
v_moeda         NUMBER;
v_moeda_char    VARCHAR2(30);
--
BEGIN
  v_moeda := NULL;
  v_moeda_char := RTRIM(REPLACE(p_numero,'.',''));
--
  v_moeda := TO_NUMBER(v_moeda_char,'99999999999999999999D99', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
--
  RETURN v_moeda;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_moeda;
END;

/
--------------------------------------------------------
--  DDL for Function MOEDA_EXTENSO_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MOEDA_EXTENSO_MOSTRAR" (
------------------------------------------------------------------------------------------
-- DESENVOLVEDOR: Internet        OpenMind     DATA: 06/08/2002
-- DESCRICAO: retorna o valor por extenso de um numero (moeda).
--
-- ALTERADO POR      DATA        MOTIVO ALTERACAO
-- ----------------  ----------  ---------------------------------------------------------
-- xxxxxxxxxxxx      dd/mm/yyyy
------------------------------------------------------------------------------------------
  p_numero             IN  NUMBER)
RETURN   VARCHAR2 IS
--
  TYPE vetor  IS TABLE OF VARCHAR2(20) INDEX BY BINARY_INTEGER;
  TYPE vetor1 IS TABLE OF NUMBER       INDEX BY BINARY_INTEGER;
--
  SAIR_LOOP            NUMBER(3);
  CONTADOR             NUMBER(3);
  CONTA_STRING         NUMBER(3);
  pvExtenso            VARCHAR2(200);
  nResto               NUMBER; /* Resto do Numero */
  nNumero              NUMBER; /* Numero a ser analizado */
  nNumTrunc            NUMBER;
  nComplemento         NUMBER;
  nQuociente           NUMBER; /* Quociente da divisao por 10 */
  nDecimal             NUMBER;
  sDescrNumCen         vetor;
  sDescrNumDec         vetor;
  sDescrNum            vetor;
  sDescrNumExe         vetor;
  nInd                 BINARY_INTEGER;
  nInd1                BINARY_INTEGER;
  nCont                BINARY_INTEGER;
  nDigito              vetor1; /* Vetor que contem os digitos do numero */
  sNumeroExtenso       VARCHAR2(1000);
  sPrimeiroExtenso     VARCHAR2(13);
  sSegundoExtenso      VARCHAR2(13);
  sTerceiroExtenso     VARCHAR2(13);
  nCasa                NUMBER; /* Indica se digito e cen, dez ou unidade */
  nIndCen              BINARY_INTEGER;
  nIndDez              BINARY_INTEGER;
  nIndUni              BINARY_INTEGER;
  sConjuncaoCD         VARCHAR2(3); /* Conjuncao entre centena e dezena */
  sConjuncaoIn         VARCHAR2(2); /* Conjuncao inicial */
  sConjuncaoDU         VARCHAR2(3); /* Conjuncao entre dezena e unidade */
  sGrandeza            VARCHAR2(10);
  sGrandezaSing        VARCHAR2(10); /* Grandeza no singular */
  sGrandezaPlural      VARCHAR2(10); /* Grandeza em plural */
  sMoeda               VARCHAR2(10); /* Descricao da moeda */
  sCentavos            VARCHAR2(10); /* String Centavo */
  nCentavos            NUMBER; /* parte centavo do numero */
  sPreposicao          VARCHAR2(3); /* carrega preposicao DE */
  bPrimeiro            BOOLEAN; /* Indica que e o primeiro digito do numero */
  bCentavos1a9         BOOLEAN; /* Numero entre 1 a 9 centavos */
  bCentavos            BOOLEAN; /* Parte Centavos */
--
-----------------------------------
PROCEDURE CARREGA_VARIAVEIS AS
-----------------------------------
BEGIN
  /*** Centenas ***/
  sDescrNumCen(0) := NULL;
  sDescrNumCen(1) := 'cento';
  sDescrNumCen(2) := 'duzentos';
  sDescrNumCen(3) := 'trezentos';
  sDescrNumCen(4) := 'quatrocentos';
  sDescrNumCen(5) := 'quinhentos';
  sDescrNumCen(6) := 'seiscentos';
  sDescrNumCen(7) := 'setecentos';
  sDescrNumCen(8) := 'oitocentos';
  sdescrNumCen(9) := 'novecentos';
  /*** Digitos ***/
  sDescrNum(0) := NULL;
  sDescrNum(1) := 'um';
  sDescrNum(2) := 'dois';
  sDescrNum(3) := 'três';
  sDescrNum(4) := 'quatro';
  sDescrNum(5) := 'cinco';
  sDescrNum(6) := 'seis';
  sDescrNum(7) := 'sete';
  sDescrNum(8) := 'oito';
  sDescrNum(9) := 'nove';
  /*** Dezenas ***/
  sDescrNumDec(0) := NULL;
  sDescrNumDec(1) := 'dez';
  sDescrNumDec(2) := 'vinte';
  sDescrNumDec(3) := 'trinta';
  sDescrNumDec(4) := 'quarenta';
  sDescrNumDec(5) := 'cinquenta';
  sDescrNumDec(6) := 'sessenta';
  sDescrNumDec(7) := 'setenta';
  sDescrNumDec(8) := 'oitenta';
  sDescrNumDec(9) := 'noventa';
  /*** Excecoes ***/
  sDescrNumExe(0) := 'dez';
  sDescrNumExe(1) := 'onze';
  sDescrNumExe(2) := 'doze';
  sDescrNumExe(3) := 'treze';
  sDescrNumExe(4) := 'quatorze';
  sDescrNumExe(5) := 'quinze';
  sDescrNumExe(6) := 'dezesseis';
  sDescrNumExe(7) := 'dezessete';
  sDescrNumExe(8) := 'dezoito';
  sDescrNumExe(9) := 'dezenove';
END;
--
-----------------------------------
PROCEDURE VERIFICA_MOEDA AS
-----------------------------------
BEGIN
  nNumero := NVL(p_numero,0);
--
  -- Verifica Moeda */
  IF nNumero >= 1 AND nNumero < 2 THEN
     sMoeda := 'real ';
  ELSIF nNumero < 1 THEN
     sMoeda := NULL;
  ELSE
     sMoeda := 'reais ';
  END IF;
--
  nNumTrunc := TRUNC(nNumero); /* Obtem numero Inteiro */
  nCentavos := nNumero - nNumTrunc; /* Obtem Centavos */
--
  -- Verifica Centavos */
  IF nCentavos = 0.01 THEN
     sCentavos := 'centavo';
  ELSIF nCentavos = 0 THEN
     sCentavos := NULL;
  ELSE
     sCentavos := 'centavos';
  END IF;
--
  IF nCentavos >= 0.01 AND nCentavos <= 0.09 THEN /* Centavos entre 1 a 9 */
     bCentavos1a9 := true;
  END IF;
--
  nNumero := nNumero*100; /* Multiplica numero por cem */
END;
--
PROCEDURE CARREGA_DIGITOS_ARRAY AS
----------------------------------------------------------------------
-- Esta procedure divide o numero em questao por dez sucessivamente para
-- obter os digitos separadamente, carregando os em um ARRAY.
-- O resto da divisao por 10 nos da o digito atraves do comando MOD
-- nInd contera o numero de digitos
----------------------------------------------------------------------
BEGIN
  nInd := 0;
--
  LOOP
    nResto := MOD(nNumero,10);
    nInd := nInd + 1;
    nDigito(nInd) := nResto;
    nComplemento := nNumero - nResto;
    nQuociente := nComplemento/10;
--
    IF nQuociente = 0 THEN
       IF sMoeda IS NULL AND nInd = 1 THEN /* Numero de 1 a nove centavos */
          nInd := nInd + 1;
          nDigito(nInd) := 0;
       END IF;
       EXIT;
    END IF;
    nNumero := nQuociente;
  END LOOP;
END;
--
-----------------------------------
PROCEDURE TRATA_CENTENA AS
-----------------------------------
BEGIN
  nIndCen := nCont; /* Indice da Centena */
  nIndDez := nCont - 1; /* Indice da Dezena */
  nIndUni := nCont - 2; /* Indice da Unidade */
--
  -- Conjuncao entre centena e dezena
  IF nDigito(nIndDez) = 0 THEN
     sConjuncaoCD := NULL;
  ELSE
     IF nDigito(nIndCen) <> 0 THEN
        sConjuncaoCD := ' e ';
     ELSE
        sConjuncaoCD := NULL;
     END IF;
  END IF;
--
  -- Conjuncao entre dezena e unidade
  IF nDigito(nIndUni) = 0 THEN
     sConjuncaoDU := NULL;
  ELSE
     IF nDigito(nIndDez) NOT IN (1,0) THEN
        sConjuncaoDU := ' e ';
     ELSIF nDigito(nIndCen) <> 0 AND nDigito(nIndDez) = 0 THEN
        sConjuncaoDU := ' e ';
     ELSE
        sConjuncaoDU := NULL;
     END IF;
  END IF;
--
  -- Particuladares do numero um
  IF nDigito(nIndCen) = 1 AND sConjuncaoCD IS NULL AND sConjuncaoDU IS NULL THEN
     sPrimeiroExtenso := 'cem';
  ELSE
     sPrimeiroExtenso := sDescrNumCen(nDigito(nIndCen));
  END IF;
--
  IF nDigito(nIndDez) = 1 THEN
     sSegundoExtenso := sDescrNumExe(nDigito(nIndUni));
     sTerceiroExtenso := NULL;
  ELSE
     sSegundoExtenso := sDescrNumDec(nDigito(nindDez));
     sTerceiroExtenso := sDescrNum(nDigito(nIndUni));
  END IF;
--
  -- Verifica centena de zeros
  IF nDigito(nIndDez) = 0 AND nDigito(nIndCen) = 0 AND nDigito(nIndUni) = 0 THEN
     sGrandeza := NULL;
     sConjuncaoIn := NULL;
  ELSE
     IF sGrandezaPlural = ' mil ' OR sGrandezaPlural IS NULL THEN
        sPreposicao := NULL;
     END IF;
--
     IF NOT bPrimeiro THEN
        sConjuncaoIn := ', ';
     END IF;
     sGrandeza := sGrandezaPlural;
  END IF;
--
  -- Carrega Numero Extenso
  sNumeroExtenso := sNumeroExtenso||sConjuncaoIn||sPrimeiroExtenso||sConjuncaoCD||
                    sSegundoExtenso||sConjuncaoDU||sTerceiroExtenso||sGrandeza;
  nCont := nCont - 3; /* Proxima casa */
END;
--
-----------------------------------
PROCEDURE TRATA_DEZENA AS
-----------------------------------
BEGIN
  nIndDez := nCont; /* Indice da Centena */
  nIndUni := nCont - 1; /* Indicie da Unidade */
--
  -- Conjuncao entre dezena e unidade
  IF nDigito(nIndUni) = 0 THEN
     sConjuncaoDU := NULL;
  ELSE
     IF NOT bCentavos THEN /* dezena Inteira */
        IF nDigito(nIndDez) <> 1 THEN
           sConjuncaoDU := ' e ';
        ELSE
           sConjuncaoDU := NULL;
        END IF;
     ELSE /* dezena dos Centavos */
        IF nDigito(nIndDez) <> 1 AND NOT bCentavos1a9 THEN
           sConjuncaoDU := ' e ';
        ELSE
           sConjuncaoDU := NULL;
        END IF;
     END IF;
  END IF;
--
  -- Particuladares do numero um
  IF nDigito(nIndDez) = 1 THEN
     sPrimeiroExtenso := sDescrNumExe(nDigito(nIndUni));
     sSegundoExtenso := NULL;
  ELSE
     sPrimeiroExtenso := sDescrNumDec(nDigito(nIndDez));
     sSegundoExtenso := sDescrNum(nDigito(nIndUni));
  END IF;
--
  -- Carrega Numero Extenso
  sNumeroExtenso := sNumeroExtenso||sConjuncaoIn||sPrimeiroExtenso||sConjuncaoDU||
                    sSegundoExtenso||sGrandezaPlural;
  nCont := nCont - 2; /* Proxima casa */
END;
--
-----------------------------------
PROCEDURE VERIFICA_GRANDEZA AS
-----------------------------------
BEGIN
  IF nCont = 15 THEN
     sGrandezaSing := ' trilhão';
     sGrandezaPlural := ' trilhões';
     IF bPrimeiro THEN
        sPreposicao := ' de';
     END IF;
  ELSIF nCont IN (14,13,12) THEN
     sGrandezaSing := ' bilhão';
     sGrandezaPlural := ' bilhões';
     IF bPrimeiro THEN
        sPreposicao := ' de';
     END IF;
  ELSIF nCont IN (11,10,9) THEN
     sGrandezaSing := ' milhão';
     sGrandezaPlural := ' milhões';
     IF bPrimeiro THEN
        sPreposicao := ' de';
     END IF;
  ELSIF nCont IN (8,7,6) THEN
     sGrandezaSing := ' mil';
     sGrandezaPlural := ' mil';
  ELSIF ncont IN (5,4,3) THEN
     sGrandezaSing := NULL;
     sGrandezaPlural := NULL;
  END IF;
END;
--
-----------------------------------
PROCEDURE TRATA_UNIDADE AS
-----------------------------------
BEGIN
  nIndUni := nCont;
--
  IF nDigito(nIndUni) = 1 THEN
     -- sPrimeiroExtenso := 'hum';
     sPrimeiroExtenso := 'um';
     sGrandeza := sGrandezaSing;
  ELSE
     sPrimeiroExtenso := sDescrNum(nDigito(nIndUni));
     sGrandeza := sGrandezaPlural;
  END IF;
--
  -- Carrega Numero Extenso
  sNumeroExtenso := sNumeroExtenso||sPrimeiroExtenso||sGrandeza;
  nCont := nCont - 1; /* proxima casa */
END;
--
-----------------------------------
PROCEDURE CONCATENA_MOEDA AS
-----------------------------------
BEGIN
  sNumeroExtenso:= sNumeroExtenso||sPreposicao||' '||sMoeda;
END;
--
-----------------------------------
PROCEDURE CONCATENA_CENTAVOS AS
-----------------------------------
BEGIN
  sNumeroExtenso:= sNumeroExtenso||' '||sCentavos;
END;
--
PROCEDURE VERIFICA_EXTENSO AS
----------------------------------------------------------------------
-- Esta procedure varre o ARRAY que contem os digitos do numero em
-- questao. nCont contem o total de digitos. Sucessivamente nCont e
-- dividido por 3 e o resto da divisao nos possibilita determinar se o
-- a casa e uma centena, dezena ou unidade, havendo portanto
-- tratamento distintos para estes tres casos
----------------------------------------------------------------------
BEGIN
  LOOP
    IF nCont = 2 THEN /* Casa dos centavos */
       CONCATENA_MOEDA;
       IF nNumTrunc <> 0 AND nCentavos <> 0 THEN
          sConjuncaoIn := ', '; /* Conjuncao Inicial p/ centavos */
       ELSE
          sConjuncaoIn := NULL;
       END IF;
--
       bCentavos := TRUE;
       TRATA_DEZENA;
       CONCATENA_CENTAVOS;
       EXIT;
    END IF;
--
    VERIFICA_GRANDEZA;
    nCasa := MOD(nCont,3);
--
    IF nCasa = 2 THEN /* Centenas */
       TRATA_CENTENA;
    ELSIF nCasa = 1 THEN /* Dezenas */
       sConjuncaoIn := NULL;
       TRATA_DEZENA;
    ELSIF nCasa = 0 THEN /* Unidades */
       TRATA_UNIDADE;
    END IF;
--
    bPrimeiro := FALSE; /* Primeiro digito */
  END LOOP;
END;
--
--
BEGIN
   bCentavos1a9 := FALSE;
   bCentavos := FALSE;
   CARREGA_VARIAVEIS;
   VERIFICA_MOEDA;
   CARREGA_DIGITOS_ARRAY;
   sNumeroExtenso := ' ';
   nCont := nInd;
   bPrimeiro := TRUE;
   VERIFICA_EXTENSO;
   pvExtenso := LTRIM(sNumeroExtenso);
--
   CONTA_STRING := NVL(LENGTH(pvExtenso),0);
   IF CONTA_STRING > 0 THEN
      -- troca a ultima virgula por "e"
      FOR v_ind IN REVERSE 1..CONTA_STRING LOOP
          IF SUBSTR(pvExtenso,v_ind,1) = ',' THEN
             pvExtenso := SUBSTR(pvExtenso,1,v_ind-1) || ' e ' || SUBSTR(pvExtenso,v_ind+1);
             EXIT;
          END IF;
      END LOOP;
   END IF;
--
   pvExtenso := REPLACE(pvExtenso, '  ', ' ');
   RETURN pvExtenso;
EXCEPTION
   WHEN OTHERS THEN
      -- Erro: valor muito grande, negativo ou exception oracle
      pvExtenso := '##########';
      RETURN pvExtenso;
END;

/
--------------------------------------------------------
--  DDL for Function MOEDA_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MOEDA_MOSTRAR" (
-----------------------------------------------------------------------
--   MOEDA_MOSTRAR
--
--   Descricao: funcao que converte um number em um string no seguinte
--   formato moeda '99999999999999999999,99'. Retorna um string com o
--   valor convertido.
-----------------------------------------------------------------------
  p_numero                     IN NUMBER,
  p_flag_milhar                IN VARCHAR2)
RETURN  VARCHAR2
IS
  v_ok                         INTEGER;
  v_moeda                      VARCHAR2(30);
BEGIN
--
  IF p_flag_milhar = 'S' THEN
     v_moeda := TO_CHAR(p_numero,'99G999G999G999G999G999G990D00', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
  ELSE
     v_moeda := TO_CHAR(p_numero,'99999999999999999990D00', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
  END IF;
--
/*
  IF v_moeda IS NULL THEN
     v_moeda := '0';
  END IF;
*/
--
  RETURN v_moeda;
EXCEPTION
  WHEN OTHERS THEN
    v_moeda := 'ERRO';
    RETURN v_moeda;
END;

/
--------------------------------------------------------
--  DDL for Function MOEDA_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MOEDA_VALIDAR" (
-----------------------------------------------------------------------
--   MOEDA_VALIDAR
--
--   Descricao: funcao que consiste uma string nos seguintes
--   formatos moeda '99999999999999999999,99'.
--   Retorna 1 caso o string seja um valor valido, 0 caso nao seja.
--   Para um string igual a NULL, retorna 1.
--   (OBS: trabalha c/ virgula como decimal e nao aceita ponto como
--   separador de milhar).
-----------------------------------------------------------------------
   p_numero        IN VARCHAR2)
RETURN    INTEGER
IS
v_ok               INTEGER;
v_numero_char      VARCHAR2(30);
v_numero           NUMBER;
v_pos              INTEGER;
BEGIN
  v_ok := 0;
--
  -- nao aceita ponto, caso a virgula nao exista
  IF INSTR(p_numero,'.') > 0 AND INSTR(p_numero,',') = 0 THEN
     RETURN v_ok;
  END IF;
--
  v_numero_char := RTRIM(REPLACE(p_numero,'.',''));
--
  v_numero := to_number(v_numero_char,'99999999999999999999D99','NLS_NUMERIC_CHARACTERS = '',.'' ');
  IF v_numero IS NULL OR ABS(v_numero) BETWEEN 0 AND 99999999999999999999.99 THEN
     v_ok := 1;
  END IF;
--
  RETURN v_ok;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function NUMERO_CONVERTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "NUMERO_CONVERTER" -----------------------------------------------------------------------
-- NUMERO_CONVERTER
--
--   Descricao: função que converte um string previamente validado
--   em numero. O string pode estar tanto no formato
--   '99999999999999999999,99' como no formato
--   '99.999.999.999.999.999.999,99'
-----------------------------------------------------------------------
     (p_numero IN VARCHAR2)
RETURN   NUMBER
IS
v_ok             INTEGER;
v_numero         NUMBER;
v_numero_char    VARCHAR2(30);
--
BEGIN
  v_numero := NULL;
  v_numero_char := RTRIM(REPLACE(p_numero,'.',''));
--
  v_numero := TO_NUMBER(v_numero_char,'99999999999999999999D999999', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
--
  RETURN v_numero;
EXCEPTION
  WHEN OTHERS THEN
    v_numero := 99999999;
    RETURN v_numero;
END;

/
--------------------------------------------------------
--  DDL for Function NUMERO_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "NUMERO_MOSTRAR" (
-----------------------------------------------------------------------
--   NUMERO_MOSTRAR
--
--   Descricao: funcao que converte um Number em um String com seguinte
--   formato '99999999999999999999,999999' (ate 6 casas decimais,
--   dependendo do numero de casas decimais especificado).
-----------------------------------------------------------------------
     p_numero                     IN NUMBER,
     p_casas_dec                  IN INTEGER,
     p_flag_milhar                IN VARCHAR2)
RETURN  VARCHAR2
IS
v_ok         INTEGER;
v_numero     VARCHAR2(30);
BEGIN
--
  IF p_casas_dec IS NULL OR p_casas_dec >= 6  OR p_casas_dec < 0 THEN
     IF p_flag_milhar = 'S' THEN
        v_numero := TO_CHAR(p_numero,'99G999G999G999G999G999G990D000000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     ELSE
        v_numero := TO_CHAR(p_numero,'99999999999999999990D000000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     END IF;
  ELSIF p_casas_dec = 5 THEN
     IF p_flag_milhar = 'S' THEN
        v_numero := TO_CHAR(p_numero,'99G999G999G999G999G999G990D00000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     ELSE
        v_numero := TO_CHAR(p_numero,'99999999999999999990D00000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     END IF;
  ELSIF p_casas_dec = 4 THEN
     IF p_flag_milhar = 'S' THEN
        v_numero := TO_CHAR(p_numero,'99G999G999G999G999G999G990D0000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     ELSE
        v_numero := TO_CHAR(p_numero,'99999999999999999990D0000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     END IF;
  ELSIF p_casas_dec = 3 THEN
     IF p_flag_milhar = 'S' THEN
        v_numero := TO_CHAR(p_numero,'99G999G999G999G999G999G990D000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     ELSE
        v_numero := TO_CHAR(p_numero,'99999999999999999990D000', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     END IF;
  ELSIF p_casas_dec = 2 THEN
     IF p_flag_milhar = 'S' THEN
        v_numero := TO_CHAR(p_numero,'99G999G999G999G999G999G990D00', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     ELSE
        v_numero := TO_CHAR(p_numero,'99999999999999999990D00', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     END IF;
  ELSIF p_casas_dec = 1 THEN
     IF p_flag_milhar = 'S' THEN
        v_numero := TO_CHAR(p_numero,'99G999G999G999G999G999G990D0', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     ELSE
        v_numero := TO_CHAR(p_numero,'99999999999999999990D0', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     END IF;
  ELSIF p_casas_dec = 0 THEN
     IF p_flag_milhar = 'S' THEN
        v_numero := TO_CHAR(p_numero,'99G999G999G999G999G999G990', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     ELSE
        v_numero := TO_CHAR(p_numero,'99999999999999999990', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
     END IF;
  END IF;
--
/*
  IF v_numero IS NULL THEN
     v_numero := '0';
  END IF;
*/
--
  RETURN v_numero;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_numero;
END;

/
--------------------------------------------------------
--  DDL for Function NUMERO_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "NUMERO_VALIDAR" -----------------------------------------------------------------------
-- NUMERO_VALIDAR
--
--   Descricao: funcao que verifica se um string e' um numero valido,
--   do tipo DOUBLE/FLOAT. Retorna '1' caso seja valido, e '0' caso
--   nao seja. Para um string igual a NULL, retorna '1'.
--   (OBS: trabalha c/ virgula como decimal e nao aceita ponto como
--   separador de milhar).
-----------------------------------------------------------------------
     (p_numero in varchar2)
RETURN    INTEGER
IS
v_ok               INTEGER;
v_numero_char      VARCHAR2(30);
v_numero           NUMBER;
v_pos              INTEGER;
BEGIN
  v_ok := 0;
--
  -- nao aceita ponto, caso a virgula nao exista
  IF INSTR(p_numero,'.') > 0 AND INSTR(p_numero,',') = 0 THEN
     RETURN v_ok;
  END IF;
--
  v_numero_char := RTRIM(REPLACE(p_numero,'.',''));
--
  v_numero := to_number(v_numero_char,'99999999999999999999D999999','NLS_NUMERIC_CHARACTERS = '',.'' ');
  v_ok := 1;
--
  RETURN v_ok;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function PROX_VALOR_RETORNAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PROX_VALOR_RETORNAR" (p_vetor       IN OUT LONG,
                              p_delimitador IN     CHAR DEFAULT ',')
-----------------------------------------------------------------------
--   PROX_VALOR_RETORNAR
--
--   Descricao: função tem dois parâmetros de entrada, um é o delimitador dos valores
--   do vetor e outro, é o vetor que tem todos os valores separados pelo delimitador.
--   A função retorna o primeiro valor do vetor e modifica p_vetor pare que ele não tenha
--   mais o valor retornado.
--   Exemplo 1) ENTRADA : p_delimitador = ','  e  p_vetor = '1,2,3
--              SAÍDA   : return_value  = '1'  e  p_vetor = '2,3,'
--   Exemplo 2) ENTRADA : p_delimitador = ','  e  p_vetor = '2,3,'
--              SAÍDA   : return_value  = '2'  e  p_vetor = '3,'
--   Exemplo 3) ENTRADA : p_delimitador = ','  e  p_vetor = '3,'
--              SAÍDA   : return_value  = '3'  e  p_vetor = NULL
--   Exemplo 4) ENTRADA : p_delimitador = ','  e  p_vetor = NULL
--              SAÍDA   : return_value  = NULL e  p_vetor = NULL

-----------------------------------------------------------------------
RETURN LONG
IS

v_pos    INTEGER;
v_valor  LONG;

BEGIN
  -- Coloca o delimitador no final do vetor caso o vetor não tenha
  IF (RTRIM(p_vetor) IS NOT NULL) AND
     (SUBSTR(p_vetor,length(p_vetor)) <> p_delimitador) THEN
     p_vetor := RTRIM(p_vetor) || p_delimitador;
  ELSE
     p_vetor := RTRIM(p_vetor);
  END IF;
--
  -- localiza a posicao do primeiro delimitador no vetor
  v_pos := INSTR(p_vetor, p_delimitador, 1, 1);
--
  -- extrai o string que vem antes do delimitador
  v_valor := RTRIM(SUBSTR(p_vetor, 1, v_pos - 1));
--
  -- troca eventual tag de pipe pelo pipe verdadeiro
  v_valor := REPLACE(v_valor,'[pipe]','|');
--
  -- pega o string restante (apos o delimitador)
  p_vetor := SUBSTR(p_vetor, v_pos + 1);
--
  RETURN v_valor;
END; -- PROX_VALOR_RETORNAR

/
--------------------------------------------------------
--  DDL for Function TAXA_CONVERTER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TAXA_CONVERTER" -----------------------------------------------------------------------
-- TAXA_CONVERTER
--
--   Descricao: função que converte um string previamente validado
--   em numero. O string pode estar tanto no formato
--   '99999999999999999999,99' como no formato
--   '99.999.999.999.999.999.999,99'
-----------------------------------------------------------------------
     (p_numero IN VARCHAR2)
RETURN   NUMBER
IS
v_ok             INTEGER;
v_numero         NUMBER;
v_numero_char    VARCHAR2(30);
--
BEGIN
  v_numero := NULL;
  v_numero_char := RTRIM(REPLACE(p_numero,'.',''));
--
  v_numero := TO_NUMBER(v_numero_char,'99999999999999999999D999999', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
--
  RETURN v_numero;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_numero;
END;

/
--------------------------------------------------------
--  DDL for Function TAXA_MOSTRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TAXA_MOSTRAR" -----------------------------------------------------------------------
-- TAXA_MOSTRAR
--
--   Descricao: funcao que converte um number em um string no seguinte
--   formato '99999,99'. Retorna um string com o
--   valor convertido.
-----------------------------------------------------------------------
     (p_numero IN NUMBER)
RETURN  VARCHAR2
IS
v_ok         INTEGER;
v_numero     VARCHAR2(30);
BEGIN
  v_numero := NULL;
--
  v_numero := TO_CHAR(p_numero,'99990D00', 'NLS_NUMERIC_CHARACTERS = '',.'' ');
--
  RETURN v_numero;
EXCEPTION
  WHEN OTHERS THEN
    v_numero := 'ERRO';
    RETURN v_numero;
END;

/
--------------------------------------------------------
--  DDL for Function TAXA_VALIDAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TAXA_VALIDAR" (
-----------------------------------------------------------------------
-- TAXA_VALIDAR
--
--   Descricao: funcao que verifica se um string e' uma taxa valida
--   (entre 0 e 100). Retorna '1' caso seja valida, e '0' caso
--   nao seja. Para um string igual a NULL, retorna '1'.
-----------------------------------------------------------------------
p_numero        IN  VARCHAR2)
--
RETURN  INTEGER
IS
v_ok integer;
BEGIN
  v_ok := 0;
--
  -- nao aceita ponto decimal
  IF INSTR(p_numero,'.') > 0 THEN
     RETURN v_ok;
  END IF;
--
  IF p_numero IS NULL OR
     (numero_validar(p_numero) = 1 AND numero_converter(p_numero) BETWEEN 0 AND 100) THEN
     v_ok := 1;
  END IF;
  RETURN v_ok;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
--------------------------------------------------------
--  DDL for Function ULT_VALOR_RETORNAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ULT_VALOR_RETORNAR" (p_vetor       IN OUT VARCHAR2,
                             p_delimitador IN  CHAR DEFAULT ',')
-----------------------------------------------------------------------
--   ULT_VALOR_RETORNAR
--
--   Descricao: função tem dois parâmetros de entrada, um é o delimitador dos valores
--   do vetor e outro, é o vetor que tem todos os valores separados pelo delimitador.
--   A função retorna o ultimo valor do vetor a direita do delimitador, e modifica
--   p_vetor pare que ele não tenha mais o valor retornado.
--
--   Exemplo 1) ENTRADA : p_delimitador = ','  e  p_vetor = '1,2,3
--              SAÍDA   : return_value  = '3'  e  p_vetor = '1,2'
--
--   Exemplo 2) ENTRADA : p_delimitador = ','  e  p_vetor = '2,3,'
--              SAÍDA   : return_value  = NULL e  p_vetor = '2,3,'
--
--   Exemplo 3) ENTRADA : p_delimitador = ','  e  p_vetor = '3'
--              SAÍDA   : return_value  = NULL e  p_vetor = '3'
--
--   Exemplo 4) ENTRADA : p_delimitador = ','  e  p_vetor = NULL
--              SAÍDA   : return_value  = NULL e  p_vetor = NULL

-----------------------------------------------------------------------
RETURN VARCHAR2
IS

v_pos       INTEGER;        -- posicao do ultimo delimitador encontrado
v_valor     VARCHAR2(2000); -- valor a direita do ultimo delimitador
v_len       INTEGER;        -- tamanho total do vetor
v_ind       INTEGER;
v_achou     INTEGER;

BEGIN
  v_pos := 0;
  v_len := NVL(LENGTH(p_vetor),0);
  v_ind := v_len;
  v_achou := 0;
--
  WHILE v_achou = 0 AND v_ind > 0 LOOP
    IF SUBSTR(p_vetor,v_ind,1) = p_delimitador THEN
       v_achou := 1;
       v_pos := v_ind;
    ELSE
       v_ind := v_ind - 1;
    END IF;
  END LOOP;
--
  IF v_achou = 1 THEN
     IF v_pos = v_len THEN
        v_valor := NULL;
     ELSE
        v_valor := RTRIM(SUBSTR(p_vetor, v_pos+1));
        p_vetor := RTRIM(SUBSTR(p_vetor,1, v_pos-1));
     END IF;
  END IF;
--
  RETURN v_valor;
END; -- ULT_VALOR_RETORNAR

/
--------------------------------------------------------
--  DDL for Function ZEROS_DIR_RETIRAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ZEROS_DIR_RETIRAR" -----------------------------------------------------------------------
-- ZEROS_DIR_RETIRAR
--
--   Descricao: funcao que retida zeros a direita de um numero ja
--    formatado.
-----------------------------------------------------------------------
     (p_numero IN VARCHAR2)
RETURN  VARCHAR2
IS
v_ok         INTEGER;
v_numero     VARCHAR2(40);
v_pos        INTEGER;
v_ind        INTEGER;
--
BEGIN
  v_numero := p_numero;
--
  IF v_numero IS NULL THEN
     v_numero := '0';
  END IF;
--
  v_pos := INSTR(v_numero,',');
  v_ind := LENGTH(v_numero);
--
  -- retira zeros a direita da virgula.
  WHILE v_ind > v_pos AND  SUBSTR(v_numero,v_ind,1) = '0' LOOP
     v_numero := SUBSTR(v_numero,1,v_ind-1);
     v_ind := v_ind - 1;
  END LOOP;
--
  -- verifica se sobrou apenas a virgula.
  IF SUBSTR(v_numero,LENGTH(v_numero),1) = ',' THEN
     v_numero := SUBSTR(v_numero,1,LENGTH(v_numero)-1);
  END IF;
--
  RETURN v_numero;
EXCEPTION
  WHEN OTHERS THEN
    v_numero := 'ERRO';
    RETURN v_numero;
END;

/
--------------------------------------------------------
--  DDL for Function ZVL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ZVL"  (p_numero in number, p_retorno in number)
-----------------------------------------------------------------------
--   ZVL
--
--   Descricao: funcao que compara um numero com zero, retornando o
--   segundo valor, caso a comparacao seja verdadeira
-----------------------------------------------------------------------
RETURN  number IS

v_ok number;

BEGIN
  v_ok := 0;
  IF p_numero = 0 THEN
     v_ok := p_retorno;
  ELSE
     v_ok := p_numero;
  END IF;

  RETURN v_ok;
EXCEPTION
  WHEN OTHERS THEN
    RETURN v_ok;
END;

/
