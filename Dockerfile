FROM tomcat:9.0.117-jre11-temurin

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file or HTML file to the Tomcat webapps directory
COPY src/main/webapp/index.html /usr/local/tomcat/webapps/ROOT/index.html



EXPOSE 8080

CMD ["catalina.sh", "run"]

