LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES := SAX.c entities.c encoding.c error.c \
parserInternals.c parser.c tree.c hash.c list.c xmlIO.c \
xmlmemory.c uri.c valid.c xlink.c HTMLparser.c HTMLtree.c \
debugXML.c xpath.c xpointer.c xinclude.c \
DOCBparser.c catalog.c globals.c threads.c c14n.c xmlstring.c \
buf.c xmlregexp.c xmlschemas.c xmlschemastypes.c xmlunicode.c \
xmlreader.c relaxng.c dict.c SAX2.c \
xmlwriter.c legacy.c chvalid.c pattern.c xmlsave.c xmlmodule.c \
schematron.c

LOCAL_C_INCLUDES := \
$(LOCAL_PATH)/include \
$(LOCAL_PATH)/include/libxml \
$(LOCAL_PATH)/../libiconv/include \
$(LOCAL_PATH)/../libiconv \
$(LOCAL_PATH)/../libiconv/libcharset \
$(LOCAL_PATH)/../libiconv/lib \
$(LOCAL_PATH)/../libiconv/libcharset/include
#$(warning $(LOCAL_C_INCLUDES) )
LOCAL_MODULE := libxml2x
LOCAL_CFLAGS += \
    -Wno-missing-field-initializers \
    -Wno-self-assign \
    -Wno-sign-compare \
    -Wno-tautological-pointer-compare
LOCAL_CFLAGS += -DLIBXML_THREAD_ENABLED=1

LOCAL_CPPFLAGS += -ffunction-sections -fdata-sections -Ofast -ftree-vectorize -DNDEBUG
LOCAL_CFLAGS += -ffunction-sections -fdata-sections -Ofast -ftree-vectorize -DNDEBUG
LOCAL_CLANG := true
#LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
LOCAL_STATIC_LIBRARIES += libicuuc libiconvx
include $(BUILD_STATIC_LIBRARY)