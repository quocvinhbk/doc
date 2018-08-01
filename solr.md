[solr basic concept](https://lucene.apache.org/solr/guide/7_4/about-this-guide.html)

[solr tutorial](http://www.solrtutorial.com/solr-in-5-minutes.html)

https://lucene.apache.org/solr/guide/7_4/solr-tutorial.html

[core admin api](https://lucene.apache.org/solr/guide/6_6/coreadmin-api.html#CoreAdminAPI-RENAME)

[command](https://lucene.apache.org/solr/guide/6_6/solr-control-script-reference.html)

- help: ``` bin/solr start -help   OR bin/solr stop -help ```

- start solr with port ``` bin/solr start -p 8984 ```
- example: host: local host, port: 8983, directory: server
  
  ``` bin/solr start -h localhost -p 8983 -d server ``` 


- create: ``` bin/solr create -help ```

- [solr control script](https://lucene.apache.org/solr/guide/7_4/solr-control-script-reference.html#solr-control-script-reference)

bin/solr create -c <yourCollection> -s 2 -rf 2


solr model: SolrCloud - vs - standardlone
SolrCloud => collection
standardlone => core

#### solr rename core by hand
  * rename solr_home/core_name directory
  * edit file core.properties