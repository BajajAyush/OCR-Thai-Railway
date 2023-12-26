FROM python:3.9-slim-buster

RUN apt-get update && \
    apt-get -qq -y install tesseract-ocr && \
    apt-get -qq -y install libtesseract-dev && \
    apt-get -qq -y install libgl1

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN cd .. && python manage.py createsu
COPY . .

CMD ["gunicorn", "app.wsgi"]
