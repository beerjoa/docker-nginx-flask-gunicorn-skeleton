FROM centos/python-38-centos7
 
USER root
 
ARG WORK_DIR
ENV WORK_DIR $WORK_DIR

RUN pip install --upgrade pip setuptools

COPY ./requirements.txt /root/
RUN pip install -r /root/requirements.txt

RUN useradd -m user
ENV HOME=/home/user
USER user

WORKDIR /home/user/
