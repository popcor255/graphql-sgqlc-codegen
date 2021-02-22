FROM nikolaik/python-nodejs:python3.9-nodejs14
WORKDIR /home/root
COPY . .
RUN pip install -r requirements.txt
CMD yarn codegen && sgqlc-codegen schema ./schema/schema.json ./schema/schema.py


