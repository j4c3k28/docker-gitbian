#!/usr/bin/env bash

if [[ ${1} == start ]]; then
  ssh-keygen -A
  mkdir /run/sshd
  /usr/sbin/sshd -D && /bin/bash
else
  ${@}
fi
