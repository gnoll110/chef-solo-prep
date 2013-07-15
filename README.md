chef-solo-prep
==============

initial install of Chef solo on a bare server 

Firstly, update the system then install curl

    sudo apt-get -y update
    sudo apt-get -y upgrade
    sudo apt-get -y curl

Secondy, install chef-solo and it's prerequisites

    curl -L -O https://github.com/gnoll110/chef-solo-prep/raw/master/chef-solo-bootstrap.sh | bash

Run the following to check the installs worked.

    ruby -v
    chef-solo -v
