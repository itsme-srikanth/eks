# FROM - Set Base Image
FROM node:16

# LABEL - add custom data, just some key values
LABEL maintainer="Backend API Maintainers <ravi2krishna@gmail.com>"

# ENV - Environment Variable
ENV APP_PATH /backend
ENV APP_VERSION 1.1

# RUN - execute commands
RUN mkdir $APP_PATH

# WORKDIR - working directory
WORKDIR $APP_PATH

# COPY - copy files to above image
COPY . .

# RUN - build related commands
RUN npm install
RUN npx prisma generate
RUN npm run build

# EXPOSE - Bind a port to container
EXPOSE 8080

# CMD - default program to start
CMD ["npm", "start"]
