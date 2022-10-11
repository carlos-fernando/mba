#Um analista do mercado acionário coletou os retornos mensais de duas ações que pretende indicar aos seus
#clientes Calcule as estatísticas descritivas para as duas variáveis, incluindo o coeficiente de correlação entre
#os retornos O banco de dados com os retornos percentuais mensais está na planilha Lista de Exercício

import pandas as pd
import numpy as np

df = pd.read_csv('C:\\_dba\\__mba\\Fundamentos de Estatística\\Aula 1\\acao.csv', sep=';')
df.describe()

df["Ação 1"].count() # número de observações

df["Ação 1"].mean() # média

df["Ação 1"].median() # mediana

df["Ação 1"].quantile(q=0.25) # 1º Quartil
df["Ação 1"].quantile(q=0.75) # 3º Quartil
df["Ação 1"].quantile(q=0.8)  # 8º Decil
df["Ação 1"].quantile(q=0.9)  # 9º Decil
df["Ação 1"].quantile(q=0.27) # 27º Percentil
df["Ação 1"].quantile(q=0.64) # 64º Percentil

df["Ação 1"].min() # mínimo
df["Ação 1"].max() # máximo

df["Ação 1"].max() - df["Ação 1"].min() # amplitude

df["Ação 1"].var() # variância
df["Ação 1"].std() # desvio padrão

df["Ação 1"].std() / np.sqrt(df["Ação 1"].count()) # erro padrão
df["Ação 1"].std()/df["Ação 1"].mean() # Coeficiente de Variação

df["Ação 1"].kurtosis() # curtose
df["Ação 1"].skew() # assimetria

df.corr() # Correlação
