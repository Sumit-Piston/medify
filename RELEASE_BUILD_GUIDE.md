# 🚀 Release Build Guide - Medify App

**Date:** October 15, 2025  
**Status:** ✅ Release APK Built Successfully (63.4MB)  
**Issue:** How to install and run the release build

---

## ✅ GOOD NEWS: Build Successful!

Your release APK has been built successfully:
- **Location:** `build/app/outputs/flutter-apk/app-release.apk`
- **Size:** 63.4MB
- **Status:** ✅ No build errors

---

## 📱 HOW TO INSTALL & TEST RELEASE APK

### **Method 1: Install on Physical Android Device** (RECOMMENDED)

#### **Step 1: Enable Developer Options**
1. Open **Settings** on your Android device
2. Go to **About Phone**
3. Tap **Build Number** 7 times
4. Go back to **Settings** → **Developer Options**
5. Enable **USB Debugging**

#### **Step 2: Connect Device to Mac**
1. Connect your Android device via USB cable
2. On your phone, accept "Allow USB Debugging" prompt
3. Choose **File Transfer** mode (not just charging)

#### **Step 3: Install ADB (if not installed)**
```bash
# Install Android SDK Platform Tools
brew install --cask android-platform-tools

# Verify installation
adb version
```

#### **Step 4: Install the APK**
```bash
cd /Users/sumitpal/Dev/Personal/medify

# Check if device is connected
adb devices

# Install the release APK
adb install -r build/app/outputs/flutter-apk/app-release.apk

# Or use the renamed version
adb install -r build/app/outputs/flutter-apk/medify-v1.0.0.apk
```

#### **Step 5: Launch the App**
Find "Medify" in your app drawer and tap to open!

---

### **Method 2: Share APK File Directly**

#### **Via Google Drive / Email:**
1. Upload `build/app/outputs/flutter-apk/app-release.apk` to Google Drive
2. Open the link on your Android phone
3. Download the APK
4. Tap the downloaded APK file
5. Allow "Install from Unknown Sources" if prompted
6. Install and open!

#### **Via AirDrop (if you have Android nearby):**
1. Use any file sharing app
2. Share the APK file from Mac to Android
3. Install on Android device

---

### **Method 3: Using Flutter Command** (if device is connected)

```bash
cd /Users/sumitpal/Dev/Personal/medify

# This will install and run the release build
fvm flutter run --release
```

---

## 🔧 COMMON ISSUES & SOLUTIONS

### **Issue 1: "adb: command not found"**

**Solution:**
```bash
# Install Android SDK Platform Tools
brew install --cask android-platform-tools

# Add to PATH (add to ~/.zshrc)
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Reload shell
source ~/.zshrc

# Verify
adb version
```

---

### **Issue 2: "Device not found" when running adb devices**

**Solutions:**
1. **Check USB Debugging is enabled** on phone
2. **Revoke and re-authorize USB debugging:**
   - Settings → Developer Options → Revoke USB Debugging Authorizations
   - Reconnect device and accept prompt again
3. **Try different USB cable** (some cables are charging-only)
4. **Try different USB port** on your Mac
5. **Restart adb:**
   ```bash
   adb kill-server
   adb start-server
   adb devices
   ```

---

### **Issue 3: "INSTALL_FAILED_UPDATE_INCOMPATIBLE"**

This means a debug version is already installed.

**Solution:**
```bash
# Uninstall old version first
adb uninstall com.medify.medify

# Then install release version
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

---

### **Issue 4: App installs but crashes on launch**

**Possible causes:**
1. **ObjectBox database issue** - Release mode may need additional ProGuard rules
2. **Missing permissions** - Check if all permissions are granted

**Solutions:**

#### **A. Check if ObjectBox needs ProGuard rules**

Create/update `android/app/proguard-rules.pro`:
```proguard
# ObjectBox
-keep class io.objectbox.** { *; }
-keepclassmembers class io.objectbox.** { *; }
-keep class * extends io.objectbox.converter.PropertyConverter { *; }
-keep class * extends io.objectbox.annotation.apihint.Internal { *; }
-keep @io.objectbox.annotation.Entity class * { *; }

# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Preserve annotations
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
```

Then update `android/app/build.gradle.kts`:
```kotlin
buildTypes {
    release {
        // Enable ProGuard
        isMinifyEnabled = true
        isShrinkResources = true
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
        signingConfig = signingConfigs.getByName("debug")
    }
}
```

#### **B. Check logcat for crash details**
```bash
# View real-time logs
adb logcat | grep -i flutter

# Or save to file
adb logcat > crash_log.txt
```

---

### **Issue 5: "Installation failed - Unknown reason"**

**Solutions:**
1. **Clear cache and rebuild:**
   ```bash
   fvm flutter clean
   fvm flutter pub get
   fvm flutter build apk --release
   ```

2. **Check available storage** on device

3. **Try installing as bundle:**
   ```bash
   fvm flutter build appbundle --release
   # Then upload to Play Store for testing
   ```

---

## 🧪 TESTING RELEASE BUILD

Once installed, test these critical features:

### **✅ Checklist:**
- [ ] App launches without crashing
- [ ] Can add a medicine
- [ ] Notifications work
- [ ] Can view schedule
- [ ] Can mark medicine as taken
- [ ] Confetti animation works
- [ ] Statistics page loads
- [ ] History page loads
- [ ] Settings work (theme toggle, etc.)
- [ ] No obvious bugs or crashes

---

## 📦 CREATING SIGNED APK FOR PLAY STORE

For actual Play Store submission, you need a signed release build.

### **Step 1: Create Keystore**
```bash
keytool -genkey -v -keystore ~/medify-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias medify-key
```

### **Step 2: Create key.properties**
Create `android/key.properties`:
```properties
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=medify-key
storeFile=/Users/sumitpal/medify-release-key.jks
```

### **Step 3: Update build.gradle.kts**
```kotlin
// Load keystore
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    // ... existing config

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}
```

### **Step 4: Build Signed APK**
```bash
fvm flutter build apk --release --split-per-abi
```

This creates 3 APKs (one for each architecture):
- `app-arm64-v8a-release.apk` (64-bit ARM)
- `app-armeabi-v7a-release.apk` (32-bit ARM)
- `app-x86_64-release.apk` (x86 64-bit)

### **Step 5: Build App Bundle (Recommended for Play Store)**
```bash
fvm flutter build appbundle --release
```

This creates `build/app/outputs/bundle/release/app-release.aab`

**App Bundle is better because:**
- Smaller download size for users
- Google Play optimizes for each device
- Required for apps over 100MB

---

## 🎯 QUICK COMMANDS REFERENCE

```bash
# Build release APK
fvm flutter build apk --release

# Build release APK (split by architecture - smaller files)
fvm flutter build apk --release --split-per-abi

# Build App Bundle (for Play Store)
fvm flutter build appbundle --release

# Install on connected device
adb install -r build/app/outputs/flutter-apk/app-release.apk

# Run release mode directly
fvm flutter run --release

# Check connected devices
adb devices

# View app logs
adb logcat | grep -i flutter

# Uninstall app
adb uninstall com.medify.medify

# Clean and rebuild
fvm flutter clean
fvm flutter pub get
fvm flutter build apk --release
```

---

## 📱 WHAT'S THE DIFFERENCE: Debug vs Release?

| Feature | Debug Build | Release Build |
|---------|-------------|---------------|
| Size | ~80-100MB | ~60-70MB |
| Performance | Slower | Optimized |
| Hot Reload | ✅ Yes | ❌ No |
| DevTools | ✅ Yes | ❌ No |
| Assertions | ✅ Enabled | ❌ Disabled |
| Obfuscation | ❌ No | ✅ Yes (with ProGuard) |
| Debugging | ✅ Easy | ❌ Harder |
| **Use For** | Development | Production/Testing |

---

## 🐛 TROUBLESHOOTING: App Crashes on Release

If your app works in debug but crashes in release:

### **1. Check for print/debug statements**
Remove or wrap with `kDebugMode`:
```dart
import 'package:flutter/foundation.dart';

if (kDebugMode) {
  print('Debug message');
}
```

### **2. Check for missing ProGuard rules**
See Issue #4 solution above

### **3. Check for reflection/dynamic code**
ObjectBox, JSON serialization might need special rules

### **4. Test in profile mode first**
```bash
fvm flutter run --profile
```
This is between debug and release - helps identify issues

### **5. Enable source maps for better error messages**
```bash
fvm flutter build apk --release --source-maps
```

---

## ✅ CURRENT STATUS

- ✅ Release APK builds successfully
- ✅ No build errors
- ✅ APK size: 63.4MB (good size)
- ✅ All dependencies included
- ⏳ Need to test on actual device

---

## 🚀 NEXT STEPS

1. **Install ADB tools** (if not already)
   ```bash
   brew install --cask android-platform-tools
   ```

2. **Connect Android device** via USB

3. **Install and test** the release APK
   ```bash
   adb install -r build/app/outputs/flutter-apk/app-release.apk
   ```

4. **Test all critical features** (see checklist above)

5. **If all works:** Proceed to Play Store preparation!

6. **If crashes:** Follow troubleshooting guide above

---

## 📞 NEED HELP?

If you encounter issues:

1. **Share the error message** you're seeing
2. **Share logcat output:** `adb logcat > log.txt`
3. **Specify what happens:** Does it install? Does it crash? What specifically isn't working?

---

**Your release build is ready to test!** 🎉

Let me know which installation method you'd like to use, or if you encounter any issues!


