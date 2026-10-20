import QtQuick
import QsDisp27
import "content/gauges"


Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "QsDisp27"

    Screen01 {
        id: mainScreen
    }
    
    FuelGauge {
        id: fuelGauges
        x: 284
        y: 380
    }

    SmallGauge {
        id: smallgauge
        x: 88
        y: 55
        unitLabel: "abc"
    }

}

