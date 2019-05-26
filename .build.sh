#!/bin/bash
set +x

src=/var/www/voyager-index-database
data=voyager-index-data
production=/var/www/pkgs/$data

# update database

cd $src
git pull -Xtheirs origin master
psql -d map -f database.sql -f export-csv.sql

# export data

sha256sum *.csv > sha256sums.txt
gpg --passphrase $gpgpass --batch --yes --detach-sign -a sha256sums.txt

cp *.csv sha256sums.txt* $production
