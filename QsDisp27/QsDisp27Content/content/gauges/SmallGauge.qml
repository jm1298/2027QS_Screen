import QtQuick
import QtQuick.Shapes
import QtQuick.Timeline 1.0
import Qt5Compat.GraphicalEffects
import QsDisp27

Item {
    id: main
    width: 300
    height: 300

    /*########## COMMON PROPERTIES ##########*/
    //things that get changed often

    //basic gauge setup
    property int minVal: 0
    property int maxVal: 1000
    
    //global arc properties
    property int arcStart: -120 //start position
    property int arcEnd: 120    //end position 

    property int lowZone: 100   //low zone, same as minVal to hide
    property int highZone: 900   //high zone, same as maxVal to hide

    //label & icon properties
    property string unitLabel: "%"
    property int labelSize: 45
    property real unitScalar: 0.1
    property string symbolPath: "../../images/fuelLevel.png"

    //colors
    property color backgroundColor: Theme.backgroundColor//"#000000"     //color for all background objects (usually black)
    property color highlightColor: Theme.highlightColor//"#FFFFFF"   //background for highlights on gauge (grey)
    property color lowColor: Theme.lowColor //"#007FFF"         //color for low area
    property color highColor: Theme.highColor //"#D22630"        //color for high area


    /*########## UNCOMMON PROPERTIES ##########*/
    //things that do not get changed often

    //calc'd angles for zones, do NOT set in parent
    //formula: setValue * (arc range) / (gauge range) - offset
    property int _calcLowZone: (lowZone * (arcEnd + (arcStart * -1)) / (maxVal - minVal)) - 120
    property int _calcHighZone: (highZone * (arcEnd + (arcStart * -1)) / (maxVal - minVal)) - 120

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
        
        begin: _calcLowZone
        end: _calcHighZone
        
        strokeColor: backgroundColor
        fillColor: "#00ffffff"
        
        ArcItem {
            id: lowArc
            
            width: parent.width
            height: parent.height
            fillColor: "#00ffffff"
            
            strokeWidth: parent.strokeWidth
            
            begin: arcStart
            end: _calcLowZone

            strokeColor: lowColor
        }
        
        ArcItem {
            id: highArc
            
            width: parent.width
            height: parent.height
            fillColor: "#00ffffff"

            strokeWidth: parent.strokeWidth
            
            begin: _calcHighZone
            end: arcEnd

            strokeColor: highColor
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
        
        strokeColor: backgroundColor
        fillColor: "#00ffffff"

        ArcItem {
            id: barArc

            anchors.centerIn: parent

            width: parent.width + barSizeDiff
            height: parent.height + barSizeDiff

            strokeWidth: parent.strokeWidth + barSizeDiff

            begin: arcStart
            end: -120

            strokeColor: highlightColor //D22630
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

            anchors.horizontalCenter: parent.horizontalCenter
            y: 0

            ShapePath {
                id: triangleShapePath
                fillColor: "#F1EB9C"
                strokeWidth: 3
                strokeColor: backgroundColor
                startX: triangle.width / 2
                startY: 0
                PathLine { x: triangle.width; y: triangle.height }
                PathLine { x: 0; y: triangle.height }
                PathLine { x: triangle.width / 2; y: 0}
            }
        }
    }

    Text {
        id: readout
        color: backgroundColor

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -8
        anchors.verticalCenter: parent.verticalCenter

        text: Math.round(timeline.currentFrame * unitScalar)

        font.pixelSize: 75
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.family: "Share Tech Mono"

        Text {
            id: iconLabel
            color: backgroundColor

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 50
            anchors.verticalCenter: parent.verticalCenter

            text: main.unitLabel

            font.pixelSize: labelSize
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            font.bold: false
            font.family: "Share Tech Mono"
        }
    }

    Image {
        id: logoIcon
        y: 160
        anchors.horizontalCenter: parent.horizontalCenter

        scale: 0.4

        source: main.symbolPath
        anchors.horizontalCenterOffset: 0

        ColorOverlay {
            anchors.fill: logoIcon
            source: logoIcon
            color: backgroundColor
        }
    }

    Timeline {
        id: timeline
        endFrame: 1000
        currentFrame: 0
        animations: [
            /*TimelineAnimation {
                id: timelineAnimation
                running: true
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }*/
        ]
        startFrame: 0
        enabled: true

        KeyframeGroup {
            target: triangleBox
            property: "rotation"
            Keyframe {
                value: 120
                frame: maxVal
            }

            Keyframe {
                value: -120
                frame: minVal
            }
        }

        KeyframeGroup {
            target: barArc
            property: "end"
            Keyframe {
                value: 120
                frame: maxVal
            }

            Keyframe {
                value: -120
                frame: minVal
            }
        }

        KeyframeGroup {
            target: barArc
            property: "strokeColor"
            Keyframe {
                value: lowColor
                frame: 0
            }

            Keyframe {
                value: lowColor
                frame: lowZone - 1
            }

            Keyframe {
                value: highlightColor
                frame: lowZone
            }

            Keyframe {
                value: highlightColor
                frame: highZone
            }

            Keyframe {
                value: highColor
                frame: highZone + 1
            }
        }

        KeyframeGroup {
            target: triangleShapePath
            property: "fillColor"
            Keyframe {
                value: lowColor
                frame: 0
            }

            Keyframe {
                value: lowColor
                frame: lowZone - 1
            }

            Keyframe {
                value: highlightColor
                frame: lowZone
            }

            Keyframe {
                value: highlightColor
                frame: highZone
            }

            Keyframe {
                value: highColor
                frame: highZone + 1
            }
        }
    }
}
