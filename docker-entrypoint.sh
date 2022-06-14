#!/bin/bash
set -e

pg_createcluster 14 cobra_cluster --start;
sudo -i -u postgres <<EOF
    createuser cobradb -d;
    createdb cobradb -O cobradb;
    psql -c "alter user cobradb with password 'cobradb';"
EOF

## on my reasonably modern laptop this was an operation of about 16 hours,
## so keep that in mind
sudo -i -u cobradb <<EOF
    ./cobradb/bin/load_db --drop-all;
EOF

## there are some post-processing steps the scripts provide,
## I have not tested whether they run yet.
# sudo -i -u cobradb <<EOF
#     ./cobradb/bin/load_db --drop-all;
#     ./bigg_models/bin/make_database_indices;
#     ./bigg_models/bin/make_all_static_models;
# the metanetx stuff etc.
# EOF

## You will need to mount this out of the container somehow.
# pg_dump -Fc cobradb > bigg_database.dump
