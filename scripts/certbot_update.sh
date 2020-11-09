#!/bin/bash
# ***************************************
# |docname| - Renew certbot's certificate
# ***************************************

pushd /home/www-data/web2py

# First, shut down uwsgi -- see the `Master FIFO commands <https://uwsgi-docs.readthedocs.io/en/latest/MasterFIFO.html#available-commands>`_.
sudo bash -c "echo q > uwsgi_master-fifo"
# Wait for the webserver to shut down.
sleep 2
# Have certbot run its own webserver to do the renewal.
echo interactive-ebooks.com | sudo certbot certonly --standalone
# Restart uwsgi.
cd applications/runestone/scripts
./run_uwsgi.sh

popd
