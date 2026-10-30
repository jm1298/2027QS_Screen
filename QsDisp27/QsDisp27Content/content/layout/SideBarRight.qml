import QtQuick
import QsDisp27

Item {
    id: main
    width: 250
    height: 1080-100+10

    Rectangle {
        id: mainRectangle
        width: parent.width
        height: parent.height

        color: Theme.boxColor


        border.color: Theme.boxOutline
        border.width: 10
        radius: 20

    }
}
