#!/usr/bin/env bash
# 
# Install learn docs to Solace Cloud microsite
#
# Usage:
#
#  SFTP_PASSWORD=**** ./deploy.sh
#

# Here’s SFTP access to the directory on the staging site. Should meet needs for experimentation.
# SFTP Address: solacecloud.sftp.wpengine.com
# Port Number: 2222
# Username: solacecloud-LearnDirStaging
# Password: (omitted)

BUILDDIR="${BUILDDIR:-../target}"
DOCSDIR="${DOCSDIR:-../docs}"

SFTP_USER="${SFTP_USER:-solacecloud-LearnDirStaging}"
SFTP_HOST="${SFTP_HOST:-solacecloud.sftp.wpengine.com}"
SFTP_PORT="${SFTP_PORT:-2222}"
SFTP_SYNC_ROOT="${SFTP_SYNC_ROOT:-/}"
SFTP_DISABLE_KNOWN_HOSTS_CHECKING=-d
SFTP_LOGGING=--logging=DEBUG


# Check environment
if [ -z "${SFTP_PASSWORD-}" ]; then
   echo "Must provide SFTP_PASSWORD environment variable. Exiting...."
   exit 1
fi

python_version=$(python -V 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1\2/')
if [ "$python_version" -lt "27" ]; then
  echo "This script requires python 2.7 or greater"
  exit 1
fi

if [[ -z `which virtualenv` ]]; then
  echo "This script requires Python virtualenv"
  exit 1
fi

echo "Creating Python virtual environment"
virtualenv .venv_deploy
source ./.venv_deploy/bin/activate

echo "Installing deployment requirements"
pip install -r requirements.txt

echo "Creating build directory"
mkdir -p $BUILDDIR

# Normalize build dir
echo "Resolving build directory"
pushd "$(dirname '$0')/$BUILDDIR" > /dev/null
BUILDDIR_REAL=`pwd`
popd > /dev/null
echo "Resolved build directory: $BUILDDIR -> $BUILDDIR_REAL"

# Normalized push to docs directory
echo "Installing docs build dependencies"
pushd "$(dirname '$0')/$DOCSDIR"
pip install -r requirements.txt

echo "Building docs"
BUILDDIR=$BUILDDIR_REAL make html

popd > /dev/null

SYNC_LOCAL="$BUILDDIR_REAL/html"
echo "Synchronizing $SYNC_LOCAL to $SFTP_HOST:$SFTP_SYNC_ROOT"
sftpclone $SFTP_DISABLE_KNOWN_HOSTS_CHECKING $SFTP_LOGGING -p$SFTP_PORT $SYNC_LOCAL "$SFTP_USER:$SFTP_PASSWORD@$SFTP_HOST:$SFTP_SYNC_ROOT"

