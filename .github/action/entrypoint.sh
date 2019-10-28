#!/bin/bash

set -e

# utils
function print_error() {
    echo -e "\e[31mERROR: ${1}\e[m"
}

echo "verify:"

# check envs
if [ -z "${GITHUB_TOKEN}" ]; then
    print_error "not found GITHUB_TOKEN"
    exit 1
fi

if [ -z "${AOJ_USERNAME}" ]; then
    print_error "not found AOJ_USERNAME"
    exit 1
fi

if [ -z "${AOJ_PASSWORD}" ]; then
    print_error "not found AOJ_PASSWORD"
    exit 1
fi

# setting for git
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
REMOTE_REPO="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

# clone
git clone "${REMOTE_REPO}" local_repo
cd local_repo
# main flow
export RUBYOPT=-EUTF-8
./bin/verify
