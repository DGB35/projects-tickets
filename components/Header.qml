import QtQuick 2.0

import "../imports" as ComponentsConstants
import "controls" as Controls

Rectangle
{
    id: header

    required property string title;
    color: ComponentsConstants.Constants.headerColor

    Controls.TextComponent
    {
        anchors.fill: parent
        id: name
        text: title

        font.bold: true
        font.pixelSize: 16

        horizontalAlignment: Text.Center
        verticalAlignment: Text.AlignVCenter
    }
}
