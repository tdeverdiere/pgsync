#!/bin/bash

./wait-for-it.sh "$PG_HOST:$PG_PORT" -t 60
./wait-for-it.sh "$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT" -t 60
./wait-for-it.sh "$REDIS_HOST:$REDIS_PORT" -t 60

bootstrap --config ./schemas/schema.json
pgsync --config ./schemas/schema.json --daemon
