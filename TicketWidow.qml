import QtQuick 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "imports" as ComponentsConstants
import "components" as Components

Rectangle
{
    id: ticketWidow
    required property var ticket;

    signal close;
    color: ComponentsConstants.Constants.actionPanelColor

    Components.Header
    {
       id: header
       anchors.top: parent.anchors.top
       height: parent.height * ComponentsConstants.Constants.headerHeigth
       width: parent.width
       color: ComponentsConstants.Constants.menuPanelColor
       title: "Ticket edit"
       Rectangle
       {
           id: back
           width: parent.height
           height: parent.height
           color: "transparent"

           MouseArea {
               width: parent.width
               height: parent.height
               onClicked: close()
           }

           Image {
               id: backImage
               source: "images/left.png"
               width: parent.width
               height: parent.height
           }
       }

    }
    Components.CustomSplitView
    {
        id: splitView
        anchors.topMargin: header.height
        anchors.fill: parent

        Components.TicketValuesPanel
        {
            SplitView.preferredWidth: 300
            SplitView.minimumWidth: 75
            SplitView.maximumWidth: 350
        }

        Components.TicketEditPanel
        {
            id: ticketEditPanel
            SplitView.minimumWidth: 200
        }

    }


}
