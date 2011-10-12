#!/bin/sh
mkdir -v $HOME/workspaces $HOME/htdocs $HOME/sources
chmod a+rx $HOME/htdocs
sudo aptitude install libapache2-mod-php5 php5-mysql php5-cli php-pear mysql-server phpmyadmin vim rpl bash-completion
sudo pear channel-update pear.php.net
sudo pear upgrade -a pear/pear
sudo cp /etc/apache2/sites-available/default /etc/apache2/sites-available/std-dev-layout
sudo `echo rpl "/var/www" "$HOME/htdocs"` /etc/apache2/sites-available/std-dev-layout
sudo rpl "AllowOverride None" "AllowOverride All" /etc/apache2/sites-available/std-dev-layout
sudo a2dissite default
sudo a2ensite std-dev-layout
sudo /etc/init.d/apache2 restart
