FROM python:2
MAINTAINER riel@quantego.com

ENV DEBIAN_FRONTEND noninteractive

VOLUME ["/home/swuser/notebooks"]
VOLUME ["/usr/local/lib/python2.7/site-packages/pyquasar"]

RUN apt-get update
RUN apt-get install -y net-tools inetutils-ping curl \
    git telnet socat tree unzip sudo software-properties-common python-mysqldb \
    pkg-config apt-utils wget build-essential python-dev python python-pip wget \
    liblapack-dev libatlas-dev gfortran libfreetype6 libfreetype6-dev libpng12-dev \
    python-lxml libyaml-dev g++ libffi-dev libzmq-dev libzmq1 openjdk-7-jdk \
    glpk-utils coinor-cbc coinor-clp
RUN pip install -U setuptools pip distribute configobj numpy

ADD ./deploy/pyquasar-0.8.tar.gz /tmp/pyquasar-0.8.tar.gz
RUN pip install -U /tmp/pyquasar-0.8.tar.gz

EXPOSE 8888

RUN groupadd -r swuser -g 433 && \
    useradd -u 431 -r -g swuser -d /home/swuser -s /sbin/nologin -c "Docker image user" swuser && \
    chown -R swuser:swuser /home/swuser

# Copy over some native libs and a default ipython profile.
RUN mkdir /usr/lib/jni
ADD ./deploy/libjniortools.so /usr/lib/jni/libjniortools.so
ADD ./deploy/profiles/profile_default /home/swuser/.ipython/profile_default
RUN chown -R swuser:swuser /home/swuser && chmod -R 770 /home/swuser

USER swuser
ENV HOME /home/swuser
WORKDIR /home/swuser/notebooks
CMD /usr/local/bin/python2 -m IPython notebook 
