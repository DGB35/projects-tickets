#ifndef AUTHENTIFICATOR_H
#define AUTHENTIFICATOR_H

#include <QObject>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QQmlEngine>
#include <QJSEngine>

#include "project.h"
#include "ticket.h"
#include "loginData.h"

class Authentificator : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Authentificator)
public:

    static QObject* autentificationSingletonProvider(QQmlEngine*, QJSEngine*);
    static Authentificator& getInstance();

    Q_INVOKABLE void requestToken(const QString& login, const QString& password);

    Q_INVOKABLE void requestTiketsData(int id);
                void requestProjectsData();

                QList<Project> getProjectsList() const;
                QList<Ticket> getTicketsList()   const;
private:
    explicit Authentificator(QObject *parent = nullptr);
    virtual ~Authentificator();
private:
    std::unique_ptr<QNetworkAccessManager> manager;
    QString token;

    //TODO: Remove projects&tickets
    QList<Project> projects;
    QList<Ticket> tickets;

    void parseProjectsData(QNetworkReply* reply);
    void parseTicketsData(QNetworkReply* reply);

signals:
    void tokenRecieveSuccess();
    void tokenRecieveFailture();

    void projectsDataRecieveSuccess();
    void projectsDataRecieveFailture();

    void ticketsDataRecieveSuccess();
    void ticketsDataRecieveFailture();
};



#endif // AUTHENTIFICATOR_H
