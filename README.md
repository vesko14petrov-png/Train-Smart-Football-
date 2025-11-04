# TrainSmart Football - Replit Starter Template

This is a minimal Flutter web starter template prepared for **TrainSmart Football** (MVP).  
It includes basic screens, localization assets (EN/BG), theme and a placeholder for Firebase integration.

## What's inside
- `lib/main.dart` - app entry with routes
- `lib/screens/` - home, technical, physical, ask_coach, progress screens
- `assets/lang/en.json` and `assets/lang/bg.json` - initial translations
- `web/index.html` - placeholder for Firebase web config
- `pubspec.yaml` - dependencies (add firebase packages after import)

## Quick start (Replit)
1. Fork the repository to your GitHub account (or upload this project).
2. Open https://replit.com and choose **Import from GitHub**.
3. Paste your repository URL and import.
4. In Replit shell, run:
   ```
   flutter pub get
   flutter run -d chrome
   ```
   The app will run as a web app in a new tab.

## Connecting Firebase (optional but recommended for real "Ask Coach" behavior)
1. Go to https://console.firebase.google.com and create a new project.
2. Add a **Web** app. In the Firebase console you'll get a `firebaseConfig` object.
3. Add the firebase web config snippet into `web/index.html` as shown:
   ```html
   <script>
     // Replace with your config
     const firebaseConfig = {
       apiKey: "YOUR_API_KEY",
       authDomain: "PROJECT_ID.firebaseapp.com",
       projectId: "PROJECT_ID",
       storageBucket: "PROJECT_ID.appspot.com",
       messagingSenderId: "SENDER_ID",
       appId: "APP_ID",
     };
   </script>
   ```
4. In Replit, add firebase packages to `pubspec.yaml` and run:
   ```
   flutter pub get
   ```
   Then initialize Firebase in `lib/main.dart` before `runApp(...)`:
   ```dart
   import 'package:firebase_core/firebase_core.dart';
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
     runApp(TrainSmartApp());
   }
   ```
5. Ensure `cloud_firestore` is added and the `ask_coach.dart` screen will save documents to Firestore collection `ask_coach`.

## Notes
- This template is intentionally minimal to run in Replit as Flutter Web.
- To build Android/iOS APKs you will need a local machine with Flutter SDK and Android SDK.
- The code uses simple placeholders; extend the models and Firestore rules for production.

## License
This starter template is provided as-is for your project. Attribution appreciated.