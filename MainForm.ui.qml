import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    width: 640
    height: 480

    property alias mouseArea: mouseArea

    ListView {
        id: angleList
        x: 456
        width: 151
        anchors.top: parent.top
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        model: angleStorage
        delegate: Item {
            x: 5
            width: 80
            height: 22
            Row {
                id: row1
                spacing: 10
                Text {
                    text: value
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.right: angleList.left
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        z: 3
        property alias blueItem: blueItem
        property alias redItem: redItem

        ImageItem {
            id: blueItem
            sourceUri: "ballon_blue.png"
            r: 200
            phi: Math.PI/4
        }

        ImageItem {
            id: redItem
            sourceUri: "ballon_red.png"
            r: 100
            phi: -Math.PI/4
        }
    }

    Rectangle {
        id: mouseAreaBackground
        anchors.right: angleList.left
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        color: "black"
        z: 1
    }

}
