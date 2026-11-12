-- As mesmas valoracións para a táboa valoracions_por_usuario (parte 3).
-- Antes tes que crear a táboa con estas columnas: usuario, data_hora, concerto_id, nota, comentario.
-- docker compose exec cass1 cqlsh -f /cql/03_valoracions_por_usuario.cql

USE app;

INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('martin', '2027-07-16 23:30:00+0200', 'neboa-16', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('gael', '2027-07-16 23:43:00+0200', 'trebon-16', 5.0, 'Impresionante');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('lucia', '2027-07-16 23:47:00+0200', 'marusia-16', 3.0, 'Ben, sen máis');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('helena', '2027-07-16 23:49:00+0200', 'dj-salitre-16', 4.0, 'Gran ambiente');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('diego', '2027-07-17 00:04:00+0200', 'trebon-16', 4.0, 'Gran ambiente');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('oscar', '2027-07-17 00:09:00+0200', 'neboa-16', 4.0, 'Gran ambiente');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('oscar', '2027-07-17 00:11:00+0200', 'trebon-16', 1.0, 'Non me gustou');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('xian', '2027-07-17 00:17:00+0200', 'dj-salitre-16', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('helena', '2027-07-17 00:28:00+0200', 'trebon-16', 2.0, 'Moita xente, pouco son');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('diego', '2027-07-17 00:36:00+0200', 'dj-salitre-16', 1.0, 'Decepcionante');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('bieito', '2027-07-17 00:49:00+0200', 'marusia-16', 1.0, 'Non me gustou');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('lucia', '2027-07-17 00:51:00+0200', 'neboa-16', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('nerea', '2027-07-17 00:57:00+0200', 'marusia-16', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('ana', '2027-07-17 01:03:00+0200', 'trebon-16', 5.0, 'Impresionante');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('fran', '2027-07-17 01:22:00+0200', 'trebon-16', 1.0, 'Non me gustou');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('martin', '2027-07-17 01:33:00+0200', 'dj-salitre-16', 3.0, 'Correcto');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('helena', '2027-07-17 01:33:00+0200', 'neboa-16', 1.0, 'Non me gustou');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('nerea', '2027-07-17 01:38:00+0200', 'neboa-16', 4.0, 'Moi bo');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('elva', '2027-07-17 01:40:00+0200', 'trebon-16', 4.0, 'Repetiría');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('oscar', '2027-07-17 02:07:00+0200', 'dj-salitre-16', 4.0, 'Gran ambiente');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('celia', '2027-07-17 02:08:00+0200', 'neboa-16', 4.0, 'Moi bo');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('xian', '2027-07-17 02:50:00+0200', 'marusia-16', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('xian', '2027-07-17 23:08:00+0200', 'ondas-curtas-17', 5.0, 'Concertazo');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('xian', '2027-07-17 23:26:00+0200', 'cantigas-17', 5.0, 'Impresionante');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('paula', '2027-07-17 23:30:00+0200', 'lua-chea-17', 4.0, 'Repetiría');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('helena', '2027-07-17 23:33:00+0200', 'lua-chea-17', 4.0, 'Gran ambiente');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('elva', '2027-07-17 23:46:00+0200', 'ondas-curtas-17', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('elva', '2027-07-18 00:04:00+0200', 'sereas-17', 4.0, 'Gran ambiente');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('icia', '2027-07-18 00:20:00+0200', 'cantigas-17', 4.0, 'Moi bo');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('bieito', '2027-07-18 00:28:00+0200', 'cantigas-17', 4.0, 'Gran ambiente');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('ana', '2027-07-18 00:48:00+0200', 'sereas-17', 5.0, 'Impresionante');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('fran', '2027-07-18 00:57:00+0200', 'ondas-curtas-17', 4.0, 'Repetiría');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('diego', '2027-07-18 01:12:00+0200', 'lua-chea-17', 2.0, 'Atrasouse moito');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('fran', '2027-07-18 01:14:00+0200', 'sereas-17', 2.0, 'Atrasouse moito');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('oscar', '2027-07-18 02:08:00+0200', 'ondas-curtas-17', 3.0, 'Ben, sen máis');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('ana', '2027-07-18 22:42:00+0200', 'bretema-18', 5.0, 'Concertazo');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('xian', '2027-07-18 23:09:00+0200', 'os-da-ria-18', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('nerea', '2027-07-18 23:11:00+0200', 'furacan-18', 4.0, 'Moi bo');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('lucia', '2027-07-18 23:17:00+0200', 'bretema-18', 3.0, 'Son mellorable');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('lucia', '2027-07-18 23:41:00+0200', 'furacan-18', 2.0, 'Moita xente, pouco son');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('oscar', '2027-07-19 00:09:00+0200', 'mare-alta-18', 3.0, 'Son mellorable');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('ana', '2027-07-19 00:32:00+0200', 'mare-alta-18', 4.0, 'Moi bo');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('elva', '2027-07-19 00:58:00+0200', 'furacan-18', 3.0, 'Son mellorable');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('paula', '2027-07-19 01:02:00+0200', 'os-da-ria-18', 4.0, 'Repetiría');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('martin', '2027-07-19 01:36:00+0200', 'os-da-ria-18', 4.0, 'Repetiría');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('diego', '2027-07-19 01:38:00+0200', 'mare-alta-18', 5.0, 'O mellor do festival');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('xian', '2027-07-19 01:56:00+0200', 'mare-alta-18', 3.0, 'Ben, sen máis');
INSERT INTO valoracions_por_usuario (usuario, data_hora, concerto_id, nota, comentario) VALUES ('bieito', '2027-07-19 02:23:00+0200', 'mare-alta-18', 5.0, 'Concertazo');
