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

printf "${COLOR}updating database${NC}"
cd "$src"
git pull -Xtheirs origin master

printf "${COLOR}expoting database${NC}"
psql -d map -f database.sql -f export-data.sql

# export data

printf "${COLOR}signing exports${NC}"
sha256sum *.csv > sha256sums.txt
gpg --passphrase "$gpgpass" --batch --yes --detach-sign -a sha256sums.txt

printf "${COLOR}copying exports${NC}"
for file in "${files[@]}"
do
    cp "$file"* "$production"
done
exit
