# Audira

<img src="assets/preview/preview.png" />

### Releases
You can find the application in the **Releases** section or by [following this link](https://github.com/ahvvad/Audira/releases).

---

###  Important Notes
If you’re taking all the contents from the `lib` folder, ensure you **update the `pubspec.yaml`** accordingly.

---

## Required Packages
These are all the packages required to run the app. Run the following commands to add them to `pubspec.yaml` :

```
flutter pub add get
flutter pub add just_audio
flutter pub add flutter_svg
flutter pub add url_launcher
flutter pub add on_audio_query
flutter pub add permission_handler
flutter pub add flutter_custom_tabs
flutter pub add flutter_native_splash
```
For app splash:
```
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.9.2

 flutter_native_splash:
   color: "#00141D"
   image: assets/Launcher.png 
   android: true
   ios: true
```
Add these entries to the `AndroidManifest.xml`.
```
    <!-- Access local storage  -->
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

    <!-- Access internet  -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    
    <!-- Access forground  -->
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
```

### Explore the UI through [this link](assets/preview)

#### **Contact me anytime if you have questions.** : [Here](https://linktr.ee/userahmed)
