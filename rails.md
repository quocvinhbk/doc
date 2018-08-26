- dev gem file: better error & rails panel
```
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rack-mini-profiler'
```

- rails new command:
```
rails new myapp --database=mysql
rails new myapp -d mysql
rails -h
rails new -h
rails new --skip-test

```

- generate scaffold

  ```
   rails g scaffold Article title:string content:text
   rails g scaffold Comment body:text article:references
  ```

- text method ``` pluralize(article.count, 'article') ```


- infra

[full tutorial](http://robmclarty.com/blog/how-to-setup-a-production-server-for-rails-4)

[deploy unicorn + nginx](https://www.ralfebert.de/tutorials/rails-deployment/)
[deploy medium](https://medium.com/ruby-on-rails-web-application-development/how-to-deploy-ruby-on-rails-apps-to-the-internet-production-staging-49efc503c91d)

server CENTOS 7 

passenger standardlone package
[nginx standardlone](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7)


[qiit apache](https://qiita.com/alokrawat050/items/ecd864a098198ebb3537#step-5install-apache)


[rails passenger nginx](https://www.digitalocean.com/community/tutorials/how-to-deploy-rails-apps-using-passenger-with-nginx-on-centos-6-5)

##### install
  * gem install passenger
  * $ sudo mkdir /opt/nginx
  * $ sudo chown user1:user1 /opt/nginx
  * $ passenger-install-nginx-module
  
##### passenger
  * $ passenger-status

##### rails app
  * bundle install --without development test
  * SECRET_KEY_BASE : config/secret.yml => $ production: secret_key_base: <%= SECRET_KEY_BASE %>
  * bundle exec rake assets:production db:migrate -e production
  * bundle exec passenger start -e production

##### nginx
  * root /var/www/myapp/public
  * passenger_root /home/admin/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/passenger-5.3.4;
  * passenger_ruby /home/admin/.rbenv/versions/2.5.1/bin/ruby;
  * passenger_app_env production;
  ```
  config: /opt/nginx/conf/nginx.conf
  bin: sudo /etc/init.d/nginx start/stop/status
  ```


```
review list: 
  - active record - Validation
```