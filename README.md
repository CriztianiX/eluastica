eluastica
=========
A Moonscript/lua elasticsearch library based on concept of http://elastica.io


# !!! WARNING !!! This is still under development, only a few classes has been implemented!

# Moonscript examples

### Creating a query
Take a look at eluastica/query directory for a complete list of implemented queries
```moon
import EluasticaQueryMatchAll from require "eluastica.query.match_all"

match_all = EluasticaQueryMatchAll!
```

### Creating a filter
Take a look at eluastica/filter directory for a complete list of implemented queries
```moon
import EluasticaFilterTerms from require "eluastica.filter.terms"

names = EluasticaFilterTerms 'Document.name', {'Juan', 'Luis', 'Pedro'}
names\setParam "execution", "or"
```

### Connecting to Elasticsearch
```moon
import EluasticaConnection from require "eluastica.connection"

connection = EluasticaConnection!
connection\setHost "HOST"
connection\setPort "PORT"
```

### Creating a request
```moon
import EluasticaRequest from require "eluastica.request"

request = EluasticaRequest!
request\setConnection connection
request\setMethod EluasticaRequest.GET
```

### Putting it together
```moon
import EluasticaQueryFiltered from require "eluastica.query.filtered"
import EluasticaQuery from require "eluastica.query"

query_filtered = EluasticaQueryFiltered!
query_filtered\setQuery match_all
query_filtered\setFilter names

elastic_query = EluasticaQuery!
elastic_query\setQuery query_filtered
elastic_query\setSize 10
elastic_query\setPage 1
```

### Sending the request
```moon
request\setPath "/your-index/your-type/_search"
request\setQuery elastic_query\toArray!
results = request\send!
```
