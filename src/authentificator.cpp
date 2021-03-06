#include "authentificator.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkReply>
#include <QJsonArray>
#include <QJsonValue>


Authentificator::Authentificator(QObject *parent) : QObject(parent),
    manager{ new QNetworkAccessManager(this) },
    token { }
{
}

Authentificator::~Authentificator()
{
}

void Authentificator::parseProjectsData(QNetworkReply* reply)
{
    if(reply->error() == QNetworkReply::NoError) {
        QJsonDocument jsonResponse = QJsonDocument::fromJson(reply->readAll());
        QJsonObject jsonObject = jsonResponse.object();
        QJsonArray jsonArray = jsonObject["projects"].toArray();

        QList<Project> projects;

        //Parsing JSON to QList<Project>
        for (const auto& value: jsonArray) {
            QJsonObject obj = value.toObject();
            Project project(obj["name"].toString(), obj["icon"].toString(), obj["id"].toInt());
            projects.append(project);
        }
        emit projectsDataRecieveSuccess(projects);
    }
    else {
        QString err = reply->errorString();
        qDebug() << err;
        emit projectsDataRecieveFailture();
    }
    reply->deleteLater();
}

void Authentificator::parseTicketsData(QNetworkReply *reply)
{
    if(reply->error() == QNetworkReply::NoError) {
        QJsonDocument jsonResponse = QJsonDocument::fromJson(reply->readAll());
        QJsonObject jsonObject = jsonResponse.object();
        QJsonArray jsonArray = jsonObject["tickets"].toArray();

        QList<Ticket> tickets;

        //Parsing JSON to QList<Ticket>
        for (const auto& value: jsonArray) {
            QJsonObject obj = value.toObject();
            Ticket ticket(obj["name"].toString(), obj["description"].toString(), obj["priority"].toInt(), obj["id"].toInt());
            tickets.append(ticket);
        }
        emit ticketsDataRecieveSuccess(tickets);
    }
    else {
        QString err = reply->errorString();
        qDebug() << err;
        emit ticketsDataRecieveFailture();
    }
    reply->deleteLater();
}

QObject* Authentificator::autentificationSingletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    return &getInstance();
}

Authentificator &Authentificator::getInstance()
{
    static Authentificator instance;
    return instance;
}

void Authentificator::requestProjectsData()
{
    const QUrl url(dataRequestLink);
    QNetworkRequest request(url);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader(rawHeaderKey.toUtf8(), token.toUtf8());

    QNetworkReply *reply = manager.get()->get(request);

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [this, reply]() {
        parseProjectsData(reply);
    });
}

void Authentificator::requestTiketsData(int id)
{
    const QUrl url((ticketRequestLink + QString::number(id) + "/"));
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader(rawHeaderKey.toUtf8(), token.toUtf8());

    QNetworkReply *reply = manager->get(request);

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [this, reply]() {
       parseTicketsData(reply);
    });
}

void Authentificator::requestToken(const QString& login, const QString& password)
{
    const QUrl url(tokenRequestLink);

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject obj;
    obj["login"] = login;
    obj["password"] = password;
    QJsonDocument doc(obj);
    QByteArray data = doc.toJson();

    QNetworkReply *reply = manager.get()->post(request, data);
    reply->ignoreSslErrors();

    QObject::connect(reply, &QNetworkReply::sslErrors, [reply](const auto& errorList) {
           //for (auto& sslError : errorList) qDebug() << sslError;
           reply->ignoreSslErrors();
        });

    QObject::connect(reply, &QNetworkReply::finished, [=]() {
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
