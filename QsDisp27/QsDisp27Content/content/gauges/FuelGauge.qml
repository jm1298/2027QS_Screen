import QtQuick 6.5
import QtQuick.Timeline 1.0

Rectangle {
    id: rectangle2
    width: 300
    height: 300
    color: "#00ffffff"
    property alias fuelLevelCurrentFrame: fuelLevel.currentFrame

    ArcItem {
        id: arc
        x: -50
        y: 0
        width: 250
        height: 250
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        strokeColor: "#0b0b0b"
        strokeWidth: 5
        anchors.horizontalCenter: parent.horizontalCenter
        end: 120
        begin: -90
        fillColor: "#00000000"

        ArcItem {
            id: arc1
            x: 0
            y: 0
            width: 218
            height: 218
            anchors.verticalCenter: parent.verticalCenter
            end: 120
            strokeWidth: 18
            strokeColor: "#0b0b0b"
            fillColor: "#00000000"
            begin: -120
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: item2
            width: 5
            height: 5
            anchors.verticalCenter: parent.verticalCenter
            rotation: -29
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: rectangle
                x: -128
                y: 3
                width: 20
                height: 3
                color: "#c51b00"
            }
        }





        Item {
            id: item3
            width: 5
            height: 5
            anchors.verticalCenter: parent.verticalCenter
            rotation: 29.8
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: rectangle1
                x: 114
                y: 0
                width: 20
                height: 3
                color: "#0b0b0bc51b00"
            }
        }

        ArcItem {
            id: arc2
            x: 0
            y: 0
            width: 210
            height: 210
            anchors.verticalCenter: parent.verticalCenter
            end: 100
            strokeWidth: 10
            strokeColor: "#c51b00"
            fillColor: "#00000000"
            begin: -120
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }



        Item {
            id: item1
            width: 10
            height: 10
            anchors.verticalCenter: parent.verticalCenter
            rotation: 210
            anchors.horizontalCenter: parent.horizontalCenter

            TriangleItem {
                id: triangle
                x: -101
                y: -9
                width: 10
                height: 30
                radius: 0
                strokeColor: "#c51b00"
                rotation: -90
                joinStyle: 1
                fillColor: "#c51b00"
                strokeWidth: 0
            }
        }



        Text {
            id: text1
            x: 83
            y: 61
            color: "#000000"
            text: fuelLevel.currentFrame
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: none.none
            anchors.verticalCenterOffset: -10
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.DemiBold
        }



        Text {
            id: text2
            x: 83
            y: 61
            opacity: 0.8
            color: "#494949"
            text: qsTr("%")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenterOffset: 1
            font.weight: Font.DemiBold
            anchors.verticalCenterOffset: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text3
            x: 20
            y: 185
            color: "#c51b00"
            text: qsTr("E")
            font.pixelSize: 20
            font.weight: Font.DemiBold
        }

        Text {
            id: text4
            x: 217
            y: 185
            color: "#0b0b0b"
            text: qsTr("F")
            font.pixelSize: 20
            font.weight: Font.DemiBold
        }


    }

    ArcItem {
        id: arc3
        x: -50
        y: 0
        width: 250
        height: 250
        anchors.verticalCenter: parent.verticalCenter
        strokeWidth: 5
        strokeColor: "#c51b00"
        fillColor: "#00000000"
        end: -90
        begin: -120
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: fuelIcon
            x: 94
            y: 163
            width: 62
            height: 53
            source: "../../images/FuelIcon.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Timeline {
        id: fuelLevel
        animations: [
            TimelineAnimation {
                id: fuelLevelTimeline
                running: false
                loops: 1
                duration: 1000
                to: 800
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 100
        enabled: true

        KeyframeGroup {
            target: arc2
            property: "end"
            Keyframe {
                value: -120
                frame: 0
            }

            Keyframe {
                value: -90
                frame: 15
            }

            Keyframe {
                value: 120
                frame: 100
            }
        }

        KeyframeGroup {
            target: item1
            property: "rotation"
            Keyframe {
                value: -29
                frame: 0
            }

            Keyframe {
                value: 1
                frame: 15
            }

            Keyframe {
                value: 210
                frame: 100
            }
        }

        KeyframeGroup {
            target: arc2
            property: "strokeColor"

            Keyframe {
                value: "#c51b00"
                frame: 0
            }

            Keyframe {
                value: "#1960cc"
                frame: 16
            }

            Keyframe {
                value: "#c51b00"
                frame: 15
            }
        }
    }
}
