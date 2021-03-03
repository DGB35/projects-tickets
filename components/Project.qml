import QtQuick 2.9
import QtQuick.Controls 2.0

import "../imports" as ComponentsConstants

Rectangle
{
    id: project

    width: parent.width
    height: ComponentsConstants.Constants.menuElementHeight
    color: "transparent"

    Row
    {
        anchors.fill: parent
        spacing: 10
        Image
        {
            horizontalAlignment: project.horizontalCenter
            id: image
            source: icon
            width: parent.height * 0.8
            height: parent.height * 0.8
        }

        Column
        {
            TextComponent
            {
                id: title
                text: name
                font.pixelSize: 13
                font.bold: true
            }

            TextComponent
            {
                id: description
                text: name
                font.pixelSize: 11
            }
        }

    }



}
