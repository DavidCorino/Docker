#!/bin/bash

build_image() {
read -p "Enter Image Name " IMAGE_NAME
read -p "Enter Image Version " VERSION
read -p "Enter Image Dockerfile " DOCKERFILE

docker build -t $IMAGE_NAME:$VERSION $DOCKERFILE
}

deploy_service() {

echo "Your Service name is: "
echo "" 
ls ../deploy_files/ | cut -d "." -f1

echo ""
read -p "Enter Image Name " NAMESPACE
read -p "Enter Image Name " SERVICE_FILE

docker stack deploy -c ../deploy_files/$SERVICE_FILE.yaml $NAMESPACE
}

scale_service() {

read -p "Enter Service Name:" SERVICE_NAME
read -p "Enter Number of Replicas:" REPLICAS

docker service scale $SERVICE_NAME=$REPLICAS
}

while [ option != 0 ] ; do

        echo "1. Build Image"
        echo "2. Deploy service"
        echo "3. Scale Service"
        echo "4. Exit"
	read option
 	case "${option}" in 
	        1) build_image ;;
                2) deploy_service ;;
                3) scale_service ;;
                4) exit 0;;
		*)
			echo "Invalid Option"
	esac
done
