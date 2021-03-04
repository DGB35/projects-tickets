import QtQuick 2.9
import QtQuick.Controls 2.0

import "../imports" as ComponentsConstants
import "controls" as Controls

Rectangle
{
    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width * 0.9
    height: ComponentsConstants.Constants.menuElementHeight

    border.color: ComponentsConstants.Constants.menuPanelColor
    border.width: 2
    radius: 10

    color: ComponentsConstants.Constants.actionPanelColor

    Column
    {
        anchors.fill: parent

        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 4
        clip: true

        Controls.TextComponent
        {
            id: title
            text: name
            font.pixelSize: 14
            font.bold: true
        }
        Controls.TextComponent
        {
            id: descr
            text: description
            font.pixelSize: 12
        }
        Controls.TextComponent
        {
            id: prior
            text: priority
            font.pixelSize: 12
        }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: stackView.push(ticketComponent.createObject(stackView, {ticket:{name, description, priority}}))
    }
}
