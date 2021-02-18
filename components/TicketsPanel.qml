import QtQuick 2.3
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.3

import "../imports" as ComponentsConstants

import com.dgb.authentificator 1.0

Panel
{
    color: ComponentsConstants.Constants.ticketsPanelColor
    ListModel
    {
        id: ticketsModel
    }

    Connections {
        target: Authentificator
        function onTicketsDataRecieveSuccess() {
            loadTickets(Authentificator.getTicketsData())
        }
    }
    function loadTickets(data)
    {
        ticketsModel.clear()
        var result = JSON.parse(data)
        for (var i in result["tickets"]) {
            ticketsModel.append({
                                     "name" : result["tickets"][i].name,
                                     "description" : result["tickets"][i].description,
                                     "priority" : result["tickets"][i].priority,
                                     "id": result["tickets"][i].id
                                 });
        }
    }

    Component {
        id: ticketsDelegate
        Ticket{}
    }
    ListView {
        id:view

        anchors.fill: parent
        interactive: false

        model: ticketsModel
        delegate: ticketsDelegate
    }
}
