FROM nikolaik/python-nodejs:python3.9-nodejs15
WORKDIR /home/root
COPY . .
RUN pip install gql
RUN pip install sgqlc
CMD yarn codegen && sgqlc-codegen schema ./schema/schema.json ./schema/schema.py && chmod 777 ./schema && node gen_connect.js
