#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "The Directory where JBDS Studio must be installed should be provided as first parameter"
    exit;
fi

# 
# Workspace
#
if [ -z "$1" ]
  then
    WORKSPACE="$HOME/Temp/lab"
  else 
  	WORKSPACE="$1"
fi

# 
# JBDS Folder Name
#
if [ -z "$2" ]
  then
    JBDS_FOLDER_NAME="jbds-7.1"
  else 
    JBDS_FOLDER_NAME="$2"
fi

# 
# FTP Server to download the integration stack zip file
# 
if [ -z "$3" ]
  then
    SERVER='ftp://192.168.1.7/pub'
  else 
  	SERVER="ftp://$3/pub"
fi


# REPO='https://devstudio.jboss.com/updates/7.0-development/integration-stack/'
#      'https://devstudio.jboss.com/updates/7.0/integration-stack/'
#      'https://devstudio.jboss.com/updates/7.0'

# 
# Set path to JBoss Developer Studio install folder
#
JBDS_STUDIO="$WORKSPACE/software/$JBDS_FOLDER_NAME/studio"
echo "JBDS_STUDIO Folder : $JBDS_STUDIO"

# Jar used to launch the Tooling
LAUNCHER=org.eclipse.equinox.launcher_1.3.0.v20130327-1440.jar

# Set path to JBDS IS update site zip
JBDSIS_NAME=jbdevstudio-integration-stack-updatesite-7.0.2.CR1.zip
#JBDSIS_NAME=jbdevstudio-integration-stack-updatesite-7.0.1.GA.zip
JBDSIS_RENAMED=jbds-is-updatesite.zip

JBDS_JAR_NAME=jbdevstudio-product-eap-universal-7.1.1.GA-v20140314-2145-B688.jar
JBDSIS_EXT=jbdevstudio-updatesite-7.1.1.GA-v20140314-2145-B688.zip
JBDS_TARGET_PLATFORM=jbdevstudiotarget-4.32.0.Final.zip

# 
# Change to the WORKSPACE directory to download the files
#
cd $WORKSPACE

# fetch update site zip
echo "cmd : wget -N --no-check-certificate ${SERVER}/$JBDSIS_NAME"
wget -N --no-check-certificate ${SERVER}/$JBDSIS_NAME
#ln -s ${JBDSIS_NAME} ${JBDSIS_RENAMED}

# Fetch JBDS Integration Site - Extension
echo "cmd : wget -N --no-check-certificate ${SERVER}/$JBDSIS_EXT"
wget -N --no-check-certificate ${SERVER}/$JBDSIS_EXT

# fetch jar file of JBDS
# wget -N --no-check-certificate ${SERVER}/${JBDS_JAR_NAME}

# fetch jar file of JBDS_TARGET_PLATFORM
echo "cmd : wget -N --no-check-certificate ${SERVER}/$JBDS_TARGET_PLATFORM"
wget -N --no-check-certificate ${SERVER}/$JBDS_TARGET_PLATFORM

#REPOS="jar:file://$WORKSPACE/$JBDSIS_RENAMED!/,jar:file://$WORKSPACE/$JBDS_JAR_NAME!/"
#REPOS="jar:file://$WORKSPACE/$JBDSIS_RENAMED!/,https://devstudio.jboss.com/updates/7.0"
#REPOS="jar:file://$WORKSPACE/${JBDSIS_RENAMED}!/,jar:file://$WORKSPACE/${JBDSIS_EXT}!/,jar:file://$WORKSPACE/${JBDS_TARGET_PLATFORM}!/"
REPOS="jar:file://$WORKSPACE/$JBDSIS_NAME!/,jar:file://$WORKSPACE/$JBDS_TARGET_PLATFORM!/"

# 
# Move to JBDS Studio directory to run/launch the command
#
cd $JBDS_STUDIO

#
# Launch installation
#
java -jar plugins/$LAUNCHER -application org.eclipse.equinox.p2.director -repository $REPOS -installIU org.fusesource.ide.camel.editor.feature.feature.group -installIU org.fusesource.ide.server.extensions.feature.feature.group -installIU org.fusesource.ide.runtimes.feature.feature.group

#
# Cleanup
# 
#rm $WORKSPACE/$JBDSIS_NAME
#rm $WORKSPACE/$JBDS_TARGET_PLATFORM
#rm $WORKSPACE/$JBDSIS_EXT
