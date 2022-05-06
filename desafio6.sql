SELECT MIN(a.valor) as 'faturamento_minimo',
	   MAX(a.valor) as 'faturamento_maximo',
       ROUND(AVG(a.valor),2) as 'faturamento_medio',
       SUM(a.valor) as 'faturamento_total'
FROM SpotifyClone.planos a join
SpotifyClone.users b on(a.id_plano = b.id_plano);