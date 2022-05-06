SELECT a.usuario AS 'usuario', COUNT(DISTINCT b.id_cancao) as 'qtde_musicas_ouvidas', ROUND(SUM(c.duracao_cancao) / 60, 2) total_minutos
FROM SpotifyClone.users a join
SpotifyClone.hst_reproducoes b on (a.usuario_id = b.usuario_id) join
SpotifyClone.cancoes c on (b.id_cancao = c.id_cancao)
GROUP BY a.usuario;