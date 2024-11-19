import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: configRoot

    // Property to store the selected color (hex code)
    property alias cfg_colorHex: colorhex.text

    signal configurationChanged

    // ColumnLayout for the UI structure
    ColumnLayout {
        spacing: units.smallSpacing * 2

        // RowLayout for color input field
        RowLayout {
            Label {
                text: i18n("Color")
                color: fgColor
            }
            TextField {
                id: colorhex
                width: 200
                text: cfg_colorHex  // Bind the text to the color
                onTextChanged: configurationChanged()  // Emit signal when color changes
            }
        }
    }
}
