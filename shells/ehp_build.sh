#!/usr/bin/env bash
cd EHPEngine

sed -i '/BuildTargetPlarforms/d' Nebula_Build_Common.sh
sed -i '$aBuildTargetPlarforms=(fsl-s32v234)' Nebula_Build_Common.sh

./Nebula_Cmake_Init.sh; ./Nebula_Release_build.sh

scp cmake-build-release-fsl-s32v234/lib/* root@192.168.0.30:/home/root/AHP-A2-3.1.0028/S32V/lib
scp cmake-build-release-fsl-s32v234/bin/* root@192.168.0.30:/home/root/AHP-A2-3.1.0028/S32V/bin





# sed -i '/BuildTargetPlarforms/d' Nebula_Build_Common.sh
# sed -i '$aBuildTargetPlarforms=(fsl-s32v234)' Nebula_Build_Common.sh


# $WORKSPACE/EHPEngine

# sed -i '/BuildTargetPlarforms/d' $WORKSPACE/EHPEngine/Nebula_Build_Common.sh
# sed -i '$aBuildTargetPlarforms=(fsl-s32v234)' $WORKSPACE/EHPEngine/Nebula_Build_Common.sh