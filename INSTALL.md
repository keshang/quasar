# Quasar installation without Docker

These instructions allow you to run QUASAR without Docker.

## System requirements.

This is tested on Debian and Ubuntu. It should run on Red Hat, CentOS and Fedora with minimal adaptions.

For OSX, Homebrew and XCode's Command Line Utilities are required.

Python 2.7 is well tested. Python 3 should work, but is not tested.

## Install required system packages

These dependencies are needed for compiling Python packages. When using a pre-compiled Python distribution, like Anaconda, this may be partly avoided.

```
sudo apt-get install build-essential python-dev python python-virtualenv pkg-config\
                     liblapack-dev libatlas-dev gfortran libfreetype6 libfreetype6-dev \
                     libpng12-dev python-lxml libyaml-dev g++ libffi-dev libzmq-dev libzmq1
```

Be sure Java 8 is availaible for installation. Jessie and Ubuntu need backports repo. E.g.

`echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list`

Then install Java 8 (open source version). Sun/Oracle Java should also work.

`sudo apt-get install -y --no-install-recommends openjdk-8-jdk`

## Create virtual environment for PyQuasar

```
virtualenv quasasr-env
source quasasr-env/bin/activate
pip install -U setuptools pip distribute configobj numpy
```

## Install Quasar Python libs
`http://static.quantego.com/releases/pyquasar-dev.tar.gz`

## Download Java bindings and set environment variable
```
wget http://static.quantego.com/releases/quasar-latest-trial.jar
export QUASAR_JAR=$(pwd)/quasar-latest-trial.jar
```

On OSX versions with Java 6, it's also necessary to point to the correct Java version.

`export QUASAR_JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/jre/lib/server/libjvm.dylib"`

## Testing
To run tests after installation:
`python -c 'import pyquasar.tests; pyquasar.tests.run()'`

## Bugs
Please report bugs in the relevant Java or Python repos:

- https://github.com/loehndorf/stochasticsolver/issues
- https://github.com/manuelRiel/pyquasar/issues

## Documentation
- http://docs.quantego.com/pyquasar
- http://docs.quantego.com/quasar

## Updating
To update to a newer Version: (while in the project folder with the virtualenv activated)

```
wget -N http://static.quantego.com/releases/quasar-latest_obf.jars
pip install -U http://static.quantego.com/releases/pyquasar-0.8.tar.gz
```
