#!/bin/bash

source `dirname ${BASH_SOURCE[0]}`/config.sh

cd $BUILD_PATH/audacity/Release
zip -r $ARTIFACT_PATH/$PACKAGE_NAME.zip Audacity.app