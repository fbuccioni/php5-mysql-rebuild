php5-mysql-rebuild
================

A script to manually fix the php warning message due the inconsistency 
between header files of the extension and the libmysqlclient headers 
when MySQL 5.6 based libmysqlclient are installed in a deb based distro.

This is the warning:

    Warning: mysql_connect(): Headers and client library minor version
    mismatch. Headers:XXXX Library:XXXX

Instructions
---------------

In your command line:

- Install the requirements

        sudo apt-get install build-essential
        sudo apt-get build-deps php5-mysql

- Install the script

        git clone https://github.com/falcacibar/php5-mysql-rebuild
        cd php5-mysql-rebuild

- Do da thing

        sudo sh php5-mysql-rebuild.sh

