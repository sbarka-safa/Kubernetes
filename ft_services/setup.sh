#set minikube configuration (/goinfre/sbarka/.minikube/config/config.json)
#change the default configuration.
echo $'\e[1;32m'1- set configuration of minikube cluster...$'\e[0m';
minikube config set memory 5072
minikube config set driver virtualbox
minikube config set disk-size 20GB

#delete the local kubernetes cluster , delete teh VM , and removes all 
#associated files.
echo $'\e[1;32m'2- delete minikube...$'\e[0m';
minikube delete

#start the kubernetes signle node cluster , create the VM 
echo $'\e[1;32m'3- start minikube...$'\e[0m'
minikube start 


echo $'\e[1;32m'10- minikube dashboard...$'\e[0m'
minikube dashboard &

#enable the metallb extension for minikube 
echo $'\e[1;32m'4- enable metallb extension in minikube...$'\e[0m'
minikube addons enable metallb

cd ~/Desktop/Kubernetes/ft_services/srcs

#execute the configuration file metallb.yaml
echo $'\e[1;32m'5- apply the minikube configuration$'\e[0m'
echo $'\e[1;32m'execute the configuration file metallb.yaml...$'\e[0m'
kubectl apply -f  metallb.yaml


#connect your Docker CLI to the docker daemon inside the VM 
echo $'\e[1;32m'6- connect to docker daemon in minikube...$'\e[0m'
eval $(minikube docker-env)

echo $'\e[1;32m'create volumes$'\e[0m'
kubectl apply -f  influxdb/influxdb-pvc.yaml
kubectl apply -f  mysql/mysql-pvc.yaml

echo $'\e[1;32m'nginx$'\e[0m'
echo $'\e[1;32m'1- Build image$'\e[0m'
docker build -t nginx  nginx/
echo $'\e[1;32m'2- create deployment$'\e[0m'
kubectl apply -f nginx/nginx-deployment.yaml
echo $'\e[1;32m'3- create service$'\e[0m'
kubectl apply -f nginx/nginx-service.yaml

echo $'\e[1;32m'mysql$'\e[0m'
echo $'\e[1;32m'1- Build image$'\e[0m'
docker build -t mysql mysql/
echo $'\e[1;32m'2- create deployment$'\e[0m'
kubectl apply -f phpmyadmin/phpmyadmin-deployment.yaml
echo $'\e[1;32m'3- create service$'\e[0m'
kubectl apply -f mysql/mysql-service.yaml


echo $'\e[1;32m'phpmyadmin$'\e[0m'
echo $'\e[1;32m'1- Build image$'\e[0m'
docker build -t phpmyadmin phpmyadmin/
echo $'\e[1;32m'2- create deployment$'\e[0m'
kubectl apply -f mysql/mysql-deployment.yaml
echo $'\e[1;32m'3- create service$'\e[0m'
kubectl apply -f phpmyadmin/phpmyadmin-service.yaml


echo $'\e[1;32m'wordpress$'\e[0m'
echo $'\e[1;32m'1- Build image$'\e[0m'
docker build -t wordpress wordpress/
echo $'\e[1;32m'2- create deployment$'\e[0m'
kubectl apply -f wordpress/wordpress-deployment.yaml
echo $'\e[1;32m'3- create service$'\e[0m'
kubectl apply -f wordpress/wordpress-service.yaml
echo $'\e[1;32m'influxdb$'\e[0m'
echo $'\e[1;32m'1- Build image$'\e[0m'
docker build -t influxdb influxdb/
echo $'\e[1;32m'2- create deployment$'\e[0m'
kubectl apply -f influxdb/influxdb-deployment.yaml
echo $'\e[1;32m'3- create service$'\e[0m'
kubectl apply -f influxdb/influxdb-service.yaml

echo $'\e[1;32m'grafana$'\e[0m'
echo $'\e[1;32m'1- Build image$'\e[0m'
docker build -t grafana grafana/
echo $'\e[1;32m'2- create deployment$'\e[0m'
kubectl apply -f grafana/grafana-deployment.yaml
echo $'\e[1;32m'3- create service$'\e[0m'
kubectl apply -f grafana/grafana-service.yaml

echo $'\e[1;32m'ftps$'\e[0m'
echo $'\e[1;32m'1- Build image$'\e[0m'
docker build -t ftps ftps/
echo $'\e[1;32m'2- create deployment$'\e[0m'
kubectl apply -f ftps/ftps-deployment.yaml
echo $'\e[1;32m'3- create service$'\e[0m'
kubectl apply -f ftps/ftps-service.yaml
