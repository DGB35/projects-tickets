import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants
import "components" as Components

StackView
{
    id: stackView
    anchors.fill: parent
    initialItem: loginComponent

    Component
    {
        id: loginComponent
        LoginWindow
        {
            onLoginCompleted: {
                stackView.replace(mainComponent)
            }
        }
    }

    Component
    {
        id: mainComponent
        MainWindow
        {
            id: mainWindow
        }
    }

    Component
    {
        id: ticketComponent
        TicketWidow
        {
            id: ticketWidow
            onClose: {
                stackView.pop(null)
            }
        }
    }
}

