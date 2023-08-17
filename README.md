# Measurement Framework Data Import Containers

## How to use this Git Repository

This repository is split into 2 parts. The ELK and Prometheus/Grafana docker-compose apps. 

## Measurement Framework Data Import / Export service overview

MFLib uses Prometheus and ELK to gather metrics and logs. It then uses Grafana and Kibana to visualize the gathered metrics and logs.

These metrics and logs are available on the Measurement Node of your Fabric slice set up with the Measurement Framework.

However, there are a few different circumstances where you may want to transfer those metrics and logs elsewhere. For example:

- You won't have access to the Fabric Testbed and want to view your data offline.
- You are no longer using your slice. You would like to delete it but save your data for later.
- You want a backup of your data to ensure that it is safe even if something on the slice goes wrong.



# Diagram of Data Transfer Service

![data_transfer_diagram drawio](https://github.com/jackhancockuky/data-import-containers/assets/100973595/e500322b-5932-4d6a-a519-0be92ac58ad3)
