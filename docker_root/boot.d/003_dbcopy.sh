#!/usr/bin/env bash

. /.bootd.scripts

IMP_DIR=${IMPORT_DIR:-/import}
EXP_DIR=${APP_DIR}/data}

copydb "user"
copydb "kb"
copydb "votes"