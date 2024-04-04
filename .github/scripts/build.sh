#!/bin/bash

source `dirname ${BASH_SOURCE[0]}`/config.sh

cp -r $WORKSPACE_PATH/mod-openvino $SOURCE_PATH/$AUDACITY_VERSION/modules
sed -i '' 's/set( MODULES/set( MODULES\n   mod-openvino/' $SOURCE_PATH/$AUDACITY_VERSION/modules/CMakeLists.txt

mkdir -p $PACKAGE_PATH

cd $PACKAGE_PATH
wget https://storage.openvinotoolkit.org/repositories/openvino/packages/2024.0/macos/m_openvino_toolkit_macos_11_0_2024.0.0.14509.34caeefd078_arm64.tgz
tar xvf m_openvino_toolkit_macos_11_0_2024.0.0.14509.34caeefd078_arm64.tgz
source m_openvino_toolkit_macos_11_0_2024.0.0.14509.34caeefd078_arm64/setupvars.sh

mkdir -p $BUILD_PATH
cd $BUILD_PATH

cmake -G "Unix Makefiles" $SOURCE_PATH/$AUDACITY_VERSION -DCMAKE_BUILD_TYPE=Release
make -j`sysctl -n hw.ncpu`

find Release