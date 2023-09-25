# Java Installation

> Install java 1.8.0 or java8


```shell
sudo su -   # Switch to root user

yum update -y  # Update all packages

yum search java-1.8.0   # Search for java 1.8.0 package


yum install java-1.8.0-openjdk-devel.x86_64 -y   # Install java 1.8.0

java -version   #  To check the java version

echo $JAVA_HOME   # If java home path is not set please set it in .bashrc file

vim ~/.bashrc   # Edit java Home path


# Add these entries

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

export PATH=$PATH:$JAVA_HOME/bin


source ~/.bashrc 
echo $JAVA_HOME   # check again after relload


# Maven Install Instructions


# Download maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz


# Extract Maven and rename it to maven

tar -xzvf apache-maven-3.9.4-bin.tar.gz


# rename it to maven


mv apache-maven-3.9.4 maven


# check maven version it wont detect anywhere in the system

mvn -version



# But when we use maven with full path it detects
/opt/maven/bin/mvn -version


# Add maven to path

vim ~/.bashrc
export M2_HOME=/opt/maven

export PATH=$PATH:$M2_HOME/bin

source ~/.bashrc


# Now we can use mvn -verison from anywhere in the system

mvn -version

# Install git
yum install git -y


# Clone the JAVA code written by developer to make or build package
git clone https://github.com/sidhusaiprasanth/java-login-app.git


# Now build the java app to make .war or .jar package from it

# Read the pom.xml carefully


mvn package


# Once the build is successful we will get an target folder

cd target

# Inside target we will have .war file or .jar file
dptweb-1.0.war



```