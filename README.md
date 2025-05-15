Instructions:
1. Build the docker images:
    - for server:
    ```bash
    docker build -t server-image ./
    ```
    - for client:
    ```bash
    docker build -t client-image ./
    ```
2. Create custom network:
    ```bash
    docker network create my-network
    ```
3. Run the docker containers:
    - for server (along with the script):
    ```bash
    docker run -dit \
   --name server-container \
   --network my-network \
   --network-alias server \
   -v "$PWD":/scripts \
   server-image \
    bash /scripts/server.sh
    ```
    - for client:
    ```bash
    docker run -dit \
    --name client-container \
    --network my-network \
    -v "$PWD":/scripts \
    client-image 
    ```
4. To verify the connection between server and client, run:
    ```bash
    docker exec client-container ping -c 4 server
    ```
5. To run the client script, run:
    ```bash
    docker exec -it client-container bash /scripts/client.sh
    ```
   After running clients' script, you will be able to write the message to server. Once you are done, you can stop the client by pressing `Ctrl + C`. The server will stop, but you can check its logs.
6. To see the logs of the server, run:
    ```bash
    docker logs server-container
    ```
7. To stop and remove the containers, run:
    ```bash
    docker stop server-container client-container
    docker rm server-container client-container
    ```
8. To remove the network, run:
    ```bash
    docker network rm my-network
    ```
9. To remove the images, run:
    ```bash
    docker rm server-image client-image
    ```
