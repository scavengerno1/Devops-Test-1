FROM tomcat:9.0.117-jre11-temurin

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file
COPY target/*.war /usr/local/tomcat/webapps/devops-project-1.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

