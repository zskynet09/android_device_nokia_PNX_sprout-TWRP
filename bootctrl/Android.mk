ifeq ($(AB_OTA_UPDATER),true)
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# HAL Shared library for the target. Used by libhardware.
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/gpt-utils/inc
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog libgptutils libcutils
LOCAL_HEADER_LIBRARIES := libhardware_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := bootctrl.sdm710
LOCAL_MODULE_OWNER := qti
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Static library for the target. Used by update_engine_sideload from recovery.
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/gpt-utils/inc
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog libgptutils libcutils
LOCAL_HEADER_LIBRARIES := libhardware_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := bootctrl.sdm710
include $(BUILD_STATIC_LIBRARY)

endif
