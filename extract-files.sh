#!/bin/bash
#
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

# Required!
export DEVICE=sagit
export VENDOR=xiaomi

export DEVICE_BRINGUP_YEAR=2017

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

ROOT="$MY_DIR"/../../..

HELPER="$ROOT"/vendor/blobscript/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

while [ "$1" != "" ]; do
    case $1 in
        -n | --no-cleanup )     CLEAN_VENDOR=false
                                ;;
        -s | --section )        shift
                                SECTION=$1
                                CLEAN_VENDOR=false
                                ;;
        * )                     SRC=$1
                                ;;
    esac
    shift
done

if [ -z "$SRC" ]; then
    SRC=adb
fi

# Initialize the helper for device
setup_vendor "$DEVICE" "$VENDOR" "$ROOT" false "$CLEAN_VENDOR"

extract "$MY_DIR"/proprietary-files.txt "$SRC" "$SECTION"

COMMON_BLOB_ROOT="$ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary

#
# Load moved mi camera dependencies from vendor
#
function fix_camera_etc_path () {
    sed -i \
        's/system\/etc\//vendor\/etc\//g' \
        "$COMMON_BLOB_ROOT"/"$1"
}

fix_camera_etc_path vendor/lib/libmmcamera2_sensor_modules.so
fix_camera_etc_path vendor/lib/libMiCameraHal.so
fix_camera_etc_path vendor/lib/libFaceGrade.so

#
# Add necessary symbols containing camera libs from stock
#
patchelf --replace-needed libicuuc.so libicuuc_stock.so "$COMMON_BLOB_ROOT"/vendor/lib/libMiCameraHal.so
patchelf --replace-needed libicuuc.so libicuuc_stock.so "$COMMON_BLOB_ROOT"/vendor/lib/hw/camera.msm8998.so
patchelf --replace-needed libminikin.so libminikin_stock.so "$COMMON_BLOB_ROOT"/vendor/lib/libMiCameraHal.so
patchelf --replace-needed libminikin.so libminikin_stock.so "$COMMON_BLOB_ROOT"/vendor/lib/hw/camera.msm8998.so
patchelf --replace-needed libskia.so libskia_stock.so "$COMMON_BLOB_ROOT"/vendor/lib/libMiCameraHal.so
patchelf --replace-needed libskia.so libskia_stock.so "$COMMON_BLOB_ROOT"/vendor/lib/hw/camera.msm8998.so

# Correct VZW IMS library location
#
QTI_VZW_IMS_INTERNAL="$COMMON_BLOB_ROOT"/vendor/etc/permissions/qti-vzw-ims-internal.xml
sed -i "s|/system/vendor/framework/qti-vzw-ims-internal.jar|/vendor/framework/qti-vzw-ims-internal.jar|g" "$QTI_VZW_IMS_INTERNAL"

#
# Correct android.hidl.manager@1.0-java jar name
#
QTI_LIBPERMISSIONS="$COMMON_BLOB_ROOT"/vendor/etc/permissions/qti_libpermissions.xml
sed -i "s|name=\"android.hidl.manager-V1.0-java|name=\"android.hidl.manager@1.0-java|g" "$QTI_LIBPERMISSIONS"

# Fix gnss
patchelf --replace-needed android.hardware.gnss@1.0.so android.hardware.gnss@1.0-v27.so $COMMON_BLOB_ROOT/vendor/lib64/vendor.qti.gnss@1.0_vendor.so
patchelf --replace-needed android.hardware.gnss@1.0.so android.hardware.gnss@1.0-v27.so $COMMON_BLOB_ROOT/lib64/vendor.qti.gnss@1.0.so

"$MY_DIR"/setup-makefiles.sh
