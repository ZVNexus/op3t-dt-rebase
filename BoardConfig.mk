# config.mk
#
# Product-specific compile-time definitions
#

TARGET_BOARD_PLATFORM := msm8996
# This value will be shown on fastboot menu
TARGET_BOOTLOADER_BOARD_NAME := msm8996

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kyro

TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false
BOOTLOADER_GCC_VERSION := arm-eabi-4.8
BOOTLOADER_PLATFORM := msm8996 # use msm8996 LK configuration

#TARGET_USES_OVERLAY := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
QTI_S3D := true # Enable S3D GPU compostion

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

#USE_CLANG_PLATFORM_BUILD := true

-include vendor/oneplus/oneplus3/BoardConfigVendor.mk

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oneplus/oneplus3/bluetooth

USE_OPENGL_RENDERER := true
BOARD_USE_LEGACY_UI := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3


TARGET_USERIMAGES_USE_EXT4 := false
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := f2fs

# Enable System As Root even for non-A/B from P onwards
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Set Header version for bootimage
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3154116608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57436708864
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_QCOM_BSP := true

BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=32M@0-0xffffffff firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7 console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0

BOARD_SECCOMP_POLICY := device/oneplus/oneplus3/seccomp

BOARD_EGL_CFG := device/oneplus/oneplus3/configs/egl.cfg

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_RAMDISK_OFFSET     := 0x02200000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := false
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8996
TARGET_KERNEL_CONFIG := du_oneplus3_defconfig

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_NO_RPC := true

TARGET_PLATFORM_DEVICE_BASE := /devices/soc/
TARGET_INIT_VENDOR_LIB := libinit_msm

#Enable Peripheral Manager
TARGET_PER_MGR_ENABLED := true

TARGET_HW_DISK_ENCRYPTION := true

BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_BOOTIMG_SIGNED := true

DEX_PREOPT_DEFAULT := nostripping

# Enable dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_PIC := true
      ifneq ($(TARGET_BUILD_VARIANT),user)
        # Retain classes.dex in APK's for non-user builds
        DEX_PREOPT_DEFAULT := nostripping
      endif
    endif
endif

# Enable sensor multi HAL
USE_SENSOR_MULTI_HAL := true

#Enable early mount support for mmc/ufs
EARLY_MOUNT_SUPPORT := true

# Enable build with MSM kernel
TARGET_COMPILE_WITH_MSM_KERNEL := true

TARGET_KERNEL_APPEND_DTB := true
# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := false

#Enable DRM plugins 64 bit compilation
TARGET_ENABLE_MEDIADRM_64 := true
