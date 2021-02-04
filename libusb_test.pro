QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        libusb/core.c \
        libusb/descriptor.c \
        libusb/hotplug.c \
        libusb/io.c \
        libusb/strerror.c \
        libusb/sync.c \
        main.cpp

HEADERS += \
    libusb/hotplug.h \
    libusb/libusb.h \
    libusb/libusbi.h \
    libusb/version.h \
    libusb/version_nano.h

INCLUDEPATH += \
    libusb \
    libusb/os

win32{
    SOURCES += \
    libusb/os/events_windows.c \
    libusb/os/threads_windows.c \
    libusb/os/windows_common.c \
    libusb/os/windows_usbdk.c \
    libusb/os/windows_winusb.c

    HEADERS += \
    libusb/os/events_windows.h \
    libusb/os/threads_windows.h \
    libusb/os/windows_common.h \
    libusb/os/windows_usbdk.h \
    libusb/os/windows_winusb.h

    RC_FILE += libusb/libusb-1.0.rc

    INCLUDEPATH += libusb/config/win
    HEADERS += libusb/config/win/config.h
}

unix{
    macx{
    }
    else{
        SOURCES += \
    #    os/linux_netlink.c        \
        libusb/os/linux_udev.c    \
        libusb/os/linux_usbfs.c   \

        HEADERS += \
        libusb/os/linux_usbfs.h   \
        libusb/config/linux/config.h

        INCLUDEPATH += libusb/config/linux
    }
    SOURCES += \
    libusb/os/events_posix.c  \
    libusb/os/threads_posix.c

    HEADERS += \
    libusb/os/events_posix.h  \
    libusb/os/threads_posix.h

    QMAKE_CFLAGS += \
#    -std=gnu11  -Wall -Wextra -Wshadow -Wunused -Wwrite-strings \
#    -Werror=format-security -Werror=implicit-function-declaration \
#    -Werror=implicit-int -Werror=init-self -Werror=missing-prototypes\
#    -Werror=strict-prototypes -Werror=undef -Werror=uninitialized \
    -fvisibility=hidden -lpthread

    QMAKE_CXXFLAGS += \
#    -std=gnu++11  -Wall -Wextra -Wshadow -Wunused -Wwrite-strings \
#    -Werror=format-security -Werror=implicit-function-declaration \
#    -Werror=implicit-int -Werror=init-self -Werror=missing-prototypes \
#    -Werror=strict-prototypes -Werror=undef -Werror=uninitialized \
#    -Wmissing-declarations
    -fvisibility=hidden -lpthread

    LIBS += -ludev -lpthread

}
