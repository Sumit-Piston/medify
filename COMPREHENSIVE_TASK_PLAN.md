# 📋 Comprehensive Task Plan - Pre-Play Store Launch

**Date:** October 15, 2025  
**Version:** 1.0.0  
**Goal:** Implement local fonts, multi-language support (Hindi & Bengali), and reorganize documentation

---

## 🎯 TASK OVERVIEW

| Phase       | Task                         | Status     | Priority  | Effort  |
| ----------- | ---------------------------- | ---------- | --------- | ------- |
| **Phase 1** | Font Migration               | ⏳ Pending | 🔴 High   | 2 hours |
| **Phase 2** | i18n Infrastructure          | ⏳ Pending | 🔴 High   | 3 hours |
| **Phase 3** | String Extraction            | ⏳ Pending | 🔴 High   | 4 hours |
| **Phase 4** | Hindi Translation            | ⏳ Pending | 🔴 High   | 3 hours |
| **Phase 5** | Bengali Translation          | ⏳ Pending | 🔴 High   | 3 hours |
| **Phase 6** | Language Switcher            | ⏳ Pending | 🔴 High   | 2 hours |
| **Phase 7** | Testing                      | ⏳ Pending | 🔴 High   | 2 hours |
| **Phase 8** | Documentation Reorganization | ⏳ Pending | 🟡 Medium | 2 hours |
| **Phase 9** | Play Store Checklist         | ⏳ Pending | 🔴 High   | 1 hour  |

**Total Estimated Time:** ~22 hours

---

## 📦 PHASE 1: FONT MIGRATION (2 hours)

### Current State:

- ✅ Nunito fonts available in `assets/fonts/`
- ❌ Using `google_fonts` package
- Files: `Nunito-Regular.ttf`, `Nunito-Medium.ttf`, `Nunito-SemiBold.ttf`, `Nunito-Bold.ttf`, `Nunito-ExtraBold.ttf`

### Tasks:

1. **Update `pubspec.yaml`:**
   - Remove `google_fonts: ^6.2.1` dependency
   - Add font family declaration under `flutter: fonts:`
2. **Update `lib/core/themes/app_theme.dart`:**
   - Remove `import 'package:google_fonts/google_fonts.dart';`
   - Replace all `GoogleFonts.nunito(...)` with `TextStyle(fontFamily: 'Nunito', ...)`
3. **Test:**
   - Verify all text renders correctly
   - Check both light and dark themes

### Files to Update:

- `pubspec.yaml`
- `lib/core/themes/app_theme.dart`

---

## 📦 PHASE 2: i18n INFRASTRUCTURE (3 hours)

### Tasks:

1. **Add Flutter Localizations:**
   - Already have `intl: ^0.20.1` ✅
   - Add `flutter_localizations` from SDK
2. **Create l10n Directory Structure:**

   ```
   lib/l10n/
   ├── app_en.arb  (English - source)
   ├── app_hi.arb  (Hindi)
   └── app_bn.arb  (Bengali)
   ```

3. **Update `pubspec.yaml`:**
   - Add `generate: true`
   - Configure `flutter: l10n:` section
4. **Create `l10n.yaml`:**
   - Configure ARB directory and template
5. **Update `lib/main.dart`:**
   - Add `localizationsDelegates`
   - Add `supportedLocales: [Locale('en'), Locale('hi'), Locale('bn')]`
6. **Create `PreferencesService` methods:**
   - `getLocale()` / `setLocale(String)`

### New Files:

- `l10n.yaml`
- `lib/l10n/app_en.arb`
- `lib/l10n/app_hi.arb`
- `lib/l10n/app_bn.arb`

### Files to Update:

- `pubspec.yaml`
- `lib/main.dart`
- `lib/core/services/preferences_service.dart`

---

## 📦 PHASE 3: STRING EXTRACTION (4 hours)

### Current String Locations:

1. **`lib/core/constants/app_strings.dart`** ✅ (Already centralized!)

   - 99 lines of constants
   - App, General, Onboarding, Medicine, Reminders, Actions, Time, Status, Notifications, Errors, etc.

2. **Hardcoded Strings in Pages:**
   - `lib/presentation/pages/*.dart` (8 files)
   - `lib/presentation/widgets/*.dart` (3 files)

### Tasks:

1. **Extract all strings from `app_strings.dart` to `app_en.arb`**
2. **Find and extract hardcoded strings from:**
   - `onboarding_page.dart`
   - `settings_page.dart`
   - `medicine_list_page.dart`
   - `schedule_page.dart`
   - `add_edit_medicine_page.dart`
   - `statistics_page.dart`
   - `history_page.dart`
   - `main_navigation_page.dart`
   - All widgets
3. **Replace `AppStrings.xxx` with `AppLocalizations.of(context)!.xxx`**

4. **Create comprehensive `app_en.arb` with ALL strings**

### Estimated String Count: ~200-250 strings

---

## 📦 PHASE 4: HINDI TRANSLATION (3 hours)

### Tasks:

1. **Translate all strings in `app_en.arb` to Hindi**
2. **Create `app_hi.arb` with proper Unicode support**
3. **Handle plural forms and gender**
4. **Review for cultural appropriateness**

### Key Translation Areas:

- App name: "Medify" → "मेडिफाई" (Medify - keep brand name)
- Tagline: "Never Miss Your Medicine" → "अपनी दवा कभी न भूलें"
- Navigation: Medicines, Schedule, Statistics, Settings
- Actions: Take, Snooze, Skip, Delete, Edit
- Time periods: Morning, Afternoon, Evening, Night
- Status: Pending, Taken, Missed, Skipped
- Form labels: Medicine Name, Dosage, Notes
- Error messages
- Success messages

### Tools:

- Manual translation for accuracy
- Review by native speaker (if possible)
- Use Devanagari script properly

---

## 📦 PHASE 5: BENGALI TRANSLATION (3 hours)

### Tasks:

1. **Translate all strings in `app_en.arb` to Bengali**
2. **Create `app_bn.arb` with proper Unicode support**
3. **Handle plural forms and gender**
4. **Review for cultural appropriateness**

### Key Translation Areas:

- App name: "Medify" → "মেডিফাই" (Medify - keep brand name)
- Tagline: "Never Miss Your Medicine" → "আপনার ওষুধ কখনো মিস করবেন না"
- Same categories as Hindi
- Use Bengali script properly

---

## 📦 PHASE 6: LANGUAGE SWITCHER (2 hours)

### Tasks:

1. **Add Language Setting to Settings Page:**
   ```dart
   _buildLanguageSetting(context, state, theme)
   ```
2. **Create Language Selection Dialog:**
   - English (English)
   - हिंदी (Hindi)
   - বাংলা (Bengali)
3. **Update `SettingsCubit`:**
   - `loadSettings()` - load saved locale
   - `changeLanguage(String locale)` - save and apply
4. **Update `PreferencesService`:**
   - `Future<String?> getLocale()`
   - `Future<void> setLocale(String locale)`
5. **Update `MyApp` in `main.dart`:**
   - Make it rebuild when locale changes
   - Use `locale` parameter
6. **UI Design:**
   - Radio list with language options
   - Show current language with checkmark
   - Persist selection across app restarts

### New UI Components:

- Language setting card in Settings
- Language selection dialog

---

## 📦 PHASE 7: TESTING (2 hours)

### Test Cases:

1. **Font Rendering:**
   - ✅ All text uses Nunito from local assets
   - ✅ No google_fonts dependency
   - ✅ Light theme renders correctly
   - ✅ Dark theme renders correctly
2. **English (Default):**
   - ✅ All pages display English text
   - ✅ No missing translations
   - ✅ Proper pluralization
3. **Hindi:**
   - ✅ Settings → Change language → Hindi
   - ✅ All pages display Hindi text
   - ✅ Devanagari script renders correctly
   - ✅ Text alignment and overflow handled
   - ✅ Restart app → Hindi persists
4. **Bengali:**
   - ✅ Settings → Change language → Bengali
   - ✅ All pages display Bengali text
   - ✅ Bengali script renders correctly
   - ✅ Text alignment and overflow handled
   - ✅ Restart app → Bengali persists
5. **Edge Cases:**
   - ✅ Very long medicine names in all languages
   - ✅ Notifications display correct language
   - ✅ Date/time formatting for each locale
   - ✅ Number formatting (if applicable)

---

## 📦 PHASE 8: DOCUMENTATION REORGANIZATION (2 hours)

### Current State:

- Docs scattered in root: `README.md`, `PHASE1_COMPLETE.md`, `ROADMAP.md`, etc. (15+ docs)
- Some docs in `lib/docs/` (18 docs)
- No version-based organization

### New Structure:

```
lib/docs/
└── medify_v1.0.0/
    ├── 00_INDEX.md (Master index with links)
    ├── 01_SETUP_AND_ARCHITECTURE/
    │   ├── project_setup.md
    │   ├── architecture.md
    │   ├── dependencies.md
    │   └── folder_structure.md
    ├── 02_FEATURES/
    │   ├── medicine_management.md
    │   ├── reminders_and_notifications.md
    │   ├── statistics_and_history.md
    │   ├── onboarding.md
    │   ├── settings.md
    │   └── localization.md
    ├── 03_DEVELOPMENT/
    │   ├── phase1_mvp.md
    │   ├── phase2_enhancements.md
    │   ├── ui_polish.md
    │   └── bug_fixes.md
    ├── 04_RELEASES/
    │   ├── v1.0.0_release_notes.md
    │   ├── release_build_guide.md
    │   └── play_store_checklist.md
    └── 05_REFERENCES/
        ├── api_reference.md
        ├── troubleshooting.md
        └── quick_start.md
```

### Tasks:

1. **Create new directory structure**
2. **Move and consolidate existing docs:**
   - Merge related docs
   - Update internal links
   - Add cross-references
3. **Create master `00_INDEX.md`:**
   - Table of contents
   - Quick links
   - Version history
4. **Create feature documentation:**
   - Comprehensive guide for each feature
   - Screenshots (if applicable)
   - Code examples
5. **Archive old docs:**
   - Move to `lib/docs/archive/` or delete if redundant

---

## 📦 PHASE 9: PLAY STORE CHECKLIST (1 hour)

### Tasks:

1. **Create comprehensive checklist:**
   - Technical requirements
   - Content requirements
   - Assets requirements
   - Testing checklist
2. **Verify all items:**
   - ✅ Release build works
   - ✅ All features tested
   - ✅ Multi-language support
   - ✅ Local fonts
   - ✅ App icon
   - ✅ Splash screen
   - ✅ Screenshots (7 required)
   - ✅ Feature graphic
   - ✅ App description
   - ✅ Privacy policy
   - ✅ Content rating
   - ✅ Signed APK/AAB
3. **Create final documentation:**
   - `PLAY_STORE_SUBMISSION_GUIDE.md`
   - Assets checklist
   - Store listing copy

---

## 📊 ESTIMATED TIMELINE

| Day               | Tasks                                               | Hours   |
| ----------------- | --------------------------------------------------- | ------- |
| **Day 1 (Today)** | Phase 1 (Fonts) + Phase 2 (i18n Setup)              | 5 hours |
| **Day 2**         | Phase 3 (String Extraction) + Start Phase 4 (Hindi) | 6 hours |
| **Day 3**         | Complete Phase 4 + Phase 5 (Bengali)                | 6 hours |
| **Day 4**         | Phase 6 (Language Switcher) + Phase 7 (Testing)     | 4 hours |
| **Day 5**         | Phase 8 (Docs) + Phase 9 (Checklist)                | 3 hours |

**Total:** ~24 hours over 5 days

---

## 🎯 SUCCESS CRITERIA

### Phase 1 (Fonts):

- ✅ No `google_fonts` dependency
- ✅ All text renders with local Nunito fonts
- ✅ App size reduced by ~1-2MB

### Phase 2-7 (Localization):

- ✅ 3 languages fully supported (English, Hindi, Bengali)
- ✅ ~200+ strings translated
- ✅ Language persists across app restarts
- ✅ All UI properly formatted in each language
- ✅ Notifications display in selected language

### Phase 8 (Documentation):

- ✅ All docs organized in `lib/docs/medify_v1.0.0/`
- ✅ Master index with easy navigation
- ✅ Comprehensive feature documentation
- ✅ Version-based structure for future releases

### Phase 9 (Play Store):

- ✅ Complete submission checklist
- ✅ All assets ready
- ✅ Signed release APK/AAB
- ✅ Ready to publish

---

## 🚀 EXECUTION PLAN

### Order of Execution:

1. ✅ Create this plan document
2. ⏳ **Start Phase 1: Font Migration** (Quick win, 2 hours)
3. ⏳ **Phase 2: i18n Infrastructure** (Foundation, 3 hours)
4. ⏳ **Phase 3: String Extraction** (Most time-consuming, 4 hours)
5. ⏳ **Phase 4 & 5: Translations** (Parallel if possible, 6 hours)
6. ⏳ **Phase 6: Language Switcher** (2 hours)
7. ⏳ **Phase 7: Testing** (Critical, 2 hours)
8. ⏳ **Phase 8: Documentation** (Can be done in parallel, 2 hours)
9. ⏳ **Phase 9: Play Store Checklist** (Final step, 1 hour)

---

## 📝 NOTES

- All work will be committed incrementally after each phase
- Testing will be done continuously, not just in Phase 7
- Documentation will be created as features are implemented
- User approval will be sought before proceeding to Play Store submission

---

**Status:** Ready to execute ✅  
**Next Step:** Begin Phase 1 - Font Migration
