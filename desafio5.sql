SELECT a.cancao as 'cancao',
COUNT(b.usuario_id) as 'reproducoes'
FROM SpotifyClone.cancoes a join
SpotifyClone.hst_reproducoes b on (a.id_cancao = b.id_cancao)
GROUP BY a.cancao
ORDER BY reproducoes DESC, a.cancao ASC
LIMIT 2;