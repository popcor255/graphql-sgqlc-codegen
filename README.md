# graphql-sgqlc-codegen 

A cli tool that is based on docker that will create a schema folder with python code from schema.graphql file.
This tool is not for produciton.

## Run

```bash
#docker run -v <folder> popcor255:graphql-codegen:0.0.1
 docker run -v $(pwd)/schema:/home/root/schema graphql-codegen:0.0.1 
```
