#include "ticket.h"



Ticket::Ticket(QString _name, QString _description, int _priority, int _id):
    name {std::move(_name)}, description {std::move(_description)},
    priority {_priority}, id {_id}
{
}

QString Ticket::getName() const
{
    return name;
}

QString Ticket::getDescription() const
{
    return description;
}

int Ticket::getPriority() const noexcept
{
    return priority;
}

int Ticket::getId() const noexcept
{
    return id;
}
