# README

Before start using Ruby on Rails, MySQL should run first. Follow the commands below   
 - docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=root -d <mysql_docker_image_id>
 - docker exec -it <mysql_container_id> bash
 - mysql -uroot -p # Use root as password
 - create user 'vlasis'@'%' identified by '1'; #create user vlasis with password 1
 - GRANT ALL PRIVILEGES ON db_name.* TO 'vlasis'@'%';
 - CREATE DATABASE simple_cms_development;
 - GRANT ALL PRIVILEGES ON simple_cms_development.* TO 'vlasis'@'%';


## Ruby on rails cheatsheet
    
#### create new Rails project (and configure it to use MySQL)
 - rails new simple_cms -d mysql 

#### generate controller
 - rails generate controller <controller_name> <list_of_views_to_create>   
 - rails generate controller Demo index
