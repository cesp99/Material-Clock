import QtQuick 2.12
import QtQuick.Controls 2.15
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    property color colorPlasmoid: Plasmoid.configuration.colorHex
    Plasmoid.backgroundHints: "NoBackground"

    FontLoader {
        id: poppins
        source: "../fonts/Poppins-Regular.ttf"
    }

    FontLoader {
        id: poppins_thin
        source: "../fonts/Poppins-Thin.ttf"
    }

    // Layout container
    Column {
        id: wrapper
        width: root.width
        height: root.height
        anchors.centerIn: parent
        spacing: 5
        // Ensuring the column's height is correctly calculated
        height: Math.max(root.height * 0.4, 100)  // Minimum height of 100px or 40% of root

        // Date Text (small, centered)
        Text {
            id: dateText
            width: parent.width
            font.family: poppins_thin.name
            font.pixelSize: parent.height * 0.1
            text: Qt.formatDateTime(new Date(), "ddd d MMM")
            color: colorPlasmoid
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }

        // Time Text (large, centered)
        Text {
            id: timeText
            width: parent.width
            font.family: poppins.name
            font.pixelSize: parent.height * 0.4
            text: Qt.formatDateTime(new Date(), "HH:mm")
            color: colorPlasmoid
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: dateText.bottom
        }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true
        onTriggered: {
            dateText.text = Qt.formatDateTime(new Date(), "ddd d MMM")
            timeText.text = Qt.formatDateTime(new Date(), "HH:mm")
        }
    }
}
