FROM ubuntu:22.04

RUN apt update -y && apt upgrade -y

RUN apt install libfl-dev zlib1g-dev curl -y

RUN curl -o /opt/graalvm-jdk-21_linux-x64_bin.tar.gz https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz

RUN tar -xzf /opt/graalvm-jdk-21_linux-x64_bin.tar.gz -C /opt/ && \
    rm /opt/graalvm-jdk-21_linux-x64_bin.tar.gz

RUN GRAALVM_HOME=$(find /opt/ -type d -name 'graalvm-jdk-21*' -printf "%p" -quit) && \
    echo JAVA_HOME=$GRAALVM_HOME >> ~/.bashrc && \
    echo PATH=$GRAALVM_HOME/bin:$PATH >> ~/.bashrc && \
    echo export JAVA_HOME=$GRAALVM_HOME >> ~/.bashrc
