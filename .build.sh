#!/bin/bash
set +x

src=/var/www/voyager-index-database
data=voyager-index-data
production=/var/www/pkgs/$data
files=(
voyager-index-data 
sha256sums
)
COLOR='\033[1;36m'
NC='\033[0m' # No Color
export GPG_TTY=$(tty)

# update database

printf "${COLOR}updating database${NC}\n"
cd "$src"
git pull -Xtheirs origin master

printf "${COLOR}exporting database${NC}\n"
psql -d map -f database.sql -f export-data.sql

# export data
printf "${COLOR}compressing exports${NC}\n"
tar -zcvf voyager-index.data.json.tar.gz voyager-index-data.json
tar -zcvf voyager-index.data.csv.tar.gz voyager-index-data.csv
zip voyager-index.data.json.zip voyager-index-data.json
zip voyager-index.data.csv.zip voyager-index-data.csv

printf "${COLOR}signing exports${NC}\n"
touch sha256sums.txt
sha256sum voyager-index-data.* >> sha256sums.txt
gpg --passphrase "$gpgpass" --batch --yes --detach-sign -a sha256sums.txt

printf "${COLOR}copying exports${NC}\n"
for file in "${files[@]}"
do
    cp "$file"* "$production"
done
exit
