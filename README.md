# Measurement Framework Data Import Service

MFLib uses Prometheus and ELK to gather metrics and logs. It then uses Grafana and Kibana to visualize the gathered metrics and logs.

These metrics and logs are available on the Measurement Node of your Fabric slice set up with the Measurement Framework.

However, there are a few different circumstances where you may want to transfer those metrics and logs elsewhere. For example:

- You won't have access to the Fabric Testbed and want to view your data offline.
- You are no longer using your slice. You would like to delete it but save your data for later.
- You want a backup of your data to ensure that it is safe even if something on the slice goes wrong.

This is what the MFLib Data Transfer service helps you accomplish. The notebooks below help you export your Prometheus or ELK data via snapshots. These snapshots will be exported onto this JH server inside of a tar file. From there you can then move your snapshots anywhere and choose from any of the import options below to use/view your data again.

# Diagram of Data Transfer Service
