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

#SFTP_USER="${SFTP_USER:-solacecloud-LearnDirStaging}"
SFTP_USER="${SFTP_USER:-omssolace-cloud-learn}"
SFTP_HOST="${SFTP_HOST:-omssolace.sftp.wpengine.com}"
SFTP_PORT="${SFTP_PORT:-2222}"
SFTP_COMMAND_DISABLE_KNOWN_HOSTS_CHECKING="set sftp:auto-confirm yes;"
SFTP_COMMAND_SYNC="mirror -Re .;"

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
echo "Synchronizing $SYNC_LOCAL to $SFTP_HOST"
pushd $SYNC_LOCAL > /dev/null
echo lftp -u $SFTP_USER,$SFTP_PASSWORD sftp://$SFTP_HOST:$SFTP_PORT -e "$SFTP_COMMAND_DISABLE_KNOWN_HOSTS_CHECKING $SFTP_COMMAND_SYNC exit"
lftp -u $SFTP_USER,$SFTP_PASSWORD sftp://$SFTP_HOST:$SFTP_PORT -e "$SFTP_COMMAND_DISABLE_KNOWN_HOSTS_CHECKING $SFTP_COMMAND_SYNC exit"

