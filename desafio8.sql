SELECT b.artista as 'artista',
	   a.album as 'album'
FROM SpotifyClone.albuns a join
SpotifyClone.artistas b on(a.id_artista = b.id_artista)
WHERE b.artista = 'Walter Phoenix'
ORDER BY a.album;