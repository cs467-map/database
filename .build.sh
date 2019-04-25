GIT=voyager-index-database

cd /tmp
mkdir $GIT
cd $GIT
git init
git remote add origin git@github.com:cs467-map/database.git
git pull origin master

psql -d map -f database.sql
