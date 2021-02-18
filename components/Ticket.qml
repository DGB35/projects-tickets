import QtQuick 2.9
import QtQuick.Controls 2.0


import "../imports" as ComponentsConstants

Rectangle
{
    color: ComponentsConstants.Constants.ticketsPanelColor
    id: ticket
    property int id: id
    width: parent.width
    height: 60
    Column
    {
        TextComponent {
            id: title
            text: name
            font.pixelSize: 14
            font.bold: true
        }
        TextComponent {
            id: descr
            text: description
            font.pixelSize: 12
        }
        TextComponent {
            id: prior
            text: priority
            font.pixelSize: 12
        }
        Rectangle
        {
            width: parent.parent.width
            height: 1
            color: "white"
        }
    }

    Popup {
        id: popup
        Column
        {
            anchors.fill: parent
            TextEdit
            {
                id: edit
                text: descr.text
                font.pixelSize: 12
                width: parent.width
                Rectangle{
                    anchors.bottom: parent.bottom
                    height: 2
                    color: black
                }
            }
            Row
            {
                Button
                {
                    id: save
                    width: 50
                    height: 20
                    text: "Save"
                    onClicked: {
                        descr.text = edit.text
                        popup.close()
                    }
                }
                Button
                {
                    id: cancel
                    width: 50
                    height: 20
                    text: "Cancel"

                    onClicked: {
                        popup.close()
                    }
                }
            }
        }


        onClosed: edit.text = descr.text
        width: 350
        height: 200
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: popup.open()

    }
}
