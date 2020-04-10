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
cd dockerapp
docker build -t dockerapp:v0.1 .




#### Troubleshoot docker for windows
Docker build error: The command '/bin/sh -c pip install Flask==0.11.1' returned a non-zero code: 4294967295: failed to shutdown container: container d00a89ced4f17e4312bcb26fb01bd9f32a7a35393146a331bd35e9d3841a50d2 encountered an error during hcsshim::System::waitBackground: failure in a Windows system call: The virtual machine or container with the specified identifier is not running. (0xc0370110): subsequent terminate failed container d00a89ced4f17e4312bcb26fb01bd9f32a7a35393146a331bd35e9d3841a50d2 encountered an error during hcsshim::System::waitBackground: failure in a Windows system call: The virtual machine or container with the specified identifier is not running. (0xc0370110) <br/><br/>

Issue link: https://github.com/docker/for-win/issues/1221 <br/>

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All <br/>
• Reboot, then enable the containers feature. <br/>
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All <br/>
