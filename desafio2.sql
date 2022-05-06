SELECT COUNT(DISTINCT A.id_cancao) as 'cancoes', COUNT(DISTINCT C.id_artista) as 'artistas', COUNT(DISTINCT B.album_id) as 'albuns'
FROM SpotifyClone.cancoes A JOIN
SpotifyClone.albuns B ON (A.album_id = B.album_id) JOIN
SpotifyClone.artistas C ON (B.id_artista = C.id_artista);
