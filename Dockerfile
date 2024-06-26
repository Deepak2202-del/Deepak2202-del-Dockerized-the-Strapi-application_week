FROM ubuntu:22.04
RUN apt update && \
    apt install curl -y && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt install -y git nodejs && \
    npm install -g npm@latest
RUN git clone https://github.com/maheshryali1122/strapi-api.git /srv/strapi-api
RUN chown -R root:root /srv/strapi-api && \
    chmod 755 /srv/strapi-api && \
    touch /srv/strapi-api/.env
COPY ./environment /srv/strapi-api/.env    
WORKDIR /srv/strapi-api 
RUN npm install pg --save   
RUN npm install
RUN npm run build
EXPOSE 1337
CMD [ "npm", "start" ]     

