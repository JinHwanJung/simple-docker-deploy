# Base Image
FROM python:3.8.0

# Author
MAINTAINER JungJinHwan <yadot1478@naver.com>

# Home
WORKDIR /home/service/

# Linux Package
RUN apt-get update

# Python Package
COPY ./requirements.txt     /home/service/requirements.txt
RUN pip install -U -r requirements.txt

# Copy Project
COPY ./manage.py                    /home/service/
COPY ./simple_server_with_docker/   /home/service/simple_server_with_docker/

# Service Config & Utils
COPY ./docker-entrypoint.sh      /home/service/
RUN chmod +x docker-entrypoint.sh

# Port
EXPOSE 8080

# Run
ENTRYPOINT ["./docker-entrypoint.sh"]
