/*
tabela de frequências no Oracle
*/

BEGIN EXECUTE IMMEDIATE 'DROP TABLE RENDA'; EXCEPTION WHEN OTHERS THEN NULL; END;

CREATE TABLE RENDA
    (OBSERVACAO NUMBER(38,0), 
    RENDA NUMBER(38,2));

Insert into RENDA (OBSERVACAO,RENDA) values ('1','2893,7');
Insert into RENDA (OBSERVACAO,RENDA) values ('2','3448,38');
Insert into RENDA (OBSERVACAO,RENDA) values ('3','1460,81');
Insert into RENDA (OBSERVACAO,RENDA) values ('4','2223,7');
Insert into RENDA (OBSERVACAO,RENDA) values ('5','2500,7');
Insert into RENDA (OBSERVACAO,RENDA) values ('6','1100,25');
Insert into RENDA (OBSERVACAO,RENDA) values ('7','3560,1');
Insert into RENDA (OBSERVACAO,RENDA) values ('8','5510,76');
Insert into RENDA (OBSERVACAO,RENDA) values ('9','2900,9');
Insert into RENDA (OBSERVACAO,RENDA) values ('10','10127,5');
Insert into RENDA (OBSERVACAO,RENDA) values ('11','1855');
Insert into RENDA (OBSERVACAO,RENDA) values ('12','3160,5');
Insert into RENDA (OBSERVACAO,RENDA) values ('13','8630');
Insert into RENDA (OBSERVACAO,RENDA) values ('14','6200,73');
Insert into RENDA (OBSERVACAO,RENDA) values ('15','4129,99');
Insert into RENDA (OBSERVACAO,RENDA) values ('16','2735,6');
Insert into RENDA (OBSERVACAO,RENDA) values ('17','4448');
Insert into RENDA (OBSERVACAO,RENDA) values ('18','2150,2');
Insert into RENDA (OBSERVACAO,RENDA) values ('19','4595,1');
Insert into RENDA (OBSERVACAO,RENDA) values ('20','5560,6');
Insert into RENDA (OBSERVACAO,RENDA) values ('21','2800');
Insert into RENDA (OBSERVACAO,RENDA) values ('22','9538,33');
Insert into RENDA (OBSERVACAO,RENDA) values ('23','2000');
Insert into RENDA (OBSERVACAO,RENDA) values ('24','3225,74');
Insert into RENDA (OBSERVACAO,RENDA) values ('25','1900,25');
Insert into RENDA (OBSERVACAO,RENDA) values ('26','7664,72');
Insert into RENDA (OBSERVACAO,RENDA) values ('27','3890');
Insert into RENDA (OBSERVACAO,RENDA) values ('28','6589,9');
Insert into RENDA (OBSERVACAO,RENDA) values ('29','1240,5');
Insert into RENDA (OBSERVACAO,RENDA) values ('30','1720,2');
Insert into RENDA (OBSERVACAO,RENDA) values ('31','2555,6');
Insert into RENDA (OBSERVACAO,RENDA) values ('32','4730');
Insert into RENDA (OBSERVACAO,RENDA) values ('33','4745,4');
Insert into RENDA (OBSERVACAO,RENDA) values ('34','8550');
Insert into RENDA (OBSERVACAO,RENDA) values ('35','3860,1');
Insert into RENDA (OBSERVACAO,RENDA) values ('36','11320');
Insert into RENDA (OBSERVACAO,RENDA) values ('37','6125');
Insert into RENDA (OBSERVACAO,RENDA) values ('38','5605,75');
Insert into RENDA (OBSERVACAO,RENDA) values ('39','3250');
Insert into RENDA (OBSERVACAO,RENDA) values ('40','1500');
Insert into RENDA (OBSERVACAO,RENDA) values ('41','9215,55');
Insert into RENDA (OBSERVACAO,RENDA) values ('42','4999,2');
Insert into RENDA (OBSERVACAO,RENDA) values ('43','3900');
Insert into RENDA (OBSERVACAO,RENDA) values ('44','7000,2');
Insert into RENDA (OBSERVACAO,RENDA) values ('45','3508,37');
Insert into RENDA (OBSERVACAO,RENDA) values ('46','1130');
Insert into RENDA (OBSERVACAO,RENDA) values ('47','4120,6');
Insert into RENDA (OBSERVACAO,RENDA) values ('48','2600,5');
Insert into RENDA (OBSERVACAO,RENDA) values ('49','2900,77');
Insert into RENDA (OBSERVACAO,RENDA) values ('50','4870,6');
COMMIT;

WITH T_RENDA AS (
        SELECT
            OBSERVACAO
            ,RENDA
            , 1 AS OCORRENCIA
            ,CASE 
                WHEN RENDA BETWEEN     0 AND 2000  THEN '1 0-2000' 
                WHEN RENDA BETWEEN  2001 AND 4000  THEN '2 2.001-4.000'
                WHEN RENDA BETWEEN  4001 AND 6000  THEN '3 4.001-6.000'
                WHEN RENDA BETWEEN  6001 AND 8000  THEN '4 6.001-8.000'
                WHEN RENDA BETWEEN  8001 AND 10000 THEN '5 8.001-10.000'
                WHEN RENDA BETWEEN 10001 AND 12000 THEN '6 10.001-12.000'
            END AS FAIXA
            FROM renda)
, T_RENDA_STAT AS (SELECT 
    t1.FAIXA
    , COUNT(t1.OBSERVACAO) AS Frequencia_Absoluta
    , SUM(COUNT(*)) OVER(ORDER BY t1.FAIXA ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Frequencia_Acumulada
FROM 
    T_RENDA t1
GROUP BY 
    t1.FAIXA
ORDER BY t1.FAIXA)
SELECT 
    FAIXA
    , Frequencia_Absoluta
    , Frequencia_Absoluta / (SELECT SUM(OCORRENCIA) FROM T_RENDA) * 100 AS "FREQUENCIA_RELATIVA (%)"
    , Frequencia_Acumulada
    , Frequencia_Acumulada / (SELECT SUM(OCORRENCIA) FROM T_RENDA) * 100 AS "FREQUENCIA_RELATIVA_ACUMULADA (%)"
FROM 
    T_RENDA_STAT;

/*
FONTE: https://docs.oracle.com/cd/E11882_01/server.112/e41084/functions004.htm#SQLRF06174
*/