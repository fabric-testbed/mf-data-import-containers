# elk-docker-container

This is a multi-container docker application ran with docker-compose.

The purpose of this container is to easily allow users to view their elk or prometheus data after they have exported it from their Fabric slice.

#TODO: steps to install

ELK:

Place your index data inside of the "es-indices" directory before running container.
This is a shared volume which will allow logstash to automatically import your data into elk.
