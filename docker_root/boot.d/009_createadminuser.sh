#!/usr/bin/env bash

. /.bootd.scripts

email="admin@faq.app"
F_OUT=${F_OUT:-${APP_DIR}/data/users.db}

if [ ! -z ${ADMIN_PASSWORD} ];then
    PASS_BCRYPT=$(htpasswd -bnBC 10 "" ${ADMIN_PASSWORD} | tr -d ':\n' | sed 's/$2y/$2a/');
    _NUM=$((1000000000+$(od -A n -t d -N 3 /dev/urandom)))
    NEW_ID="AdMIn${_NUM:4}FaQ"
    #PASS_MD5=$(#echo -n ${ADMIN_PASSWORD} | md5sum | awk '{print $1}')
    #echo "PASS_BCRYPT='${PASS_BCRYPT}'"
    info "Creating User Admin (${email}) ${NEW_ID}"

    if [ "$(grep -s ${email} ${F_OUT})" != "" ]; then
        warn "User '${email} already exists!"
    else
        echo "{\"users_name\":\"admin\",\"user_email\":\"${email}\",\"user_password\":\"${PASS_BCRYPT}\",\"is_admin\":\"true\",\"_id\":\"${NEW_ID}\"}" >>$F_OUT
    fi

fi
