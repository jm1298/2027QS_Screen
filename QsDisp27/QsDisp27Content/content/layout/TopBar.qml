import QtQuick
import QsDisp27

Item {
    id: main
    width: 1920
    height: 100

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
