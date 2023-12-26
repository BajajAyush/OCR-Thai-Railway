#!/usr/bin/env bash

set -o errexit  # exit on error

apt-get -qq -y install tesseract-ocr
pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate
python manage.py createsu 