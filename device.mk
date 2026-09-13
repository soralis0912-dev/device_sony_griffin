#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from sony sm8150-common
$(call inherit-product, device/sony/sm8150-common/common.mk)

# Device info
# Three physical rear sensors, all 12 MP: imx445 wide, s5k3m3 tele and s5k4h7
# ultra wide.  Left to the camera HAL the logical cameras built on top of them
# would be counted too, so list the sensors rather than what it reports.
CAMERA_REAR_INFO := 12,12,12
CAMERA_FRONT_INFO := 8

# Boot animation
TARGET_SCREEN_HEIGHT := 3840
TARGET_SCREEN_WIDTH := 1644

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Overlays
PRODUCT_PACKAGES += \
    SonyGriffinFrameworksRes \
    SonyGriffinSystemUIRes

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Inherit from vendor blobs
$(call inherit-product, vendor/sony/griffin/griffin-vendor.mk)
