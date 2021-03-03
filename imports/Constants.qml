pragma Singleton
import QtQuick 2.6

QtObject
{
    readonly property real elementsWidth: 180
    readonly property real elementsHeight: 30

    readonly property real menuElementHeight: 60

    readonly property string qImagePath: "../images/Q.png"

    readonly property color inputTextColor: "#8dadd6"
    readonly property color forgotPasswordColor: "#8dadd6"
    readonly property color forgotPasswordPressedColor: "#00aefe"

    readonly property color menuColor: "#4b7eb7"
    readonly property color loginButtonColor: "#2a609e"
    readonly property color loginButtonPressedColor: "#00376f"

    readonly property color actionPanelColor: "#0e1621"
    readonly property color menuPanelColor: "#17212b"

    readonly property color headerColor: "#17212b"

    readonly property color textColor: "#f5f5f5"
    readonly property color elementSelectedColor:"#2b5278"

    readonly property real  headerHeigth: 0.05
}
