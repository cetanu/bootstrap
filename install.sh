#!/usr/bin/env bash

set -eux

for dir in salt pillar
do
    rm -rf /srv/${dir}
    mkdir -p /srv/${dir}
    cp -rf ./${dir} /srv
done

USERNAME=$1
cat << EOF > /srv/pillar/user.sls
homedir: ${HOME}
username: ${USERNAME}
EOF

bootstrap () {
    curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io
    sh bootstrap-salt.sh -xP stable 3003.3
}
which salt-call || bootstrap
salt-call -l debug -c $(pwd) state.highstate

