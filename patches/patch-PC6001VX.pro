$NetBSD$

- use pkgconfig paths

--- PC6001VX.pro.orig	2016-08-27 12:19:26.000000000 +0000
+++ PC6001VX.pro
@@ -56,8 +56,16 @@ DEFINES += NOJOYSTICK NOOPENGL NOMONITOR
 #Configuration for X11(XCB)
 DEFINES += USE_X11
 QT += x11extras
-LIBS += -lX11
+QMAKE_CXXFLAGS += $$system(pkg-config --cflags x11)
+LIBS += $$system(pkg-config --libs x11)
 }
+} else {
+#!linux
+#Configuration for X11(XCB)
+DEFINES += USE_X11
+QT += x11extras
+QMAKE_CXXFLAGS += $$system(pkg-config --cflags x11)
+LIBS += $$system(pkg-config --libs x11)
 }
 
 #Configuration for Windows
@@ -90,7 +98,8 @@ SOURCES += \
 }
 !contains(DEFINES, NOAVI) {
 DEFINES += __STDC_CONSTANT_MACROS __STDC_FORMAT_MACROS
-LIBS += -lavformat -lavcodec -lswscale -lavutil -lswresample
+QMAKE_CXXFLAGS += $$system(pkg-config --cflags libavformat libavcodec libswscale libavutil libswresample)
+LIBS += $$system(pkg-config --libs libavformat libavcodec libswscale libavutil libswresample)
 win32:LIBS += -lvorbisenc -lvorbis -logg -lvpx
 }
 
