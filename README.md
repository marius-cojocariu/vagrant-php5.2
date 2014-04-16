vagrant-php5.2
==============

Simple vagrant box with deploy script for apache, php 5.2.17, mysql and phpmyadmin.

This will install a vagrant development environment with php version 5.2.17 that can be activated on demand. It downloads a special prepared deb file and php.ini from dropbox. Do not use it in production.

The default php version is the system package one (php 5.3.~). To activate the old version, add ```Include php52.conf``` in the ```<VirtualHost>``` definition of any sites that should use it (the default one is at ```/etc/apache2/sites-available/default```).

Of course, php 5.2 is no longer supported and is a security risk.

Special thanks to the authors of http://zgadzaj.com/how-to-install-php-53-and-52-together-on-ubuntu-1204. The deb file was compiled using their instructions.

License? you may use this repo as you see fit (MIT license for my files, the deb and php.ini are not mine to grant them a license).
