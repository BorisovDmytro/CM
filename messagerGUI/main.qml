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

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 478
    height: 850
    title: qsTr("Messager")

    StackView{
        id: mainStack
        anchors.fill: parent
        initialItem: autorizationPage
        Component{
            id: autorizationPage
            AutorizationPage{}
        }
        Component{
            id: generalPage
            GeneralPage{}
        }
        Component{
            id: registrationPage
            RegistrationPage{}
        }
        Component{
            id: restorePasswordPage
            RestorePasswordPage{}
        }
        Component{
            id: messagePage
            MessagePage{}
        }
    }
    //IncomingCallPage{height: width*0.4}

    Connections{
        target: ClientEngen
        onNewTextMessage:{
            console.log("New message:", recipient, autor, message, date, time)
        }
    }

    readonly property int dpi: Screen.pixelDensity * 25.4
    function dp(x){ return (dpi < 160) ? x : x*(dpi/160); }
    readonly property string windowOrientation:{if(mainWindow.width < mainWindow.height) return "portrait"; else return "landscape"}

    property variant listAccount: []

}
