FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps

COPY target/*.war . 

EXPOSE 8080