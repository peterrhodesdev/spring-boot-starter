#!/bin/bash

# Install Java OpenJDK

JAVA_OPEN_JDK_VERSION=11

sudo add-apt-repository ppa:openjdk-r/ppa \
&& sudo apt update \
&& sudo apt install openjdk-${JAVA_OPEN_JDK_VERSION}-jdk \
&& sudo sh -c "echo export JAVA_HOME=/usr/lib/jvm/java-${JAVA_OPEN_JDK_VERSION}-openjdk-amd64 >> /etc/profile"

if [ $? -eq 0 ]; then
  echo "SUCCESS: Java OpenJDK installed successfully"
else
  echo "FAIL: Java OpenJDK not installed, exiting";
  exit 1;
fi

# Install Maven

command -v java >/dev/null 2>&1 || { echo >&2 "Maven requires java but it's not installed, exiting"; exit 1; }
command -v javac >/dev/null 2>&1 || { echo >&2 "Maven requires javac but it's not installed, exiting"; exit 1; }

MAVEN_VERSION=3.8.1
MAVEN_TAR_GZ_FILE_NAME="apache-maven-${MAVEN_VERSION}-bin.tar.gz"

curl https://downloads.apache.org/maven/maven-${MAVEN_VERSION:0:1}/${MAVEN_VERSION}/binaries/${MAVEN_TAR_GZ_FILE_NAME} -o ~/Downloads/${MAVEN_TAR_GZ_FILE_NAME} \
&& sudo tar -xvsf ~/Downloads/${MAVEN_TAR_GZ_FILE_NAME} -C /opt \
&& cat << EOF | sudo tee -a /etc/profile
export M2_HOME="/opt/apache-maven-${MAVEN_VERSION}"
export PATH=$JAVA_HOME/bin:${M2_HOME}/bin:$PATH
EOF

if [ $? -eq 0 ]; then
  echo "SUCCESS: Maven installed"
else
  echo "FAIL: Maven not installed, exiting";
  exit 1;
fi
