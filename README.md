# RETO2_v2 - Monitorizacion

## ¿Qué hay que hacer?

Queremos poder monitorizar nuestro sistema, para empezar el numero de inserciones por segundo en la base de datos.

Idealmente, querremos poder tener una interfaz gráfica para consultar estos datos.

Como herramienta, se ha planteado usar el stack ELK ([ElasticSearch][1], [Logstash][2] y [Kibana][3]).

## ¿Qué piezas hay?

### DB
Container de docker con una base de datos MySQL de nombre reto1, con una sola tabla de nombre reto1 en la que hay dos campos un timestamp con la hora de creacion del registro y un timestamp con la hora de insercion del registro. Los recursos de cpu de este  container se limitan a un 20% de la cpu 0 del sistema.

### server_python
Container de docker con un servidor web minimo escrito en python que escucha en el puerto 80 y escribe una linea en la base de datos por cada peticion que le llega. En este mismo container hay un proceso en nodejs que guarda estadisticas en un fichero en un volumen compartido (shared/server_stats.log). Este fichero es un csv, la primera linea es el unix epoq y la penultima el numero de inserciones por minuto en la base de datos. Los recursos de cpu de este  container se limitan a un 20% de la cpu 0 del sistema.

### load
Container que genera carga sobre el servidor web. Tiene un dashboard en el puerto 8091 que se esta exportado al host. Eso quiere decir que podemos ver el estado con http://< ip de la  maquina virtual >:8091

### Logstash
Lee los datos del csv de estadisticas y los envia a elasticsearch. Work in progress

### Elastic Search (ES)
almacena las estadisticas y permite que las presente kibana. Se usara la imagen de docker "elasticsearch" por defecto sin modificar.

### Kibana
Lee datos de Elasticsearch y los muestra en un interfaz grafico (dashboard). Se usara la imagen de docker "kibana" por defecto sin modificar.

## ¿Cómo nos vamos a organizar?

Estaria bien que cada uno de los participantes se hiciese un fork de este repositorio git, y cuando se vaya avanzando o se encuentren cosas utiles para los demas, se haga un pull request para compartir las mejoras.

[1]: https://www.elastic.co/products/elasticsearch
[2]: https://www.elastic.co/products/logstash
[3]: https://www.elastic.co/products/kibana

