import QtQuick 2.3
import QtQuick.Layouts 1.3
import QtQuick.Window 2.15

import "imports" as ComponentsConstants
import "components" as Components
import "components/panels" as Panels

Panels.LoginPanel
{
    width: 200; height: 220
    x: parent.width / 2 - width / 2
    y: parent.height / 2 - height / 2 - parent.height * 0.08

    anchors.bottomMargin: parent.height * 0.1
}

