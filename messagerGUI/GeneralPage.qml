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
    id: generalWindow
    Rectangle{
        id: headRectangle
        width: parent.width
        height: dp(40)
        color: "#000000"
        z: 2
        Image{
            width: height
            height: parent.height*0.6
            anchors.right: parent.right
            anchors.rightMargin: dp(15)
            anchors.verticalCenter: parent.verticalCenter
            source: "images/search.png"
        }
        Text{
            anchors.centerIn: parent
            text: qsTr("Messager")
            font.pointSize: 12
            color: "white"
            font.bold: true


        }
        Rectangle{
            width: height/2
            height: parent.height*0.6
            anchors.left: parent.left
            anchors.leftMargin: dp(15)
            anchors.verticalCenter: parent.verticalCenter
            color: "#000000"
            Rectangle{width: height; height: parent.height/5; radius: height; anchors.horizontalCenter: parent.horizontalCenter; anchors.top: parent.top}
            Rectangle{width: height; height: parent.height/5; radius: height; anchors.centerIn: parent}
            Rectangle{width: height; height: parent.height/5; radius: height; anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom}
        }
    }
    color: "#0d6f00"
    TabBar {
        id: tabBar
        anchors.top: headRectangle.bottom
        width: parent.width
        currentIndex: swipeView.currentIndex
        background: Rectangle{color: "#000000"}
        font.pointSize: 12
        font.bold: true
        z: 2
        TabButton {
            id: tabButtonContacts
            height: parent.height
            background: Rectangle{height: tabBar.height; color: tabButtonContacts.checked? "#181818":"#000000"}
            Text{
                anchors.centerIn: parent
                font.bold: parent.checked? true:false
                font.pointSize: parent.checked? 12:10
                color: parent.checked? "white":"#afafaf"
                text:qsTr("Контакты")
            }
        }
        TabButton {
            id: tabButtonChats
            height: parent.height
            background: Rectangle{height: tabBar.height; color: tabButtonChats.checked? "#181818": "#000000"}
            Text{
                anchors.centerIn: parent
                font.bold: parent.checked? true:false
                font.pointSize: parent.checked? 12:10
                color: parent.checked? "white":"#afafaf"
                text:qsTr("Чаты")
            }
        }
        TabButton{
            id: tabButtonCall
            height: parent.height
            background: Rectangle{height: tabBar.height; color: tabButtonCall.checked? "#181818": "#000000"}
            Text{
                anchors.centerIn: parent
                font.bold: parent.checked? true:false
                font.pointSize: parent.checked? 12:10
                color: parent.checked? "white":"#afafaf"
                text:qsTr("Звонки")
            }
        }
    }
    SwipeView {
        id: swipeView
        width: parent.width
        height: parent.height - tabBar.height
        anchors.top: tabBar.bottom
        currentIndex: tabBar.currentIndex

        ContactListPage{}

        ChatListPage{
            Label{
                anchors.centerIn: parent
                text: "ChatList"
            }
        }
        CallListPage{
            Label{
                anchors.centerIn: parent
                text: "CallList"
            }
        }
    }
}
