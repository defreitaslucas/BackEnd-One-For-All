DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    id_plano INT NOT NULL,
    descricao VARCHAR(25) NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_plano)
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    usuario_id INT NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    id_plano INT NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    id_artista INT NOT NULL,
    artista VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_artista)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidores(
  id_seguidor INT NOT NULL,
  usuario_id INT NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (id_seguidor),
  FOREIGN KEY (usuario_id) REFERENCES users(usuario_id),
  FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT NOT NULL,
  album VARCHAR(100) NOT NULL,
  id_artista INT NOT NULL,
  ano_lancamento YEAR NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  id_cancao INT NOT NULL,
  cancao VARCHAR(50) NOT NULL,
  duracao_cancao TIME NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (id_cancao),
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.hst_reproducoes(
  id_reproducao INT NOT NULL,
  usuario_id INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  id_cancao INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_cancao) REFERENCES cancoes(id_cancao),
  FOREIGN KEY (usuario_id) REFERENCES users(usuario_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (id_plano, descricao, valor)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'univeristário', 5.99),
  (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.users (usuario_id, usuario, idade, data_assinatura, id_plano)
VALUES
  (1, 'Thati', 23, '2019-10-20', 1),
  (2, 'Cintia', 35, '2017-12-30', 2),
  (3, 'Bill', 20, '2019-06-05', 3),
  (4, 'Roger', 45, '2020-05-13', 4 ),
  (5, 'Norman', 58, '2017-02-17', 4),
  (6, 'Patrick', 33, '2017-01-06', 2),
  (7, 'Vivian', 26, '2018-01-05', 3),
  (8, 'Carol', 19, '2018-02-14', 3),
  (9, 'Angelina', 42, '2018-04-29', 2),
  (10, 'Paul', 46, '2017-01-17', 2);

INSERT INTO SpotifyClone.artistas (id_artista, artista)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon'),
  (5, 'Tyler Isle'),
  (6, 'Fog');

INSERT INTO SpotifyClone.seguidores (id_seguidor, usuario_id, id_artista)
VALUES
  (1, 1, 1),
  (2, 1, 4),
  (3, 1, 3),
  (4, 2, 1),
  (5, 2, 3),
  (6, 3, 2),
  (7, 3, 1),
  (8, 4, 4),
  (9, 5, 5),
  (10, 5, 6),
  (11, 6, 6),
  (12, 6, 3),
  (13, 6, 1),
  (14, 7, 2),
  (15, 7, 5),
  (16, 8, 1),
  (17, 8, 5),
  (18, 9, 6),
  (19, 9, 4),
  (20, 9, 3),
  (21, 10, 2),
  (22, 10, 6);

INSERT INTO SpotifyClone.albuns (album_id, album, ano_lancamento, id_artista)
VALUES
  (1, 'Envious', '1990', 1),
  (2, 'Exuberant', '1993', 1),
  (3, 'Hallowed Steam', '1995', 2),
  (4, 'Incandescent', '1998', 3),
  (5, 'Temporary Culture', '2001', 4),
  (6, 'Library of liberty', '2003', 4),
  (7, 'Chained Down', '2007', 5),
  (8, 'Cabinet of fools', '2012', 5),
  (9, 'No guarantees', '2015', 5),
  (10, 'Apparatus', '2015', 6);

INSERT INTO SpotifyClone.cancoes (id_cancao, cancao, duracao_cancao, album_id)
VALUES
  (1, 'Soul For us', '00:03:33', 1),
  (2, 'Reflections Of Magic', '00:03:18', 1),
  (3, 'Dance With Her Own', '00:02:55', 1),
  (4, 'Troubles Of My Inner Fire', '00:03:38', 2),
  (5, 'Time Fireworks', '00:02:53', 2),
  (6, 'Magic Circus', '00:02:25', 3),
  (7, 'Honey, So Do I', '00:03:45', 3),
  (8, 'Sweetie, Let`s Go Wild', '00:02:31', 3),
  (9, 'She Knows', '00:04:06', 3),
  (10, 'Fantasy For Me', '00:02:10', 4),
  (11, 'Celebration Of More', '00:02:43', 4),
  (12, 'Rock His Everything', '00:04:18', 4),
  (13, 'Home Forever', '00:04:41', 4),
  (14, 'Diamond Power', '00:04:01', 4),
  (15, 'Let`s Be Silly', '00:02:02', 4),
  (16, 'Thang Of Thunder', '00:04:00', 5),
  (17, 'Words Of Her Life', '00:03:08', 5),
  (18, 'Without My Streets', '00:03:55', 5),
  (19, 'Need Of The Evening', '00:03:16', 6),
  (20, 'History Of My Roses', '00:04:16', 6),
  (21, 'Without My Love', '00:02:41', 6),
  (22, 'Walking And Game', '00:02:05', 6),
  (23, 'Young And Father', '00:03:28', 6),
  (24, 'Finding My Traditions', '00:04:05', 7),
  (25, 'Walking And Man', '00:04:35', 7),
  (26, 'Hard And Time', '00:02:25', 7),
  (27, 'Honey, I`m A Lone Wolf', '00:02:50', 7),
  (28, 'She Thinks I Won`t Stay Tonight', '00:03:26', 8),
  (29, 'He Heard You`re Bad For Me', '00:02:56', 8),
  (30, 'He Hopes We Can`t Stay', '00:03:50', 8),
  (31, 'I Know I Know', '00:02:58', 8),
  (32, 'He`s Walking Away', '00:03:08', 9),
  (33, 'He`s Trouble', '00:02:30', 9),
  (34, 'I Heard I Want To Bo Alone', '00:02:00', 9),
  (35, 'I Ride Alone', '00:02:51', 9),
  (36, 'Honey', '00:01:31', 10),
  (37, 'You Cheated On Me', '00:01:58', 10),
  (38, 'Wouldn`t It Be Nice', '00:03:55', 10),
  (39, 'Baby', '00:02:26', 10),
  (40, 'You Make Me Feel So..', '00:01:38', 10);

INSERT INTO SpotifyClone.hst_reproducoes (id_reproducao, usuario_id, data_reproducao, id_cancao)
VALUES
  (1, 1, '2020-02-28 10:45:55', 36),
  (2, 1, '2020-05-02 05:30:35', 25),
  (3, 1, '2020-03-06 11:22:33', 23),
  (4, 1, '2020-08-05 08:05:17', 14),
  (5, 1, '2020-09-14 16:32:22', 15),
  (6, 2, '2020-01-02 07:40:33', 34),
  (7, 2, '2020-05-16 06:16:22', 24),
  (8, 2, '2020-10-09 12:27:48', 21),
  (9, 2, '2020-09-21 13:14:46', 39),
  (10, 3, '2020-11-13 16:55:13', 6),
  (11, 3, '2020-12-05 18:38:30', 3),
  (12, 3, '2020-07-30 10:00:00', 26),
  (13, 4, '2021-08-15 17:10:10', 2),
  (14, 4, '2021-07-10 15:20:30', 35),
  (15, 4, '2021-01-09 01:44:33', 27),
  (16, 5, '2020-07-03 19:33:28', 7),
  (17, 5, '2017-02-24 21:14:22', 12),
  (18, 5, '2020-08-06 15:23:43', 14),
  (19, 5, '2020-11-10 13:52:27', 1),
  (20, 6, '2019-02-07 20:33:48', 38),
  (21, 6, '2017-01-24 00:31:17', 29),
  (22, 6, '2017-10-12 12:35:20', 30),
  (23, 6, '2018-05-29 14:56:41', 22),
  (24, 7, '2018-05-09 22:30:49', 5),
  (25, 7, '2020-07-27 12:52:58', 4),
  (26, 7, '2018-01-16 18:40:43', 11),
  (27, 8, '2018-03-21 16:56:40', 39),
  (28, 8, '2020-10-18 13:38:05', 40),
  (29, 8, '2019-05-25 08:14:03', 32),
  (30, 8, '2021-08-15 21:37:09', 33),
  (31, 9, '2021-05-24 17:23:45', 16),
  (32, 9, '2018-12-07 22:48:52', 17),
  (33, 9, '2021-03-14 06:14:26', 8),
  (34, 9, '2020-04-01 03:36:00', 9),
  (35, 10, '2017-02-06 08:21:34', 20),
  (36, 10, '2017-12-04 05:33:43', 21),
  (37, 10, '2017-07-27 05:24:49', 12),
  (38, 10, '2017-12-25 01:03:57', 13);