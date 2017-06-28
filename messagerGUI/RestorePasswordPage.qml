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
            text: qsTr("Восстановление пароля")
            color: "#f9f9f9"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: buttonBack.right
            anchors.leftMargin: dp(10)
            font.pointSize: 15
        }
    }
}
