SELECT COUNT(b.id_cancao) as 'quantidade_musicas_no_historico'
FROM SpotifyClone.users a join
SpotifyClone.hst_reproducoes b on(a.usuario_id = b.usuario_id)
WHERE a.usuario = 'Bill';