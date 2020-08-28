# Install FROM UBUNTU IMAGE
FROM ubuntu:latest

#Author of the Docker File
# MAINTAINER Pictolearn Note: MAINTAINER has been deprecated for LABEL, 
# LABEL is a key value pair 
LABEL "Maintainer"="Pradeep Joshi"


# NOTE and WARNING: ORACLE JDK is no longer licensed.
# use JDk 11 
FROM store/oracle/jdk:11



#use maven
FROM maven:latest as mvnBuild



# ADD a directory called docker-git-hello-world inside the UBUNTU IMAGE where you will be moving all of these files under this 
# DIRECTORY to
#ADD . /usr/local/DockerTomcatWarRun



ENV HOME=/home/usr/app

RUN mkdir -p $HOME

WORKDIR $HOME

# 1. add pom.xml only here

ADD pom.xml $HOME

# 2. start downloading dependencies

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

# 3. add all source code and start compiling

ADD . $HOME

RUN ["mvn", "package"]

#check the war file in target folder
RUN cd ./target && pwd && ls


RUN cd ./target && mv DockerSpringTomcatExample-1.war docker-spring-tomcat.war

# use tomcat
FROM tomcat:latest

EXPOSE 5555

COPY --from=mvnBuild /home/usr/app/target/docker-spring-tomcat.war /usr/local/tomcat/webapps

#RUN /usr/local/tomcat/bin/startup.sh
