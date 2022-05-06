SELECT b.artista as 'artista',
	   a.album as 'album',
       COUNT(c.usuario_id) as 'seguidores'
FROM SpotifyClone.albuns a join
SpotifyClone.artistas b on(a.id_artista = b.id_artista) join
SpotifyClone.seguidores c on(b.id_artista = c.id_artista)
GROUP BY b.artista, a.album
ORDER BY seguidores DESC, b.artista ASC, a.album ASC;