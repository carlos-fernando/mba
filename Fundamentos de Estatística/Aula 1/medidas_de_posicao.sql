SELECT 
      TRUNC(AVG(ACAO_1), 4) AS media_acao_1
    , MEDIAN(ACAO_1) AS mediana_acao_1
    , PERCENTILE_CONT(0.25)  WITHIN GROUP(ORDER BY ACAO_1) AS "1_quartil"
    , PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY ACAO_1) AS "3_quartil"
    , PERCENTILE_CONT(0.8)  WITHIN GROUP(ORDER BY ACAO_1) AS "8_decil"
    , PERCENTILE_CONT(0.9)  WITHIN GROUP(ORDER BY ACAO_1) AS "9_decil"
    , PERCENTILE_CONT(0.27) WITHIN GROUP(ORDER BY ACAO_1) AS "27_percentil"
    , PERCENTILE_CONT(0.64) WITHIN GROUP(ORDER BY ACAO_1) AS "64_percentil"
    , MIN(ACAO_1) AS minimo_acao_1
    , MAX(ACAO_1) AS maximo_acao_1
    , TRUNC(VARIANCE(ACAO_1), 4) AS variancia_padrao_1
    , TRUNC(STDDEV(ACAO_1), 4) AS desvio_padrao_1
    , TRUNC(STDDEV(ACAO_1)/SQRT(COUNT(*)), 4) AS erro_padrao_1
    , TRUNC(STDDEV(ACAO_1) / AVG(ACAO_1), 2) * 100 AS coeficiente_de_variacao_1
FROM 
    ACAO;
