# Instructions

## Prerequisites
- Docker is installed
- Docker-compose is installed

## Create docker container and import your data

git clone https://github.com/jackhancockuky/elk-docker-container.git

cd elk-docker-container

mkdir imported_data

#### Place your snapshot tar file inside the snapshots directory

tar -xvf snapshots/elk_backup_2.tar -C imported_data # Where "elk_backup_2.tar" is your snapshot file name

docker-compose up

#### Register the repository
curl -X PUT -H "Content-Type: application/json" -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/imported_data/_data",
    "compress": true
  }
}' http://localhost:9200/_snapshot/imported_repository


### View repository after registration
curl -X GET "http://localhost:9200/_cat/snapshots/imported_repository?v"

#### Delete all indices
curl -X DELETE "http://localhost:9200/_all"

#### Restore snapshot (replace snapshot name and change index list if you want to customize)
curl -X POST "http://localhost:9200/_snapshot/imported_repository/snapshot_test/_restore?pretty" -H "Content-Type: application/json" -d '{ "indices": "*", "index_settings": { "index.number_of_replicas": 1 } }'

### View indices
curl -X GET "http://localhost:9200/_cat/indices?pretty"

## Take down and reset container to original state:

docker-compose down

docker volume rm elk-docker-container_es-data

#### If you want to use a new backup
rm -rf imported_data/* 
