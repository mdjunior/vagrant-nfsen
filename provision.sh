#!/usr/bin/env bash


#  Fix error message in system
sudo locale-gen UTF-8

#  Updating repos
sudo apt-get update -y

#  Install deps for nfdump
apt-get install -y libapache2-mod-php5 librrds-perl libmailtools-perl libsocket6-perl rrdtool whois

#  Install nfdump
apt-get install -y nfdump

#  Verify if mod_rewrite is set
if [ ! -e /etc/apache2/mods-enabled/rewrite.load ] ; then
    a2enmod rewrite
    service apache2 restart
fi

#  Checking files, and downloading if they do not exist
if [ ! -e nfsen.tar.gz ] ; then
    wget -q http://sourceforge.net/projects/nfsen/files/stable/nfsen-1.3.7/nfsen-1.3.7.tar.gz/download -k -O nfsen.tar.gz
    wget -q http://sourceforge.net/projects/nfsen/files/stable/nfsen-1.3.7/nfsen-1.3.7.tar.gz.sig/download -k -O nfsen.tar.gz.sig

    gpg --keyserver pgp.mit.edu --recv-key EDE80DF6
    gpg --verify nfsen.tar.gz.sig
    if [ "$?" != "0" ] ; then
        echo "=> Signature not match!"
        exit
    fi
fi

#  Unpack files
tar xvzf nfsen.tar.gz

#  Preparing for the installation of nfsen
mkdir -p /data/nfsen

#  If nfsen is not installed
if [ ! -e /var/www/nfsen ] ; then 
    cd nfsen-*/
    yes ''| ./install.pl /vagrant_data/nfsen.conf
    cd /var/www/nfsen
    ln -s nfsen.php index.php
fi

#  Change the apache configuration for nfsen
sudo sed -i "s/DocumentRoot.*/DocumentRoot \/var\/www/" /etc/apache2/sites-enabled/000-default.conf

#  Restarting nfsen
/data/nfsen/bin/nfsen stop
/data/nfsen/bin/nfsen start

#  Setup fprobe
echo "fprobe fprobe/collector string localhost:9996" | debconf-set-selections
echo "fprobe fprobe/interface string eth0" | debconf-set-selections

#  Install fprobe
DEBIAN_FRONTEND=noninteractive apt-get -y install fprobe
