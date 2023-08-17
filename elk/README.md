# Using Docker to locally use and view ELK index data

# What is Elastic Stack (ES or ELK)?

- "ELK" is the acronym for three open source projects: Elasticsearch, Logstash, and Kibana. Elasticsearch is a search and analytics engine. Logstash is a server‑side data processing pipeline that ingests data from multiple sources simultaneously, transforms it, and then sends it to a "stash" like Elasticsearch. Kibana lets users visualize data with charts and graphs in Elasticsearch. The Elastic Stack is the next evolution of the ELK Stack.
- Official website: https://www.elastic.co/
&nbsp;

## 1. Inital Setup
#### 1.1 Prerequisites
- [Docker is installed](https://docs.docker.com/engine/install/)
- [Docker-compose is installed](https://docs.docker.com/compose/install/)

#### 1.2 Clone this Git Repository
```bash
git clone https://github.com/jackhancockuky/elk-docker-container.git
```


## 2. Create docker container and get your snapshot data ready
#### 2.1 Move to git repo and create directory for snapshot data
```bash
cd elk-docker-container
mkdir imported_data
```

#### 2.1 Place your snapshot tar file inside the snapshots directory
```bash
tar -xvf snapshots/elk_backup.tar -C imported_data # Where "elk_backup.tar" is your snapshot file name
```

#### 2.2 Start the docker-compose app
##### The first run may take some time due to downloading the required docker images.
```bash
docker-compose up
```

## 3. Import your snapshot data into ELK

#### 3.1 Register the new ELK repository
```bash
curl -X PUT -H "Content-Type: application/json" -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/imported_data/_data",
    "compress": true
  }
}' http://localhost:9200/_snapshot/imported_repository
```


#### 3.2 View repository after registration
```bash
curl -X GET "http://localhost:9200/_cat/snapshots/imported_repository?v"
```

#### 3.3 Delete all existing indices (to clean up before import)
```bash
curl -X DELETE "http://localhost:9200/_all"
```

#### 3.4 Restore snapshot (replace snapshot name and change index list if you want to customize)
```bash
curl -X POST "http://localhost:9200/_snapshot/imported_repository/snapshot_test/_restore?pretty" -H "Content-Type: application/json" -d '{ "indices": "*", "index_settings": { "index.number_of_replicas": 1 } }'
```
## 4. You are now ready to use your data
#### 4.1 View indices
```bash
curl -X GET "http://localhost:9200/_cat/indices?pretty"
```
## 5. Clean up (optional)

#### 5.1 Take down and reset container to original state:
```bash
docker-compose down
docker volume rm elk-docker-container_es-data
```

#### 5.2 If you want to use a new backup
```bash
rm -rf imported_data/*
```

# 6. References
- elasticsearch docker hub: [https://hub.docker.com/\_/elasticsearch](https://hub.docker.com/_/elasticsearch)
- kibana docker hub: [https://hub.docker.com/\_/kibana](https://hub.docker.com/_/kibana)
