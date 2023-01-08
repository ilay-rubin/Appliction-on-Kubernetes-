FROM node:14.5.0
RUN apt-get update
EXPOSE 6042
RUN mkdir -p /opt/backend
WORKDIR /opt/backend
COPY FS-portal/server /opt/backend/
RUN npm install
#RUN npm i axios
#RUN npm i pdf-lib
#RUN npm i fontkit
#RUN npm i node-schedule
CMD ["npm","start"]
