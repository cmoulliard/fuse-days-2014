#
# MAC
#

# INSTALL JBoss Fuse
# Get script file
wget ftp://192.168.1.7/pub/scripts/install_JBF.sh
# Run script
./install_JBF.sh /Users/chmoulli/Temp/lab jboss-fuse-full-6.1.0.redhat-379 192.168.1.7

# Install JBDS Studio
# Get script file
wget ftp://192.168.1.7/pub/scripts/install_JBDS.sh
# Run script
./install_JBDS.sh /Users/chmoulli/Temp/lab/jbds-7.1/ jbdevstudio-product-eap-universal-7.1.1.GA-v20140314-2145-B688.jar 192.168.1.7

# Post Installation JBDS
# Get script file
wget ftp://192.168.1.7/pub/scripts/install_IS.sh
# Run script
./install_IS.sh /Users/chmoulli/Temp/lab/jbds-7.1 192.168.1.7

# Run script
./install_IS2.sh /Users/chmoulli/Temp/lab/jbds-7.1 /Users/chmoulli/Temp/lab/ 192.168.1.7

# Post Installation JBDS
# Get script file
wget ftp://192.168.1.7/pub/scripts/updateMavenSettings.sh
# Run script
./updateMavenSettings.sh 192.168.1.7

#
# Fedora - Lenovo
#

# INSTALL JBoss Fuse
# Get script file
wget ftp://192.168.1.7/pub/scripts/install_JBF.sh
# Run script
#./install_JBF.sh /Users/chmoulli/Temp/lab jboss-fuse-full-6.1.0.redhat-379 192.168.1.7
./install_JBF.sh /home/dabou/Temp/lab jboss-fuse-full-6.1.0.redhat-379 192.168.1.7

# Install JBDS Studio
# Get script file
wget ftp://192.168.1.7/pub/scripts/install_JBDS.sh
# Run script
#./install_JBDS.sh /Users/chmoulli/Temp/lab/jbds-7.1/ jbdevstudio-product-eap-universal-7.1.1.GA-v20140314-2145-B688.jar 192.168.1.7
./install_JBDS.sh /home/dabou/Temp/lab/jbds-7.1/ jbdevstudio-product-eap-universal-7.1.1.GA-v20140314-2145-B688.jar 192.168.1.7

# Post Installation JBDS
# Get script file
wget ftp://192.168.1.7/pub/scripts/install_IS.sh
# Run script
#./install_IS.sh /Users/chmoulli/Temp/lab/jbds-7.1 192.168.1.7
./install_IS.sh /home/dabou/Temp/lab/jbds-7.1 192.168.1.7

./install_IS2.sh /home/dabou/Temp/lab/jbds-7.1 /home/dabou/Temp/lab 192.168.1.7

# Post Installation JBDS
# Get script file
wget ftp://192.168.1.7/pub/scripts/updateMavenSettings.sh
# Run script
./updateMavenSettings.sh 192.168.1.7


