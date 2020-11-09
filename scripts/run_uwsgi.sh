#!/bin/bash
pushd /home/www-data/web2py
sudo uwsgi --ini applications/runestone/uwsgi.ini &
popd
