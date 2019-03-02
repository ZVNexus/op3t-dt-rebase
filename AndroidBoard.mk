LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Copy additional target-specific files
#----------------------------------------------------------------------

#Create dsp directory
$(shell mkdir -p $(TARGET_OUT_VENDOR)/lib/dsp)

#----------------------------------------------------------------------
# Radio image
#----------------------------------------------------------------------
ifeq ($(ADD_RADIO_FILES), true)
radio_dir := $(LOCAL_PATH)/radio
RADIO_FILES := $(shell cd $(radio_dir) ; ls)
$(foreach f, $(RADIO_FILES), \
	$(call add-radio-file,radio/$(f)))
endif
