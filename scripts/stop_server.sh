#!/bin/bash
#pkill -U $USER -f "java .*-jar manage.*\.jar"
echo "stop server 停止服务"
#sudo service httpd stop

echo "docker stop"
# 第一步  关闭docker 镜像
##docker stop laravel_cms_php_1

cd /var/www/im_server/
# /usr/local/bin/docker-compose down

sudo rm -rf /var/www/im_server/*
## kill -s 9 8001

