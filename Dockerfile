FROM node:20-alpine

WORKDIR /app

COPY . .

RUN npm install -g npm@10.5.0

RUN npm install -g mintlify 

EXPOSE 3333

# CMD ["/bin/bash", "mintlify", "dev", "--port", "3333"]
CMD mintlify dev --port 3333
