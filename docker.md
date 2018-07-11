docker rmi -f $(docker images -a -q)

  - console 'web'
      docker-compose run web rails console
  - truy cap shell cua 'web'
      docker-compose exec -it web bash
  - khoi dong lai container 'web'
      docker-compose restart web

      

1. Defile project
  - create Dockerfile 
  - create Gemfile
  - create Gemfile.lock
  - create docker-compose.yml

2. Build the project 
  - build image && install rails new in container web
      docker-compose run web rails new . --force --database=postgresql
  - rebuild with new gemfile 
      docker-compose build

3. Connect the database
  - replace new config/database.yml file 
  - boot the app
      docker-compose up

  - on other terminal: Create database 
      docker-compose run web rake db:create

  - stop compose 
      docker-compose down



# Ctrl-C is working too, but need to remove file: tmp/pids/server.pid

4. mysql docker 
  $ docker run -p 3306:3306 -d --name mysql -e MYSQL_ROOT_PASSWORD=password mysql/mysql-server
  $ docker run --name centos -v `pwd`:/centos -itd --restart=always centos tail -f /dev/null
  $ docker run -p 3307:3306 --name mysql -itd --restart=always --env="MYSQL_ROOT_PASSWORD=12345" mysql/mysql-server:5.7
  $ docker logs mysql 2>&1 | grep GENERATED
  $ ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';

  CREATE TABLE foo (
    foo_id int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);

# mysql -u root -p -h 172.17.0.1 -P 3306

mysql -u root -p -h docker.for.mac.localhost -P 3306
mysql -u root -p -h 127.0.0.1 -P 6603


# https://dzone.com/articles/docker-for-mac-mysql-setup
$ docker run -p 3306:3306 -d --name mysql --e="MYSQL_ROOT_PASSWORD=password" mysql/mysql-server

mysql > select host,user from mysql.user;
mysql > CREATE USER 'admin'@'%' IDENTIFIED BY '12345';
mysql > GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';
mysql > select host,user from mysql.user;
