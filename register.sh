#!/bin/bash

# Register Repository
curl -X PUT -H "Content-Type: application/json" -d '{
  "type": "fs",
  "settings": {
    "location": "/usr/share/elasticsearch/backup",
    "compress": true
  }
}' http://localhost:9200/_snapshot/backup_repository

# Register Snapshot
curl -X PUT -H "Content-Type: application/json" -d '{
  "ignore_unavailable": true,
  "include_global_state": false
}' http://localhost:9200/_snapshot/backup_repository/snapshot_test
