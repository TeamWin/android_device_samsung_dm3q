#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/dm3q

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := kalama
TARGET_BOOTLOADER_BOARD_NAME := kalama
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

ALLOW_MISSING_DEPENDENCIES := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kalama
TARGET_BOARD_PLATFORM_GPU := qcom-adreno740
QCOM_BOARD_PLATFORMS += kalama

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo
#BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_KERNEL_ARCH := arm64

# Boot
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 printk.devkmsg=on firmware_class.path=/vendor/firmware_mnt/image bootconfig androidboot.hardware=qcom androidboot.memcg=1 androidboot.usbcontroller=a600000.dwc3 loop.max_part=7 androidboot.selinux=permissive buildvariant=eng
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) 
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION) --pagesize $(BOARD_KERNEL_PAGESIZE) --board "SRPVH05C005"
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB) --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/bootimg.mk

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 109051904
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 109051904

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9126805504
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system odm product system_ext vendor vendor_dlkm

# System as root
BOARD_ROOT_EXTRA_FOLDERS := \
	cache \
	carrier \
	data_mirror \
	efs \
	linkerconfig \
	odm_dlkm \
	oem \
	optics \
	postinstall \
	prism \
	second_stage_resources \
	spu \
	system_ext \
	vendor_dlkm
BOARD_SUPPRESS_SECURE_ERASE := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_VENDOR_PROP += device/samsung/dm3q/vendor.prop

AB_OTA_UPDATER := false

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# Crypto
PLATFORM_SECURITY_PATCH := 2029-12-31
VENDOR_SECURITY_PATCH := 2029-12-31
PLATFORM_VERSION := 12.1.0
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
BOARD_USES_QCOM_FBE_DECRYPTION := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false
BOARD_USES_METADATA_PARTITION := true

# PRODUCT_COPY_FILES directives.
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

TW_LOAD_VENDOR_MODULES := "qcom_wdt_core.ko gh_virt_wdt.ko qcom_cpu_vendor_hooks.ko clk-rpmh.ko gcc-kalama.ko icc-rpmh.ko camcc-kalama.ko qcom_ipcc.ko qcom-pdc.ko thermal_minidump.ko qcom_tsens.ko rpmh-regulator.ko bwmon.ko qcom-cpufreq-hw.ko sched-walt.ko thermal_pause.ko cpu_hotplug.ko clk-dummy.ko clk-qcom.ko cmd-db.ko cqhci.ko crypto-qti-common.ko crypto-qti-hwkm.ko dcc_v2.ko dcvs_fp.ko dispcc-kalama.ko tcsrcc-kalama.ko videocc-kalama.ko gdsc-regulator.ko gh_arm_drv.ko gh_ctrl.ko gh_dbl.ko gh_msgq.ko gh_rm_drv.ko gunyah.ko mdt_loader.ko hwkm.ko icc-bcm-voter.ko iommu-logger.ko llcc-qcom.ko mem-hooks.ko mem_buf_dev.ko mem_buf_msgq.ko mem_buf.ko memory_dump_v2.ko minidump.ko msm_dma_iommu_mapping.ko pinctrl-kalama.ko qnoc-kalama.ko nvmem_qcom-spmi-sdam.ko phy-qcom-ufs.ko phy-qcom-ufs-qmp-v4-kalama.ko phy-qcom-ufs-qrbtc-sdm845.ko pinctrl-msm.ko pinctrl-somc.ko proxy-consumer.ko qcom-dcvs.ko qcom-dload-mode.ko qcom_dma_heaps.ko qcom_hwspinlock.ko debug_symbol.ko qcom_logbuf_vh.ko qcom_iommu_util.ko qcom_llcc_pmu.ko qcom-pmu-lib.ko pmu_vendor.ko pmu_scmi.ko qcom-spmi-pmic.ko spmi-pmic-arb.ko qcom-reboot-reason.ko qcom_rpmh.ko qcom-scm.ko qnoc-qos.ko qrtr.ko regmap-spmi.ko rtc-pm8xxx.ko secure_buffer.ko smem.ko socinfo.ko stub-regulator.ko qcom_aoss.ko msm_qmp.ko tmecom-intf.ko ufs_qcom.ko ufshcd-crypto-qti.ko arm_smmu.ko sdhci-msm.ko qcom_rimps.ko c1dcvs_vendor.ko c1dcvs_scmi.ko bcl_pmic5.ko nvme-core.ko nvme.ko wakeup_irq_debug.ko msm_sysstats.ko msm_show_resume_irq.ko mhi.ko mhi_cntrl_qcom.ko mhi_dev_uci.ko mhi_dev_netdev.ko mhi_dev_dtr.ko mhi_dev_satellite.ko phy-qcom-ufs-qmp-v4-waipio.ko phy-qcom-ufs-qmp-v4.ko phy-qcom-ufs-qmp-v4-khaje.ko pinctrl-spmi-gpio.ko pinctrl-spmi-mpp.ko pinctrl-somc-pmic.ko pwm-qti-lpg.ko pci-msm-drv.ko debugcc-kalama.ko gpucc-kalama.ko bam_dma.ko msm_gpi.ko pdr_interface.ko qmi_helpers.ko heap_mem_ext_v01.ko msm_memshare.ko smp2p.ko smp2p_sleepstate.ko qsee_ipc_irq_bridge.ko glink_probe.ko glink_pkt.ko pmic_glink.ko altmode-glink.ko soc_sleep_stats.ko cdsprm.ko sysmon_subsystem_stats.ko subsystem_sleep_stats.ko adsp_sleepmon.ko eud.ko microdump_collector.ko llcc_perfmon.ko cdsp-loader.ko pmic-pon-log.ko boot_stats.ko rq_stats.ko core_hang_detect.ko usb_bam.ko memlat.ko memlat_scmi.ko qcom_ramdump.ko panel_event_notifier.ko dmesg_dumper.ko sys_pm_vx.ko qdss_bridge.ko fsa4480-i2c.ko msm_show_epoch.ko gh_tlmm_vm_mem_access.ko sps_drv.ko spss_utils.ko spcom.ko msm_performance.ko qcom_va_minidump.ko qbt_handler.ko hung_task_enh.ko qti-fixed-regulator.ko qti-ocp-notifier.ko hvc_gunyah.ko msm_geni_serial.ko frpc-adsprpc.ko rdbg.ko lt9611uxc.ko qseecom_proxy.ko sg.ko spi-msm-geni.ko smsc.ko smsc75xx.ko smsc95xx.ko msm_sharedmem.ko phy-generic.ko phy-qcom-emu.ko phy-msm-ssusb-qmp.ko phy-msm-snps-eusb2.ko phy-msm-m31-eusb2.ko dwc3-msm.ko ehset.ko usb_f_cdev.ko usb_f_ccid.ko usb_f_qdss.ko usb_f_gsi.ko usb_f_diag.ko ucsi_glink.ko usbmon.ko repeater.ko repeater-qti-pmic-eusb2.ko repeater-i2c-eusb2.ko redriver.ko pm8941-pwrkey.ko i2c-msm-geni.ko i3c-master-msm-geni.ko qcom_ipc_lite.ko synx-driver.ko qcom-pon.ko reboot-mode.ko qti_battery_charger.ko qcom-spmi-temp-alarm.ko bcl_soc.ko cpu_voltage_cooling.ko ddr_cdev.ko max31760_fan.ko msm_lmh_dcvs.ko policy_engine.ko qti_qmi_cdev.ko qti_qmi_sensor_v2.ko qti_cpufreq_cdev.ko qti_devfreq_cdev.ko qti_userspace_cdev.ko sdpm_clk.ko qcom_edac.ko qcom_lpm.ko mmc_log_probes.ko leds-qti-flash.ko leds-qti-tri-led.ko memlat_vendor.ko ipa_fmwk.ko qcom_pil_info.ko rproc_qcom_common.ko qcom_q6v5.ko qcom_q6v5_pas.ko qcom_spss.ko qcom_esoc.ko qcom_sysmon.ko qcom_glink.ko qcom_glink_smem.ko qcom_glink_spss.ko qcom_smd.ko gh_irq_lend.ko gh_mem_notifier.ko qcom-spmi-adc5-gen3.ko qcom-vadc-common.ko nvmem_qfprom.ko slimbus.ko slim-qcom-ngd-ctrl.ko stm_core.ko stm_p_basic.ko stm_p_ost.ko stm_console.ko stm_ftrace.ko snd-usb-audio-qmi.ko snd-soc-hdmi-codec.ko cfg80211.ko mac80211.ko qrtr-smd.ko qrtr-mhi.ko qrtr-gunyah.ko qca_cld3_kiwi_v2.ko cnss2.ko cnss_plat_ipc_qmi_svc.ko wlan_firmware_service.ko cnss_nl.ko cnss_prealloc.ko cnss_utils.ko q6_notifier_dlkm.ko spf_core_dlkm.ko audpkt_ion_dlkm.ko gpr_dlkm.ko audio_pkt_dlkm.ko q6_dlkm.ko adsp_loader_dlkm.ko audio_prm_dlkm.ko q6_pdr_dlkm.ko pinctrl_lpi_dlkm.ko swr_dlkm.ko swr_ctrl_dlkm.ko snd_event_dlkm.ko wcd_core_dlkm.ko mbhc_dlkm.ko wcd9xxx_dlkm.ko stub_dlkm.ko machine_dlkm.ko swr_dmic_dlkm.ko swr_haptics_dlkm.ko hdmi_dlkm.ko lpass_cdc_wsa2_macro_dlkm.ko lpass_cdc_wsa_macro_dlkm.ko lpass_cdc_va_macro_dlkm.ko lpass_cdc_rx_macro_dlkm.ko lpass_cdc_tx_macro_dlkm.ko lpass_cdc_dlkm.ko wsa884x_dlkm.ko wsa883x_dlkm.ko wcd938x_dlkm.ko wcd938x_slave_dlkm.ko tz_log_dlkm.ko qcedev-mod_dlkm.ko qcrypto-msm_dlkm.ko qce50_dlkm.ko hdcp_qseecom_dlkm.ko qrng_dlkm.ko smcinvoke_dlkm.ko cirrus_wm_adsp.ko cirrus_cs35l45.ko somc_battchg_ext.ko et603-int.ko cirrus_cs40l2x.ko cirrus_cs40l2x_codec.ko lxs_touchscreen.ko btpower.ko bt_fm_slim.ko radio-i2c-rtc6226-qca.ko gsim.ko ipam.ko ipanetm.ko rndisipam.ko ipa_clientsm.ko rmnet_core.ko rmnet_ctl.ko rmnet_offload.ko rmnet_perf_tether.ko rmnet_perf.ko rmnet_shs.ko rmnet_aps.ko rmnet_sch.ko rmnet_wlan.ko msm_drm.ko msm-eva.ko msm_ext_display.ko sync_fence.ko msm_hw_fence.ko msm-mmrm.ko nxp-nci.ko msm_video.ko slg51000-regulator.ko msm_kgsl.ko"
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION := 1
TW_FRAMERATE := 120
TW_MAX_BRIGHTNESS := 510
TW_DEFAULT_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone50/temp
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_NO_HAPTICS := true
TW_USE_NEW_MINADBD := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_TOOLBOX := true
TARGET_USES_MKE2FS := true
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_EXTRA_LANGUAGES := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true
# *End*