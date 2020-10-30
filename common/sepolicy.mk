#
# This policy configuration will be used by all products that
# inherit from hornbill
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/hornbill/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/hornbill/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/hornbill/sepolicy/common/dynamic \
    device/hornbill/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/hornbill/sepolicy/common/dynamic \
    device/hornbill/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/hornbill/sepolicy/legacy-common/sepolicy.mk
