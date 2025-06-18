#!/bin/bash

#-----------------------------------------------------------------------
# Jenkins Node User Provisioning Script
#
# This script performs the following actions:
# 1. Creates a 'jenkins' group with GID 2828.
# 2. Creates a 'jenkins' user with UID 2828 and assigns it to the
#    'jenkins' group and the 'docker' group.
# 3. Generates a 4096-bit RSA SSH key for the 'jenkins' user.
# 4. Sets up the SSH authorized_keys for passwordless login.
# 5. Sets appropriate permissions for the user's home and SSH directory.
#-----------------------------------------------------------------------

set -e
set -x

##
# Variables
##
USER_NAME="jenkins"
USER_ID="2828"
GROUP_ID="2828"
HOME_DIR="/home/${USER_NAME}"

##
# Create Jenkins Group and User
##

echo "--- Creating group '${USER_NAME}' with GID ${GROUP_ID} ---"
# Create a group for the jenkins user with the specified GID
# The -f flag ensures the command doesn't fail if the group already exists.
sudo groupadd --gid ${GROUP_ID} --force ${USER_NAME}

echo "--- Creating user '${USER_NAME}' with UID ${USER_ID} ---"

# Create the jenkins user if it doesn't already exist
if ! id -u ${USER_NAME} >/dev/null 2>&1; then
    sudo useradd \
        --uid ${USER_ID} \
        --gid ${GROUP_ID} \
        --create-home \
        --home-dir ${HOME_DIR} \
        --shell /bin/bash \
        ${USER_NAME}
else
    echo "User '${USER_NAME}' already exists. Skipping creation."
fi

echo "--- Adding user '${USER_NAME}' to the 'docker' group ---"
sudo usermod -a -G docker ${USER_NAME}

# Verify user and group IDs
id ${USER_NAME}

##
# Provision SSH Key for the new user
##

echo "--- Generating SSH key for '${USER_NAME}' ---"
# Create the .ssh directory as the jenkins user
sudo -u ${USER_NAME} mkdir -p ${HOME_DIR}/.ssh

# Generate the SSH key non-interactively
sudo -u ${USER_NAME} ssh-keygen \
    -m PEM \
    -t rsa \
    -b 4096 \
    -f ${HOME_DIR}/.ssh/id_rsa \
    -N "" # No passphrase

echo "--- Setting up authorized_keys ---"
# Add the new public key to the authorized_keys file
sudo -u ${USER_NAME} cp ${HOME_DIR}/.ssh/id_rsa.pub ${HOME_DIR}/.ssh/authorized_keys

echo "--- Setting correct permissions for SSH files ---"
# Set strict permissions required for SSH
sudo chmod 700 ${HOME_DIR}/.ssh
sudo chmod 600 ${HOME_DIR}/.ssh/authorized_keys
sudo chown -R ${USER_NAME}:${USER_NAME} ${HOME_DIR}/.ssh

echo "--- Provisioning complete for user '${USER_NAME}' ---"
echo "Public key:"
sudo cat ${HOME_DIR}/.ssh/id_rsa.pub

##
# (Optional) Docker Login - This part remains interactive
##
# docker login
