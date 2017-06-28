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
    width: parent.width * 0.8
    height: width * 0.8
    color: "white"
    anchors.horizontalCenter: parent.horizontalCenter
    Image {
        id: acceptCallImg
        source: "images/phone-flat.png"
        width: dp(40)
        height: width
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: dp(20)
        anchors.bottomMargin: dp(20)
    }
}
