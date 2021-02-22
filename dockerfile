FROM nikolaik/python-nodejs:python3.9-nodejs14
WORKDIR /home/root
COPY . .
CMD yarn codegen && python -m sgqlc-codegen schema schema.graphql schema.py


