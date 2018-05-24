#!/bin/bash
docker-compose -f ../docker-compose.yml up -d --build
sleep 80
docker-compose -f ../docker-compose.yml exec python ./scripts/sql.sh