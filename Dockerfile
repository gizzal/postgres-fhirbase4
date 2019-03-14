FROM postgres:11.2
COPY ./schema ./schema
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]