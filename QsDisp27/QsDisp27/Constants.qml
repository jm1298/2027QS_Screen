pragma Singleton
import QtQuick
import QtQuick.Studio.Application

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    readonly property color backgroundColor: "#EAEAEA"


    property StudioApplication application: StudioApplication {
        fontPath: Qt.resolvedUrl("../QsDisp27Content/" + relativeFontDirectory)
    }

    property FontLoader gaugeFont: FontLoader {
            // Adjust the ../ based on where your Constants.qml is relative to assets
            source: "../../QsDisp27Content/fonts/carles-wright.bold.otf"
        }
}
