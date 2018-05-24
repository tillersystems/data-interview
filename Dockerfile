FROM ubuntu:latest
MAINTAINER Rops "rops@tillersystems.com"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential mysql-client libmysqlclient-dev
COPY . /app
WORKDIR /app
RUN pip install -r ./tillerinterview/requirements.txt
ENTRYPOINT ["python"]
CMD ["./tillerinterview/__init__.py"]
