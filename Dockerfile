FROM maven:3.9 AS maven
COPY . .
RUN mvn clean install
FROM tomcat:8.0.20-jre8
COPY --from=maven target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
