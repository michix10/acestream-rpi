#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

################################################################################
# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"
################################################################################

CURDIR=$PWD
BASEDIR=`dirname $0`
PROJECT_PATH=`cd $BASEDIR; pwd`
VERSION=`cat $PROJECT_PATH/latest`
ACE_NAME="acestream-rpi"
RELEASE_DIR="Release"

rm -fr $PROJECT_PATH/$RELEASE_DIR
mkdir -p $PROJECT_PATH/$RELEASE_DIR

echo ""
echo -e "${COL_BLUE}Creating release $ACE_NAME-$VERSION...${COL_RESET}"
echo ""
pushd $PROJECT_PATH/python27 > /dev/null
zip -rq $PROJECT_PATH/src/acestream.engine/python/lib/python27.zip *
popd > /dev/null
pushd $PROJECT_PATH/src > /dev/null
tar -cvjf $ACE_NAME-$VERSION.tar.bz2 *
popd > /dev/null
mv -f $PROJECT_PATH/src/$ACE_NAME-$VERSION.tar.bz2 $PROJECT_PATH/$RELEASE_DIR
rm -f $PROJECT_PATH/src/acestream.engine/python/lib/python27.zip
echo ""
echo -e "${COL_YELLOW}Done:${COL_MAGENTA} $ACE_NAME-$VERSION.tar.bz2${COL_RESET}"
echo ""
