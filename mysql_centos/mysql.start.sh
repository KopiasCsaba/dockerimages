#!/bin/bash





if [ ! -d "/home/user/mysql/data/mysql" ]; then

    echo "Initializing mysql..."
    mysql_install_db --ser=mysql --ldata=/home/user/mysql/data;
    mysqld_safe --defaults-file='/home/user/mysql/my.cnf' &
    sleep 5; 
    mysqladmin -h 127.0.0.1 -u root password "$MYSQL_ROOT_PASS"; 
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY \"$MYSQL_ROOT_PASS\";" | mysql -u root -p$MYSQL_ROOT_PASS -h 127.0.0.1;
    
fi


    mysqld_safe --defaults-file='/home/user/mysql/my.cnf' & tail -f /home/user/mysql/data/mysql.log



