

# id: apple
# 
curl "http://localhost:8983/solr/gettingstarted/select?q=id:apple"


# pry -r rsolr
solr = RSolr.connect :url => 'http://localhost:8983/solr/gettingstarted/'

# search
    response = solr.get 'select', :params => {:q => 'id:apple'}
  # or
    solr.select params: {q: 'id:1'}
    re = solr.select params: {q: 'city_id:*'}

    re['response']['docs'].count
    re['response']['numFound']

# paginate
  # solr.paginate #{start}, #{rows}
    solr.paginate 1, 10, "select", :params => {:q => "city_id:*"}


# add with hash
  doc = {:id=>2, :job_id => 'jobid_1', :job_title => 'some title'}
  solr.add [doc]
  solr.commit

# add one data only
  solr.add :id=>1, :address_s => 'random address'
  solr.commit
  solr.get 'select', :params => {:q => 'id:1'}


# delete
  solr.delete_by_id 1
  solr.delete_by_query 'id:apple'

  
# SOLR schema create

require_relative './helpers'

require 'mysql2'
require 'rsolr'
require 'rsolr-ext'
require 'pry'

@client = Mysql2::Client.new(host: 'localhost', username: 'root')

# @city_table = @client.query("SELECT * FROM  venjobs_app_development.cities")
# @industry_table = @client.query("SELECT * FROM venjobs_app_development.industries")

def update_solr
  solr = RSolr.connect url: 'http://localhost:8983/solr/gettingstarted/'

  # city_table = @client.query('SELECT * FROM  venjobs_app_development.cities')
  # industry_table = @client.query('SELECT * FROM venjobs_app_development.industries')

  # # update Jobs table
  # job_table = @client.query('SELECT * FROM  venjobs_app_development.jobs')

  # if job_table.any?
  #   job_table.each do |job|
  #     # check is job_id is exist and not update job to solr
  #     response_solr = solr.get 'select', params: { q: "job_id: #{job['id']}" }
  #     next if response_solr['response']['docs'].any?

  #     # if job_id is not exit: add job to solr
  #     job_city = city_table.select { |city| city['id'] == job['city_id'] }.first
  #     job_industry = industry_table.select { |ind| ind['id'] == job['industry_id'] }.first

  #     doc = { job_id:             job['id'],
  #             job_title:          job['title'].downcase,
  #             job_city_id:        job_city['id'],
  #             job_city_name:      job_city['name'].downcase,
  #             job_city_slug:      job_city['slug'],
  #             job_industry_id:    job_industry['id'],
  #             job_industry_name:  job_industry['name'].downcase,
  #             job_industry_slug:  job_industry['slug'] }

  #     solr.add [doc]
  #   end

  #   solr.commit
  # end
  solr.delete_by_query '*:*'
  solr.commit
end

print_memory_usage do
  print_time_spent do
    update_solr
    # retrive_solr
  end
end


#!/bin/bash
# # Document
# # Add field to schema
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "add-field":{
#      "name":"job_name",
#      "default":""
#      "type":"string",
#      "stored":true }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_name" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Add a copy field 
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "add-copy-field":{
#      "source":"shelf",
#      "dest":[ "location", "catchall" ]}
# }' http://localhost:8983/solr/gettingstarted/schema

# retrive schema
# curl http://localhost:8983/solr/gettingstarted/schema/fields

# # Add job_id
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "add-field":{
#      "name":"job_id",
#      "type":"string",
#      "indexed": true,
#      "stored":true }
# }' http://localhost:8983/solr/gettingstarted/schema


# # Add search_text
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "add-field":{
#      "name":"search_text",
#      "type":"text_en",
#      "indexed": true,
#      "stored":false,
#      "multiValued": true }
# }' http://localhost:8983/solr/gettingstarted/schema


# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema


# ## DELETE FIELD

# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_industry_id", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_industry_slug", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_industry_name", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_city_id", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_city_slug", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_city_name", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_id", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema


# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-copy-field":{ "source":"job_title", "dest":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"search_text" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_industry_id" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_industry_name" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_industry_slug" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_city_id" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_city_name" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_city_slug" }
# }' http://localhost:8983/solr/gettingstarted/schema


# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_id" }
# }' http://localhost:8983/solr/gettingstarted/schema

# # Delete field
# curl -X POST -H 'Content-type:application/json' --data-binary '{
#   "delete-field" : { "name":"job_title" }
# }' http://localhost:8983/solr/gettingstarted/schema


############ ADD NEW SCHEMA #################
# Add job_id
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_id",
     "type":"string",
     "indexed": true,
     "stored":true }
}' http://localhost:8983/solr/gettingstarted/schema

# Add job_title
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_title",
     "type":"string",
     "indexed": true,
     "stored":true }
}' http://localhost:8983/solr/gettingstarted/schema


# Add job_city_id
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_city_id",
     "type":"string",
     "indexed": true,
     "stored":true,
     "multiValued": true }
}' http://localhost:8983/solr/gettingstarted/schema

# Add job_city_name
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_city_name",
     "type":"string",
     "indexed": true,
     "stored":true,
     "multiValued": true }
}' http://localhost:8983/solr/gettingstarted/schema

# Add job_city_slug
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_city_slug",
     "type":"string",
     "indexed": true,
     "stored":true,
     "multiValued": true }
}' http://localhost:8983/solr/gettingstarted/schema


# Add job_industry_id
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_industry_id",
     "type":"string",
     "indexed": true,
     "stored":true,
     "multiValued": true }
}' http://localhost:8983/solr/gettingstarted/schema

# Add job_industry_name
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_industry_name",
     "type":"string",
     "indexed": true,
     "stored":true,
     "multiValued": true }
}' http://localhost:8983/solr/gettingstarted/schema

# Add job_industry_slug
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"job_industry_slug",
     "type":"string",
     "indexed": true,
     "stored":true,
     "multiValued": true }
}' http://localhost:8983/solr/gettingstarted/schema


# Add search_text
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"search_text",
     "type":"text_en",
     "indexed": true,
     "stored":false,
     "multiValued": true }
}' http://localhost:8983/solr/gettingstarted/schema

# Add copy field job_id
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_id",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema

# Add copy field job_title
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_title",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema

# Add copy field job_city_id
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_city_id",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema


# Add copy field job_city_name
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_city_name",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema


# Add copy field job_city_slug
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_city_slug",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema

# Add copy field job_industry_id
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_industry_id",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema


# Add copy field job_industry_name
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_industry_name",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema


# Add copy field job_industry_slug
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"job_industry_slug",
     "dest":"search_text" }
}' http://localhost:8983/solr/gettingstarted/schema

############ DONE ADD SCHEMA #################

