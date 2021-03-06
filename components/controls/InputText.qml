import QtQuick 2.0
import QtQuick.Controls 2.15

import "../../imports" as ComponentsConstants

TextField
{
    leftPadding: 10
    topPadding: 6
    selectByMouse: true

    background: Rectangle
    {
        color: ComponentsConstants.Constants.inputFieldColor
        radius: 2
    }
    color: ComponentsConstants.Constants.textColor
    placeholderTextColor: ComponentsConstants.Constants.inputTextHintColor
}
