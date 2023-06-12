#!/bin/bash

# delete all indices
curl -X DELETE "http://localhost:9200/_all"

# restore snapshot
curl -X POST "http://localhost:9200/_snapshot/backup_repository/snapshot_test/_restore?pretty" -H "Content-Type: application/json" -d '{
  "indices": "metricbeat-7.13.2-2023.06.02-000001,.kibana_task_manager_7.13.0_001,.kibana_7.13.0_001,.ds-ilm-history-5-2023.06.02-000001,packetbeat-7.13.2-2023.06.02-000001,filebeat-7.13.2-2023.06.02-000001,.apm-custom-link,kibana_sample_data_flights,.apm-agent-configuration,.kibana-event-log-7.13.0-000001",
  "index_settings": {
    "index.number_of_replicas": 1
  }
}'
