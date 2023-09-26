FROM amazonlinux:2 AS build

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

ENV M2_HOME=/opt/maven

ENV PATH=$PATH:/opt/maven/bin

RUN export JAVA_HOME

RUN export PATH


LABEL MAINTAINER="sidhusaiprasanth@gmail.com"

WORKDIR /opt

RUN yum update -y &&\
    yum install wget -y && \
    yum install tar -y && \
    yum install unzip -y && \
    yum install gzip -y && \
    yum install git -y && \
    yum install vim -y

RUN yum install java-1.8.0-openjdk-devel.x86_64 -y

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz && \
    tar -xzvf apache-maven-3.9.4-bin.tar.gz && \
    mv apache-maven-3.9.4 maven

RUN git clone https://github.com/sidhusaiprasanth/java-login-app.git

WORKDIR /opt/java-login-app

RUN mvn clean package


FROM amazonlinux:2

LABEL MAINTAINER="sidhusaiprasanth@gmail.com"

WORKDIR /opt

RUN yum update -y &&\
    yum install wget -y && \
    #yum install tar -y && \
    yum install unzip -y && \
    #yum install gzip -y && \
    #yum install git -y && \
    yum install vim -y

RUN yum install java-1.8.0-openjdk-devel.x86_64 -y


RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93.zip && \
    unzip apache-tomcat-8.5.93.zip && \
    mv apache-tomcat-8.5.93 tomcat

COPY --from=build /opt/java-login-app/target/dptweb-1.0.war  /opt/tomcat/webapps

EXPOSE 8080

ENTRYPOINT [ "/opt/tomcat/bin/catalina.sh" ]

CMD [ "run" ]




