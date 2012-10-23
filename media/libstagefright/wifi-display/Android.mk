LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
        ANetworkSession.cpp             \
        Parameters.cpp                  \
        ParsedMessage.cpp               \
        sink/LinearRegression.cpp       \
        sink/RTPSink.cpp                \
        sink/TunnelRenderer.cpp         \
        sink/WifiDisplaySink.cpp        \
        source/Converter.cpp            \
        source/MediaPuller.cpp          \
        source/PlaybackSession.cpp      \
        source/RepeaterSource.cpp       \
        source/Sender.cpp               \
        source/TSPacketizer.cpp         \
        source/WifiDisplaySource.cpp    \

ifeq ($(OMAP_ENHANCEMENT), true)
LOCAL_SRC_FILES+= \
        ElementaryParser.cpp            \
        VideoParameters.cpp             \
        AudioParameters.cpp             \

endif

LOCAL_C_INCLUDES:= \
        $(TOP)/frameworks/av/media/libstagefright \
        $(TOP)/frameworks/native/include/media/openmax \
        $(TOP)/frameworks/av/media/libstagefright/mpeg2ts \

ifeq ($(OMAP_ENHANCEMENT), true)
LOCAL_C_INCLUDES+= \
        $(TOP)/hardware/ti/domx/omx_core/inc
endif

LOCAL_SHARED_LIBRARIES:= \
        libbinder                       \
        libcutils                       \
        libgui                          \
        libmedia                        \
        libstagefright                  \
        libstagefright_foundation       \
        libui                           \
        libutils                        \

LOCAL_MODULE:= libstagefright_wfd

LOCAL_MODULE_TAGS:= optional

include $(BUILD_SHARED_LIBRARY)

################################################################################

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
        wfd.cpp                 \

LOCAL_SHARED_LIBRARIES:= \
        libbinder                       \
        libgui                          \
        libmedia                        \
        libstagefright                  \
        libstagefright_foundation       \
        libstagefright_wfd              \
        libutils                        \

LOCAL_MODULE:= wfd

LOCAL_MODULE_TAGS := debug

include $(BUILD_EXECUTABLE)

################################################################################

include $(CLEAR_VARS)

ifeq ($(OMAP_ENHANCEMENT),true)
LOCAL_C_INCLUDES:= \
    $(DOMX_PATH)/omx_core/inc
endif

LOCAL_SRC_FILES:= \
        udptest.cpp                 \

LOCAL_SHARED_LIBRARIES:= \
        libbinder                       \
        libgui                          \
        libmedia                        \
        libstagefright                  \
        libstagefright_foundation       \
        libstagefright_wfd              \
        libutils                        \

LOCAL_MODULE:= udptest

LOCAL_MODULE_TAGS := debug

include $(BUILD_EXECUTABLE)
