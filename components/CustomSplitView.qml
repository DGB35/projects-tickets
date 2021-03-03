import QtQuick 2.3
import QtQuick.Controls 2.15

import "../imports" as ComponentsConstants

SplitView
{
    handle: Rectangle {
        implicitWidth: 4
        implicitHeight: 4
        color: ComponentsConstants.Constants.menuPanelColor
    }

}
