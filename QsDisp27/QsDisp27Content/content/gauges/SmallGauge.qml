import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Timeline 1.0

Item {
    id: main
    width: 300
    height: 300
    
    //global arc properties
    property int arcStart: -120 //start position
    property int arcEnd: 120    //end position
    property int lowZone: -90   //low zone, same as arcStart to hide
    property int highZone: 100   //high zone, same as arcEnd to hide

    //outside arc properties
    property int outsideSizeDiff: -10
    property int outsideWidth: 8
    
    //inside arc properties
    property int insideSizeDiff: -50  //size difference compared to outside arc
    property int insideWidth: 25

    //bar arc properties
    property int barSizeDiff: -15
    
    ArcItem {
        id: outsideArc

        anchors.centerIn: parent
        
        width: parent.width + outsideSizeDiff
        height: parent.height + outsideSizeDiff
        
        strokeWidth: outsideWidth
        
        begin: lowZone
        end: highZone
        
        strokeColor: "#000000"
        fillColor: "#00ffffff"
        
        ArcItem {
            id: lowArc
            
            width: parent.width
            height: parent.height
            
            strokeWidth: parent.strokeWidth
            
            begin: arcStart
            end: lowZone

            strokeColor: "#D22630"
        }
        
        ArcItem {
            id: highArc
            
            width: parent.width
            height: parent.height

            strokeWidth: parent.strokeWidth
            
            begin: highZone
            end: arcEnd

            strokeColor: "#D22630"
        }
    }
    
    ArcItem {
        id: insideArc
        
        anchors.centerIn: parent
        
        width: parent.width + insideSizeDiff + outsideSizeDiff
        height: parent.width + insideSizeDiff + outsideSizeDiff
        
        strokeWidth: insideWidth
        
        begin: arcStart
        end: arcEnd
        
        strokeColor: "#000000"
        fillColor: "#00ffffff"

        ArcItem {
            id: barArc

            anchors.centerIn: parent

            width: parent.width + barSizeDiff
            height: parent.height + barSizeDiff

            strokeWidth: parent.strokeWidth + barSizeDiff

            begin: arcStart
            end: -120

            strokeColor: "#F1EB9C"
            fillColor: "#00ffffff"
        }
    }

    Item {
        id: triangleBox

        width: 30
        height: 130

        anchors.horizontalCenter: parent.horizontalCenter
        y: (parent.height / 2) - height

        transformOrigin: Item.Bottom

        rotation: -120

        Shape {
            id: triangle

            width: 20
            height: 40

            anchors. horizontalCenter: parent.horizontalCenter
            y: 0

            ShapePath {
                fillColor: "#F1EB9C"
                strokeWidth: 3
                strokeColor: "#000000"
                startX: triangle.width / 2
                startY: 0
                PathLine { x: triangle.width; y: triangle.height }
                PathLine { x: 0; y: triangle.height }
                PathLine { x: triangle.width / 2; y: 0}
            }
        }
    }

    //FIX THIS IT IS NOT GOOD!!!!!
    //VERY SLOPPY AND UNORGANIZED!@!!!!!!!!!!!
    Text {
        id: readout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        text: timeline.currentFrame
        font.pixelSize: 75
        horizontalAlignment: Text.AlignHCenter
        font.family: "Share Tech Mono"

        font.letterSpacing: 0

    }



    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: triangleBox
            property: "rotation"
            Keyframe {
                value: 120
                frame: 1000
            }

            Keyframe {
                value: -120
                frame: 0
            }
        }

        KeyframeGroup {
            target: barArc
            property: "end"
            Keyframe {
                value: 120
                frame: 1000
            }

            Keyframe {
                value: -120
                frame: 0
            }
        }
    }



    /*Image {
        id: triangleOutline
        width: 30
        height: 35
        source: "../../images/triangleOutline.svg"

        sourceSize: Qt.size(width, height)

        ColorOverlay {
            anchors.fill: fill
            source: fill

        }

        Image {
            id: triangleFill
            width: parent.width
            height: parent.height
            source: "../../images/triangleFill.svg"

            sourceSize: Qt.size(width, height)
        }

    }*/


}
