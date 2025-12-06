# internal-ops-platform
A unified platform combining an Angular-based internal operations dashboard with a Flutter mobile app for WebView access and integrated messaging.

## Features

- **Messaging App** – Flutter-based, uses BLoC architecture for state management.  
- **WebView** – Displays an Angular project running locally.  

---

## Flutter App Structure

The Flutter app uses **BLoC architecture** to manage state cleanly and predictably.  

## Running the Flutter App

To run the Flutter app:

1. Make sure you have **Flutter SDK installed**.  
2. Navigate to the Flutter project folder:

```bash
cd desktalk
flutter run
```
---

## Angular WebView

The WebView in Flutter points to an Angular project running locally at **http://localhost:4200/**.  
### Starting the Angular Server

1. Make sure you have **Node.js** and **Angular CLI** installed.
2. Navigate to the Angular project folder:

```bash
cd dashboard_web
npx ng serve

npx ng serve --host 0.0.0.0 --port 4200
```
Open your browser at http://localhost:4200
