QT       += core gui qml quick network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    src/authentificator.cpp \
    src/main.cpp \
    src/project.cpp \
    src/projectmodel.cpp \
    src/ticket.cpp \
    src/ticketmodel.cpp

HEADERS += \
    src/authentificator.h \
    src/loginData.h \
    src/project.h \
    src/projectmodel.h \
    src/ticket.h \
    src/ticketmodel.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


DISTFILES += \
    .gitignore

RESOURCES += \
    qrc.qrc
