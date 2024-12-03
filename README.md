# Expense Planner

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Emon526/Expense-Planner/blob/master/LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/Emon526/Expense-Planner.svg)](https://github.com/Emon526/Expense-Planner/issues)
[![GitHub Forks](https://img.shields.io/github/forks/Emon526/Expense-Planner.svg)](https://github.com/Emon526/Expense-Planner/network)
[![GitHub Stars](https://img.shields.io/github/stars/Emon526/Expense-Planner.svg)](https://github.com/Emon526/Expense-Planner/stargazers)
[![Releases](https://github.com/Emon526/Expense-Planner/actions/workflows/release.yml/badge.svg)](https://github.com/Emon526/Expense-Planner/actions/workflows/release.yml)

## Overview

Welcome to **Expense Planner**, a comprehensive Flutter application designed to assist users in effectively managing their expenses. This project utilizes Flutter for cross-platform compatibility, enabling seamless operation on both Android and iOS devices.

## Table of Contents

- [Features](#features)
- [Packages Utilized](#packages-utilized)
- [Application Compatibility](#application-compatibility)
- [Installation Instructions](#installation-instructions)
- [Usage Instructions](#usage-instructions)
- [Application Demonstration](#application-demonstration)
- [App Screenshots](#app-screenshots)
- [Troubleshooting](#troubleshooting)
- [Contribution Guidelines](#contribution-guidelines)
- [Contact Information](#contact-information)

## Features

- **Data Persistence**: Users can securely save their expense data locally for easy retrieval.
- **Multi-Duration Expense Visualization**: Analyze expenses over various time frames, including the last 7 days, 15 days, and 30 days.
- **Transaction Management**: Users have the flexibility to delete any expense transaction at their discretion.
- **Customizable Themes**: Choose between light and dark themes to enhance user experience.

## Packages Utilized

This project leverages the following packages:

- **flutter**: The core Flutter SDK for building the application.
- **intl**: A package for internationalization and localization.
- **sqflite**: A SQLite plugin for local database storage.
- **cupertino_icons**: Provides iOS-style icons for the application.
- **provider**: A state management package that enhances the efficiency of app state handling.
- **shared_preferences**: A package for storing simple data in key-value pairs.
- **flutter_native_splash**: Facilitates the creation of native splash screens for the application.

## Application Compatibility

This application is fully functional and compatible with both Android and iOS devices.

## Installation Instructions

To set up the project, ensure you have Flutter installed on your machine. For detailed installation guidance, please refer to the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

1. Clone the repository:
   ```bash
   git clone https://github.com/Emon526/Expense-Planner.git
   cd Expense Planner
   ```
2. Install the necessary dependencies:
   ```bash
   flutter pub get
   ```

## Usage Instructions

To run the application, execute the following command:

```bash
flutter run
```

## Application Demonstration

This demo highlights the key features of the Expense Planner application, including data entry, expense visualization, and theme selection.

<center>
    <img src="preview/app_demo.gif" alt="App Demo" />
</center>

## App Screenshots

Here are some screenshots showcasing the user interface of the Expense Planner application:

### Home Screen

<center>
<table>
<tr>
<td><img src="preview/dark_homepage.png" alt="Dark Home Screen" width="350"/></td>
<td><img src="preview/light_homepage.png" alt="Light Home Screen" width="350"/></td>
</tr>
</table>
</center>

### Input Screen

<center>
<table>
<tr>
<td><img src="preview/dark_input.png" alt="Dark Input Screen" width="350"/></td>
<td><img src="preview/light_input.png" alt="Light Input Screen" width="350"/></td>
</tr>
</table>
</center>

### Data View Screen

<center>
<table>
<tr>
<td><img src="preview/dark_datascreen.png" alt="Dark Data View Screen" width="350"/></td>
<td><img src="preview/light_datascreen.png" alt="Light Data View Screen" width="350"/></td>
</tr>
</table>
</center>

### Theme Selection

<center>
<table>
<tr>
<td><img src="preview/dark_themepick.png" alt="Dark Theme Selection" width="350"/></td>
<td><img src="preview/light_themepick.png" alt="Light Theme Selection" width="350"/></td>
</tr>
</table>
</center>

### Landscape Main Screen

<center>
<table>
<tr>
<td><img src="preview/dark_land_trans.png" alt="Dark Landscape Main Screen" width="600"/></td>
<td><img src="preview/light_land_trans.png" alt="Light Landscape Main Screen" width="600"/></td>
</tr>
</table>
</center>

### Landscape Chart View Screen

<center>
<table>
<tr>
<td><img src="preview/dark_land_chart.png" alt="Dark Landscape Chart View" width="600"/></td>
<td><img src="preview/light_land_chart.png" alt="Light Landscape Chart View" width="600"/></td>
</tr>
</table>
</center>

## Troubleshooting

If you encounter issues while using the application, consider the following solutions:

- **Common Issues**:
  - If the app crashes on startup, ensure all dependencies are correctly installed and up to date.
  - If you experience issues with the database, try running `flutter clean` and then `flutter pub get`.

## Contribution Guidelines

We welcome contributions! If you wish to contribute to the Expense Planner project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Implement your changes and commit them.
4. Push your changes to your forked repository.
5. Submit a pull request detailing your modifications.

## Contact Information

For any inquiries or support, please reach out to developer.asrafulislam@gmail.com.
