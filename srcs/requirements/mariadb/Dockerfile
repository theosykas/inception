FROM debian:bookworm

# 3306 port

RUN apt-get update && apt-get install -y \
	mariadb-server


RUN chmod -R +x /mariadb.sh

ENTRYPOINT ["/mariadb.sh"]

CMD = []