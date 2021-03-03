import QtQuick 2.0
import QtQuick.Controls 2.5

import "../imports" as ComponentsConstants

ActionPanel
{

    property string editValue;
    property int ticketValue;

    function changeEditValue(value, index) {
        editValue = value
        ticketValue = index
    }

    Rectangle
    {
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.9
        color: "transparent"
        border.color: ComponentsConstants.Constants.menuPanelColor

        Column
        {
            anchors.fill: parent
            anchors.margins: 10
            TextEdit
            {
                id: edit
                text: editValue
                color: ComponentsConstants.Constants.textColor
                font.pixelSize: 12

                width: parent.width * 0.9

                selectByMouse: true
                wrapMode: Text.Wrap
            }

            Row
            {
                spacing: 10
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                Button
                {
                    id: save
                    width: ComponentsConstants.Constants.elementsWidth
                    height: ComponentsConstants.Constants.elementsHeight

                    background: Rectangle {
                        color: save.down ? ComponentsConstants.Constants.actionPanelColor : ComponentsConstants.Constants.menuPanelColor
                    }
                    contentItem: Text {
                        text: "Save"
                        horizontalAlignment: Text.Center
                        verticalAlignment: Text.AlignVCenter
                        color: ComponentsConstants.Constants.textColor
                    }

                    onClicked: {
                        //TODO: Fix bug with these 2 functions

                        //edit.text = edit.text.replace(/\n/g, " ")
                        //edit.text = edit.text.trim()

                        if(edit.text.length > 0)
                            switch(ticketValue)
                            {
                                case 0: ticket.name        = editValue = edit.text; break;
                                case 1: ticket.description = editValue = edit.text; break;
                                case 2: ticket.priority    = editValue = edit.text; break;
                            }


                        //*save data to the server*
                    }
                    hoverEnabled: false
                }
                Button
                {
                    id: cancel
                    width: ComponentsConstants.Constants.elementsWidth
                    height: ComponentsConstants.Constants.elementsHeight
                    background: Rectangle {
                        color: cancel.down ? ComponentsConstants.Constants.actionPanelColor : ComponentsConstants.Constants.menuPanelColor
                    }
                    contentItem: Text {
                        text: "Cancel"
                        horizontalAlignment: Text.Center
                        verticalAlignment: Text.AlignVCenter
                        color: ComponentsConstants.Constants.textColor
                    }
                    hoverEnabled: false
                }
            }
        }
        focus: true
    }
}
