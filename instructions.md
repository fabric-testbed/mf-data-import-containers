# Instructions

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
curl -X GET http://localhost:9200/_cat/snapshots/backup_repository?v

#### Delete all indices
curl -X DELETE "http://localhost:9200/_all"

#### Restore snapshot (replace snapshot name and index list)
curl -X POST "http://localhost:9200/_snapshot/imported_repository/snapshot_test/_restore?pretty" -H "Content-Type: application/json" -d '{
  "indices": "filebeat-7.13.2-2023.06.05-000001,.kibana_task_manager_7.13.0_001,.apm-agent-configuration,.apm-custom-link,.kibana-event-log-7.13.0-000001,metricbeat-7.13.2-2023.06.05-000001,packetbeat-7.13.2-2023.06.05-000001,.kibana_7.13.0_001",
  "index_settings": {
    "index.number_of_replicas": 1
  }
}'

### View indices
curl -X GET "http://localhost:9200/_cat/indices?pretty"

## Take down and reset container to original state:

docker-compose down

docker volume rm elk-docker-container_es-data

#### If you want to use a new backup
rm -rf imported_data/* 
