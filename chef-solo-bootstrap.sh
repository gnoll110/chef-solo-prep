#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential zlib1g zlib1g-dev libssl-dev libreadline5 libreadline5-dev git
#
# Install rbenv
cd /usr/local
sudo git clone git://github.com/sstephenson/rbenv.git rbenv
sudo chgrp -R staff rbenv
sudo chmod -R g+rwxXs rbenv
# make sure users that will use rbenv are in the group associated with the rbenv foller, ie 'staff' atm
#
# Mods for bash etcruby-build
cp ~/.profile ~/.profile.bck
sudo cp /etc/skel/.profile /etc/skel/.profile.bck
sudo echo '# rbenv setup' | sudo tee -a ~/.profile /etc/skel/.profile
sudo echo 'export RBENV_ROOT=/usr/local/rbenv' | sudo tee -a ~/.profile /etc/skel/.profile
sudo echo 'export PATH="$RBENV_ROOT/bin:$PATH"' | sudo tee -a ~/.profile /etc/skel/.profile
sudo echo 'eval "$(rbenv init -)"' | sudo tee -a ~/.profile /etc/skel/.profile
#
# Install 
cd /usr/local/rbenv
sudo mkdir plugins
cd plugins
sudo git clone git://github.com/sstephenson/ruby-build.git
sudo chgrp -R staff ruby-build
sudo chmod -R g+rwxs ruby-build
cd ruby-build
sudo ./install.sh
#
sudo echo 'export PATH="$RBENV_ROOT/plugins/ruby-build/bin:$PATH"' | sudo tee -a ~/.profile /etc/skel/.profile
#
. ~/.profile
#
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
rbenv rehash
gem install chef ruby-shadow --no-ri --no-rdoc
rbenv rehash