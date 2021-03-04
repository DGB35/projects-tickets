pragma Singleton
import QtQuick 2.6

QtObject
{
    readonly property real elementsWidth: 200
    readonly property real elementsHeight: 30

    readonly property real menuElementHeight: 60

    readonly property string qImagePath: "../../images/Q.png"

    readonly property color inputFieldColor: "#17212b"//"#8dadd6"
    readonly property color inputTextHintColor: "#4f5b67"
    readonly property color forgotPasswordColor: "#f5f5f5"//"#8dadd6"
    readonly property color forgotPasswordPressedColor: "#3f4b67"

    readonly property color loginWindowColor: "#0e1621"//"#4b7eb7"
    readonly property color loginButtonColor: "#3865b9"
    readonly property color loginButtonPressedColor: "#0e1621"//"#00376f"

    readonly property color actionPanelColor: "#0e1621"
    readonly property color menuPanelColor: "#17212b"
    readonly property color headerColor: "#242f3d"

    readonly property color elementSelectedColor:"#2b5278"

    readonly property color textColor: "#f5f5f5"

    readonly property real  headerHeigth: 0.04
}
