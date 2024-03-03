#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := tokay
DEVICE_PATH := device/google/caimito
VENDOR_PATH := vendor/google/tokay
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/zumapro/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 9
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# RisingOS
RISING_MAINTAINER="Lord Itachi"
TARGET_ENABLE_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := false
TARGET_HAS_UDFPS := true
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
WITH_GMS := true

ifneq ($(WITH_GMS),false)
TARGET_PREBUILT_GOOGLE_CAMERA := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
endif

# Boot animation
TARGET_SCREEN_HEIGHT := 2424
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="tokay-user 15 AP4A.250105.002 12701944 release-keys" \
    BuildFingerprint=google/tokay/tokay:15/AP4A.250105.002/12701944:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME) \
    RisingChipset="Tensor G4" \
    RisingMaintainer="Lord Itachi"

ifneq ($(wildcard vendor/google_devices/tokay/proprietary/device-vendor.mk),)
else
  $(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
endif
