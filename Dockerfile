FROM fedora:latest 

MAINTAINER Wire_Wolf

RUN dnf update -y
RUN dnf install -y python python-pip

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["python"]

CMD ["app.py"]
