#!/bin/bash
set +x

src=/var/www/voyager-index-database
data=voyager-index-data
production=/var/www/pkgs/$data
files=voyager-index-data.voyager-index-data.json sha256sums.txt*

# update database

echo "updating database"
cd $src
git pull -Xtheirs origin master

echo "exporting database"
psql -d map -f database.sql -f export-csv.sql
psql -d map -f database.sql -f export-json.sql

# export data

echo "signing exports"
sha256sum *.csv > sha256sums.txt
gpg --passphrase $gpgpass --batch --yes --detach-sign -a sha256sums.txt

echo "copying exports"
cp $files $production
