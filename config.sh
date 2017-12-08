#!/bin/bash
sudo yum update
sudo yum -y install vim
sudo yum -y install git
sudo yum install -y epel-release
sudo yum update
sudo yum install -y redis
yum install -y avahi
sudo systemctl start redis
sudo systemctl enable redis

#configure java 
sudo su
sudo yum install -y wget
cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz"
tar xzf jdk-8u151-linux-x64.tar.gz
cd /opt/jdk1.8.0_151/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_151/bin/java 2
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_151/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_151/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_151/bin/jar
alternatives --set javac /opt/jdk1.8.0_151/bin/javac

#Set java path
FILE1="/etc/profile.d/java.sh"

/bin/cat <<EOM >$FILE1
export JAVA_HOME=/opt/jdk1.8.0_151
export JRE_HOME=/opt/jdk1.8.0_151/jre
export PATH=$PATH:/opt/jdk1.8.0_151/bin:/opt/jdk1.8.0_151/jre/bin
EOM

#Install maven
cd /usr/local
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
sudo tar xzf apache-maven-3.5.2-bin.tar.gz
sudo ln -s apache-maven-3.5.2  maven


#Set maven path
FILE2="/etc/profile.d/maven.sh"

/bin/cat <<EOM >$FILE2
export M2_HOME=/usr/local/maven
export PATH=\${M2_HOME}/bin:\${PATH}
EOM
