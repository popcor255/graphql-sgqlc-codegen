FROM nikolaik/python-nodejs:python3.9-nodejs14
WORKDIR /home/root
COPY . .
RUN pip install gql
RUN pip install sgqlc
CMD bash -c "./codegen.sh"
