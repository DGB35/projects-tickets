#include "project.h"


Project::Project(QString _name, QString _icon, int _id):
    name{ std::move(_name) }, icon{ std::move(_icon) }, id{_id}
{
}

QString Project::getName() const
{
    return name;
}

QString Project::getIcon() const
{
    return icon;
}

int Project::getId() const noexcept
{
    return id;
}
