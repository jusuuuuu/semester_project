# LutoReco — Recipe Recommendation System

## Project Description

LutoReco is a recipe recommendation application that helps users discover dishes they can prepare using ingredients they already have at home. It aims to make meal planning easier, reduce food waste, and help users find practical recipes.

## Technology Stack

- **Flutter** — Framework for building the web application and user interface.
- **Dart** — Programming language used to develop the application.
- **GoRouter** — Package used for navigation between screens.
- **Visual Studio Code (VS Code)** — Code editor used for development.
- **Git** — Version control system for tracking code changes.
- **GitHub** — Online repository for storing and managing the project.
- **Google Chrome** — Browser used to run and test the Flutter Web application.

## Prerequisites

Before running the project, make sure you have installed:

- Flutter SDK
- Dart SDK (included with Flutter)
- Google Chrome
- Git

## How to Run the Project

### 1. Clone the Repository

Replace `YOUR_GITHUB_REPOSITORY_URL` with the actual URL of this project's GitHub repository.

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### 2. Navigate to the Project Folder

```bash
cd semester_project
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the Flutter Web Application

```bash
flutter run -d chrome
```

The application should open in Google Chrome.

### 5. Build the Web Application

To generate a web build for deployment, run:

```bash
flutter build web
```

The generated files will be available in the `build/web` directory.

## Initial Pages and Screens

### 1. Homepage
Introduces LutoReco, explains its purpose, displays featured recipes, and provides navigation to the Login page.

### 2. Login Page
Provides a login form with email and password fields, input validation, and a password visibility toggle.

### 3. Registration Page
Provides a registration form with full name, email, password, and confirm password fields, including input validation.

## Current Project Status

The initial user interface and client-side navigation have been implemented. The Login and Registration forms validate user input, but account creation and authentication are not yet connected to a backend. The recipe recommendation feature is planned for a later development stage.

## Repository Information

- **Project Title:** LutoReco
- **Repository URL:** YOUR_GITHUB_REPOSITORY_URL
- **Activity:** Activity 8 — Flutter Web Project Initialization
- **First Checkpoint Date:** October 12, 2026


## Testing

To check the project for Dart and Flutter analysis issues, run:

```bash
flutter analyze
```

To run the automated tests, run:

```bash
flutter test
```
