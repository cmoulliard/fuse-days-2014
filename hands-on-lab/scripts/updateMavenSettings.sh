#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit;
fi

# IP Address of the Apache Archiva Server
if [ -z "$1" ]
  then
    SERVER="192.168.1.10"
  else 
    SERVER="$1"
fi

#
# Backup user maven settings.xml file 
#
echo "Backup settings.xml file & maven repository"
if [ -d "$HOME/.m2/" ]; then
	if [ -f "$HOME/.m2/settings.xml" ]; then
      mv $HOME/.m2/settings.xml $HOME/.m2/settings.xml.bk
    fi
    if [ -d "$HOME/.m2/repository" ]; then
      mv -f $HOME/.m2/repository $HOME/.m2/repository.bk
    fi
fi

#
# Add mirror 
#
echo "Add maven settings"
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<settings xmlns=\"http://maven.apache.org/SETTINGS/1.0.0\"
          xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
          xsi:schemaLocation=\"http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd\">
 <servers>
	<server>
		<id>fabric8.upload.repo</id>
		<username>admin</username>
		<password>admin</password>
	</server>
</servers>
<mirrors>
    <mirror>
      <id>archiva.default</id>
      <url>http://${SERVER}:8080/repository/all/</url>
      <mirrorOf>external:*</mirrorOf>
    </mirror>
</mirrors>
</settings>
" > ~/.m2/settings.xml