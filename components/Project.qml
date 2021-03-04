import QtQuick 2.9
import QtQuick.Controls 2.0

import "../imports" as ComponentsConstants
import "controls" as Controls

Rectangle
{
    id: project

    width: parent.width
    height: ComponentsConstants.Constants.menuElementHeight
    color: "transparent"

    Row
    {
        anchors.fill: parent
        anchors.margins: 3
        spacing: 10
        Image
        {
            horizontalAlignment: project.horizontalCenter
            id: image
            source: icon
            fillMode: Image.PreserveAspectFit
            width: parent.height * 0.8
            height: parent.height * 0.8
        }

        Column
        {
            Controls.TextComponent
            {
                id: title
                text: name
                font.pixelSize: 13
                font.bold: true
            }

            Controls.TextComponent
            {
                id: description
                text: name
                font.pixelSize: 11
            }
        }

    }



}
