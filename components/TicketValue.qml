import QtQuick 2.9
import QtQuick.Controls 2.0

import "../imports" as ComponentsConstants
import "controls" as Controls

Rectangle
{
    id: ticketValue

    width: parent.width
    height: ComponentsConstants.Constants.menuElementHeight
    color: "transparent"

    Row
    {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 10
        Column
        {
            Controls.TextComponent
            {
                id: title
                text: name
                font.pixelSize: 13
                font.bold: true
            }
        }
    }



}
