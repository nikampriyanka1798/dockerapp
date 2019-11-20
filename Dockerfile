FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=Manager@123

ENV MYSQL_DATABASE=nodetest
COPY schema.sql /docker-entrypoint-initdb.d/
EXPOSE 3306