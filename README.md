# Obradoiro de Cassandra

Material do obradoiro (o enunciado está en Moodle: `BDA_UD1_Obradoiro_Cassandra`).

```bash
docker compose up -d                                    # tres nodos: tarda uns minutos
docker compose ps                                       # agardar a (healthy)
docker compose exec cass1 nodetool status
docker compose exec cass1 cqlsh -f /cql/01_esquema.cql
docker compose exec cass1 cqlsh -f /cql/02_valoracions.cql
docker compose exec cass1 cqlsh                         # consola CQL
docker compose down -v                                  # ao rematar
```

Cada nodo usa 1 GB de memoria de Java. Se o equipo vai xusto, pecha outros contedores antes.
