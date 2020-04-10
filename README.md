# pickup-docker
Enlarging the docker knowledge with a guide line

#### Docker Common Commands
docker images
docker ps
docker ps -a
docker container rm container_id
docker run -it -rm -d -p 8888:8080 tomcat:8.0 sleep 1000

#### Creating docker image from debina:jessie using command
docker run -it debian:jessie
ls
apt-get update && apt-get install -y git
git --version
ctrl + c
docker ps -a
docker commit container_id datacrud/debian:1.00
docker images
docker run -it datacrud/debian:1.00
ls
git
ctrl + c

#### Creating docker image from debina:jessie using Dockerfile
echo FROM debian:jessie > Dockerfile

..edit the docker file using text edition... (see <a href="https://github.com/sabbiryan/pickup-docker/blob/master/Dockerfile">Dockerfile</a>)

docker build -t datacrud/debina . (. means Dockerfile present in current direcotry)
docker images



