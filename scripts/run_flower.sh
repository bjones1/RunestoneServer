#!/bin/bash
pushd /home/www-data/web2py/applications/runestone/modules
sudo -u www-data celery flower --app=scheduled_builder --port=5000 --certfile=/etc/letsencrypt/live/interactive-ebooks.com/fullchain.pem --keyfile=/etc/letsencrypt/live/interactive-ebooks.com/privkey.pem &
popd

