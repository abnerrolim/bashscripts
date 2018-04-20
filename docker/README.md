# Docker bash scripts
A collection of bash scripts to make life easy. You can put on /usr/local/bin/ or whatever your Linux use to make visible from anywhere.

### dockerexec
Extract PID from docker ps and call docker exec -it $PID $YOURCOMMAND
Example, I want to initialize bash inside Kafka image. Here are the images running.
```bash
[abner@abner-pc]$ sudo docker ps
[sudo] password for abner: 
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                                                                            NAMES
4275941e2ae9        wurstmeister/kafka:0.10.2.1     "start-kafka.sh"         26 minutes ago      Up 26 minutes       0.0.0.0:9092->9092/tcp                                                           r_kafka_1
bc2118f75fae        wurstmeister/zookeeper:latest   "/bin/sh -c '/usr/sb…"   26 minutes ago      Up 26 minutes       22/tcp, 2888/tcp, 3888/tcp, 0.0.0.0:2181->2181/tcp                               r_zookeeper_1
de3d94709ab0        progrium/consul:latest          "/bin/start -server …"   26 minutes ago      Up 26 minutes       53/tcp, 53/udp, 8300-8302/tcp, 8400/tcp, 8301-8302/udp, 0.0.0.0:8500->8500/tcp   r_consul_1
```
All that I need to do is execute:
```bash
[abner@abner-pc]$ dockerexec kafka bash
INFO: sudo acquired. Trying to execute bash on kafka image
INFO: calling docker exec -it 4275941e2ae9 bash
bash-4.3# 
```
