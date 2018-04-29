# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=2 \
    audio.adm.buffering.ms=6 \
    audio.offload.min.duration.secs=15 \
    audio.usb.disable.sidetone=false \
    persist.audio.dirac.speaker=true \
    persist.audio.speaker.dualmode=true \
    ro.audio.nojack=true \
    ro.audio.soundtrigger=none \
    ro.audio.soundtrigger.lowpower=false \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.audio.hw.aac.encoder=false \
    vendor.audio.offload.multiple.enabled=true \
    vendor.audio.offload.track.enable=false \
    vendor.audio.parser.ip.buffer.size=0 \
    vendor.audio.soundtrigger.phrase.adsp.level=40 \
    vendor.audio.soundtrigger.phrase.level=40 \
    vendor.audio.soundtrigger.training.level=50 \
    vendor.audio.soundtrigger.user.adsp.level=30 \
    vendor.audio.soundtrigger.user.level=60

# Battery
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cutoff_voltage_mv=3400

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    bt.max.hfpclient.connections=1 \
    qcom.bluetooth.soc=cherokee

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,com.miui.cit,co.paranoidandroid.camera \
    persist.dualcam.lpm.enable=1 \
    persist.ts.rtmakeup=false \
    vidc.enc.dcvs.extra-buff-count=2

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1

# Coresight
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.coresight.config=stm-events

# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.mode=concurrent \
    persist.data.netmgrd.qos.enable=true \
    ro.use_data_netmgrd=true

# Dalvik heap
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.bg-dex2oat-threads=8 \
    dalvik.vm.dex2oat-min-free-mem=209715200 \
    dalvik.vm.dex2oat-threads=6 \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.75

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=0 \
    ro.qcom.ad=1 \
    ro.qcom.ad.calib.data=/system/etc/calib.cfg \
    ro.qcom.ad.sensortype=2 \
    sdm.perf_hint_window=50 \
    vendor.display.enable_default_color_mode=1

# Displayfeature
#PRODUCT_PROPERTY_OVERRIDES += \
    ro.eyecare.brightness.threshold=7 \
    ro.eyecare.brightness.level=2 \
    ro.sys.display.support=63 \
    sys.displayfeature_hidl=true

# DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.dpm.feature=1 \
    persist.vendor.dpm.nsrm.bkg.evt=3955

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.fingerprint=goodix

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.gralloc.enable_fb_ubwc=1 \
    debug.sf.enable_hwc_vds=1 \
    debug.sf.hw=1 \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    ro.opengles.version=196610 \
    ro.sf.lcd_density=480 \
    sdm.perf_hint_window=50

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=4096

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mm.enable.qcom_parser=1047551 \
    mm.enable.smoothstreaming=true \
    mmp.enable.3g2=true \
    persist.mm.enable.prefetch=true

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nfc.port=I2C \
    ro.se.type=HCE,UICC \
    persist.nfc.smartcard.config=SIM1,eSE1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.nfc_nci=nqx.default \
    ro.sys.fw.bg_apps_limit=60 \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.qti.core_ctl_min_cpu=2 \
    ro.vendor.qti.core_ctl_max_cpu=4

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so \
    ril.subscription.types=RUIM \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.default_cdma_sub=0 \
    ro.telephony.default_network=22,22 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.dynamic_sar=false \
    persist.radio.multisim.config=dsds \
    persist.radio.redir_party_num=1 \
    persist.radio.report_codec=1 \
    persist.radio.schd.cache=3500 \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3="" \
    persist.sys.labtest_flag=false \
    persist.vendor.qti.telephony.vt_cam_interface=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.rat_on=combine \
    persist.vendor.radio.redir_party_num=1 \
    persist.vendor.radio.report_codec=1 \
    persist.vendor.radio.sib16_support=1 \
    telephony.lteOnCdmaDevice=1

# Radio - Data/RMNet
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rmnet.data.enable=true \
    persist.data.wda.enable=true \
    persist.data.df.dl_mode=5 \
    persist.data.df.ul_mode=5 \
    persist.data.df.agg.dl_pkt=10 \
    persist.data.df.agg.dl_size=4096 \
    persist.data.df.mux_count=8 \
    persist.data.df.iwlan_mux=9 \
    persist.data.df.dev_name=rmnet_usb0

# Radio - IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.NO_STAPA=1 \
    persist.radio.VT_HYBRID_ENABLE=1

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.sensors.cfos=false \
    persist.sys.sensors.pug=false \
    persist.sys.sensors.spg=false \
    ro.vendor.sdk.sensors.gestures=false \
    ro.vendor.sensors.cmc=false \
    ro.vendor.sensors.dev_ori=false \
    ro.vendor.sensors.dpc=true \
    ro.vendor.sensors.facing=false \
    ro.vendor.sensors.iod=false \
    ro.vendor.sensors.mot_detect=true \
    ro.vendor.sensors.multishake=true \
    ro.vendor.sensors.pmd=false \
    ro.vendor.sensors.sta_detect=true \
    ro.vendor.sensors.taptap_gesture=true

# SSR
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ssr.enable_ramdumps=1 \
    persist.sys.ssr.restart_level=ALL_ENABLE

# Time
PRODUCT_PROPERTY_OVERRIDES += \
    persist.backup.ntpServer="0.pool.ntp.org" \
    persist.timed.enable=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wlan.vendor=qcom \
    wifi.interface=wlan0

# WFD
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0
