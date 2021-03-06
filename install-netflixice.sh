#/bin/bash
# Installing Netflix/ice
set -x

# Root check

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

which git >/dev/null 2>&1
if  [ $? != 0 ]; then
  yum -y install git >/dev/null 2>&1
fi

wget https://gitlab.com/naveenlj/java-install/raw/master/install-java8.sh

bash install-java8.sh

JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk.x86_64

export JAVA_HOME

git clone https://github.com/Netflix/ice.git

cd ice

bash install.sh

