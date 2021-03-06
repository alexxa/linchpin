#!/bin/bash

VENV_LIB_PATH=lib/python2.7/site-packages
LIBSELINUX_PATH=/usr/lib64/python2.7/site-packages

if [ -n "${VIRTUAL_ENV}" ]; then
    if [ "${USER}" != "root" ]; then
        sudo dnf install libselinux-python -yq &> /dev/null
    else
        dnf install libselinux-python -yq &> /dev/null
    fi

    ln -s ${LIBSELINUX_PATH}/selinux ${VIRTUAL_ENV}/${VENV_LIB_PATH} &> /dev/null
    ln -s ${LIBSELINUX_PATH}/_selinux.so ${VIRTUAL_ENV}/${VENV_LIB_PATH} &> /dev/null
else
    echo "A virtual environment is required"
    exit 1
fi
