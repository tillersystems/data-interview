FROM ubuntu:latest
MAINTAINER Rops "rops@tillersystems.com"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential mysql-client
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
