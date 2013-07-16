#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential zlib1g zlib1g-dev libssl-dev libreadline5 libreadline5-dev git
#
# Install rbenv
cd /usr/local
git clone git://github.com/sstephenson/rbenv.git rbenv
chgrp -R staff rbenv
chmod -R g+rwxXs rbenv
# make sure users that will use rbenv are in the group associated with the rbenv foller, ie 'staff' atm
#
# Mods for bash etcruby-build
cp ~/.profile ~/.profile.bck
sudo cp /etc/skel/.profile /etc/skel/.profile.bck
sudo echo '# rbenv setup' | tee -a ~/.profile /etc/skel/.profile
sudo echo 'export RBENV_ROOT=/usr/local/rbenv' | tee -a ~/.profile /etc/skel/.profile
sudo echo 'export PATH="$RBENV_ROOT/bin:$PATH"' | tee -a ~/.profile /etc/skel/.profile
sudo echo 'eval "$(rbenv init -)"' | tee -a ~/.profile /etc/skel/.profile
#
# Install 
cd /usr/local/rbenv
mkdir plugins
cd plugins
git clone git://github.com/sstephenson/ruby-build.git
chgrp -R staff ruby-build
chmod -R g+rwxs ruby-build
#
sudo echo 'export PATH="$RBENV_ROOT/plugins/ruby-build/bin:$PATH"' | tee -a ~/.profile /etc/skel/.profile
#
. ~/.profile
#
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
rbenv rehash
gem install chef ruby-shadow --no-ri --no-rdoc
rbenv rehash