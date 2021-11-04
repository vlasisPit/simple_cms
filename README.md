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

#### ActiveRecord commands  
- rails db:schema:dump  
- rails generate migration <MigrationName> #generate migration  
- rails generate model <ModelName>  
- rails db:migrate    # run migration  
- rails db:migrate:status   # status of the migration  
- rails db:migrate VERSION=0   # migrate to initial state  
- rails db:migrate VERSION=20211024104753   # migrate to specific version (check table schema_migrations)   
- rails generate model User first_name:string last_name:string email:string # generate model  
- rails generate model Page subject_id:integer name:string permalink:string position:integer visible:boolean context:text  
- rails generate model Subject name:string position:integer visible:boolean  

#### Rails console  
- rails console -e development
- rails console
- rails c
- bundle exec rails console

#### Create records using ActiveRecord
- subject = Subject.new(:name => 'First subject', :visible => true)  
- subject.position=1  
- subject.name # check name  
- subject.new_record? # check if record has been stored in database
- subject.id # value is present only if record has been stored in database  
- subject.save  
- subject.created_at  
- subject.updated_at
- subject_2 = Subject.create(:name => 'Second subject', :visible => false) # create and store it into the database

#### Update records using ActiveRecord
- subject = Subject.find(1)  # find record with id (or primary key) 1
- subject.name = 'Initial subject' # change name but not stored yet
- subject.save
- subject_2 = Subject.find(2)
- subject_2.update(:name => 'Next subject', :position => 2) # change and store with one command  

#### Delete records using ActiveRecord
- bad = Subject.create(:name => 'Bad subject')
- subject3 = Subject.find(3)  
- subject3.destroy  # delete from the database, but the object is still available 
- subject3.name   #  but the object is still available  
- subject3.name = 'Test'  # Can't modify frozen object
- subject4 = Subject.create(:name => 'Deleted subject subject')
- subject4.delete
- subject4.name

#### Find records using ActiveRecord
- Subject.find(3)  # primary key finder  
- Subject.where(:visible => true)  # conditions with hash. Returns an Array
- Subject.where("visible=1 AND position<10")  # conditions with SQL fragment as a string
- Subject.where("first_name LIKE #{@query}")  # NEVER interpolate because of SQL injection
- Subject.where(["first_name LIKE ?", @query])  # Instead use an array
- Subject.where(:visible => true).first  # Returns an object or nil
- Subject.order('position ASC')
- Subject.limit(20)
- Subject.offset(100)
- Subject.where(:visible => true).order(:position).limit(5)  #  Daisy chain

#### Association Methods for has_many
- subject = Subject.find(1)
- subject.pages
- subject.pages << page
- subject.pages.delete(page)
- subject.pages.empty?
- page = Page.new(:name=>'First page', :visible => true)
- page.subject = subject
- page.save
- second_page = Page.new(:name=>'Second page', :visible => true, :position => 2)
- second_page.save  # cannot save it, because foreign key is not optional
- subject.pages << second_page