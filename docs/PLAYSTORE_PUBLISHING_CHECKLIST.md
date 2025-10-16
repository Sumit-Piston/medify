# Play Store Publishing Checklist for Medify

**Version:** 1.0.0  
**Target Platform:** Android  
**Last Updated:** October 15, 2025

---

## 📋 Pre-Publishing Checklist

### 1. App Configuration & Metadata

#### Android Configuration

- [x] App name set to "Medify" in `AndroidManifest.xml`
- [x] App icon generated and configured (adaptive icon)
- [x] Notification icon created (`ic_notification.xml`)
- [x] Splash screen configured (light & dark mode)
- [ ] Update `applicationId` in `android/app/build.gradle` to unique package name (e.g., `com.yourcompany.medify`)
- [ ] Set `versionCode` to 1 in `android/app/build.gradle`
- [ ] Set `versionName` to "1.0.0" in `android/app/build.gradle`
- [ ] Configure `minSdkVersion` (currently 21 - Android 5.0)
- [ ] Configure `targetSdkVersion` (currently 34 - Android 14)
- [ ] Configure `compileSdkVersion` (currently 34)

#### App Permissions Review

- [x] `POST_NOTIFICATIONS` - Required for Android 13+
- [x] `SCHEDULE_EXACT_ALARM` - For precise medicine reminders
- [x] `USE_EXACT_ALARM` - Fallback for exact alarms
- [x] `RECEIVE_BOOT_COMPLETED` - Reschedule notifications after reboot
- [x] `VIBRATE` - Vibration for notifications
- [x] `WAKE_LOCK` - Wake device for critical reminders
- [ ] Review and justify all permissions in Play Console

---

### 2. Code Quality & Stability

#### Testing

- [ ] Test app on multiple Android versions (Android 5.0 to Android 14+)
- [ ] Test on different screen sizes (phone, tablet)
- [ ] Test notification delivery (foreground, background, terminated)
- [ ] Test notification actions (will be implemented in Phase 2)
- [ ] Test app behavior after device reboot
- [ ] Test database operations (CRUD for medicines and logs)
- [ ] Test timezone handling for notifications
- [ ] Test theme switching (light/dark mode)
- [ ] Test onboarding flow for new users
- [ ] Test settings persistence across app restarts
- [ ] Verify all permissions are requested and handled correctly
- [ ] Test app with no internet connection (offline functionality)

#### Performance

- [ ] Profile app performance (CPU, memory, battery usage)
- [ ] Check for memory leaks
- [ ] Optimize image assets (compression without quality loss)
- [ ] Minimize app size (analyze APK/AAB)
- [ ] Test app startup time (cold & warm start)

#### Error Handling

- [ ] Implement global error handlers
- [ ] Add error boundaries for critical flows
- [ ] Test edge cases (empty states, invalid inputs)
- [ ] Add user-friendly error messages
- [ ] Implement crash reporting (e.g., Firebase Crashlytics)

---

### 3. Security & Privacy

#### Data Security

- [ ] Review data storage (ObjectBox) - ensure sensitive data is protected
- [ ] No hardcoded API keys or secrets in code
- [ ] Implement data backup mechanism (optional)
- [ ] Add data export feature for user data portability
- [ ] Implement secure data deletion when medicine is deleted

#### Privacy Policy

- [ ] **CRITICAL:** Create and publish Privacy Policy
- [ ] Host Privacy Policy on accessible URL
- [ ] Include Privacy Policy link in app (Settings > About)
- [ ] Clearly state data collection practices (local only, no cloud)
- [ ] Explain permission usage (notifications, alarms)
- [ ] Add contact information for privacy concerns

#### Terms of Service (Optional but Recommended)

- [ ] Create Terms of Service document
- [ ] Host Terms of Service on accessible URL
- [ ] Include disclaimer about medical advice
- [ ] Include link in app (Settings > About)

---

### 4. Build & Release Configuration

#### Signing Configuration

- [ ] Generate production keystore (`.jks` file)
- [ ] Store keystore securely (backup in safe location)
- [ ] Configure `key.properties` file with keystore details
- [ ] Update `android/app/build.gradle` with signing config
- [ ] **NEVER commit keystore or passwords to Git**
- [ ] Test signed release build on device

#### Build Configuration

- [ ] Enable code obfuscation (ProGuard/R8)
- [ ] Configure ProGuard rules for ObjectBox, BLoC, etc.
- [ ] Enable code shrinking to reduce app size
- [ ] Disable debug flags and logging in release mode
- [ ] Test release APK/AAB thoroughly

#### Build Commands

```bash
# Clean build
fvm flutter clean
fvm flutter pub get

# Generate ObjectBox code
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Build release APK (for testing)
fvm flutter build apk --release

# Build release App Bundle (for Play Store)
fvm flutter build appbundle --release
```

---

### 5. Google Play Console Setup

#### Account & App Creation

- [ ] Create Google Play Developer account ($25 one-time fee)
- [ ] Create new app in Play Console
- [ ] Select app name: "Medify"
- [ ] Choose default language (e.g., English - US)
- [ ] Select app category: Medical
- [ ] Select app type: App

#### Store Listing

- [ ] **App name:** Medify
- [ ] **Short description** (80 characters max):
  ```
  Never miss your medicine. Smart reminders with daily tracking & logs.
  ```
- [ ] **Full description** (4000 characters max):

  ```
  Medify - Your Personal Medicine Reminder & Tracker

  Never forget to take your medicine again! Medify helps you stay on track with your medication schedule through smart reminders and comprehensive tracking.

  ✨ KEY FEATURES:
  • 💊 Medicine Management - Add unlimited medicines with custom dosages
  • ⏰ Smart Reminders - Set multiple daily reminders for each medicine
  • 📊 Daily Tracking - Mark medicines as taken, missed, or snoozed
  • 📈 Progress Overview - View your medicine adherence at a glance
  • 📅 History & Logs - Track your complete medication history
  • 🌓 Dark Mode - Easy on the eyes, day or night
  • 🔒 Privacy First - All data stored locally on your device
  • 📱 Clean UI - Simple, intuitive, and accessible design

  🎯 PERFECT FOR:
  • Chronic condition management
  • Post-surgery medication schedules
  • Daily vitamin and supplement tracking
  • Elderly care and caregiver support
  • Anyone with multiple medications

  🔔 RELIABLE NOTIFICATIONS:
  • Precise timing with exact alarm scheduling
  • Works even when app is closed
  • Persists across device reboots
  • Customizable snooze duration

  🛡️ PRIVACY & SECURITY:
  • 100% offline - no account required
  • No data collection or tracking
  • No internet connection needed
  • Your health data stays on your device

  📱 REQUIREMENTS:
  • Android 5.0 (Lollipop) or higher
  • Notification permissions for reminders
  • Exact alarm permissions for precise timing

  ⚠️ MEDICAL DISCLAIMER:
  Medify is a reminder and tracking tool. It is not a substitute for professional medical advice, diagnosis, or treatment. Always consult your healthcare provider for medical questions and before making any changes to your medication regimen.

  💬 FEEDBACK & SUPPORT:
  We'd love to hear from you! Contact us at [your-email@example.com]

  Download Medify today and take control of your medication schedule! 💪
  ```

- [ ] **App icon:** 512x512 PNG (high-res)
- [ ] **Feature graphic:** 1024x500 PNG (required)
- [ ] **Phone screenshots:** Minimum 2, maximum 8 (see screenshot guide below)
- [ ] **7-inch tablet screenshots:** Optional but recommended
- [ ] **10-inch tablet screenshots:** Optional but recommended
- [ ] **App category:** Medical
- [ ] **Tags:** medication, reminder, health, tracker, medicine (max 5)
- [ ] **Contact email:** Your support email
- [ ] **Website:** Optional (your app website or company site)
- [ ] **Phone number:** Optional (support phone)
- [ ] **Privacy Policy URL:** **REQUIRED** - Must be accessible URL

#### Content Rating

- [ ] Complete Content Rating Questionnaire
- [ ] Select target audience: Everyone
- [ ] Declare no ads, no in-app purchases, no user-generated content
- [ ] Medical app disclaimer acknowledgment

#### App Content

- [ ] Privacy Policy - Link to hosted policy
- [ ] Ads - Declare if app contains ads (currently: No)
- [ ] Target audience - Select age groups
- [ ] News app - Declare if news app (No)
- [ ] COVID-19 contact tracing - Declare if applicable (No)
- [ ] Data safety - Fill out data safety form (all data local)
- [ ] Government apps - Declare if government app (No)

#### Pricing & Distribution

- [ ] Select pricing: Free (or Paid with price)
- [ ] Select countries: Available everywhere (or specific countries)
- [ ] Opt-in to Android App Bundle (AAB)
- [ ] Enable Google Play Instant (optional)

---

### 6. Screenshots & Marketing Assets

#### Screenshot Guide

**Required Sizes:**

- Phone: 1080x1920 to 1080x2340 (portrait) or 1920x1080 (landscape)
- 7" Tablet: 1536x2048 (portrait) or 2048x1536 (landscape)
- 10" Tablet: 2048x2732 (portrait) or 2732x2048 (landscape)

**Recommended Screenshots:**

1. **Onboarding Screen** - Show the welcome/feature highlights
2. **Medicine List** - Show the main medicine management screen
3. **Add Medicine** - Show how to add a new medicine with reminders
4. **Today's Schedule** - Show the daily medicine tracking view
5. **Notification Example** - Show a medicine reminder notification
6. **Settings Page** - Show theme toggle and app settings
7. **Dark Mode** - Show the app in dark mode (optional but nice)
8. **Summary Card** - Show the daily progress overview

**Tips:**

- Use device frames for professional look
- Add descriptive text overlays highlighting features
- Show actual app functionality, not marketing fluff
- Use high-quality, crisp images
- Test on different devices for consistency

#### Feature Graphic (1024x500)

- [ ] Create banner with app logo and tagline
- [ ] Use brand colors (#4F46E5 primary, #FAFAFA background)
- [ ] Include key benefit text (e.g., "Never Miss Your Medicine")
- [ ] Professional, clean design

#### Promotional Video (Optional)

- [ ] Create 30-second app demo video
- [ ] Show key features in action
- [ ] Upload to YouTube and link in Play Console

---

### 7. Pre-Launch Checklist

#### Final Testing

- [ ] Install release APK/AAB on test devices
- [ ] Test all critical flows end-to-end
- [ ] Verify no debug code or logging in release
- [ ] Check app behavior on low-end devices
- [ ] Verify all links (Privacy Policy, support email) work
- [ ] Test app after fresh install (first-time user experience)
- [ ] Verify notification permissions are requested properly
- [ ] Test background notification delivery

#### Legal & Compliance

- [ ] **Medical Disclaimer:** Clearly stated in app and store listing
- [ ] **Privacy Policy:** Published and linked
- [ ] **Terms of Service:** Published and linked (if applicable)
- [ ] Verify compliance with Google Play Policies
- [ ] Verify compliance with medical app guidelines
- [ ] No false medical claims or promises

#### App Store Optimization (ASO)

- [ ] Research keywords for app discovery
- [ ] Optimize title and description with keywords
- [ ] Create compelling short description
- [ ] Use all available screenshot slots
- [ ] Add localized listings for target markets (optional)

---

### 8. Submission Process

#### Upload Build

- [ ] Navigate to Play Console > Releases > Production
- [ ] Create new release
- [ ] Upload App Bundle (.aab file)
- [ ] Add release notes (what's new in this version)
- [ ] Set rollout percentage (start with 20% for safety)
- [ ] Review and confirm

#### Release Notes Example

```
🎉 Welcome to Medify v1.0.0!

Medify helps you never miss your medicine with smart reminders and tracking.

✨ Features:
• Add and manage your medicines
• Set multiple daily reminders
• Track taken, missed, and snoozed doses
• View daily progress and history
• Beautiful light and dark themes
• 100% offline and private

Never forget your medicine again! 💊
```

#### Post-Submission

- [ ] Monitor for review status (typically 1-7 days)
- [ ] Respond to any policy issues or rejections
- [ ] Fix any reported issues and resubmit if needed
- [ ] Once approved, gradually increase rollout to 100%

---

### 9. Post-Launch

#### Monitoring

- [ ] Set up Firebase Analytics (optional)
- [ ] Set up Firebase Crashlytics for crash reporting
- [ ] Monitor Play Console reports (crashes, ANRs)
- [ ] Monitor user reviews and ratings
- [ ] Respond to user feedback promptly

#### Updates & Maintenance

- [ ] Plan regular updates (bug fixes, features)
- [ ] Maintain changelogs
- [ ] Test updates on production builds before release
- [ ] Increment version code and version name for each release

#### Marketing & Growth

- [ ] Share on social media
- [ ] Ask early users for reviews
- [ ] Create landing page or website (optional)
- [ ] Consider blog posts or press releases
- [ ] Monitor download and engagement metrics

---

## 🚀 Quick Reference Commands

### Build Commands

```bash
# Clean and get dependencies
fvm flutter clean && fvm flutter pub get

# Run code generation
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Build release APK (for testing)
fvm flutter build apk --release

# Build release App Bundle (for Play Store submission)
fvm flutter build appbundle --release

# Find built files
ls -lh build/app/outputs/bundle/release/
ls -lh build/app/outputs/flutter-apk/
```

### Signing Setup (One-Time)

```bash
# Generate keystore
keytool -genkey -v -keystore ~/medify-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias medify

# Create key.properties file
echo "storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=medify
storeFile=/Users/yourname/medify-release-key.jks" > android/key.properties

# Add to .gitignore
echo "android/key.properties" >> .gitignore
echo "*.jks" >> .gitignore
```

---

## ⚠️ Critical Items Before Submission

**MUST HAVE:**

1. ✅ Unique package name (applicationId)
2. ✅ Signed release build with production keystore
3. ✅ Privacy Policy URL (hosted and accessible)
4. ✅ High-quality screenshots (minimum 2)
5. ✅ Feature graphic (1024x500)
6. ✅ Store listing fully filled out
7. ✅ Content rating completed
8. ✅ Data safety form completed
9. ✅ Medical disclaimer in description
10. ✅ Tested release build on real devices

---

## 📱 Recommended Package Name

**Current:** `com.example.medify` (default)  
**Recommended:** `com.yourcompany.medify` or `com.yourdomain.medify`

Example:

- `com.healthtech.medify`
- `com.medifyapp.android`
- `io.medify.app`

---

## 📧 Support & Legal Templates

### Support Email Content Template

```
Subject: Medify App Support

Hello,

Thank you for using Medify!

If you have questions, issues, or feedback, please reply to this email with:
- Your device model and Android version
- Description of the issue
- Screenshots if applicable

We'll get back to you within 24-48 hours.

Best regards,
Medify Support Team
```

### Privacy Policy Template (Simplified)

```
Privacy Policy for Medify

Last updated: [DATE]

1. Data Collection
Medify does NOT collect, store, or transmit any personal data to external servers. All data is stored locally on your device.

2. Permissions
- Notifications: To send medicine reminders
- Exact Alarms: To ensure precise reminder timing
- Boot Completed: To reschedule reminders after device restart

3. Data Storage
All medicine and log data is stored locally using ObjectBox database on your device. This data is never shared or uploaded.

4. Third-Party Services
Medify does not use any third-party analytics, advertising, or tracking services.

5. Changes to Privacy Policy
We may update this policy from time to time. Changes will be posted in the app.

6. Contact
For questions about this privacy policy, contact: [your-email@example.com]
```

---

## ✅ Final Pre-Flight Check

Before clicking "Submit for Review":

- [ ] App name: Medify ✓
- [ ] Version: 1.0.0 ✓
- [ ] Package name: Updated to unique ID
- [ ] Keystore: Generated and backed up
- [ ] Signed release build: Tested on device
- [ ] Screenshots: All uploaded (minimum 2)
- [ ] Feature graphic: Uploaded
- [ ] Store listing: Complete
- [ ] Privacy Policy: Hosted and linked
- [ ] Medical disclaimer: In description
- [ ] Content rating: Complete
- [ ] Data safety: Complete
- [ ] All features tested: Working
- [ ] No debug code: Confirmed
- [ ] Backup created: Code + Keystore

---

## 📚 Resources

- [Google Play Console](https://play.google.com/console)
- [Android Developer Policy](https://play.google.com/about/developer-content-policy/)
- [Launch Checklist (Official)](https://developer.android.com/distribute/best-practices/launch/launch-checklist)
- [App Bundle Guide](https://developer.android.com/guide/app-bundle)
- [Signing Your App](https://flutter.dev/docs/deployment/android#signing-the-app)

---

**Good luck with your launch! 🚀**
