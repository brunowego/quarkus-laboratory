# Panache One-to-Many with Lombok

## Assemble

### Dependencies

```sh
#
docker network create workbench \
  --subnet 10.1.1.0/24

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='user' \
  -e POSTGRES_PASSWORD='pass' \
  -e POSTGRES_DB='dev' \
  -v panache-one-to-many-postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name panache-one-to-many-postgresql \
  --network workbench \
  docker.io/library/postgres:12.6-alpine

#
docker exec -i panache-one-to-many-postgresql \
  psql \
    -U user \
    -d dev \
    -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
```

### Running

```sh
#
./mvnw compile quarkus:dev
```

## Disassemble

```sh
#
docker rm -f panache-one-to-many-postgresql

#
docker volume rm panache-one-to-many-postgresql-data
```
