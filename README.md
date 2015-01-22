eluastica
=========
A Moonscript/lua elasticsearch library based on concept of http://elastica.io


# !!! WARNING !!! This is still under development, only a few classes has been ported!

# Moonscript examples

### Connecting to Elasticsearch
```moon
import EluasticaConnection from require "eluastica.connection"

connection = EluasticaConnection!
connection\setHost "HOST"
connection\setPort "PORT"
```
