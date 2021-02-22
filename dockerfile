FROM node:15.9.0-buster
RUN useradd -ms /bin/bash non-root
USER non-root
WORKDIR /home/non-root
COPY . .
CMD yarn graphql-codegen


