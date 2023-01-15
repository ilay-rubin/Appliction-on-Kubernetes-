# Appliction-on-Kubernetes-
In this project I have three servers:
1. Kubernetes Cluster
2. Application - node
3. databases - node

My project works with NodeJs, MySql, MongoDB.
All data is saved on the data server to avoid overloading the server, and my app ran on the app server.

1. MySql :
This YAML file describes a Kubernetes configuration for deploying a MySQL database in a production environment. The configuration includes the following components:

A PersistentVolume (PV) named "mysql-pv-production" which is used to store data on the cluster. The PV has a storage capacity of 10Gi and uses the "hostPath" provisioner to access data stored in the "/ALL-Data/Production/rt-crm.com/MySql-8.0.18v" directory.

A PersistentVolumeClaim (PVC) named "mysql-pvc-production" which claims the above-mentioned PV.

A Service named "mysql-production" which allows external traffic to access the MySQL service on port 3306 and is load balanced by an external IP 83.229.71.19 and also type of service is NodePort.

A Deployment named "mysql-production" which creates a pod running a container based on the "mysql:8.0.18" image. The container runs on port 3306 and the data is stored using a volumeMounts to the PV "mysql-pv-production" which is mounted to '/var/lib/mysql'. There is also an environment variable 'MYSQL_ROOT_PASSWORD' which is being populated from a k8s secret 'mysql-secret' and key 'root-password'

Overall, this configuration creates a MySQL deployment that can persist data across pod restarts and can be accessed within the cluster via the service and also from outside the cluster via the external IP and NodePort.

2. MongoDB : 
This YAML file describes a Kubernetes configuration for deploying a MongoDB database in a production environment. The configuration includes the following components:

A PersistentVolume (PV) named "mongo-pv-production" which is used to store data on the cluster. The PV has a storage capacity of 2Gi and uses the "hostPath" provisioner to access data stored in the "/ALL-Data/Production/rt-students.xyz/MongoDB-3.6.3v" directory.

A PersistentVolumeClaim (PVC) named "mongo-pvc-production" which claims the above-mentioned PV.

A Service named "mongo-production" which allows external traffic to access the MongoDB service on port 27017 and is accessible only within the kubernetes cluster.

A Deployment named "mongo-production" which creates a pod running a container based on the "mongo:3.6.3" image. The container runs on port 27017 and the data is stored using a volumeMounts to the PV "mongo-pv-production" which is mounted to '/data/db'.

Overall, this configuration creates a MongoDB deployment that can persist data across pod restarts and can be accessed within the cluster via the service.

3. NodeJS : 
This YAML file describes a Kubernetes configuration for deploying a node.js application on a cluster. The configuration includes the following components:

Two PersistentVolumes (PVs) named "node6042-uploads" and "node6042-pv", which are used to store data on the cluster. Both PVs have a storage capacity of 1Gi and use the "hostPath" provisioner to access data stored in the "/home/ilay/xyz-nodejs-volume/UPLOADS" and "/home/ilay/xyz-nodejs-volume" directories respectively.

Two PersistentVolumeClaims (PVCs) named "node6042-uploads" and "node6042-pvc" which claim the above mentioned PVs.

A Service named "node6042" which allows external traffic to access the application on port 6042 and is load balanced by an external IP 83.229.71.19

A Deployment named "node6042" which creates one replica of a pod running a container based on the "portal:6042" image. The container runs on port 6042, and has an environment variable MONGO_URL set to "mongodb://mongo-production:27017/rtg-portal". Two VolumeMounts are defined for the container, the first one mounts node6042-pv to '/etc/letsencrypt' and the second one mounts node6042-uploads to '/opt/backend/uploads'.
