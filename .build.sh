#!/bin/bash
set +x

project=voyager-index-data
production=/var/www/pkgs/$project

sha256sum *.csv > sha256sums.txt
gpg --pinentry-mode loopback --passphrase $gpgpass --batch --yes --detach-sign -a sha256sums.txt

cp *.csv sha256sums.txt* $production
