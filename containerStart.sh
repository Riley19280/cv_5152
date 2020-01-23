#!/bin/bash


python manage.py migrate
python manage.py runserver
# Need this here to keep the docker container running
/bin/bash
tail -f /dev/null