FROM ubuntu 

WORKDIR /app
EXPOSE 5000
ENV FLASK_APP=index.py
COPY index.py /app

RUN apt-get update
RUN apt install -y python
RUN apt install -y pip
RUN pip install flask

ENTRYPOINT [ "flask"]
CMD [ "run", "--host", "0.0.0.0" ]


