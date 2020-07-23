FROM python:3
MAINTAINER charles@sentnl.io
RUN apt-get update -y && \
    apt-get install python3-pip -y
WORKDIR /root/sublerts
ADD . .
RUN pip3 install -r requirements.txt 
ADD docker-files/config-docker.py config.py
RUN chmod +x sublert.py
ADD docker-files/start.sh /root
RUN chmod u+x /root/start.sh
CMD /root/start.sh