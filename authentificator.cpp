#include "authentificator.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkReply>

Authentificator::Authentificator(QObject *parent) : QObject(parent),
    manager{ new QNetworkAccessManager(this) },
    token { }
{
}

void Authentificator::requestProjectsData()
{
    const QUrl url(QStringLiteral
                   ("https://51.15.247.46:80/852983733:AAHMihiJcpmZBxyAuVkCdFs-NAdyQJgbtZQ/project/projects/"));
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader("authorization", token.toUtf8());

    QNetworkReply *reply = manager->get(request);

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [=]() mutable {
        if(reply->error() == QNetworkReply::NoError) {
            projectsData = QString::fromUtf8(reply->readAll());
            emit projectsDataRecieveSuccess();
        }
        else {
            QString err = reply->errorString();
            emit projectsDataRecieveFailture();
        }
        reply->deleteLater();
    });
}

void Authentificator::requestTiketsData(int id)
{
    const QUrl url(
                   ("https://51.15.247.46:80/852983733:AAHMihiJcpmZBxyAuVkCdFs-NAdyQJgbtZQ/project/tickets/" + QString::number(id)+ "/"));
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader("authorization", token.toUtf8());

    QNetworkReply *reply = manager->get(request);

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [=]() mutable {
        if(reply->error() == QNetworkReply::NoError) {
            ticketsData = QString::fromUtf8(reply->readAll());
            qDebug() << ticketsData;
            emit ticketsDataRecieveSuccess();
        }
        else {
            QString err = reply->errorString();
            emit ticketsDataRecieveFailture();
        }
        reply->deleteLater();
    });
}

QString Authentificator::getProjectsData()
{
    return projectsData;
}

QString Authentificator::getTicketsData()
{
    return ticketsData;
}

void Authentificator::getToken(QString login, QString password)
{
    const QUrl url(
                QStringLiteral("https://51.15.247.46:80/852983733:AAHMihiJcpmZBxyAuVkCdFs-NAdyQJgbtZQ/project/login/"));
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject obj;
    obj["login"] = login;
    obj["password"] = password;
    QJsonDocument doc(obj);
    QByteArray data = doc.toJson();

    QNetworkReply *reply = manager->post(request, data);
    reply->ignoreSslErrors();

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [=]() mutable {
        if(reply->error() == QNetworkReply::NoError){
            auto json = QJsonDocument::fromJson(reply->readAll());
            token = json["token"].toString();
            requestProjectsData();
            emit tokenRecieveSuccess();
        }
        else{
            QString err = reply->errorString();
            qDebug() << err;
            emit tokenRecieveFailture();
        }
        reply->deleteLater();
    });
}
