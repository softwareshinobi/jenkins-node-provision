#!/bin/bash
#
# =================================================================
# Docker Hub Login Script
#
# Purpose: Logs into the Docker Hub registry to allow pulling
#          private images and pushing new images.
# =================================================================

set -e
set -x

# --- Configuration ---
# Set the Docker Hub username.

DOCKER_USERNAME="softwareshinobi"

# --- Main Execution ---

echo "🚀 Initiating login for Docker Hub user: ${DOCKER_USERNAME}"

# The docker login command authenticates with the Docker Hub registry.
# It will prompt for a password or Personal Access Token to complete the login.

docker login --username "${DOCKER_USERNAME}"

echo "✅ Login successful!"
