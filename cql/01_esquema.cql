-- Obradoiro de Cassandra: valoracións dos concertos na app do festival Son do Mar.
-- docker compose exec cass1 cqlsh -f /cql/01_esquema.cql

CREATE KEYSPACE IF NOT EXISTS app
  WITH replication = {'class': 'NetworkTopologyStrategy', 'dc1': 3};

USE app;

-- Consulta: "as valoracións dun concerto, as máis recentes primeiro"
CREATE TABLE IF NOT EXISTS valoracions_por_concerto (
  concerto_id text,
  data_hora   timestamp,
  usuario     text,
  nota        float,                  -- float e non int: avg() dun int devolve un enteiro
  comentario  text,
  PRIMARY KEY ((concerto_id), data_hora, usuario)
) WITH CLUSTERING ORDER BY (data_hora DESC, usuario ASC);
