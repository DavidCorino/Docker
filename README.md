**INSTALLING NGINX + HAPROXY**

<u>**Requirements**</u>

**Note:** This is a personal lab, so there are some changes to the Haproxy image and some configuration files are copied.

1. Have a docker swarm cluster configured

**<u>Configuring the envinronment</u>**

1. You can download the latest versions available with the commands below:

   

   docker pull nginx
   docker pull davidcorino/haproxy:<version>

   Example: docker pull davidcorino/haproxy:1.0

   

2. If you don't want to use the Haproxy image already ready, you can use the Dockerfile and all files that are in: https://github.com/DavidCorino/Docker/ and make the changes you want, after making the changes run the command:

   

   ​		**Clone the repository**

   

   git clone git@github.com:DavidCorino/Docker.git

   

   Change what you think is necessary in the "Dockerfile", after this build the image with the command:

   

   docker build -t haproxy-modified:1.0 .

   

   This will create a image with a tag 1.0 and name haproxy-modified, you can choose your name. 

   

   **NOTE:** Only do this if you change something and the image. 

   

3. After pulling the images, execute the command:

   

   docker volume create --driver local --opt type=none --opt device=<directory> --opt o=bind <volume_name>

   

   It will be responsible for creating the volume that will store the webpages.

   

   Example: docker volume create --driver local --opt type=none --opt device=/tmp/nginx/ --opt o=bind nginx-data

   

   **NOTE:** If you changed the volume name in step two, you need to change it when executing this command.

   

4. After that it will be necessary to create the services, and for that to execute the command below:

   

   **NOTE:** Rename the image in the file: docker-stack.yaml or use the command  docker tag davidcorino/haproxy:1.0 haproxy-challenge

   

   docker stack deploy -c docker-stack.yaml challenge

   

   After this, you can try access the webpage.

   



