#!/usr/bin/env bash

. /.bootd.scripts

if [ -z ${APP_DIR} ]; then
    errorexit "Env 'APP_DIR' not set! ${APP_DIR}"
fi
