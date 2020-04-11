# pickup-docker
Enlarging the docker knowledge with a guide line

#### Docker basic commands
docker images <br/>
docker ps <br/>
docker ps -a <br/>
docker container rm container_id <br/> 
docker run -it -rm -d -p 8888:8080 tomcat:8.0 sleep 1000

#### Creating docker image from debina:jessie using command
docker run -it debian:jessie <br/>
ls /dir <br/>
apt-get update && apt-get install -y git <br/>
git --version <br/>
ctrl + c <br/>
docker ps -a <br/>
docker commit container_id datacrud/debian:1.00 <br/>
docker images <br/>
docker run -it datacrud/debian:1.00 <br/>
ls /dir <br/>
git <br/>
ctrl + c <br/>

#### Creating docker image from debina:jessie using Dockerfile
echo FROM debian:jessie > Dockerfile <br/>

......edit the docker file using text editor....... (see <a href="https://github.com/sabbiryan/pickup-docker/blob/master/Dockerfile">Dockerfile</a>) <br/>

docker build -t datacrud/debina . (. means Dockerfile present in current direcotry) <br/>
docker build -t datacrud/debina . --no-cache=true <br/>
docker images <br/>
docker run container_id

#### Dockerfile keywords
FROM (define image source) <br/>
RUN (run instrations) <br/>
CMD (run on container startup) <br/>
COPY (copy files or diretories to container) <br/>
ADD (copy, download, unpack compress files)

#### Image push to docker hub
docker tag container_id datacrud/debian:1.01 <br/>
docker tag container_id dockerhubuserid/debian:1.01 <br/>
docker login --username=dockerhubusername <br/>
Login Succeeded <br/>
docker push dockerhubuserid/debian:1.01

#### Create containarized web applciation
git clone -b v0.1 https://github.com/jleetutorial/dockerapp.git <br/>
cd dockerapp <br/>
docker build -t dockerapp:v0.1 .<br/>
docker images <br/>
docker run -d -p 5000:5000 container_id <br/>
hit http://localhost:5000/ on your local machine browser, it should up and running <br/>
docker exec -it 07e39455d1f4 bash <br/>
pwd  <br/>
cd /home/admin  <br/>
ps axu  <br/>


#### Mannual linking microservice approch in docker
docker build -t dockerapp:v0.3 . <br/>
docker run -d --name redis redis:3.2.0  <br/>
docker run -d -p 5000:5000 --link redis  dockerapp:v0.3 <br/>

#### docker-compose.yml to manage the microservices linking
echo >docker-compose.yml <br/>

......edit the docker-compose.yml file in the text edition...... <br/>

docker-componse up -d<br/>
docker-componse ps<br/>
docker-componse logs<br/>
docker-componse logs -f<br/>
docker-componse down<br/>
docker-componse build<br/>
docker-componse rm <br/> 

#### Docker networks
docker network ls
docker network inspect bridge

#### Docker none network
docker run -d --net none busybox sleep 1000
docker exec -it container_id bin/ash
ping 8.8.8.8
ifconfig

#### Docker bridge network
docker run -d --name container_1 busybox sleep 1000 <br/> 
docker exec -it container_1 ifconfig <br/> 
docker run -d --name container_2 busybox sleep 1000 <br/> 
docker exec container_2 ifconfig <br/> 
docker exec -it container_1 ping 127.0.0.1 <br/> 
docker exec -it container_1 ping 8.8.8.8 <br/> 

docker network create --driver bridge my_bridge_network <br/> 
docker network inspect my_bridge_network <br/> 
docker run -d --name container_3 --net my_bridge_network busybox sleep 1000 <br/> 

docker exec -it container_3 ifconfig <br/> 
docker inspect container_1 <br/> 
docker exec -it container_3 ping 127.17.0.3 <br/> 
docker network connect bridge container_3 <br/> 
docker exec -it container_3 ping 127.17.0.3 <br/> 
docker network disconnect bridge container_3 <br/> 
docker exec -it container_3 ping 127.17.0.3 <br/> 

#### Host & overlay network
docker run -d --name container_4 --net host busybox sleep 1000 <br/> 
docker exec -it container_4 ifconfig <br/> 

#### Run unit test in docker
docker-compose up -d <br/> 
docker-compose run dockerapp python test.py <br/> 

#### Deploy in production
docker-machine create --driver digitalocean --digitalocean-access-token your_digitalocean_account_api_access_token docker-app-machine <br/>
docker-machine regenerate-certs --client-certs docker-app-machine </br>
docker-machine env docker-app-machine </br>


#### Troubleshoot docker for windows

Issue link: https://github.com/docker/for-win/issues/1221 <br/>

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All <br/>
• Reboot, then enable the containers feature. <br/>
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All <br/>
