SELECT d.cancao as 'nome',
	   COUNT(a.usuario_id) as 'reproducoes'
FROM SpotifyClone.users a join
SpotifyClone.hst_reproducoes b on(a.usuario_id = b.usuario_id) join
SpotifyClone.planos c on(a.id_plano = c.id_plano) join
SpotifyClone.cancoes d on(b.id_cancao = d.id_cancao)
WHERE c.descricao in('gratuito', 'pessoal')
GROUP BY d.cancao
ORDER BY d.cancao;