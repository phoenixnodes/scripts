mkdir /srv/backups

cd /srv

echo "Is this a US or EU server? (us or eu)"
read whatserver

wget https://raw.githubusercontent.com/phoenixnodes/scripts/master/$whatserver-backup.sh -O "backup.sh" && chmod a+x backup.sh

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "0 */12 * * * bash /srv/backup.sh" >> mycron
#install new cron file
crontab mycron
rm mycron

curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws
rm -rf awscliv2.zip

/usr/local/bin/aws configure

/usr/local/bin/aws configure set default.s3.max_bandwidth 50MB/s

echo "Done"
