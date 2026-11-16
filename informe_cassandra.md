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
    * Representa la semilla inicial de los nodos , esto para que servir como punto de contacto para la configuración y los nodos nuevos(CONEXIÓN NUEVOS NODOS PUERTA PARA ENTRAR)
3. Pregunta
    * La etiqueta del compose.yaml 'CASSANDRA_NUM_TOKENS: 16' representa la cantidad de nodos virtuales que gestiona cada máquina (Número de espacios que hay de ese anel(información)tramos de ese anel para repartir información)
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

* WITH CLUSTERING ORDER BY (data_hora DESC, usuario ASC);
```
cqlsh:app> select * from valoracions_por_concerto where concerto_id = 'neboa-16';

 concerto_id | data_hora                       | usuario | comentario           | nota
-------------+---------------------------------+---------+----------------------+------
    neboa-16 | 2027-07-17 00:08:00.000000+0000 |   celia |               Moi bo |    4
    neboa-16 | 2027-07-16 23:38:00.000000+0000 |   nerea |               Moi bo |    4
    neboa-16 | 2027-07-16 23:33:00.000000+0000 |  helena |        Non me gustou |    1
    neboa-16 | 2027-07-16 22:51:00.000000+0000 |   lucia | O mellor do festival |    5
    neboa-16 | 2027-07-16 22:09:00.000000+0000 |   oscar |        Gran ambiente |    4
    neboa-16 | 2027-07-16 21:30:00.000000+0000 |  martin | O mellor do festival |    5

(6 rows)
```
* Solo las 3 primeras d ese concerto 

```
cqlsh:app> select * from valoracions_por_concerto where concerto_id = 'neboa-16' LIMIT 3;

 concerto_id | data_hora                       | usuario | comentario    | nota
-------------+---------------------------------+---------+---------------+------
    neboa-16 | 2027-07-17 00:08:00.000000+0000 |   celia |        Moi bo |    4
    neboa-16 | 2027-07-16 23:38:00.000000+0000 |   nerea |        Moi bo |    4
    neboa-16 | 2027-07-16 23:33:00.000000+0000 |  helena | Non me gustou |    1

(3 rows)
```

* Nota media y número de valoracions

```
cqlsh:app> select avg(nota) from valoracions_por_concerto where concerto_id = 'neboa-16';

 system.avg(nota)
------------------
          3.83333

(1 rows)


cqlsh:app> select count(nota) from valoracions_por_concerto where concerto_id = 'neboa-16';

 system.count(nota)
--------------------
                  6

(1 rows)

```


* Valoraciones do usuario Xian
    * No deja hacer una consulta antes de añadir la particion key  en la consulta y la siguiente pk que es data_hora

```
cqlsh:app> select * from valoracions_por_concerto where usuario = 'xian';
InvalidRequest: Error from server: code=2200 [Invalid query] message="PRIMARY KEY column "usuario" cannot be restricted as preceding column "data_hora" is not restricted"

cqlsh:app> select * from valoracions_por_concerto where usuario = 'xian' ALLOW FILTERING;

 concerto_id     | data_hora                       | usuario | comentario           | nota
-----------------+---------------------------------+---------+----------------------+------
    os-da-ria-18 | 2027-07-18 21:09:00.000000+0000 |    xian | O mellor do festival |    5
   dj-salitre-16 | 2027-07-16 22:17:00.000000+0000 |    xian | O mellor do festival |    5
     cantigas-17 | 2027-07-17 21:26:00.000000+0000 |    xian |        Impresionante |    5
      marusia-16 | 2027-07-17 00:50:00.000000+0000 |    xian | O mellor do festival |    5
 ondas-curtas-17 | 2027-07-17 21:08:00.000000+0000 |    xian |           Concertazo |    5
    mare-alta-18 | 2027-07-18 23:56:00.000000+0000 |    xian |        Ben, sen máis |    3

(6 rows)

```
* todo el anillo de datos y baixa laas particions - es muy pesada la consulta 
* porque se bería dehbaer pensado mejor las consultas y saturar la red pudiendo provcar caida de cluetr 

```
cqlsh:app> select * from valoracions_por_usuario where usuario = 'xian';

 usuario | concerto_id     | data_hora                       | comentario           | nota
---------+-----------------+---------------------------------+----------------------+------
    xian |     cantigas-17 | 2027-07-17 21:26:00.000000+0000 |        Impresionante |    5
    xian |   dj-salitre-16 | 2027-07-16 22:17:00.000000+0000 | O mellor do festival |    5
    xian |    mare-alta-18 | 2027-07-18 23:56:00.000000+0000 |        Ben, sen máis |    3
    xian |      marusia-16 | 2027-07-17 00:50:00.000000+0000 | O mellor do festival |    5
    xian | ondas-curtas-17 | 2027-07-17 21:08:00.000000+0000 |           Concertazo |    5
    xian |    os-da-ria-18 | 2027-07-18 21:09:00.000000+0000 | O mellor do festival |    5

(6 rows)

```


* Que ten que facer a app se un usuario cambia a nota? A aplicación debe actualizar ambas táboas explicitamente (a táboa ordenada por concerto e valoracions_por_usuario). Para garantir que ambas operacións se executan á vez e non queda unha a medias se cae o servidor,


*  Produciríase unha inconsistencia de datos (datos desincronizados)

* Cassandra está deseñado para repartir datos entre varios nodos distintos. - optimizza la tabla para que las consultas sean cosas mucho más rapido

*  ao buscar un usuario o nodo coordinador non sabería en que nodo está ese dato. Tería que preguntarlle a todos os nodos do clúster á vez (scatter-gather), o que dispara a latencia e tira o rendemento abaixo cando o clúster crece.

## Parte 4

1.  no tienen por qué estar todos en el mismo nodo. Cassandra distribuye las particiones entre los nodos del clúster utilizando el token calculado a partir de la clave de partición.(hay genet que 3 o 2)

3. Porque el keyspace app está configurado con un factor de replicación RF3.

Esto significa que Cassandra mantiene tres copias de cada partición, distribuidas entre los tres nodos del clúster.

A diferencia de proba_rf1, que solamente tiene una copia, app dispone de tres réplicas para mejorar la disponibilidad y tolerancia a fallos.

4. Keyspace proba_rf1 (RF1): los conciertos cuya única réplica estaba almacenada en el nodo detenido dejan de estar disponibles. Los conciertos almacenados en los otros nodos siguen pudiéndose consultar.

Keyspace app (RF3): las valoraciones siguen estando disponibles porque existen otras dos réplicas en los nodos restantes.

* Apuntes
    * select * from concertos ; debería de fallarporque siguen sin estar todos los nodos activos
    * select * from concertos where neboa 16 - como está en el nodo2 y se pararon el 1 y el 3 
    * acude a un dato que está en el que no está pausado
    * no puede pedir todos y darme solo los que tiene 

## Parte 5

| Nodos en marcha      | ONE (ler / escribir)| QUORUM (ler / escribir) | ALL (ler / escribir) |
|------------|------------------|--------------------|--------------------|
|3 | ✔            | ✔                |✔
| 2 | ✔ | ✔                |✘
| 1 (só cass1) | ✔             | ✘               |✘

2. devuelve un error:

UnavailableException o WriteTimeoutException / ReadTimeoutException, dependiendo de si se trata de una lectura o una escritura y de cuándo se produce el fallo.
que se necesita x replicas y solo tiene y activas  - UnavailableException (en ejemplo que nos compartió por pantalla)

3. Sí, los otros dos nodos terminan teniendo esa valoración.

Con nivel de consistencia ONE, basta con que una réplica confirme la escritura para que Cassandra la considere correcta.

Cuando arrancan los otros dos nodos, pueden recibir los datos mediante los mecanismos de recuperación y sincronización de Cassandra (lo sincroniza solo)

4. Con tres copias, QUORUM necesita dos respuestas. Si hubiese cinco copias, necesitaría tres. Esto garantiza que responda una mayoría de las réplicas.


## Parte 6 Preguntas

1. MongoDB prefiere tener consistencia (dejando que todos vena el ultimo dato ) y tolerancia a partición que auqneu se divida se pueda acceder / mientras que cassandra perfriere estar disponible siempre (poder hacer todo tipo de operaciones sin mayoría) y tolerancia a partición 

2. Non, usando QUORUM para escribir e ler con 3 copias non podemos ler un dato atrasado. Pola contra, usando ONE en ambas operacións si que é posible ler un dato desactualizado.

3. saldo quorum y valoración one , ya que en uno estamos hablando de datos ensibles como pueden ser cantidades moenyarias para realizar operaciones en tiempo real , frente a una valoración la cual es meramente informativa para el ususario , es decir , uan recomendación y su uso va a acabar en simplemente mostrarse

se desactualizan porque si haces write a uno los doemas tardan en comunicarse un tiempo 
y puedes leer datos desactualizados al leer de 2 o de 3 por exemplo