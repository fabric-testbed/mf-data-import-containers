# Using Docker to locally use and view Prometheus index data with Grafana

# What is Elastic Stack (ES or ELK)?

- Prometheus collects and stores its metrics as time series data, i.e. metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels.
- Official website: https://prometheus.io/
&nbsp;

## 1. Inital Setup
#### 1.1 Prerequisites
- Docker is installed - https://docs.docker.com/engine/install/
- Docker-compose is installed - https://docs.docker.com/compose/install/

#### 1.2 Clone this Git Repository
```bash
git clone https://github.com/jackhancockuky/prometheus-grafana-docker-container
```


## 2. Setup docker compose app

#### 2.1 Place your snapshot tar file inside the backup_snapshots directory

#### 2.2 Run the import_snapshot.sh script to load snapshot data into shared directory.
```bash
./import_snapshot.sh
```
Enter snapshot tar file name in script

#### 2.2 Start the docker-compose app
##### The first run may take some time due to downloading the required docker images.
```bash
docker-compose up
```

## 3. View and use data on Grafana
- Grafana is accessible at: http://localhost:3000/
- Username: admin
- Password: grafana
- You can change your credentials inside the docker-compose.yml file if you would like.
