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
    id: autorizationWindow
    anchors.fill: parent
    color: "#181818"

    Rectangle{
        id:  bodyRectangle
        width: parent.width * 0.8
        height: labelSignIn.contentHeight+labelSignInInfo.contentHeight+textFieldLogin.height+textFieldPassword.height+
                +buttonOK.height+dp(205)
        color: "#181818"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: dp(70)
        Text {
            id: labelSignIn
            text: qsTr("Вход")
            color: "#ffffff"
            anchors.top: parent.top
            anchors.topMargin: dp(25)
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.15
            font.pointSize: 30
        }
        Text{
            id: labelSignInInfo
            text: qsTr("Для входа в messager используйте: логин Messager, E-mail адрес или номер телефона.")
            anchors.top: labelSignIn.bottom
            anchors.topMargin: dp(5)
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.15
            color: "#ffffff"
            font.pointSize: 10
            width: parent.width * 0.7
            wrapMode: Text.WordWrap
        }
        TextField{
            id: textFieldLogin
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: labelSignInInfo.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Логин/E-mail/номер телефона")
            validator: RegExpValidator{regExp: /[0-9A-z@.+]+/}
            color: "#ffffff"
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
            id: textFieldPassword
            implicitHeight: dp(50)
            implicitWidth: parent.width * 0.7
            anchors.top: textFieldLogin.bottom
            anchors.topMargin: dp(50)
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Пароль")
            //validator: RegExpValidator{regExp: /[0-9a-z]+/}
            echoMode: TextInput.Password
            color: "#ffffff"
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
        Rectangle{
            id: buttonOK
            width: dp(60)
            height: dp(60)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textFieldPassword.bottom
            anchors.topMargin: dp(50)
            color: "#740094"
            radius: height/2
            Image{
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                source: "images/arrow-white.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    animationButtonOk.start()
                    if(textFieldLogin.text == "" || textFieldPassword.text == "")
                        messageError.open()
                    else if(!textFieldLogin.text == "" && !textFieldPassword.text == ""){
                        console.log("Component.onCompleted")
                        ClientEngen.connectToHost("192.168.0.102", 9999)
                        //mainStack.replace(generalPage)
                        //backgroundRectangle.visible = true
                        //animationLoading.start()
                    }
                }
            }
        }
    }
    Connections{
        target: ClientEngen
        onAuthResualt:{
            var isConnect = isSuccess
            if (isSuccess) {
                mainStack.replace(generalPage)
            } else {
                //TODO SHOW AUTH ERROR MESSAGE
            }

            console.log(isConnect)
        }
        onConnectedDone:{
            // auth
            ClientEngen.auth(textFieldLogin.text, textFieldPassword.text)
            backgroundRectangle.visible = true
            animationLoading.start()
            console.log("ConnectToServerDone")
        }
    }
    Rectangle{
        id: registrationNewUserRectangle
        height: dp(30)
        width: parent.width*0.7
        color: "#00474747"
        anchors.bottom: restorePasswordRectangle.top
        anchors.bottomMargin: dp(10)
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: qsTr("Зарегистрироваться?")
            anchors.centerIn: parent
            color: "#808080"
            font.pointSize: 13
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainStack.push(registrationPage)
                console.log("REGISTRATION")
            }
        }
    }
    Rectangle{
        id: restorePasswordRectangle
        height: dp(30)
        width: parent.width*0.7
        color: "#00474747"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(20)
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            text: qsTr("Восстановление пароля")
            anchors.centerIn: parent
            color: "#808080"
            font.pointSize: 13
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                mainStack.push(restorePasswordPage)
                console.log("RESTORE PASSWORD")
            }
        }
    }
    Rectangle{
        id: backgroundRectangle
        anchors.fill: parent
        color: "#000000"
        opacity: 0
        visible: false
        AnimatedImage{
            visible: parent.visible
            opacity: parent.opacity
            anchors.centerIn: parent
            width: parent.width * 0.7
            height: width
            source: "images/loading-animated.gif"
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.children[0].bottom
            text: qsTr("Loading...")
            color: "#ffffff"
            font.pointSize: 30
        }
        MouseArea{
            anchors.fill: parent
            onClicked: mainStack.replace(generalPage)
        }
    }
    MessageDialog{
        id: messageError
        title: qsTr("Ошибка")
        text: qsTr("Заполните все поля!")
        visible: false
    }
    SequentialAnimation{
        id: animationButtonOk
        PropertyAnimation{target: buttonOK; property: "rotation"; from: 0; to:360; duration: 200}
    }
    SequentialAnimation{
        id: animationLoading
        PropertyAnimation{target: backgroundRectangle; property: "opacity"; from: 0; to: 1; duration: 400}
    }
}
