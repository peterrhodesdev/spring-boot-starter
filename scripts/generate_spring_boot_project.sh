#!/bin/bash

# List of all Spring Initializr dependencies
#curl -H 'Accept: application/json' https://start.spring.io | jq -r '.dependencies.values[].values[].id'

JAVA_VERSION="11"
SPRING_BOOT_VERSION="2.5.4"
REVERSED_DOMAIN_NAME="dev.peterrhodes"
APP_NAME="sbstarter"
APP_DESCRIPTION="Spring Boot starter"
PROJECT_DIR_NAME="spring-boot-starter"
TMP_ZIP_FILE_NAME="starter.zip"
# Dependencies are a comma-separated list with no spaces
DEPENDENCIES="web"

mkdir $PROJECT_DIR_NAME \
&& curl https://start.spring.io/starter.zip \
   -d type=maven-project \
   -d language=java \
   -d bootVersion=$SPRING_BOOT_VERSION \
   -d groupId=$REVERSED_DOMAIN_NAME.$APP_NAME \
   -d artifactId=$APP_NAME \
   -d name=$APP_NAME \
   -d description="$APP_DESCRIPTION" \
   -d packageName=$REVERSED_DOMAIN_NAME.$APP_NAME \
   -d packaging=jar \
   -d javaVersion=$JAVA_VERSION \
   -d dependencies=$DEPENDENCIES \
   -o $TMP_ZIP_FILE_NAME \
&& unzip $TMP_ZIP_FILE_NAME -d $PROJECT_DIR_NAME \
&& rm $TMP_ZIP_FILE_NAME
