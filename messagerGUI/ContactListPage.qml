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
import QtGraphicalEffects 1.0

Rectangle{
    id: contactWindow
    color: "#181818"
    ListView {
        id: listview
        anchors.fill: parent
        width: parent.width
        height: parent.height - tabBar.height
        ScrollIndicator.vertical: ScrollIndicator{
            parent: parent

        }
        delegate: Item {
            id:item
            height: dp(60)
            anchors.left: parent.left
            anchors.right: parent.right
            Rectangle {
                id:itemRec
                anchors.fill: parent
                anchors.margins: dp(1)
                color: "#181818"
                Rectangle{
                    id: contactImgBackground
                    width: height
                    height: parent.height * 0.8
                    radius: height/2
                    color: "#c6c6c6"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: dp(20)
                }
                Image {
                    width: height
                    height: contactImgBackground.height*0.7
                    source: "images/no-avatar.png"
                    anchors.centerIn: contactImgBackground
                }
                Text {
                    id: listText
                    anchors.left: contactImgBackground.right
                    anchors.leftMargin: parent.height - listText.contentHeight
                    anchors.verticalCenter: parent.verticalCenter
                    text: userName
                    //styleColor: "#9000f7"
                    font.pixelSize: 20
                    color: "white"
                    //renderType: Text.NativeRendering
                    //horizontalAlignment: Text.AlignHCenter
                    //verticalAlignment: Text.AlignVCenter
                }
                Image{
                    id: messageImg
                    anchors.right: parent.right
                    anchors.rightMargin: dp(25)
                    anchors.verticalCenter: parent.verticalCenter
                    source: "images/message.png"
                    width: height
                    height: parent.height*0.5
                    z: 2
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            mainStack.push(messagePage)
                            console.log("MESSAGE
line: " + index)
                        }
                    }
                }
                Image{
                    anchors.right: messageImg.left
                    anchors.rightMargin: dp(30)
                    anchors.verticalCenter: parent.verticalCenter
                    source: "images/phone-512.png"
                    width: height
                    height: parent.height*0.5
                    z: 2
                    MouseArea{
                        anchors.fill: parent
                        onClicked: console.log("PHONE CALL
line: " + index)
                    }
                }
                MouseArea {
                    id: areaLoaderDevice
                    anchors.fill: parent
                    onClicked: {
                        //contactsModel.append({"items":"userName"})
                    }
                }
            }
            Rectangle{
                visible: (contactsModel.count<2)? false:true
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - dp(30)
                height: 1
                color: "#959595"
                anchors.top: parent.bottom
            }
        }
        model: contactsModel
    }

    ListModel{
        id: contactsModel
    }
    function addModel(){
        for(var i = 0; i < listAccount.length; i++)
            contactsModel.append({"userName": listAccount[i]})
    }
    Component.onCompleted: ClientEngen.loadAccountList()
    Connections{
        target: ClientEngen
        onAccountList:{
            listAccount = list
            console.log("ACCOUNT LIST QML: ", listAccount)
            addModel()
        }
    }
}
