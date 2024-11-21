# Material Clock for KDE Plasma 6
# Version 0.0.4
**Material Clock** is a simple, Material Design-inspired clock plasmoid for KDE Plasma 6.

## Features
- **Customizable color**: Change the clock's color through the settings.
- **Flexible date formatting**: Choose from preset date formats or create a custom format.
- **Flexible time formatting**: Select from preset time formats or define a custom format.

## Installation
You can install Material Clock through multiple methods:

### KDE Store
1. Open System Settings
2. Go to Plasma Widgets
3. Click "Get New Widgets"
4. Search for "Material Clock"
5. Click "Install"

### Manual Installation
1. Download the `.plasmoid` file from the [Releases](https://github.com/cesp99/Material-Clock/releases) section.
2. Install the plasmoid by double-clicking the downloaded `.plasmoid` file.
3. Add the clock to your panel: Right-click on the desktop or panel, select "Add Widgets...", search for "Material Clock," and drag it to your panel.

## Configuration
Right-click on the clock widget and select "Configure" to adjust:
- **Color**: Choose a custom color for the clock text (using hex format).
- **Date Format**: 
  - Select from preset formats like:
    - "Mon, 15 Jan"
    - "Monday, 15 January"
    - "15/01/2024"
  - Or create a custom format using Qt date formatting codes
- **Time Format**:
  - Choose from preset formats like:
    - 24-hour (15:45)
    - 12-hour with AM/PM (3:45 PM)
    - Formats with or without seconds
  - Create a custom format using Qt date formatting codes

### Date/Time Format Tips
- Use Qt formatting codes like:
  - `ddd`: Short weekday name
  - `MMM`: Short month name
  - `HH`: 24-hour hour
  - `mm`: Minutes
  - `h`: 12-hour hour
  - `AP`: AM/PM indicator

> [!NOTE]
> The widget updates every 60 seconds. Including seconds in the time format is not recommended as the display will not update in real-time.

## Supporting the Project
Enjoyed Material Clock? Help support its development:
- ⭐ Star this GitHub repository
- 📝 Rate and review the widget on the KDE Store
- 🐛 Report issues or suggest improvements on GitHub

Your support helps maintain and improve the project!

## Contributing
Feel free to fork the repository, open issues, or submit pull requests. Contributions are welcome to improve and expand the project!

## License
This project is licensed under the GNU General Public License v3.0 (GPL-3.0).
See the [LICENSE](./LICENSE) file for more details.