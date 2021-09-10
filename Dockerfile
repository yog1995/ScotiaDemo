FROM tomcat:10.1-jre11-openjdk-slim
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-webapplication.war
