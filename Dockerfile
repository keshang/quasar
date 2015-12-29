FROM ubuntu:14.04
MAINTAINER riel@quantego.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y net-tools inetutils-ping curl \
    git telnet socat tree unzip sudo software-properties-common python-mysqldb \
    pkg-config apt-utils wget build-essential python-dev python python-virtualenv \
    python-pip wget liblapack-dev libatlas-dev gfortran libfreetype6 libfreetype6-dev \
    libpng12-dev python-lxml libyaml-dev g++ libffi-dev libzmq-dev libzmq1 \
    glpk-utils coinor-cbc coinor-clp
RUN add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get update && apt-get install -y --no-install-recommends openjdk-8-jdk
RUN pip install -U setuptools pip distribute configobj numpy scipy

RUN pip install -U http://static.quantego.com/releases/pyquasar-dev.tar.gz

RUN adduser --home /home/swuser --uid 431 --shell /sbin/nologin --disabled-password swuser && \
    chown -R swuser:swuser /home/swuser

# Copy over some native libs and a default ipython profile.
COPY deploy/profiles/profile_default /home/swuser/.ipython/profile_default
ADD http://static.quantego.com/releases/quasar-latest-trial.jar /usr/lib/quasar-latest-trial.jar
RUN chmod 755 /usr/lib/quasar-latest-trial.jar
COPY deploy/00-update.py /home/swuser/.ipython/profile_default/startup/00-update.py
RUN git clone https://github.com/quantego/quasar-samples.git /home/swuser/notebooks/samples
RUN chown -R swuser:swuser /home/swuser && chmod -R 770 /home/swuser

USER swuser
EXPOSE 8888
ENV HOME /home/swuser
ENV QUASAR_JAR /usr/lib/quasar-latest-trial.jar
WORKDIR /home/swuser/notebooks
CMD /usr/bin/python -m IPython notebook 
