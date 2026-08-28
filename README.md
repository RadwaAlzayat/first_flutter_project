# Shopping App

A Flutter shopping application developed as a complete Flutter project covering UI development, form validation, navigation, animations, and Arabic localization.

## Features

* Home screen with local and network images
* Responsive UI using MediaQuery
* Shopping screen with:

  * Our Products
  * Product PageView
  * Product Grid
  * Add-to-cart SnackBar
  * Hot Offers ListView
* Sign Up form with validation
* Full Name capitalization validation
* Email validation
* Password length validation
* Confirm Password validation
* Success dialog after account creation
* Fade page transition to the Shopping Screen
* English and Arabic localization
* Language switching from the AppBar

## Technologies

* Flutter
* Dart
* Flutter CLI
* Android Studio / VS Code
* Google Fonts
* easy_localization
* MediaQuery
* GitHub

## Project Structure

```text
lib/
├── main.dart
└── screens/
    ├── home_screen.dart
    ├── sign_up_screen.dart
    └── shopping_screen.dart
```

## Localization

The application supports:

* English
* Arabic

Translation files are stored in:

```text
assets/translations/
```

## Getting Started

Clone the repository and run:

```bash
flutter pub get
flutter run
```

Before submission, format the project using:

```bash
dart format .
```

Then verify the project using:

```bash
flutter analyze
```

## Project Requirements

This project was developed to demonstrate:

* Stateless and Stateful Widgets
* Responsive layouts
* User input validation
* Screen navigation
* Page transition animations
* Multi-language support
* Clean and organized Flutter code
