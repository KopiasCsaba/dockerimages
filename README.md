# dockerimages
## mysql_centos 
This is a percona docker image, that runs as a non privileged user, could be used with an external volume, and the root password can be overridden with MYSQL_ROOT_PASS.
This serves demo purposes only, do not use in production.

### Build with 
```
sudo docker build -t kcsmysql https://github.com/KopiasCsaba/dockerimages.git#master:mysql_centos
```

### Run with:
 ```
mkdir /tmp/mysqldata;
chmod 0777 /tmp/mysqldata
sudo docker run -it -e 'MYSQL_ROOT_PASS=foobar' --volume=/tmp/mysqldata:/home/user/mysql/data kcsmysql
 ```

