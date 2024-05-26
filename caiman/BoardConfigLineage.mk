#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

include $(DEVICE_PATH)/BoardConfigLineage.mk

ifneq ($(wildcard vendor/google_devices/caiman/proprietary/BoardConfigVendor.mk),)
else
  include $(VENDOR_PATH)/BoardConfigVendor.mk
endif
