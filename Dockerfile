FROM node:10.15.3-alpine

ARG REPO_NAME=unknown 
ARG COMMIT_ID=unknown
ARG BRANCH_NAME=unknown
ARG DATE=unknown

ENV REPO_NAME=$REPO_NAME COMMIT_ID=$COMMIT_ID BRANCH_NAME=$BRANCH_NAME DATE=$DATE 

# make current directory
WORKDIR /usr/src/

# Copy the source code of app to docker demon
COPY . /usr/src/

#Expose the application on the port 
EXPOSE 8080

#Run the node command
CMD ["node", "app.js"]
