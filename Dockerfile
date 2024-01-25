FROM ubuntu:24.04

RUN apt update -y && apt upgrade -y

RUN apt install libfl-dev zlib1g-dev curl -y

RUN curl -o /opt/graalvm-jdk-21_linux-x64_bin.tar.gz https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz

RUN tar -xzf /opt/graalvm-jdk-21_linux-x64_bin.tar.gz -C /opt/

RUN rm /opt/graalvm-jdk-21_linux-x64_bin.tar.gz

RUN echo JAVA_HOME=$(find /opt/ -type d -name 'graalvm-jdk-21*' -printf "%p" -quit) >> ~/.bashrc
RUN echo PATH=$(find /opt/ -type d -name 'graalvm-jdk-21*' -printf "%p" -quit)/bin:$PATH >> ~/.bashrc

RUN echo export JAVA_HOME=$(find /opt/ -type d -name 'graalvm-jdk-21*' -printf "%p" -quit) >> ~/.bashrc
RUN echo export PATH=$(find /opt/ -type d -name 'graalvm-jdk-21*' -printf "%p" -quit)/bin:$PATH >> ~/.bashrc
