# see https://github.com/Schmoho/cobradb-container
FROM cobradb

USER cobradb
WORKDIR /home/cobradb

# using my own fork for fixed dependencies and such
RUN git clone https://github.com/Schmoho/bigg_models.git
WORKDIR /home/cobradb/bigg_models

USER root
RUN python3 setup.py develop

COPY ./settings.ini /home/cobradb/cobradb/settings.ini

USER cobradb
WORKDIR /home/cobradb

# using my own fork on principle at this point
RUN git clone https://github.com/Schmoho/bigg_models_data
WORKDIR /home/cobradb/bigg_models_data

RUN mkdir -p /home/cobradb/bigg-db/config \
    && mkdir -p /home/cobradb/bigg-db/data \
    && ln -s /home/cobradb/bigg_models_data/config /home/cobradb/bigg-db/config \
    && ln -s /home/cobradb/bigg_models_data/models /home/cobradb/bigg-db/data

WORKDIR /home/cobradb
USER root

RUN apt-get install -y sudo

## In the end, I picked up the container from here and did the rest manually,
## which was good enough for what I needed to achieve.
## Most of what I did is in the entrypoint script.
# COPY ./docker-entrypoint.sh /
# ENTRYPOINT ["/home/cobradb/docker-entrypoint.sh"]
