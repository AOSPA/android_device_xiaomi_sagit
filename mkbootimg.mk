LOCAL_PATH := $(call my-dir)

## Use prebuilt kernel
INTERNAL_BOOTIMAGE_ARGS := \
	$(addprefix --second ,$(INSTALLED_2NDBOOTLOADER_TARGET)) \
	--kernel $(TARGET_PREBUILT_KERNEL)

ifneq ($(BOARD_BUILD_SYSTEM_ROOT_IMAGE),true)
INTERNAL_BOOTIMAGE_ARGS += --ramdisk $(INSTALLED_RAMDISK_TARGET)
endif

INTERNAL_BOOTIMAGE_FILES := $(filter-out --%,$(INTERNAL_BOOTIMAGE_ARGS))

INTERNAL_RECOVERYIMAGE_ARGS := \
	$(addprefix --second ,$(INSTALLED_2NDBOOTLOADER_TARGET)) \
	--kernel $(TARGET_PREBUILT_KERNEL) \
	--ramdisk $(recovery_ramdisk)

INTERNAL_BOARD_KERNEL_CMDLINE := $(strip $(BOARD_KERNEL_CMDLINE))
ifdef INTERNAL_BOARD_KERNEL_CMDLINE
	INTERNAL_BOOTIMAGE_ARGS += --cmdline "$(INTERNAL_BOARD_KERNEL_CMDLINE)"
	INTERNAL_RECOVERYIMAGE_ARGS += --cmdline "$(INTERNAL_BOARD_KERNEL_CMDLINE)"
endif

INTERNAL_BOARD_KERNEL_BASE := $(strip $(BOARD_KERNEL_BASE))
ifdef INTERNAL_BOARD_KERNEL_BASE
	INTERNAL_BOOTIMAGE_ARGS += --base $(INTERNAL_BOARD_KERNEL_BASE)
	INTERNAL_RECOVERYIMAGE_ARGS += --base $(INTERNAL_BOARD_KERNEL_BASE)
endif

INTERNAL_BOARD_KERNEL_PAGESIZE := $(strip $(BOARD_KERNEL_PAGESIZE))
ifdef INTERNAL_BOARD_KERNEL_PAGESIZE
	INTERNAL_BOOTIMAGE_ARGS += --pagesize $(INTERNAL_BOARD_KERNEL_PAGESIZE)
	INTERNAL_RECOVERYIMAGE_ARGS += --pagesize $(INTERNAL_BOARD_KERNEL_PAGESIZE)
endif

## Overload bootimg generation: Same as the original, using prebuilt kernel
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e "Made boot image: $@"

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTFS) $(MKBOOTIMG) $(MINIGZIP) $(RECOVERYIMAGE_EXTRA_DEPS) \
		$(INSTALLED_RAMDISK_TARGET) \
		$(INSTALLED_BOOTIMAGE_TARGET) \
		$(INTERNAL_RECOVERYIMAGE_FILES) \
		$(recovery_initrc) $(recovery_sepolicy) $(recovery_kernel) \
		$(INSTALLED_2NDBOOTLOADER_TARGET) \
		$(recovery_build_prop) $(recovery_resource_deps) \
		$(recovery_fstab) \
		$(RECOVERY_INSTALL_OTA_KEYS)
		$(call build-recoveryimage-target, $@)
	@echo -e "----- Making recovery image ------"
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e "Made recovery image: $@"
