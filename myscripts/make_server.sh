# Build Docker Image
docker build -t simple_server_with_docker_img .

# Create Docker Network
docker network create simple_network 2>/dev/null

# Remove Container
docker rm -f $(docker ps -a | grep "simple_server_with_docker_container" | awk "{print \$1}")

# New Container
docker run --name simple_server_with_docker_container \
  -itd \
  -p 80:8080 \
  -m=2g \
  --network simple_network \
  --restart unless-stopped \
  simple_server_with_docker_img

# Clean Dummy Docker Image
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
