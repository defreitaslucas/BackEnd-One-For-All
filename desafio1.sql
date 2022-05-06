DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(25) NOT NULL,
    valor DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(25) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    id_plano INT NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
    id_artista INT PRIMARY KEY NOT NULL auto_increment,
    artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidores(
  usuario_id INT NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (usuario_id, id_artista),
  FOREIGN KEY (usuario_id) REFERENCES users(usuario_id),
  FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(100) NOT NULL,
  id_artista INT NOT NULL,
  ano_lancamento YEAR NOT NULL,
  FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  id_cancao INT PRIMARY KEY AUTO_INCREMENT,
  cancao VARCHAR(50) NOT NULL,
  duracao_cancao INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.hst_reproducoes(
  usuario_id INT NOT NULL,
  id_cancao INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  PRIMARY KEY (usuario_id, id_cancao),
  FOREIGN KEY (id_cancao) REFERENCES cancoes(id_cancao),
  FOREIGN KEY (usuario_id) REFERENCES users(usuario_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (descricao, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('univeristário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (usuario, idade, data_assinatura, id_plano)
VALUES
  ('Thati', 23, '2019-10-20', 1),
  ('Cintia', 35, '2017-12-30', 2),
  ('Bill', 20, '2019-06-05', 3),
  ('Roger', 45, '2020-05-13', 4 ),
  ('Norman', 58, '2017-02-17', 4),
  ('Patrick', 33, '2017-01-06', 2),
  ('Vivian', 26, '2018-01-05', 3),
  ('Carol', 19, '2018-02-14', 3),
  ('Angelina', 42, '2018-04-29', 2),
  ('Paul', 46, '2017-01-17', 2);

INSERT INTO SpotifyClone.artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.seguidores (usuario_id, id_artista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

INSERT INTO SpotifyClone.albuns (album, ano_lancamento, id_artista)
VALUES
  ('Envious', '1990', 1),
  ('Exuberant', '1993', 1),
  ('Hallowed Steam', '1995', 2),
  ('Incandescent', '1998', 3),
  ('Temporary Culture', '2001', 4),
  ('Library of liberty', '2003', 4),
  ('Chained Down', '2007', 5),
  ('Cabinet of fools', '2012', 5),
  ('No guarantees', '2015', 5),
  ( 'Apparatus', '2015', 6);

INSERT INTO SpotifyClone.cancoes (cancao, duracao_cancao, album_id)
VALUES
  ('Soul For us', 200, 1),
  ('Reflections Of Magic', 163, 1),
  ('Dance With Her Own', 116, 1),
  ('Troubles Of My Inner Fire', 203, 2),
  ('Time Fireworks', 152, 2),
  ('Magic Circus', 105, 3),
  ('Honey, So Do I', 207, 3),
  ('Sweetie, Let`s Go Wild', 139, 3),
  ('She Knows', 244, 3),
  ('Fantasy For Me', 100, 4),
  ('Celebration Of More', 146, 4),
  ('Rock His Everything', 223, 4),
  ('Home Forever', 231, 4),
  ('Diamond Power', 241, 4),
  ('Let`s Be Silly', 132, 4),
  ('Thang Of Thunder', 240, 5),
  ('Words Of Her Life', 185, 5),
  ('Without My Streets', 176, 5),
  ('Need Of The Evening', 190, 6),
  ('History Of My Roses', 222, 6),
  ('Without My Love', 111, 6),
  ('Walking And Game', 123, 6),
  ('Young And Father', 197, 6),
  ('Finding My Traditions', 179, 7),
  ('Walking And Man', 229, 7),
  ('Hard And Time', 135, 7),
  ('Honey, I`m A Lone Wolf', 150, 7),
  ('She Thinks I Won`t Stay Tonight', 166, 8),
  ('He Heard You`re Bad For Me', 154, 8),
  ('He Hopes We Can`t Stay', 210, 8),
  ('I Know I Know', 117, 8),
  ('He`s Walking Away', 159, 9),
  ('He`s Trouble', 138, 9),
  ('I Heard I Want To Bo Alone', 120, 9),
  ('I Ride Alone', 151, 9),
  ('Honey', 79, 10),
  ('You Cheated On Me', 95, 10),
  ('Wouldn`t It Be Nice', 213, 10),
  ('Baby', 136, 10),
  ('You Make Me Feel So..', 83, 10);

INSERT INTO SpotifyClone.hst_reproducoes (usuario_id, data_reproducao, id_cancao)
VALUES
  (1, '2020-02-28 10:45:55', 36),
  (1, '2020-05-02 05:30:35', 25),
  (1, '2020-03-06 11:22:33', 23),
  (1, '2020-08-05 08:05:17', 14),
  (1, '2020-09-14 16:32:22', 15),
  (2, '2020-01-02 07:40:33', 34),
  (2, '2020-05-16 06:16:22', 24),
  (2, '2020-10-09 12:27:48', 21),
  (2, '2020-09-21 13:14:46', 39),
  (3, '2020-11-13 16:55:13', 6),
  (3, '2020-12-05 18:38:30', 3),
  (3, '2020-07-30 10:00:00', 26),
  (4, '2021-08-15 17:10:10', 2),
  (4, '2021-07-10 15:20:30', 35),
  (4, '2021-01-09 01:44:33', 27),
  (5, '2020-07-03 19:33:28', 7),
  (5, '2017-02-24 21:14:22', 12),
  (5, '2020-08-06 15:23:43', 14),
  (5, '2020-11-10 13:52:27', 1),
  (6, '2019-02-07 20:33:48', 38),
  (6, '2017-01-24 00:31:17', 29),
  (6, '2017-10-12 12:35:20', 30),
  (6, '2018-05-29 14:56:41', 22),
  (7, '2018-05-09 22:30:49', 5),
  (7, '2020-07-27 12:52:58', 4),
  (7, '2018-01-16 18:40:43', 11),
  (8, '2018-03-21 16:56:40', 39),
  (8, '2020-10-18 13:38:05', 40),
  (8, '2019-05-25 08:14:03', 32),
  (8, '2021-08-15 21:37:09', 33),
  (9, '2021-05-24 17:23:45', 16),
  (9, '2018-12-07 22:48:52', 17),
  (9, '2021-03-14 06:14:26', 8),
  (9, '2020-04-01 03:36:00', 9),
  (10, '2017-02-06 08:21:34', 20),
  (10, '2017-12-04 05:33:43', 21),
  (10, '2017-07-27 05:24:49', 12),
  (10, '2017-12-25 01:03:57', 13);