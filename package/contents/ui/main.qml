import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

PlasmoidItem {
    id: root

    property color colorPlasmoid: Plasmoid.configuration.colorHex

    // Transparent background
    Plasmoid.backgroundHints: "NoBackground"

    // Font loaders with more robust path handling
    FontLoader {
        id: poppinsThin
        source: Qt.resolvedUrl("../fonts/poppins-thin.ttf")
    }

    FontLoader {
        id: poppinsRegular
        source: Qt.resolvedUrl("../fonts/poppins-regular.ttf")
    }

    // Centered layout container
    Item {
        id: wrapper
        anchors.fill: parent
        anchors.margins: 10

        // Vertical layout for better alignment
        ColumnLayout {
            anchors.centerIn: parent
            width: parent.width
            spacing: 5

            // Date Text (small, centered)
            Text {
                id: dateText
                Layout.alignment: Qt.AlignHCenter
                font.family: poppinsThin.name
                font.pixelSize: root.height * 0.1
                text: Qt.formatDateTime(new Date(), Plasmoid.configuration.dateFormat || "ddd d MMM").toLowerCase()
                color: colorPlasmoid
                horizontalAlignment: Text.AlignHCenter
            }

            // Time Text (large, centered)
            Text {
                id: timeText
                Layout.alignment: Qt.AlignHCenter
                font.family: poppinsRegular.name
                font.pixelSize: root.height * 0.4
                text: Qt.formatDateTime(new Date(), Plasmoid.configuration.timeFormat || "HH:mm")
                color: colorPlasmoid
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    // Timer for updating time and date
    Timer {
        interval: 60000
        running: true
        repeat: true
        onTriggered: {
            var now = new Date()
            dateText.text = Qt.formatDateTime(now, Plasmoid.configuration.dateFormat || "ddd d MMM").toLowerCase()
            timeText.text = Qt.formatDateTime(now, Plasmoid.configuration.timeFormat || "HH:mm")
        }
    }
}
