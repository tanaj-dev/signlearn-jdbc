FROM tomcat:10.1-jdk21
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY WebContent/ /usr/local/tomcat/webapps/signlearn/
COPY lib/mysql-connector.jar /usr/local/tomcat/lib/
COPY src/ src/
RUN javac -cp /usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/lib/mysql-connector.jar -d /usr/local/tomcat/webapps/signlearn/WEB-INF/classes/ src/RegistroServlet.java
ENV PORT=8080
EXPOSE 8080
CMD ["catalina.sh", "run"]