#!/bin/bash
yum update -y
yum install -y git httpd docker
systemctl enable httpd
systemctl start httpd
systemctl enable docker
systemctl start docker
usermod -a -G docker ec2-user
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
cd/tmp/
cat <<EOF > docker-compose.yml
services:
  db:
    image: mysql:8.0.15
    container_name: wordpress_db
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: wordpress
      MYSQL_DATABASE: tj
      MYSQL_USER: vasanth
      MYSQL_PASSWORD: laxmivasanth

  wordpress:
    image: wordpress:latest
    container_name: wordpress_app
    depends_on:
      - db
    ports:
      - "9000:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: vasanth
      WORDPRESS_DB_PASSWORD: laxmivasanth
      WORDPRESS_DB_NAME: tj
    volumes:
      - wordpress_data:/var/www/html

volumes:
  db_data:
  wordpress_data:
EOF
cd/tmp/
sudo docker-compose -p my_project up
