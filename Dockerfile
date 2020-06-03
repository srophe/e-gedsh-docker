# Specify the eXist-db release as a base image
FROM existdb/existdb:5.2.0

# Copy Srophe required libraries/modules to autodeploy, include the srophe.xar and the srophe-data.xar
COPY autodeploy/*.xar /exist/autodeploy/

# OPTIONAL: Copy custom controller-config.xml to WEB-INF. This sets the root app to srophe.
#COPY conf/controller-config.xml /exist/webapp/WEB-INF/

# OPTIONAL: Copy custom jetty config to set context to '/'
# See: https://exist-open.markmail.org/message/gjp2po2ducmckvix?q=set+app+as+root+order:date-backward
#COPY conf/exist-webapp-context.xml /exist/tools/jetty/webapps/

#EXPOSE 8080 8443
EXPOSE 8080 8444

# Start eXist-db
CMD [ "java", "-jar", "start.jar", "jetty" ]