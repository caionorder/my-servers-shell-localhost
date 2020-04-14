#!/bin/bash

if [ $1 ]
then

	if [ $1 == start ]
	then
	
		echo start servers.

		if [ $2 == all ]
		then
			echo 'MYSQL - OK'
			brew services start mysql@5.7
			echo 'PHP 5 - OK'
			sudo /usr/local/php5/sbin/php-fpm
			sudo chmod 777 /usr/local/php5/var/php5.sock
			echo 'PHP 7 - OK'
			sudo php-fpm
			sudo chmod 777 /usr/local/php7.3-fpm.sock
			echo 'NGINX - OK'
			brew services start nginx
		fi

		if [ $2 == mysql ]
		then
			brew services start mysql@5.7
		fi

		if [ $2 == nginx ]
		then
			sudo /usr/local/php5/sbin/php-fpm
			sudo chmod 777 /usr/local/php5/var/php5.sock
			brew services start nginx
		fi
	fi

	if [ $1 == stop ]
	then
	
		if [ $2 == all ]
		then
			brew services stop mysql@5.7
			brew services stop nginx
			sudo pkill php
			
		fi

		if [ $2 == mysql ]
		then
			brew services stop mysql@5.7
		fi

		if [ $2 == nginx ]
		then
			brew services stop nginx
			sudo pkill php
		fi
	
	fi

	if [ $1 == restart ]
	then
	
		if [ $2 == all ]
		then
			brew services restart mysql@5.7
			brew services restart nginx

		fi

		if [ $2 == mysql ]
		then
			brew services restart mysql@5.7
		fi

		if [ $2 == nginx ]
		then
			sudo /usr/local/php5/sbin/php-fpm
			sudo chmod 777 /usr/local/php5/var/php5.sock
			brew services start nginx
		fi
	
	fi

else
	echo Hey man! uses start, stop and restart or service and status.
fi
