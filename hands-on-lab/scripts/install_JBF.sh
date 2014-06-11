#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "The Directory where JBDEV Studio must be installed should be provided as first parameter"
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
# JBoss Fuse Server - Version
#
if [ -z $2 ]
  then
    FUSE_NAME="jboss-fuse-full-6.1.0.redhat-379"
  else 
    FUSE_NAME="$2"
fi

#
# FTP Server to download the scripts, jar, ...
#
if [ -z $3 ]
  then
    SERVER='ftp://192.168.1.7/pub'
  else 
    SERVER="ftp://$3/pub"
fi

cd $WORKSPACE

#
# Create software folder if it does not exists
#
if [ ! -d $WORKSPACE/software ]; then
  mkdir $WORKSPACE/software
fi  

# Get JBDS from Server
wget -N --no-check-certificate $SERVER/$FUSE_NAME.zip

# Get org.ops4j.pax.url.mvn.cfg file
wget -N --no-check-certificate $SERVER/scripts/org.ops4j.pax.url.mvn.cfg

FUSE_NAME_UNZIPPED=jboss-fuse-6.1.0.redhat-379

# Remove JBoss Fuse Directory
if [ -d $WORKSPACE/software/$FUSE_NAME_UNZIPPED ]; then
    echo "Deleting JBoss Fuse directory : $WORKSPACE/software/$FUSE_NAME_UNZIPPED"
    rm -rf $WORKSPACE/software/$FUSE_NAME_UNZIPPED
fi

# Unzip JBoss Fuse
echo "Unzip ..."
unzip -bo $FUSE_NAME.zip 

# 
# Update maven settings
#
echo -e "\n Update Maven Settings for JBoss Fuse \n"
sed "s/SERVER/$3/" org.ops4j.pax.url.mvn.cfg > mvn.cfg
mv mvn.cfg $FUSE_NAME_UNZIPPED/etc/org.ops4j.pax.url.mvn.cfg

# 
# Add admin user/password
#
echo -e "\n Add admin/admin as login/pasword in etc/users.properties \n"
echo "admin=admin,admin" > $FUSE_NAME_UNZIPPED/etc/users.properties

#
# Move JBoss Fuse to destination directory
#
mv $FUSE_NAME_UNZIPPED $WORKSPACE/software/$FUSE_NAME_UNZIPPED

#
# Cleanup
#
# rm org.ops4j.pax.url.mvn.cfg
# rm $FUSE_NAME.zip