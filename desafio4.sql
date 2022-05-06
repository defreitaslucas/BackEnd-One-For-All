SELECT a.usuario as 'usuario', 
IF(MAX(YEAR(b.data_reproducao)) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.users a join
SpotifyClone.hst_reproducoes b on (a.usuario_id = b.usuario_id)
GROUP BY usuario
ORDER BY usuario;