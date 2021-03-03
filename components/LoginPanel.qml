import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import "../imports" as ComponentsConstants
import com.dgb.authentificator 1.0

Rectangle
{
    id: loginPanel
    signal loginCompleted()

    color: ComponentsConstants.Constants.menuColor

    ColumnLayout
    {
        spacing: 12

        Image
        {
            id: image

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 100
            Layout.preferredHeight: 50
            fillMode: Image.PreserveAspectFit
            source: ComponentsConstants.Constants.qImagePath
        }

        InputText
        {
            id: loginField

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            placeholderText: "<i>Login</i>"

            KeyNavigation.down: passwordField
            onAccepted: passwordField.focus = true
        }

        InputText
        {
            id: passwordField

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            echoMode: TextInput.Password
            placeholderText: "<i>Password</i>"

            KeyNavigation.down: loginButton
            onAccepted: loginButton.focus = true
        }

        LoginButton
        {
            id: loginButton

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: ComponentsConstants.Constants.elementsWidth + 2
            Layout.preferredHeight: ComponentsConstants.Constants.elementsHeight

            function activate() {
                Authentificator.requestToken(loginField.text, passwordField.text)
            }

            Keys.onReturnPressed: loginButton.activate()
            Keys.onEnterPressed: loginButton.activate()
            KeyNavigation.up: passwordField

            onClicked: loginButton.activate()

            Connections
            {
                target: Authentificator
                function onTokenRecieveSuccess() {
                    loginPanel.loginCompleted()
                }
                function onTokenRecieveFailture() {
                    errorText.visible = true
                }
            }
        }

        Text
        {
            id: forgotPassword

            Layout.alignment: Qt.AlignCenter
            text: "Forgot password?"
            color: ComponentsConstants.Constants.inputTextColor

            MouseArea
            {
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally("https://google.com")
                    forgotPassword.color = ComponentsConstants.Constants.forgotPasswordPressedColor
                }
                onCanceled: forgotPassword.color = ComponentsConstants.Constants.forgotPasswordColor
            }
        }

        Text
        {
            id: errorText

            Layout.alignment: Qt.AlignCenter
            visible: false
            text: "Wrong login or password"
            color: "red"
        }
    }
}
