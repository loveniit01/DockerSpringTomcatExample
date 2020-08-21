# DockerSpringTomcatExample
# in this project we are just creating Docker build by using already created war \ file.  /  /\   |--|
#																				  \  /\  /  /__\  |__|  
#																				   \/  \/  /    \ |\ 

#Step 1: build the image 
#build image will create war file , for running the war we need tomcat server.
#docker build -t <repository name> .
#repository name must be in lowercase
-------------------------------------------------------------------
docker build -t docker-spring-tomcat .


#Step 2: check list of image 
-------------------------------------------------------------------
docker image ls -a

#Step 3: Running a container from the image
#Syntax: docker run -itd --name <container-name> -p <host-port>:<port in container> image-name:tag
# note in the above syntax:
# -d : represents (detached mode), note that if you dont run this in detached mode, the life of the container will be the life of the terminal in which you are executing it.
# -p : represents the host-port to container-port mapping, if you substitute it with -P you will get a random port allocated by docker
# --name : represents the name of the container 
-------------------------------------------------------------------
docker run -itd --name spring-container -p 5555:8080 docker-spring-tomcat:latest


Step 4: View all the containers
-------------------------------------------------------------------
#Shows all the containers stopped and running
docker ps -a


Step 5: Logging into the container
-------------------------------------------------------------------
#Note: The container must be started before we can do this.
docker exec -it <container-id> /bin/bash

#Step 5: to check application on browser 
#http://localhost:5555/DockerSpringTomcatExample-1/
#5555 : exposed posrt over 8080
# DockerSpringTomcatExample : spring project name 
#-1 : build version (check on  pom.xml file)
-------------------------------------------------------------------
http://localhost:5555/DockerSpringTomcatExample-1/

