/usr/bin/apt-get update
/usr/bin/apt-get dist-upgrade -y

/usr/bin/apt-get update
/usr/bin/apt-get install -y php5
/usr/bin/apt-get install -y php5-enchant php5-tidy php5-intl php5-xdebug php5-gmp php5-pspell php5-mcrypt php5-json php5-xsl php5-xmlrpc php5-sqlite php5-snmp php5-pgsql php5-odbc php5-ldap php5-imap php5-dev php5-curl php5-gd php-soap php5-curl
/usr/bin/debconf-set-selections <<< 'mysql-server mysql-server/root_password password asd123'
/usr/bin/debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password asd123'
/usr/bin/apt-get install -y mysql-server
/usr/bin/apt-get install -y php5-mysql
/usr/bin/debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
/usr/bin/debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'
/usr/bin/debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password asd123'
/usr/bin/debconf-set-selections <<< 'phpmyadmin phpmyadmin/password-confirm password asd123'
/usr/bin/debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password asd123'
/usr/bin/debconf-set-selections <<< 'phpmyadmin phpmyadmin/setup-password password asd123'
/usr/bin/debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password asd123'
/usr/bin/apt-get install -y phpmyadmin

/usr/bin/wget https://github.com/marius-cojocariu/vagrant-php5.2/releases/download/1.0.0/php_5.2.17-1_amd64.deb
/usr/bin/wget https://github.com/marius-cojocariu/vagrant-php5.2/releases/download/1.0.0/php.ini-recommended
/usr/bin/dpkg -i /home/vagrant/php_5.2.17-1_amd64.deb
/usr/bin/apt-get install -f -y

/bin/ln -s /etc/php5/conf.d /etc/php52
/bin/ln -s /etc/php5/cli /etc/php52
/bin/cp /home/vagrant/php.ini-recommended /etc/php52/apache2/php.ini

/bin/echo "deb http://archive.ubuntu.com/ubuntu precise multiverse" >> /etc/apt/sources.list
/bin/echo "deb http://archive.ubuntu.com/ubuntu precise-updates multiverse" >> /etc/apt/sources.list
/bin/echo "deb http://security.ubuntu.com/ubuntu precise-security multiverse" >> /etc/apt/sources.list

/usr/bin/apt-get update
/usr/bin/apt-get install libapache2-mod-fastcgi -y

/usr/sbin/a2enmod a2enmod cgi fastcgi actions rewrite
/usr/sbin/service apache2 restart

/usr/bin/touch /usr/lib/cgi-bin/php52-cgi
/bin/echo "#!/bin/sh" >> /usr/lib/cgi-bin/php52-cgi
/bin/echo "PHPRC="/etc/php52/apache2/"" >> /usr/lib/cgi-bin/php52-cgi
/bin/echo "export PHPRC" >> /usr/lib/cgi-bin/php52-cgi
/bin/echo "PHP_FCGI_CHILDREN=4" >> /usr/lib/cgi-bin/php52-cgi
/bin/echo "export PHP_FCGI_CHILDREN" >> /usr/lib/cgi-bin/php52-cgi
/bin/echo "PHP_FCGI_MAX_REQUESTS=5000" >> /usr/lib/cgi-bin/php52-cgi
/bin/echo "export PHP_FCGI_MAX_REQUESTS" >> /usr/lib/cgi-bin/php52-cgi
/bin/echo "exec /usr/bin/php52/php-cgi" >> /usr/lib/cgi-bin/php52-cgi
/bin/chmod +x /usr/lib/cgi-bin/php52-cgi

/usr/bin/touch /etc/apache2/php52.conf
/bin/echo "# Include file for virtual hosts that need to run PHP 5.2" >> /etc/apache2/php52.conf
/bin/echo "" >> /etc/apache2/php52.conf
/bin/echo "" >> /etc/apache2/php52.conf
/bin/echo "<FilesMatch "\.php">" >> /etc/apache2/php52.conf
/bin/echo "  SetHandler application/x-httpd-php5" >> /etc/apache2/php52.conf
/bin/echo "</FilesMatch>" >> /etc/apache2/php52.conf
/bin/echo "" >> /etc/apache2/php52.conf
/bin/echo "" >> /etc/apache2/php52.conf
/bin/echo "ScriptAlias /php52-cgi /usr/lib/cgi-bin/php52-cgi" >> /etc/apache2/php52.conf
/bin/echo "Action application/x-httpd-php5 /php52-cgi" >> /etc/apache2/php52.conf
/bin/echo "AddHandler application/x-httpd-php5 .php" >> /etc/apache2/php52.conf

/usr/bin/touch /home/vagrant/activate-php52

adduser www-data vagrant
adduser vagrant www-data
/bin/rm -rf /var/www
/bin/ln -fs /vagrant /var/www

/bin/rm -rf /home/vagrant/php.ini-recommended
/bin/rm -rf /home/vagrant/php_5.2.17-1_amd64.deb

/bin/echo ""
/bin/echo ""
/bin/echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"
/bin/echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"
/bin/echo "To activate php 5.2 add 'Include php52.conf' to <VirtualHost> definition for the sites which should use this version and restart apache"
/bin/echo "To activate php 5.2 add 'Include php52.conf' to <VirtualHost> definition for the sites which should use this version and restart apache" >> /home/vagrant/activate-php52.info
/bin/echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"
/bin/echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"

