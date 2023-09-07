# Measurement Framework Data Import Containers

## How to use this Git Repository

Before using this repository, make sure you have snapshot data from Elastic Search or Prometheus. All information for doing so can be found in these notebooks:
https://github.com/fabric-testbed/jupyter-examples/tree/mf_data_transfer/fabric_examples/mflib/data_transfer_service

The goal of this repository is to allow Fabric users to easily import their snapshot data into a new ELK / Prometheus setup. This repository is split into 2 parts. The ELK and Prometheus/Grafana docker-compose apps. 

Instructions for ELK: 
https://github.com/jackhancockuky/data-import-containers/blob/main/elk/README.md

Instructions for Prometheus/Grafana: 
https://github.com/fabric-testbed/mf-data-import-containers/blob/main/prometheus/README.md

## Overview of the Measurement Framework Data Export/Import service

MFLib uses Prometheus and ELK to gather metrics and logs. It then uses Grafana and Kibana to visualize the gathered metrics and logs.

These metrics and logs are available on the Measurement Node of your Fabric slice set up with the Measurement Framework.

However, there are a few different circumstances where you may want to transfer those metrics and logs elsewhere. For example:

- You won't have access to the Fabric Testbed and want to view your data offline.
- You are no longer using your slice. You would like to delete it but save your data for later.
- You want a backup of your data to ensure that it is safe even if something on the slice goes wrong.


## Diagram of Data Transfer Service

![data_transfer_diagram drawio](https://github.com/jackhancockuky/data-import-containers/assets/100973595/e500322b-5932-4d6a-a519-0be92ac58ad3)
