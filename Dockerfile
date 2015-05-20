FROM python:2
MAINTAINER riel@quantego.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y net-tools inetutils-ping curl \
    git telnet socat tree unzip sudo software-properties-common python-mysqldb \
    pkg-config apt-utils wget build-essential python-dev python python-pip wget \
    liblapack-dev libatlas-dev gfortran libfreetype6 libfreetype6-dev libpng12-dev \
    python-lxml libyaml-dev g++ libffi-dev libzmq-dev libzmq1 openjdk-7-jdk \
    glpk-utils coinor-cbc coinor-clp
RUN pip install -U setuptools pip distribute configobj numpy

COPY deploy/pyquasar-0.8.tar.gz /tmp/pyquasar-0.8.tar.gz
RUN pip install /tmp/pyquasar-0.8.tar.gz

RUN adduser --home /home/swuser --shell /sbin/nologin --disabled-password swuser && \
    chown -R swuser:swuser /home/swuser

# Copy over some native libs and a default ipython profile.
RUN mkdir /usr/lib/jni
COPY deploy/libjniortools.so /usr/lib/jni/libjniortools.so
COPY deploy/profiles/profile_default /home/swuser/.ipython/profile_default
COPY deploy/quasar-samples /home/swuser/notebooks/samples
RUN chown -R swuser:swuser /home/swuser && chmod -R 770 /home/swuser

USER swuser
EXPOSE 8888
ENV HOME /home/swuser
ENV SULUM_LICENSE "LICENSE sulum slmlp 4.3 30-jun-2015 uncounted hostid=ANY _ck=c51efc8e94 sig='60PG453MNM3XG74U4RVJ2X1W5F32PWNPBSA5EXR22M09V6F1PVQBYHEGN05T97EDC1042ACHHH4G'"
WORKDIR /home/swuser/notebooks
CMD /usr/local/bin/python2 -m IPython notebook 
