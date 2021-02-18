#ifndef AUTHENTIFICATOR_H
#define AUTHENTIFICATOR_H

#include <QObject>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QQmlEngine>
#include <QJSEngine>

class Authentificator : public QObject
{
    Q_OBJECT
public:
    explicit Authentificator(QObject *parent = nullptr);

    Q_INVOKABLE void getToken(QString login, QString password);
    void requestProjectsData();
    Q_INVOKABLE void requestTiketsData(int id);
    Q_INVOKABLE QString getProjectsData();
    Q_INVOKABLE QString getTicketsData();
private:
    QNetworkAccessManager *manager;
    QString token;
    QString projectsData;
    QString ticketsData;
signals:
    void tokenRecieveSuccess();
    void tokenRecieveFailture();

    void projectsDataRecieveSuccess();
    void projectsDataRecieveFailture();

    void ticketsDataRecieveSuccess();
    void ticketsDataRecieveFailture();
};

static QObject *autentificationSingletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    Authentificator *singletonClass = new Authentificator();
    return singletonClass;
}
#endif // AUTHENTIFICATOR_H
