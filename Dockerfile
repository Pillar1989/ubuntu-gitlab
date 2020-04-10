FROM ubuntu:20.04

RUN apt update
RUN apt install -y  wget git g++ cmake build-essential python3-pip
