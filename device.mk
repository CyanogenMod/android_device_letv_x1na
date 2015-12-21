#
# Copyright (C) 2015 The CyanogenMod Project
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

ifneq ($(QCPATH),)
$(call inherit-product-if-exists, $(QCPATH)/common/config/device-vendor.mk)
endif
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

PRODUCT_DEX_PREOPT_MODULE_CONFIGS := true
# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation 1440x2560
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Haters gonna hate..
PRODUCT_CHARACTERISTICS := nosdcard

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.class_main.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.max1.rc \
    init.qcom.usb.max1_in.rc \
    init.qcom.usb.x1_na.rc \
    init.qcom.usb.x1.rc \
    init.qcom.usb.sh \
    init.rc \
    init.target.rc \
    ueventd.qcom.rc

# Qcom init scripts for /etc
#PRODUCT_PACKAGES += \
#    init.qcom.bt.sh \
#    init.qcom.fm.sh \
#    init.qcom.post_boot.sh \
#    init.qcom.uicc.sh \
#    msm8994_hmp.sh \
#    msm8994_tune.sh

# Keyhandler
PRODUCT_PACKAGES += \
    com.cyanogenmod.keyhandler

PRODUCT_SYSTEM_SERVER_JARS += com.cyanogenmod.keyhandler

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdb/Liquid/Liquid_Hdmi_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Liquid/Liquid_Bluetooth_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Liquid/Liquid_General_cal.acdb:system/etc/acdbdata/Liquid/Liquid_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Liquid/Liquid_Global_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Liquid/Liquid_Headset_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Liquid/Liquid_Handset_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Liquid/Liquid_Speaker_cal.acdb:system/etc/acdbdata/Liquid/Liquid_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/workspaceFile.qwsp:system/etc/acdbdata/MTP/X1/workspaceFile.qwsp \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/X1/MTP_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/X1/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/X1/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/X1/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/MTP_General_cal.acdb:system/etc/acdbdata/MTP/X1/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/X1/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/X1/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/workspaceFile.qwsp:system/etc/acdbdata/MTP/X1_NA/workspaceFile.qwsp \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/X1_NA/MTP_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/X1_NA/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/X1_NA/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/X1_NA/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/MTP_General_cal.acdb:system/etc/acdbdata/MTP/X1_NA/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/X1_NA/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/X1_NA/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/X1_NA/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/workspaceFile.qwsp:system/etc/acdbdata/MTP/MAX1/workspaceFile.qwsp \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MAX1/MTP_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MAX1/MTP_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MAX1/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MAX1/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MAX1/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MAX1/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MAX1/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MAX1/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/MTP/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Fluid/Fluid_Handset_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Fluid/Fluid_General_cal.acdb:system/etc/acdbdata/Fluid/Fluid_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Fluid/Fluid_Global_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Fluid/Fluid_Hdmi_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Fluid/Fluid_Headset_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Fluid/Fluid_Bluetooth_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Fluid/Fluid_Speaker_cal.acdb:system/etc/acdbdata/Fluid/Fluid_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8994 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8994 \
    tinymix

PRODUCT_PACKAGES += \
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Bluetooth
PRODUCT_PACKAGES += \
    bdAddrLoader

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Display
PRODUCT_PACKAGES += \
    copybit.msm8994 \
    gralloc.msm8994 \
    hwcomposer.msm8994 \
    memtrack.msm8994 \
    liboverlay

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    make_ext4fs \
    setup_fs

# GPS
PRODUCT_PACKAGES += \
    gps.msm8994 \
    flp.conf \
    gps.conf \
    izat.conf \
    lowi.conf \
    msap.conf \
    quipc.conf \
    sap.conf \
    xtwifi.conf

# IRQ
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/zImage:kernel \
    $(LOCAL_PATH)/dt.img:dt.img

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fpc1020.kl:system/usr/keylayout/fpc1020.kl \
    $(LOCAL_PATH)/keylayout/synaptics.kl:system/usr/keylayout/synaptics.kl

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8994

# Media profile
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    qcmediaplayer

PRODUCT_BOOT_JARS += qcmediaplayer

# Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/modules/core_ctl.ko:system/lib/modules/core_ctl.ko \
    $(LOCAL_PATH)/modules/evbug.ko:system/lib/modules/evbug.ko \
    $(LOCAL_PATH)/modules/gpio_axis.ko:system/lib/modules/gpio_axis.ko \
    $(LOCAL_PATH)/modules/gpio_event.ko:system/lib/modules/gpio_event.ko \
    $(LOCAL_PATH)/modules/gpio_input.ko:system/lib/modules/gpio_input.ko \
    $(LOCAL_PATH)/modules/gpio_matrix.ko:system/lib/modules/gpio_matrix.ko \
    $(LOCAL_PATH)/modules/gpio_output.ko:system/lib/modules/gpio_output.ko \
    $(LOCAL_PATH)/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    $(LOCAL_PATH)/modules/mcDrvModule.ko:system/lib/modules/mcDrvModule.ko \
    $(LOCAL_PATH)/modules/mcKernelApi.ko:system/lib/modules/mcKernelApi.ko \
    $(LOCAL_PATH)/modules/mmc_block_test.ko:system/lib/modules/mmc_block_test.ko \
    $(LOCAL_PATH)/modules/mmc_test.ko:system/lib/modules/mmc_test.ko \
    $(LOCAL_PATH)/modules/msm-buspm-dev.ko:system/lib/modules/msm-buspm-dev.ko \
    $(LOCAL_PATH)/modules/qca_cld/qca_cld_wlan.ko:system/lib/modules/qca_cld/qca_cld_wlan.ko \
    $(LOCAL_PATH)/modules/sii6400drv.ko:system/lib/modules/sii6400drv.ko \
    $(LOCAL_PATH)/modules/spidev.ko:system/lib/modules/spidev.ko \
    $(LOCAL_PATH)/modules/test-iosched.ko:system/lib/modules/test-iosched.ko \
    $(LOCAL_PATH)/modules/ufs_test.ko:system/lib/modules/ufs_test.ko \
    $(LOCAL_PATH)/modules/ufsd.ko:system/lib/modules/ufsd.ko \
    $(LOCAL_PATH)/modules/wil6210.ko:system/lib/modules/wil6210.ko \
    $(LOCAL_PATH)/modules/wlan.ko:system/lib/modules/wlan.ko


# Power
PRODUCT_PACKAGES += \
    power.msm8994

# Qualcomm
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/qmi_config.xml:system/etc/data/qmi_config.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:system/etc/thermal-engine.conf

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/qca_cld/WCNSS_qcom_wlan_nv.bin

#xtwifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/xtwifi.conf

PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    hostapd_default.conf \
    hostapd.accept \
    hostapd.deny

PRODUCT_PACKAGES += \
    wcnss_service \
    libwcnss_qmi

# Misc dependency packages
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    curl \
    libnl_2 \
    libbson \
    libcnefeatureconfig \
    libtinyxml \
    libxml2

# Inherit from oppo-common
#$(call inherit-product, device/letv/common/common.mk)
