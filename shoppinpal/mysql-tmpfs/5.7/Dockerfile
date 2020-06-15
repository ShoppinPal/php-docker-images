FROM mysql:5.7
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
EXPOSE 3306
CMD ["mysqld"]
