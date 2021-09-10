FROM tomcat:8-jdk11-openjdk-slim
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-webapplication.war
