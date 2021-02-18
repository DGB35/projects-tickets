#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "authentificator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(":/imports");

    qmlRegisterSingletonType<Authentificator>("com.dgb.authentificator", 1, 0, "Authentificator", autentificationSingletonProvider);


    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    return app.exec();
}
