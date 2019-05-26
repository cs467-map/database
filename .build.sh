#!/bin/bash
set +x

# update database

GIT=voyager-index-database

sudo su git
cd $HOME/Documents/$GIT
git pull origin master

psql -d map -f database.sql -f export-csv.sql

exit

# export data

project=voyager-index-data
production=/var/www/pkgs/$project

sha256sum *.csv > sha256sums.txt
gpg --pinentry-mode loopback --passphrase $gpgpass --batch --yes --detach-sign -a sha256sums.txt

cp *.csv sha256sums.txt* $production
