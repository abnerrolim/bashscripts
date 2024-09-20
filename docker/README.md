# Docker bash scripts
A collection of bash scripts to make life easy.

### dockerexec
Extract PID from docker ps and calls `docker exec -it $PID $YOURCOMMAND`.
For example,  you want to initialize a bash session inside a Kafka image. Your docker is running with three images, as the follow:
```bash
[abner@abner-pc]$ sudo docker ps
[sudo] password for abner: 
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                                                                            NAMES
4275941e2ae9        wurstmeister/kafka:0.10.2.1     "start-kafka.sh"         26 minutes ago      Up 26 minutes       0.0.0.0:9092->9092/tcp                                                           r_kafka_1
bc2118f75fae        wurstmeister/zookeeper:latest   "/bin/sh -c '/usr/sb…"   26 minutes ago      Up 26 minutes       22/tcp, 2888/tcp, 3888/tcp, 0.0.0.0:2181->2181/tcp                               r_zookeeper_1
de3d94709ab0        progrium/consul:latest          "/bin/start -server …"   26 minutes ago      Up 26 minutes       53/tcp, 53/udp, 8300-8302/tcp, 8400/tcp, 8301-8302/udp, 0.0.0.0:8500->8500/tcp   r_consul_1
```
Instead of using `docker exec -it 4275941e2ae9 bash` which would require first finding out the PID, you can execute `dockerexec kafka bash`. 
```bash
[abner@abner-pc]$ dockerexec kafka bash
INFO: sudo acquired. Trying to execute bash on kafka image
INFO: calling docker exec -it 4275941e2ae9 bash
bash-4.3# 
```
You can execute more complex commands bracing it by quotes.
```bash
[root@abner-pc]# dockerexec postgres 'psql -U myuser'
INFO: sudo acquired. Trying to execute psql -U myuser on postgres image
INFO: calling docker exec -it 247109a5d980 psql -U myuser
psql (9.6.6)
Type "help" for help.

mydatabase=# 
```
