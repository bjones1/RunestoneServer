#!/usr/bin/bash
#
# *********************************
# |docname| - Run the celery worker
# *********************************
# TODO:
#
# - `daemonize this <https://docs.celeryproject.org/en/stable/userguide/daemonizing.html#daemon-systemd-generic>`_.
# - Celery produces occasional failures in the client (not the worker) when the client is multi-threaded with a redis backend; see `celery issue 6335 <https://github.com/celery/celery/issues/6335>`_, which might be caused by `celery issue 4480 <https://github.com/celery/celery/issues/4480>`_ and is still waiting for a fix. The quick workaround: run waf build with ``-j 1``. web2py is multi-threaded based on the current uwsgi setup, but (hopefully) will have fewer simultaneous outstanding build requests.
#
# Old method: run just the web2py worker.
##pushd /home/www-data/web2py/applications/runestone/modules
##sudo -u www-data env "PATH=$PATH" celery --app=scheduled_builder worker --pool=threads --concurrency=4 --loglevel=info &

# New method: run the combined web2py and waf worker.
# Use ``env`` to `pass on the current user's path <https://unix.stackexchange.com/questions/83191/how-to-make-sudo-preserve-path>`_ (which knows where the Microchip compiler is located) to celery.
pushd /home/www-data/web2py/applications/runestone/books/pic24_asm_to_c/_sources/build/waf
sudo -u www-data env "PATH=$PATH" celery --app=celery_build worker --pool=threads --concurrency=3 --loglevel=info &
popd
