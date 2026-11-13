-- As mesmas valoracións para a táboa valoracions_por_usuario (parte 3).
-- Antes tes que crear a táboa con estas columnas: usuario, data_hora, concerto_id, nota, comentario.
-- docker compose exec cass1 cqlsh -f /cql/03_valoracions_por_usuario.cql

--CREATE KEYSPACE IF NOT EXISTS app
--WITH replication = {'class': 'NetworkTopologyStrategy', 'dc1': 3};

USE app;

-- Consulta: "as valoracións dun concerto, as máis recentes primeiro"
CREATE TABLE IF NOT EXISTS valoracions_por_usuario (
  usuario     text,
  concerto_id text,
  data_hora   timestamp,
  nota        float,                  -- float e non int: avg() dun int devolve un enteiro
  comentario  text,
  PRIMARY KEY ((usuario), concerto_id,data_hora)
) WITH CLUSTERING ORDER BY (concerto_id ASC, data_hora DESC);
