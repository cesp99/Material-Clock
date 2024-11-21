import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: configRoot

    // Properties for configuration
    property alias cfg_colorHex: colorhex.text
    property alias cfg_dateFormat: dateFormatField.text
    property alias cfg_timeFormat: timeFormatField.text

    signal configurationChanged

    ColumnLayout {
        spacing: units.smallSpacing * 2

        // Color Selector
        ColumnLayout {
            Label {
                text: i18n("Color")
            }
            TextField {
                id: colorhex
                width: 200
                text: cfg_colorHex
                onTextChanged: configurationChanged()
            }
        }

        // Date Format Selector
        ColumnLayout {
            Label {
                text: i18n("Date Format")
            }
            ComboBox {
                id: dateFormatPresets
                Layout.fillWidth: true
                model: [
                    { text: "Weekday, Date Month (e.g., mon, 15 jan)", value: "ddd, d MMM" },
                    { text: "Full Weekday, Date Month (e.g., monday, 15 january)", value: "dddd, d MMMM" },
                    { text: "Numeric Short (e.g., 15/01/2024)", value: "dd/MM/yyyy" },
                    { text: "Numeric Long (e.g., 15 january 2024)", value: "d MMMM yyyy" },
                    { text: "Custom...", value: "custom" }
                ]
                textRole: "text"
                valueRole: "value"

                onCurrentValueChanged: {
                    if (currentValue !== "custom") {
                        dateFormatField.text = currentValue
                        dateFormatField.readOnly = true
                    } else {
                        dateFormatField.readOnly = false
                        dateFormatField.text = ""
                        dateFormatField.focus = true
                    }
                    configurationChanged()
                }
            }

            // Custom Date Format Input
            TextField {
                id: dateFormatField
                Layout.fillWidth: true
                readOnly: true
                placeholderText: i18n("Enter custom date format")
                onTextChanged: configurationChanged()
            }
        }

        // Time Format Selector
        ColumnLayout {
            Label {
                text: i18n("Time Format")
            }
            ComboBox {
                id: timeFormatPresets
                Layout.fillWidth: true
                model: [
                    { text: "24-Hour (e.g., 15:45)", value: "HH:mm" },
                    { text: "12-Hour with AM/PM (e.g., 3:45 PM)", value: "h:mm AP" },
                    { text: "Custom...", value: "custom" }
                ]
                textRole: "text"
                valueRole: "value"

                onCurrentValueChanged: {
                    if (currentValue !== "custom") {
                        timeFormatField.text = currentValue
                        timeFormatField.readOnly = true
                    } else {
                        timeFormatField.readOnly = false
                        timeFormatField.text = ""
                        timeFormatField.focus = true
                    }
                    configurationChanged()
                }
            }

            // Custom Time Format Input
            TextField {
                id: timeFormatField
                Layout.fillWidth: true
                readOnly: true
                placeholderText: i18n("Enter custom time format")
                onTextChanged: configurationChanged()
            }
        }

        // Tip Text
        Label {
            text: i18n("Format Help: Use Qt date formatting codes (ddd, MMM, HH, mm, etc.)")
            wrapMode: Text.Wrap
            Layout.fillWidth: true
        }
    }
}
