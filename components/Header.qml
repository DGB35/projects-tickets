
import QtQuick 2.0

Rectangle
{
    id: header
    TextComponent
    {
        anchors.fill: parent
        id: name
        text: "All projects"

        font.bold: true
        font.pixelSize: 16

        horizontalAlignment: Text.Center
        verticalAlignment: Text.AlignVCenter
    }
}
