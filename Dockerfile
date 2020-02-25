FROM fedora:latest 
MAINTAINER Wire_Wolf

RUN useradd rose
RUN mkdir /rose
RUN chown rose:rose /rose

#Install requirements
RUN dnf update -y && dnf install -y python python-pip gcc python-devel uwsgi
COPY ./requirements.txt /rose

#Set working enviernment
WORKDIR /rose
COPY ./app /rose/app
COPY ./wsgi.py /rose
COPY ./rosebud.ini /rose

RUN pip install -r requirements.txt

#Start the Program
#ENTRYPOINT ["python"]
#CMD ["uwsgi --socket 0.0.0.0:8000 --protocol=http -w wsgi"]
CMD uwsgi --ini rosebud.ini
#CMD ["./start.sh"]
