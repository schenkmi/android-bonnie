LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SDK_VERSION := 21
LOCAL_NDK_STL_VARIANT := gnustl_static
LOCAL_SRC_FILES:=	\
bonnie++.cpp bon_io.cpp bon_file.cpp bon_time.cpp semaphore.cpp \
 sync.cpp thread.cpp bon_suid.cpp duration.cpp rand.cpp util.cpp ipc_sysv.c

LOCAL_MODULE:= bonnie
LOCAL_CFLAGS += -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
LOCAL_CFLAGS +=		\
	-D__ARM__			\
	-DIS_ANDROID=1		\
	-fPIE				\
	-DSEMUN_IN_SEM_H -D__GNU__


LOCAL_LDFLAGS += -pie
APP_STL :=stlport_static

include $(BUILD_EXECUTABLE)
