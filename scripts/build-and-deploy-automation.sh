#!/bin/bash

build_image() {
echo ""
read -p "Enter Image Name " IMAGE_NAME
read -p "Enter Image Version " VERSION
read -p "Enter Image Dockerfile " DOCKERFILE
echo ""

docker build -t $IMAGE_NAME:$VERSION $DOCKERFILE 

echo ""
}

deploy_service() {

echo "Your Service name is: "
echo "" 
ls ../deploy_files/ | cut -d "." -f1

echo ""
read -p "Enter Image Name " NAMESPACE
read -p "Enter Image Name " SERVICE_FILE

docker stack deploy -c ../deploy_files/$SERVICE_FILE.yaml $NAMESPACE 

echo ""
}

scale_service() {

echo ""
read -p "Enter Service Name:" SERVICE_NAME
read -p "Enter Number of Replicas:" REPLICAS
echo ""

docker service scale $SERVICE_NAME=$REPLICAS 

echo ""
}

view_logs() {

echo "Your Service name is: "
echo ""
docker service ls | awk '{print $2}' | grep -v NAME

echo ""
read -p "Enter Service Name:" SERVICE_NAME
echo ""

docker service logs $SERVICE_NAME

echo ""
}

while [ option != 0 ] ; do

        echo "1. Build Image"
        echo "2. Deploy service"
        echo "3. Scale Service"
        echo "4. View Logs"
	echo "5. Exit"
	read option
 	case "${option}" in 
	        1) build_image ;;
                2) deploy_service ;;
                3) scale_service ;;
                4) view_logs ;;
		5) exit 0;;
		*)
			echo "Invalid Option"
	esac
done
