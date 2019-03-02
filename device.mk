$(call inherit-product, vendor/oneplus/oneplus3/oneplus3-vendor.mk)
$(call inherit-product, vendor/extras/configs/phone-xxhdpi-4096-dalvik-heap.mk)
$(call inherit-product, vendor/extras/configs/phone-xxhdpi-2048-hwui-memory.mk)
$(call inherit-product, device/oneplus/extras/common.mk)

ALLOW_MISSING_DEPENDENCIES=true

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

TARGET_KERNEL_VERSION := 3.18

# video seccomp policy files
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/oneplus/oneplus3/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Enable features in video HAL that can compile only on this platform
TARGET_USES_MEDIA_EXTENSIONS := true

# copy customized media_profiles and media_codecs xmls for msm8996
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/oneplus/oneplus3/configs/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    device/oneplus/oneplus3/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/oneplus/oneplus3/configs/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    device/oneplus/oneplus3/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    device/oneplus/oneplus3/configs/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-service \
    android.hardware.power@1.0-impl


# system prop for opengles version
#
# 196608 is decimal for 0x30000 to report version 3
# 196609 is decimal for 0x30001 to report version 3.1
# 196610 is decimal for 0x30002 to report version 3.2
PRODUCT_PROPERTY_OVERRIDES  += \
    ro.opengles.version=196610

PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_BOOT_JARS += WfdCommon

DEVICE_MANIFEST_FILE := device/oneplus/oneplus3/configs/manifest.xml
DEVICE_MATRIX_FILE   := device/oneplus/oneplus3/configs/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := device/oneplus/oneplus3/configs/framework_manifest.xml

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

# Audio configuration file
-include hardware/qcom/audio-caf/configs/msm8996/msm8996.mk

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# Display/Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    android.hardware.configstore@1.0-service

PRODUCT_PACKAGES += \
    vendor.display.color@1.0-service \
    vendor.display.color@1.0-impl

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service \

# Camera configuration file. Shared by passthrough/binderized camera HAL
PRODUCT_PACKAGES += camera.device@3.2-impl
PRODUCT_PACKAGES += camera.device@1.0-impl
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-impl

# Enable binderized camera HAL
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-service

# Sensor features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# High performance VR feature
#PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vr.high_performance.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/oneplus/oneplus3/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# List of AAPT configurations
PRODUCT_AAPT_CONFIG += normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Powerhint configuration file
PRODUCT_COPY_FILES += \
device/oneplus/oneplus3/configs/powerhint.xml:system/etc/powerhint.xml

#Healthd packages
PRODUCT_PACKAGES += android.hardware.health@2.0-impl \
                   android.hardware.health@2.0-service

PRODUCT_PACKAGES += \
    libandroid_net \
    libandroid_net_32

#Enable Lights Impl HAL Compilation
PRODUCT_PACKAGES += android.hardware.light@2.0-impl

#Enable AOSP KEYMASTER and GATEKEEPER HIDLs
PRODUCT_PACKAGES += android.hardware.gatekeeper@1.0-impl \
                    android.hardware.gatekeeper@1.0-service \
                    android.hardware.keymaster@3.0-impl \
                    android.hardware.keymaster@3.0-service

# Defined the locales
PRODUCT_LOCALES += th_TH vi_VN tl_PH hi_IN ar_EG ru_RU tr_TR pt_BR bn_IN mr_IN ta_IN te_IN zh_HK \
        in_ID my_MM km_KH sw_KE uk_UA pl_PL sr_RS sl_SI fa_IR kn_IN ml_IN ur_IN gu_IN or_IN

PRODUCT_PROPERTY_OVERRIDES += rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so

TARGET_MOUNT_POINTS_SYMLINKS := false

# system prop for Bluetooth SOC type
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=rome

# Set this true as ROME which is programmed
# as embedded wipower mode by deafult
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.emb_wp_mode=true \
    ro.vendor.bluetooth.emb_wp_mode=true

#system prop for wipower support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.wipower=true \
    ro.vendor.bluetooth.wipower=true

#Thermal
PRODUCT_PACKAGES += android.hardware.thermal@1.0-impl \
                    android.hardware.thermal@1.0-service
