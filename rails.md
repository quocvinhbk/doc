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