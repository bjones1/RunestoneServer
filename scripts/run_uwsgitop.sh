#!/bin/bash
pushd /home/www-data/web2py
sudo uwsgitop uwsgi_stats
popd
