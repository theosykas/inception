FROM debian:bookworm

# 3306 port

RUN apt-get update && apt-get install -y \
	mariadb-server

COPY scripts/mariadb.sh /mariadb.sh
RUN chmod -R +x /mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/mariadb.sh"]

CMD  [ "mysqld" "--user=mysql" ]