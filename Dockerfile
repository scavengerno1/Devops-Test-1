FROM tomcat:9.0.117-jre11-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY src/main/webapp/index.html /usr/local/tomcat/webapps/ROOT/index.html


EXPOSE 8080

CMD ["catalina.sh", "run"]

