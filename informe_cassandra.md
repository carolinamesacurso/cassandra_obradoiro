# Informe

## preparación

```
(.venv) carolinamesamartine@026P230B:~/obradoiroCassanadra/Obradoiro_Cassandra$ docker compose up -d
[+] up 18/18
 ✔ Image cassandra:5.0.8                  Pulled                                                                   14.5s
 ✔ Network obradoiro-cassandra_festival   Created                                                                   0.1s
 ✔ Volume obradoiro-cassandra_cass3_datos Created                                                                   0.0s
 ✔ Volume obradoiro-cassandra_cass1_datos Created                                                                   0.0s
 ✔ Volume obradoiro-cassandra_cass2_datos Created                                                                   0.0s
 ✔ Container obradoiro-cassandra-cass1-1  Healthy                                                                  61.9s
 ✔ Container obradoiro-cassandra-cass2-1  Healthy                                                                 137.1s
 ✔ Container obradoiro-cassandra-cass3-1  Started                                                                 137.1s
(.venv) carolinamesamartine@026P230B:~/obradoiroCassanadra/Obradoiro_Cassandra$ docker compose ps
NAME                          IMAGE             COMMAND                  SERVICE   CREATED         STATUS                             PORTS
obradoiro-cassandra-cass1-1   cassandra:5.0.8   "docker-entrypoint.s…"   cass1     2 minutes ago   Up 2 minutes (healthy)             7000-7001/tcp, 7199/tcp, 9042/tcp, 9160/tcp
obradoiro-cassandra-cass2-1   cassandra:5.0.8   "docker-entrypoint.s…"   cass2     2 minutes ago   Up About a minute (healthy)        7000-7001/tcp, 7199/tcp, 9042/tcp, 9160/tcp
obradoiro-cassandra-cass3-1   cassandra:5.0.8   "docker-entrypoint.s…"   cass3     2 minutes ago   Up 30 seconds (health: starting)   7000-7001/tcp, 7199/tcp, 9042/tcp, 9160/tcp
(.venv) carolinamesamartine@026P230B:~/obradoiroCassanadra/Obradoiro_Cassandra$
```

## Clúster
1. Pregunta:
    * Vemos que existen 3 nodos activos
    * La letra UN de la primera columna signica que el estado de los nodos , el cual idnica que están encendidos 
2. Pregunta:
    * En cassandra no existen nodos primarios ni secundarios ,
    ya que todos son iguales 
    * Representa la semilla inicial de los nodos , esto para que servir como punto de contacto para la configuración y los nodos nuevos
3. Pregunta
    * La etiqueta del compose.yaml 'CASSANDRA_NUM_TOKENS: 16' representa la cantidad de nodos virtuales que gestiona cada máquina 

```
(.venv) carolinamesamartine@026P230B:~/obradoiroCassanadra/Obradoiro_Cassandra$ docker compose exec cass1 nodetool status
Datacenter: dc1
===============
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address     Load        Tokens  Owns (effective)  Host ID                               Rack
UN  172.18.0.3  80.02 KiB   16      59.3%             a62a5a2e-c405-4baf-a42b-d39dbadb65a9  rack1
UN  172.18.0.4  80.05 KiB   16      76.0%             790142d5-1977-468e-885b-066e3b9d6de3  rack1
UN  172.18.0.2  119.83 KiB  16      64.7%             93b869b9-db8e-4557-b33b-f7d7e4ae13b5  rack1
```

## Primeras consultas
