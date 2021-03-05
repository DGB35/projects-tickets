#include "ticketmodel.h"
#include "authentificator.h"

TicketModel::TicketModel(QObject *parent): QAbstractListModel(parent)
{
    QObject::connect(&Authentificator::getInstance(), &Authentificator::ticketsDataRecieveSuccess, this, &TicketModel::appendItems);
}

void TicketModel::appendItems(QList<Ticket> responseTickets)
{
    beginResetModel();

    if(!tickets.isEmpty())
        tickets.clear();

    tickets = std::move(responseTickets);

    endResetModel();
}

QHash<int, QByteArray> TicketModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[DescriptionRole] = "description";
    roles[PriorityRole] = "priority";
    roles[IdRole] = "id";
    return roles;
}

int TicketModel::rowCount(const QModelIndex &parent) const
{
    return tickets.count();
}

QVariant TicketModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
           return QVariant();

    switch (role) {
    case TicketRoles::NameRole:
        return tickets[index.row()].getName();
        break;

    case TicketRoles::DescriptionRole:
        return tickets[index.row()].getDescription();
        break;

    case TicketRoles::PriorityRole:
        return tickets[index.row()].getPriority();
        break;

    case TicketRoles::IdRole:
        return tickets[index.row()].getId();
        break;

    default:
        return QVariant();
        break;
    }
}
