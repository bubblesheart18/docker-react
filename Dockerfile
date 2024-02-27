FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build  
#output of this is a build folder. /app/build will have all the stuff we require

#build phase done

#new block started by FROM command
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#no need to specify any command as default nginx command is started when we run the container.


