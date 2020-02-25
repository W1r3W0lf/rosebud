FROM fedora:latest 
MAINTAINER Wire_Wolf

#Install requirements
RUN dnf update -y && dnf install -y python python-pip
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

#Set working enviernment
WORKDIR /app
COPY ./app /app

#Start the Program
ENTRYPOINT ["python"]
CMD ["app.py"]
