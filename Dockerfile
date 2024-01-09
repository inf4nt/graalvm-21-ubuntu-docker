FROM ubuntu:24.04

RUN apt update -y && apt upgrade -y

RUN apt install libfl-dev zlib1g-dev curl -y

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /work-dir

RUN curl -o graalvm-jdk-21_linux-x64_bin.tar.gz https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz

RUN tar -xzf graalvm-jdk-21_linux-x64_bin.tar.gz

RUN rm graalvm-jdk-21_linux-x64_bin.tar.gz

RUN echo JAVA_HOME=/work-dir/graalvm-jdk-21.0.1+12.1 >> ~/.bashrc
RUN echo PATH=/work-dir/graalvm-jdk-21.0.1+12.1/bin:$PATH >> ~/.bashrc

RUN echo export JAVA_HOME=/work-dir/graalvm-jdk-21.0.1+12.1 >> ~/.bashrc
RUN echo export PATH=/work-dir/graalvm-jdk-21.0.1+12.1/bin:$PATH >> ~/.bashrc
