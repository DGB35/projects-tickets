#include "projectmodel.h"
#include "authentificator.h"

ProjectModel::ProjectModel(QObject *parent): QAbstractListModel(parent)
{
    QObject::connect(&Authentificator::getInstance(), &Authentificator::projectsDataRecieveSuccess, this, &ProjectModel::appendItems);
}

void ProjectModel::appendItems(QList<Project> replyProjects)
{
    beginResetModel();

    if(!projects.isEmpty())
        projects.clear();

    projects = std::move(replyProjects);

    endResetModel();
}

int ProjectModel::rowCount(const QModelIndex &parent) const
{
    return projects.count();
}


QVariant ProjectModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
           return QVariant();

    switch (role) {
    case ProjectRoles::NameRole:
        return projects[index.row()].getName();
        break;

    case ProjectRoles::IconRole:
        return projects[index.row()].getIcon();
        break;

    case ProjectRoles::IdRole:
        return projects[index.row()].getId();
        break;

    default:
        return QVariant();
        break;
    }
}

QHash<int, QByteArray> ProjectModel::ProjectModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[IconRole] = "icon";
    roles[IdRole] = "id";
    return roles;
}


