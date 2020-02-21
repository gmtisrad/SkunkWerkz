FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE skunkwerkz

ADD setup.sql /docker-entrypoint-initdb.d
