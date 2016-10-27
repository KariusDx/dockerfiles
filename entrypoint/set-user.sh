#!/bin/bash
set -eu

# run the docker imaage with: -e LOCAL_USER_ID=`id -u $USER`
# source: https://denibertovic.com/posts/handling-permissions-with-docker-volumes/

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

user=user
USER_ID=${LOCAL_USER_ID:-9001}
if ! uid=$(id -u "$USER_ID") ; then
    echo "Starting with UID : $USER_ID"
    useradd --shell /bin/bash -u "$USER_ID" -o -c "" -m user
else
    echo $uid
    user=$(getent passwd "$uid" | cut -d: -f1)
    echo $user
fi

export "HOME=/home/$user"
if ! groups "$user" | grep sudo ; then
  adduser "$user" sudo
fi

if ! sudo ls ; then
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
fi

exec /usr/bin/sudo -u "$user" "$@"
