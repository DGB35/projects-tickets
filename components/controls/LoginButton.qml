import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

import "../../imports" as ComponentsConstants

Button
{
    id: submit
    contentItem: Text {
        text: "Login"
        font.bold: true
        color: ComponentsConstants.Constants.textColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        color: submit.down ? ComponentsConstants.Constants.loginButtonPressedColor : ComponentsConstants.Constants.loginButtonColor
        radius: 2
    }

    hoverEnabled: false
}
