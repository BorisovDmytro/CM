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
    Rectangle{
        id: header
        width: parent.width
        height: dp(50)
        anchors.top: parent.top
        anchors.left: parent.left
        color: "#000000"
        z: 2
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
            text: qsTr("UserName")
            color: "#f9f9f9"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: buttonBack.right
            anchors.leftMargin: dp(10)
            font.pointSize: 15
        }
        Rectangle{
            id: contactImgBackground
            width: height
            height: parent.height * 0.8
            radius: height/2
            color: "#c6c6c6"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: dp(20)
            Image {
                width: height
                height: contactImgBackground.height*0.7
                source: "images/no-avatar.png"
                anchors.centerIn: contactImgBackground
            }
        }
    }
    Image {
        id: backgroundMessage
        anchors.top: header.bottom
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "images/messageBackground.jpg"
    }
    Rectangle{
        id: backgroundTextInput
        anchors.bottom: parent.bottom
        width: parent.width
        height: dp(60)
        color: "white"
    }
    Flickable{
        width: parent.width-dp(60)
        height: dp(60)
        anchors.left:backgroundTextInput.left
        anchors.leftMargin: dp(10)
        anchors.verticalCenter: backgroundTextInput.verticalCenter
        contentHeight: textInputMessage.contentHeight
        clip: true
        TextInput {
            id: textInputMessage
            anchors.centerIn: parent
            anchors.fill: parent
            cursorVisible: false
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.pointSize: 12
            focus: true
            //placeholderText: qsTr("Введите текст...")

        }
    }
}
