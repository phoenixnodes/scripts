apt install -y nginx
rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default

echo "server {

   listen 80 default_server;
   server_name _;

   root /var/www/default; 

}" > /etc/nginx/sites-available/default

sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

service nginx restart

cd /var/www/default

git clone 
