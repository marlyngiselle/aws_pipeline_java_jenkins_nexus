FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps

COPY target/rihanna.war .

EXPOSE 8080