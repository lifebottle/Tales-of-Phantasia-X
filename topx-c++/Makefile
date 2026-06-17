TARGET_LIB = julian-top.a
OBJS = src/text.o src/topx_debug_menu.o

#BUILD_PRX=1

INCDIR =
CFLAGS = -Os -G0 -Wall
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LIBDIR =
LDFLAGS =

PSPSDK=$(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak
