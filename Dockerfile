FROM fedora:latest 
MAINTAINER Wire_Wolf

RUN useradd rose
COPY ./rose /rose
WORKDIR /rose
RUN chown rose:rose /rose

#Install requirements
RUN dnf update -y
RUN dnf install -y python python-pip gcc python-devel 
RUN pip install -r requirements.txt

RUN chmod +x start.sh


#Start the Program
#ENTRYPOINT ["python"]
#CMD ["uwsgi --socket 0.0.0.0:8000 --protocol=http -w wsgi"]
#CMD uwsgi --ini rosebud.ini
CMD ./start.sh
