#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := komodo
DEVICE_PATH := device/google/caimito
VENDOR_PATH := vendor/google/komodo
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/zumapro/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 9 Pro XL
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# RisingOS
RISING_MAINTAINER="Lord Itachi|Niv"
TARGET_ENABLE_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := false
TARGET_HAS_UDFPS := true
TARGET_PREBUILT_BCR := true
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
WITH_GMS := true
TARGET_CORE_GMS := false
TARGET_CORE_GMS_EXTRAS := false
TARGET_GMS_EXTRAS := true
WITH_PIXEL_OVERLAYS := true

ifneq ($(WITH_GMS),false)
ifneq ($(TARGET_CORE_GMS),true)
TARGET_PREBUILT_GOOGLE_CAMERA := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
endif
endif

# Boot animation
TARGET_SCREEN_HEIGHT := 2992
TARGET_SCREEN_WIDTH := 1344

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="komodo-user 15 AP4A.250105.002 12701944 release-keys" \
    BuildFingerprint=google/komodo/komodo:15/AP4A.250105.002/12701944:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME) \
    RisingChipset="Tensor G4" \
    RisingMaintainer="Lord Itachi|Niv"

ifneq ($(wildcard vendor/google_devices/komodo/proprietary/device-vendor.mk),)
else
  $(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
endif
