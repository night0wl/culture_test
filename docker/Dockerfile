FROM clue/json-server:latest

ADD ./db.json /data/db.json

WORKDIR /data
VOLUME /data

EXPOSE 80

ENTRYPOINT ["bash", "/run.sh"]
CMD []
