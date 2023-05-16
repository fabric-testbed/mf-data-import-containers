# Using Docker to locally view ELK index data

# What is Elastic Stack (ES or ELK)?

- "ELK" is the acronym for three open source projects: Elasticsearch, Logstash, and Kibana. Elasticsearch is a search and analytics engine. Logstash is a server‑side data processing pipeline that ingests data from multiple sources simultaneously, transforms it, and then sends it to a "stash" like Elasticsearch. Kibana lets users visualize data with charts and graphs in Elasticsearch. The Elastic Stack is the next evolution of the ELK Stack.
- Official website: https://www.elastic.co/

&nbsp;

# 1. Configuration

> Install Docker CE and Docker-Compose if you do not have. [Link to instructions](/README.md)

## 1.1 Git clone

```bash
git clone https://github.com/fabric-testbed/fabric-docker-images.git
```

## 1.2 Choose from the following options based on your exported file type
If you don't have any exported index data yet, visit https://github.com/fabric-testbed/jupyter-examples/blob/master/fabric_examples/mflib/elk_data_export.ipynb

- ElasticDump tool
- Logstash (in dev)
- ELK Snapshots (in dev)

# 2 Elastic Dump Tool
## 2.1 Switch to branch "elastic_dump"
```bash
git checkout elastic_dump
```
## 2.2 Place index data in the elastic_dump_data directory
Rename your index file to "index.json"
(Temporary solution)

## 2.3 Start containers
```bash
docker-compose up
```

## 2.4 Confirm data is imported 
```bash
docker-compose start elasticdump
```

## 2.5 visit http://localhost:5601/app/management/data/index_management/indices

# 3 Logstash
# 4 ELK Snapshots

## Useful command references

Stop dockers & remove & tear down

```bash
docker-compose stop
docker-compose rm
docker-compose down -v
```

Display log output from services (-f follows log output)

```bash
docker-compose logs -f es01 es02 es03
```

&nbsp;

# 8. Reference

- elasticsearch docker hub: [https://hub.docker.com/\_/elasticsearch](https://hub.docker.com/_/elasticsearch)
- logstash docker hub: [https://hub.docker.com/\_/logstash](https://hub.docker.com/_/logstash)
- kibana docker hub: [https://hub.docker.com/\_/kibana](https://hub.docker.com/_/kibana)
- [Run Filebeat on Docker](https://www.elastic.co/guide/en/beats/filebeat/current/running-on-docker.html)
- [Filebeat Modules](https://www.elastic.co/guide/en/beats/filebeat/6.8/filebeat-modules.html)
