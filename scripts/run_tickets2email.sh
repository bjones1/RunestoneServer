#!/bin/bash
pushd /home/www-data/web2py
sudo -u www-data python3 web2py.py --shell=runestone --run=applications/runestone/scripts/tickets2email.py --no_gui --import_models &
popd
