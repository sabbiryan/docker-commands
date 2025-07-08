# pickup-docker
Enlarging the docker knowledge with a guide line

#### Docker basic commands
```
docker images
docker ps
docker ps -a 
docker container rm container_id 
docker run -it -rm -d -p 8888:8080 tomcat:8.0 sleep 1000

```
#### Creating docker image from debina:jessie using command
```
docker run -it debian:jessie
ls /dir
apt-get update && apt-get install -y git
git --version
ctrl + c 
docker ps -a
docker commit container_id datacrud/debian:1.00
docker images
docker run -it datacrud/debian:1.00
ls /dir
git
ctrl + c
```

#### Creating docker image from debina:jessie using Dockerfile
```
echo FROM debian:jessie > Dockerfile
```
##### Edit the docker file using text editor....... (see <a href="https://github.com/sabbiryan/pickup-docker/blob/master/Dockerfile">Dockerfile</a>)
```
docker build -t datacrud/debina . (. means Dockerfile present in current direcotry)
docker build -t datacrud/debina . --no-cache=true
docker images
docker run container_id
```

#### Dockerfile keywords
```
FROM (define image source)
RUN (run instrations)
CMD (run on container startup)
COPY (copy files or diretories to container)
ADD (copy, download, unpack compress files)
```

#### Image push to docker hub
```
docker tag container_id datacrud/debian:1.01
docker tag container_id dockerhubuserid/debian:1.01
docker login --username=dockerhubusername
Login Succeeded
docker push dockerhubuserid/debian:1.01
```

#### Create containarized web applciation
```
git clone -b v0.1 https://github.com/jleetutorial/dockerapp.git
cd dockerapp
docker build -t dockerapp:v0.1 .<br/>
docker images
docker run -d -p 5000:5000 container_id 
hit http://localhost:5000/ on your local machine browser, it should up and running 
docker exec -it 07e39455d1f4 bash
pwd 
cd /home/admin
ps axu 
```


#### Mannual linking microservice approch in docker
```
docker build -t dockerapp:v0.3 . 
docker run -d --name redis redis:3.2.0  
docker run -d -p 5000:5000 --link redis  dockerapp:v0.3 
```

#### docker-compose.yml to manage the microservices linking
```
echo > docker-compose.yml
```
###### Edit the docker-compose.yml file in the text edition...... <br/>
```
docker-componse up -d
docker-componse ps
docker-componse logs
docker-componse logs -f
docker-componse down
docker-componse build
docker-componse rm 
```
#### Docker networks
```
docker network ls
docker network inspect bridge
```

#### Docker none network
```
docker run -d --net none busybox sleep 1000
docker exec -it container_id bin/ash
ping 8.8.8.8
ifconfig
```

#### Docker bridge network
```
docker run -d --name container_1 busybox sleep 1000 
docker exec -it container_1 ifconfig 
docker run -d --name container_2 busybox sleep 1000 
docker exec container_2 ifconfig 
docker exec -it container_1 ping 127.0.0.1 
docker exec -it container_1 ping 8.8.8.8 
```

```
docker network create --driver bridge my_bridge_network 
docker network inspect my_bridge_network 
docker run -d --name container_3 --net my_bridge_network busybox sleep 1000 
```

```
docker exec -it container_3 ifconfig 
docker inspect container_1 
docker exec -it container_3 ping 127.17.0.3 
docker network connect bridge container_3 
docker exec -it container_3 ping 127.17.0.3 
docker network disconnect bridge container_3 
docker exec -it container_3 ping 127.17.0.3 
```

#### Host & overlay network
```
docker run -d --name container_4 --net host busybox sleep 1000 
docker exec -it container_4 ifconfig 
``` 

#### Run unit test in docker
```
docker-compose up -d 
docker-compose run dockerapp python test.py 
```

#### Deploy in production
```
docker-machine create --driver digitalocean --digitalocean-access-token your_digitalocean_account_api_access_token docker-app-machine  or
docker-machine create --driver digitalocean --digitalocean-access-token your_digitalocean_account_api_access_token --digitalocean-image=coreos-stable --digitalocean-ssh-user=core docker-app-machine 
docker-machine regenerate-certs docker-app-machine  or
docker-machine regenerate-certs --client-certs docker-app-machine 
docker-machine env docker-app-machine 
@FOR /f "tokens=*" %i IN ('docker-machine env docker-app-machine') DO @%i (for shell) 
eval $docker-machine env docker-app-machine) (for mac)
docker info 
docker-compose -f prod.yml up -d 
docker-machine ls 
http://machine-ip:5000/ 
```

#### Troubleshoot docker for windows

Issue link: https://github.com/docker/for-win/issues/1221 <br/>
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```
##### Reboot, then enable the containers feature. <br/>
```
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All
```
