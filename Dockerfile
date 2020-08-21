# use tomcat
FROM tomcat:latest


#Author of the Docker File
# MAINTAINER Pictolearn Note: MAINTAINER has been deprecated for LABEL, 
# LABEL is a key value pair 
LABEL "Maintainer"="Pradeep joshi"


# Copy the following directory
COPY /target/DockerSpringTomcatExample-1.war /usr/local/tomcat/webapps/DockerSpringTomcatExample-1.war