FROM python:slim
ADD . /app
WORKDIR /app

RUN apt-get update && apt-get -y install curl
EXPOSE 5443

RUN pip install -r requirements.txt
CMD [ "python3", "flask_rx.py"]
