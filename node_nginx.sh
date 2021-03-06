apt install -y nginx git
rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default

echo "server {

   listen 80 default_server;
   server_name _;

   root /var/www/phxno.de; 

}" > /etc/nginx/sites-available/phxno.de

sudo ln -s /etc/nginx/sites-available/phxno.de /etc/nginx/sites-enabled/

git clone -b node-webpage https://github.com/phoenixnodes/websites.git /var/www/phxno.de

service nginx restart
