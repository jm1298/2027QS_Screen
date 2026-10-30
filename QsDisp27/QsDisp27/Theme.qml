pragma Singleton
import QtQuick

QtObject {
    id: theme

    property bool isDarkMode: false

    //Dynamic Colors                             true (dark) : false (light)
    //gauge colors
    property color backgroundColor: isDarkMode ? "#c2c2c2" : "#000000"
    property color highlightColor: isDarkMode ? "#3a3838" : "#dddddd"
    property color lowColor: isDarkMode ? "#007FFF" : "#007FFF"
    property color highColor: isDarkMode ? "#D22630" : "#D22630"

    //ui colors
    property color boxColor: isDarkMode ? "#0C2340" : "#CBD3EB"
    property color boxOutline: isDarkMode ? "#7C878E" : "#000000"


    //Static Colors
    property color warningRed:      "#FF3333"
    property color indicatorGreen:  "#00FF66"
}