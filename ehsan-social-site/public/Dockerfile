FROM node:13.12.0-alpine
WORKDIR /Demo
ADD package.json /Demo/package.json
RUN npm install 
COPY . /Demo
EXPOSE 3000 