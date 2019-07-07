node {
   stage('Update') {
      src = '/var/www/voyager-index-database'
      sh "cd ${src}"
      git url: 'https://github.com/voyager-index/database/'
   }
   stage('Export') {
      sh "psql -d map -f database.sql -f export-data.sql"
   }
   stage('Compress') {
      sh "tar -zcvf voyager-index-data.json.tar.gz voyager-index-data.json"
      sh "tar -zcvf voyager-index-data.csv.tar.gz voyager-index-data.csv"
      sh "zip voyager-index-data.json.zip voyager-index-data.json"
      sh "zip voyager-index-data.csv.zip voyager-index-data.csv"
   }
   stage('Sign') {
      sh "> sha256sums.txt"
      sh "sha256sum voyager-index-data.* >> sha256sums.txt"
      withCredentials([string(credentialsId: 'gpgpass', variable: 'gpgpass')]) {
        sh "gpg --pinentry-mode loopback --passphrase ${gpgpass} --yes --detach-sign -a sha256sums.txt"
      }
   }
   stage('Copy') {
      data = 'voyager-index-data'
      production = "/var/www/pkgs/${data}"
      files = ['voyager-index-data', 'sha256sums']
      files.each { item ->
        sh "cp ${item}* ${production}"
      }
   }
}
