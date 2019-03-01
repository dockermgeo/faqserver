#!/usr/bin/env bash

. /.bootd.scripts
for script in $(ls /boot.d/*.sh); do
    info "Starting $script"
    . $script
done


cd ${APP_DIR}
npm start