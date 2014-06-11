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
# JBDS Installation folder Name
#
if [ -z "$2" ]
  then
    JBDS_DIR="jbds-7.1"
  else 
    JBDS_DIR="$2"
fi

# 
# JAR file used to install JBDS
#
if [ -z "$3" ]
  then
    JBDS_JAR="jbdevstudio-product-eap-universal-7.1.1.GA-v20140314-2145-B688.jar"
  else 
    JBDS_JAR="$3"
fi

#
# Server to download the scripts, jar ...
#
if [ -z "$4" ]
  then
    FTP_SERVER='ftp://192.168.1.7/pub'
  else 
    FTP_SERVER="ftp://$4/pub"
fi


#
# Move to the WORKSPACE directory
#
cd $WORKSPACE

#
# Create software folder if it does not exists
#
if [ ! -d $WORKSPACE/software ]; then
  mkdir $WORKSPACE/software
fi

# 
# Get JBDS from FTP Server
#
JBDS=$FTP_SERVER/$JBDS_JAR
wget -N --no-check-certificate $JBDS

#
# Get JAVA Path
#
JAVA=$(which java)
echo "JAVA EXEC : $JAVA"

# 
# Create the configFile
#
echo "Creation of the config file for the installation"
echo "<?xml version='1.0' encoding='UTF-8' standalone='no'?>
<AutomatedInstallation langpack='eng'>
<com.jboss.jbds.installer.HTMLInfoPanelWithRootWarning id='introduction'/>
<com.izforge.izpack.panels.HTMLLicencePanel id='licence'/>
<com.jboss.jbds.installer.PathInputPanel id='target'>
<installpath>$WORKSPACE/software/$JBDS_DIR</installpath>
</com.jboss.jbds.installer.PathInputPanel>
<com.jboss.jbds.installer.JREPathPanel id='jre'/>
<com.jboss.jbds.installer.JBossAsSelectPanel id='as'>
<installgroup>jbds</installgroup>
</com.jboss.jbds.installer.JBossAsSelectPanel>
<com.jboss.jbds.installer.UpdatePacksPanel id='updatepacks'/>
<com.jboss.jbds.installer.DiskSpaceCheckPanel id='diskspacecheck'/>
<com.izforge.izpack.panels.SummaryPanel id='summary'/>
<com.izforge.izpack.panels.InstallPanel id='install'/>
<com.jboss.jbds.installer.CreateLinkPanel id='createlink'>
<jrelocation>$JAVA</jrelocation>
</com.jboss.jbds.installer.CreateLinkPanel>
<com.izforge.izpack.panels.ShortcutPanel id='shortcut'/>
<com.jboss.jbds.installer.ShortcutPanelPatch id='shortcutpatch'/>
<com.izforge.izpack.panels.SimpleFinishPanel id='finish'/>
</AutomatedInstallation>
" > installConfig.xml


# Remove JBDS Directory
if [ -d $WORKSPACE/software/$JBDS_DIR ]; then
    echo "Deleting JBDS directory : $WORKSPACE/software/$JBDS_DIR"
    rm -rf $WORKSPACE/software/$JBDS_DIR
fi

#
# Installation of JBDS
#
echo "Installation of JBDS"
java -jar $JBDS_JAR installConfig.xml

#
# Cleanup
#
echo "Delete installConfig.xml and JBDS Jar"
# rm installConfig.xml
# rm $JBDS_JAR
