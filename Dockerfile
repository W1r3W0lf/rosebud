FROM fedora:latest 
MAINTAINER Wire_Wolf

#Install requirements
RUN dnf update -y && dnf install -y python python-pip gcc python-devel
COPY ./requirements.txt /app/requirements.txt

#Set working enviernment
WORKDIR /app
COPY ./app /app

RUN pip install -r requirements.txt

#Start the Program
#ENTRYPOINT ["python"]
#CMD ["uwsgi --socket 0.0.0.0:8000 --protocol=http -w wsgi"]
CMD ["uwsgi --ini rosebud.ini"]
