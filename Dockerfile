FROM nginx:latest 

MAINTAINER Wire_Wolf

RUN apt update -y && apt install -y python3 python3-pip python3-dev

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT ["python3"]

CMD ["app.py"]

EXPOSE 5000/tcp
