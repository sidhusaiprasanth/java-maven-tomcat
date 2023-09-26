# Tomcat server setup

## Install JAVA first

> Install java 1.8.0 or java8

```shell
sudo su -   # Switch to root user

yum update -y  # Update all packages

yum search java-1.8.0   # Search for java 1.8.0 package


yum install java-1.8.0-openjdk-devel.x86_64 -y   # Install java 1.8.0

java -version   #  To check the java version

# Install Tomcat

wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93.zip

# Extract the downloaded file
unzip apache-tomcat-8.5.93.zip


# Rename tomcat

mv apache-tomcat-8.5.93 tomcat

cd tomcat

cd bin


# Give executable permisisions to all files in this bin folder

chmod +x *


# copy the .war file package which was generated in maven build to tomcat webapps folder

cp -r /opt/java-login-app/target/dptweb-1.0.war /opt/tomcat/webapps/

#OPTIONAL ###

# If tomcat is in different server:

scp -r /opt/java-login-app/target/dptweb-1.0.war root@IPADDRESS:/opt/tomcat/webapps

# Now start the tomcat server

cd /opt/tomcat/bin

./catalina.sh start


# Now go to any browser and browse this website 

http://IPADDRESS:8080/WARFILENAME

```

