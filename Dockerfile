FROM debian
RUN apt-get update && apt-get install -y apache2 libapache2-mod-php7.4 php7.4 && apt-get clean && rm -rf /var/lib/apt/lists/*
ADD bookmedik /var/www/html/
RUN rm /var/www/html/index.html
ADD script.sh /usr/local/bin/
EXPOSE 80
ENV DATABASE_USER bookmedik
ENV DATABASE_PASSWORD password
ENV DATABASE_HOST server_mariadb
ENTRYPOINT ["script.sh"]
