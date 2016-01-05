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

git clone https://github.com/Netflix/ice.git

cd ice

bash install.sh
