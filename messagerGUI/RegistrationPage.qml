import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Extras 1.4
import QtQml 2.2

Rectangle{
    id: registrationRectangle
    anchors.fill: parent
    Rectangle{
        id: header
        width: parent.width
        height: dp(50)
        anchors.top: parent.top
        anchors.left: parent.left
        color: "#00aa96"
        Rectangle{
            id: buttonBack
            height: parent.height
            width: height
            color: "#00222222"
            Image{
                anchors.centerIn: parent
                width: parent.width*0.8
                height: width
                source: "images/back.png"
                //color"#dedede"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: mainStack.pop()
            }
        }
        Text{
            text: qsTr("Регистрация")
            color: "#f9f9f9"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: buttonBack.right
            anchors.leftMargin: dp(10)
            font.pointSize: 15
        }
    }
    Text {
        id: labelSignIn
        text: qsTr("Регистрация")
        color: "#1e1e1e"
        anchors.top: header.bottom
        anchors.topMargin: dp(25)
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15
        font.pointSize: 30
    }
    Text{
        id: labelSignInInfo
        text: qsTr("Для регистрации в messager заполните все поля, ниже.")
        anchors.top: labelSignIn.bottom
        anchors.topMargin: dp(5)
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15
        color: "#2d2d2d"
        font.pointSize: 10
        width: parent.width * 0.7
        wrapMode: Text.WordWrap
    }
    Flickable{
        id: flickable
        anchors.top: labelSignInInfo.bottom
        anchors.topMargin: dp(20)
        width: parent.width
        height: parent.height-(dp(100)+labelSignIn.contentHeight+labelSignInInfo.contentHeight)
        contentHeight: dp(700)
        clip: true
        ScrollIndicator.vertical: ScrollIndicator{
            parent: flickable.parent
            anchors.top: flickable.top
            anchors.bottom: flickable.bottom
            anchors.right: flickable.right
        }
        TextField{
            id: textFieldName
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: labelSignInInfo.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Имя")
            validator: RegExpValidator{regExp: /[0-9A-zА-я]+/}
            color: "#000000"
            font.pointSize: 13
            background: Rectangle{
                color: "#00000000"
            }
            Rectangle{
                anchors.top: textFieldName.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#000000"
                width: textFieldLogin.width
                height: dp(1)
            }
        }
        TextField{
            id: textFieldLogin
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: textFieldName.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Логин")
            validator: RegExpValidator{regExp: /[0-9A-z]+/}
            color: "#000000"
            font.pointSize: 13
            background: Rectangle{
                color: "#00000000"
            }
            Rectangle{
                anchors.top: textFieldLogin.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#000000"
                width: textFieldLogin.width
                height: dp(1)
            }
        }
        TextField{
            id: textFieldEmail
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: textFieldLogin.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("E-mail")
            validator: RegExpValidator{regExp: /^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$/}
            color: "#000000"
            font.pointSize: 13
            background: Rectangle{
                color: "#00000000"
            }
            Rectangle{
                anchors.top: textFieldEmail.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#000000"
                width: textFieldLogin.width
                height: dp(1)
            }
        }
        TextField{
            id: textFieldMobileNumber
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: textFieldEmail.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Номер телефона")
            validator: RegExpValidator{regExp: /[0-9+]+/}
            color: "#000000"
            font.pointSize: 13
            background: Rectangle{
                color: "#00000000"
            }
            Rectangle{
                anchors.top: textFieldMobileNumber.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#000000"
                width: textFieldLogin.width
                height: dp(1)
            }
        }
        TextField{
            id: textFieldPassword
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: textFieldMobileNumber.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Пароль")
            //validator: RegExpValidator{regExp: /[0-9a-z]+/}
            echoMode: TextInput.Password
            color: "#000000"
            font.pointSize: 13
            background: Rectangle{
                color: "#00000000"
            }
            Rectangle{
                anchors.top: textFieldPassword.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#000000"
                width: textFieldPassword.width
                height: dp(1)
            }
        }
        TextField{
            id: textFieldPasswordRepiad
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: textFieldPassword.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Пароль")
            //validator: RegExpValidator{regExp: /[0-9a-z]+/}
            echoMode: TextInput.Password
            color: "#000000"
            font.pointSize: 13
            background: Rectangle{
                color: "#00000000"
            }
            Rectangle{
                anchors.top: textFieldPasswordRepiad.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#000000"
                width: textFieldPassword.width
                height: dp(1)
            }
        }
        Rectangle{
            id: buttonOK
            width: dp(60)
            height: dp(60)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textFieldPasswordRepiad.bottom
            anchors.topMargin: dp(20)
            color: "#99ffd7"
            radius: height/2
            Image{
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                source: "images/arrow.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }
}
