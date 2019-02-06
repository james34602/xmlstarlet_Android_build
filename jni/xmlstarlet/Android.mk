LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := xmlstarlet
LOCAL_SRC_FILES := \
	c14n-usage.c \
	depyx-usage.c \
	edit-usage.c \
	elem-usage.c \
	escape-usage.c \
	format-usage.c \
	ls-usage.c \
	pyx-usage.c \
	select-usage.c \
	trans-usage.c \
	trans.c \
	unescape-usage.c \
	usage.c \
	validate-usage.c \
	xml.c \
	xml_C14N.c \
	xml_depyx.c \
	xml_edit.c \
	xml_elem.c \
	xml_escape.c \
	xml_format.c \
	xml_ls.c \
	xml_pyx.c \
	xml_select.c \
	xml_trans.c \
	xml_validate.c \
# terminator

LOCAL_C_INCLUDES += \
$(LOCAL_PATH)/../libxml2/include \
$(LOCAL_PATH)/../libxslt \
$(LOCAL_PATH)/../ \

LOCAL_STATIC_LIBRARIES += libicuuc libiconvx libxml2x libxslt libexslt
LOCAL_CPPFLAGS += -ffunction-sections -fdata-sections -Ofast -ftree-vectorize -DNDEBUG
LOCAL_CFLAGS += -ffunction-sections -fdata-sections -Ofast -ftree-vectorize -DNDEBUG
LOCAL_LDFLAGS += -Wl,--gc-sections,--exclude-libs,ALL -static
include $(BUILD_EXECUTABLE)