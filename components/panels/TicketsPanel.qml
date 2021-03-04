import QtQuick 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.0

import "../../imports" as ComponentsConstants
import "../../components" as Components

import com.dgb.authentificator 1.0
import com.dgb.ticketModel 1.0

ActionPanel
{

    TicketModel
    {
        id: ticketsModel
    }

    Connections
    {
        target: Authentificator
        function onTicketsDataRecieveSuccess() {
            state = "Done"
        }
    }

    Component
    {
        id: ticketsDelegate
        Components.Ticket { }
    }

    ListView
    {
        id: view

        spacing: 15
        anchors.fill: parent
        anchors.margins: 10

        clip: true
        model: ticketsModel
        delegate: ticketsDelegate
    }
    BusyIndicator {
        id: busyIndicator
        x: parent.width / 2
        y: parent.height / 2 - parent.height * 0.1
        running: false
    }
    states:[
        State
        {
            name: "Loading"
            PropertyChanges
            {
                target: busyIndicator
                running: true
            }
        },
        State
        {
            name: "Done"
            PropertyChanges
            {
                target: busyIndicator
                running: false
            }
        }
    ]
    onStateChanged: {
        console.log(state);
    }
}
