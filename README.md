# docker_php_5.6

	php 5.6 with changing uid and gid of www-data
	
	Composer installed

	Mainly used for development purpose

## Application Installation Instructions:

    git clone git@github.com:kay1759/docker_php_5.6.git
    cd docker_php_5.6
	** change uid data below as your environment
	   *** uid and gid in Dockerfile, recommend to same uid and gid with developer account in your docker host
	   *** myhostname in main.cf
	   *** timezone and/or mbstring.language
	docker build .
	docker tag <docker-image-id> myphp:5.6
	

### Usage Example

	docker network create --subnet=172.23.2.0/24 mydockernet
	docker run --name mariadb -d -e MYSQL_ROOT_PASSWORD=myapassword --net=mydockernet --ip=172.23.2.2 mariadb

	docker run --name phpapp5 -d -v /home/app/myapp/html:/var/www/html -v /home/app/myapp/sites-available:/etc/apache2/sites-available --net=mydockernet --ip=172.23.2.4 myphp:5.6

    connet with browzer
    http://172.23.2.4/

## Licence
[MIT]

## Author
[Katsuyoshi Yabe](https://github.com/kay1759)

