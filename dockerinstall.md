# Docker setup instructions



```bash

# Install docker

yum install docker -y


# Check status and if it is stopped start it

systemctl status docker

systemctl start docker

systemctl status docker   # it should be running now


# try different docker commands now

docker images   # Shows the docker images present on the system

docker ps   # Shows details of running containers

docker ps -a  # Shows Stopped containers

docker run --name java-login-app -itd -p 8080:8080 sidhusaiprasanth/amazon-java-login:1  # TO run a container  -p dockerhost: dockercontainer

docker rmi IMAGEID  # remove that image with IMAGEID

docker rm CONTAINERID # Removes a stopped coontainer with CONTAINERID

docker stop CONTAINERID # stops a running container with CONATINERID

docker ps   # Shows all running containers

docker ps -a # Shows all 







```

