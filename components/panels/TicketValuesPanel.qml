import QtQuick 2.0

import "../../imports" as ComponentsConstants
import "../../components"

MenuPanel
{
    ListModel
    {
        id: ticketValuesModel
        ListElement { name: "Name"}
        ListElement { name: "Description"}
        ListElement { name: "Priority"}
    }

    Component
    {
        id: ticketValuesDelegate
        TicketValue
        {
            MouseArea
            {
                id: ticketValueArea
                focus: true
                anchors.fill: parent
                onClicked: {
                    if (view.currentIndex !== model.index)
                    {
                        switch(model.index)
                        {
                        case 0:
                            ticketEditPanel.changeEditValue(ticket.name, model.index)
                            break
                        case 1:
                            ticketEditPanel.changeEditValue(ticket.description, model.index)
                            break
                        case 2:
                            ticketEditPanel.changeEditValue(ticket.priority, model.index)
                            break
                        }
                        view.currentIndex = model.index
                    }
                }
            }
        }
    }

    ListView
    {
        id: view
        anchors.fill: parent
        clip: true
        interactive: false

        currentIndex: 0
        Component.onCompleted: ticketEditPanel.changeEditValue(ticket.name)

        highlightMoveDuration: 0
        highlight: Rectangle
        {
            anchors { left:parent.left; right: parent.right }
            color: ComponentsConstants.Constants.elementSelectedColor
        }

        model: ticketValuesModel
        delegate: ticketValuesDelegate
    }
}

