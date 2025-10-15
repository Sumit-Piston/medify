import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'Medify'**
  String get appName;

  /// App tagline shown on onboarding
  ///
  /// In en, this message translates to:
  /// **'Never Miss Your Medicine'**
  String get appTagline;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Title for first onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Welcome to Medify'**
  String get onboardingTitle1;

  /// Description for first onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Your personal medicine reminder and tracker'**
  String get onboardingDesc1;

  /// Title for second onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Never Miss a Dose'**
  String get onboardingTitle2;

  /// Description for second onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Get timely reminders for all your medications'**
  String get onboardingDesc2;

  /// Title for third onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Track Your Progress'**
  String get onboardingTitle3;

  /// Description for third onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Keep track of your medication history and adherence'**
  String get onboardingDesc3;

  /// Button to complete onboarding
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @medicines.
  ///
  /// In en, this message translates to:
  /// **'Medicines'**
  String get medicines;

  /// No description provided for @addMedicine.
  ///
  /// In en, this message translates to:
  /// **'Add Medicine'**
  String get addMedicine;

  /// No description provided for @editMedicine.
  ///
  /// In en, this message translates to:
  /// **'Edit Medicine'**
  String get editMedicine;

  /// No description provided for @deleteMedicine.
  ///
  /// In en, this message translates to:
  /// **'Delete Medicine'**
  String get deleteMedicine;

  /// No description provided for @medicineName.
  ///
  /// In en, this message translates to:
  /// **'Medicine Name'**
  String get medicineName;

  /// No description provided for @dosage.
  ///
  /// In en, this message translates to:
  /// **'Dosage'**
  String get dosage;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @noMedicines.
  ///
  /// In en, this message translates to:
  /// **'No medicines added yet'**
  String get noMedicines;

  /// No description provided for @addYourFirstMedicine.
  ///
  /// In en, this message translates to:
  /// **'Add your first medicine'**
  String get addYourFirstMedicine;

  /// No description provided for @intakeTiming.
  ///
  /// In en, this message translates to:
  /// **'Intake Timing'**
  String get intakeTiming;

  /// No description provided for @beforeFood.
  ///
  /// In en, this message translates to:
  /// **'Before Food'**
  String get beforeFood;

  /// No description provided for @withFood.
  ///
  /// In en, this message translates to:
  /// **'With Food'**
  String get withFood;

  /// No description provided for @afterFood.
  ///
  /// In en, this message translates to:
  /// **'After Food'**
  String get afterFood;

  /// No description provided for @anytime.
  ///
  /// In en, this message translates to:
  /// **'Anytime'**
  String get anytime;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @todaysSchedule.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Schedule'**
  String get todaysSchedule;

  /// No description provided for @upcomingReminders.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Reminders'**
  String get upcomingReminders;

  /// No description provided for @noReminders.
  ///
  /// In en, this message translates to:
  /// **'No reminders for today'**
  String get noReminders;

  /// No description provided for @allCaughtUp.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up!'**
  String get allCaughtUp;

  /// No description provided for @reminderTimes.
  ///
  /// In en, this message translates to:
  /// **'Reminder Times'**
  String get reminderTimes;

  /// No description provided for @addReminderTime.
  ///
  /// In en, this message translates to:
  /// **'Add Reminder Time'**
  String get addReminderTime;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// No description provided for @timeAlreadyPassed.
  ///
  /// In en, this message translates to:
  /// **'Time Already Passed'**
  String get timeAlreadyPassed;

  /// Message shown when selected time has passed
  ///
  /// In en, this message translates to:
  /// **'The time {time} has already passed today.'**
  String timePassedMessage(String time);

  /// Info about next reminder time
  ///
  /// In en, this message translates to:
  /// **'First reminder will be scheduled for tomorrow at {time}'**
  String firstReminderTomorrow(String time);

  /// No description provided for @addAnyway.
  ///
  /// In en, this message translates to:
  /// **'Add Anyway'**
  String get addAnyway;

  /// No description provided for @markAsTaken.
  ///
  /// In en, this message translates to:
  /// **'Mark as Taken'**
  String get markAsTaken;

  /// No description provided for @taken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get taken;

  /// No description provided for @snooze.
  ///
  /// In en, this message translates to:
  /// **'Snooze'**
  String get snooze;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @snoozeFor.
  ///
  /// In en, this message translates to:
  /// **'Snooze for:'**
  String get snoozeFor;

  /// No description provided for @markAsSkipped.
  ///
  /// In en, this message translates to:
  /// **'Mark as Skipped'**
  String get markAsSkipped;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get afternoon;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get evening;

  /// No description provided for @night.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get night;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @missed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get missed;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @snoozed.
  ///
  /// In en, this message translates to:
  /// **'Snoozed'**
  String get snoozed;

  /// No description provided for @skipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get skipped;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'OVERDUE'**
  String get overdue;

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get notificationPermission;

  /// No description provided for @notificationPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'We need notification permission to remind you about your medicines'**
  String get notificationPermissionDesc;

  /// No description provided for @grantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Time to take your medicine'**
  String get notificationTitle;

  /// Notification body text
  ///
  /// In en, this message translates to:
  /// **'It\'s time to take {medicineName} ({dosage}). Don\'t forget your medicine!'**
  String notificationBody(String medicineName, String dosage);

  /// No description provided for @snoozeNotification.
  ///
  /// In en, this message translates to:
  /// **'Reminder: Time to take your medicine'**
  String get snoozeNotification;

  /// No description provided for @notificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications Enabled'**
  String get notificationsEnabled;

  /// No description provided for @notificationsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications Disabled'**
  String get notificationsDisabled;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGeneric;

  /// No description provided for @errorNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorNoInternet;

  /// No description provided for @errorInvalidInput.
  ///
  /// In en, this message translates to:
  /// **'Please check your input'**
  String get errorInvalidInput;

  /// No description provided for @errorMedicineNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Medicine name is required'**
  String get errorMedicineNameRequired;

  /// No description provided for @errorDosageRequired.
  ///
  /// In en, this message translates to:
  /// **'Dosage is required'**
  String get errorDosageRequired;

  /// No description provided for @errorScheduleRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one time is required'**
  String get errorScheduleRequired;

  /// No description provided for @errorLoadingData.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get errorLoadingData;

  /// No description provided for @errorSavingData.
  ///
  /// In en, this message translates to:
  /// **'Error saving data'**
  String get errorSavingData;

  /// No description provided for @errorDeletingData.
  ///
  /// In en, this message translates to:
  /// **'Error deleting data'**
  String get errorDeletingData;

  /// No description provided for @snooze15min.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get snooze15min;

  /// No description provided for @snooze30min.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get snooze30min;

  /// No description provided for @snooze1hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get snooze1hour;

  /// No description provided for @snooze5min.
  ///
  /// In en, this message translates to:
  /// **'Snooze (5 min)'**
  String get snooze5min;

  /// No description provided for @deleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Delete Confirmation'**
  String get deleteConfirmation;

  /// No description provided for @deleteMedicineConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this medicine?'**
  String get deleteMedicineConfirmation;

  /// No description provided for @deleteMedicineWarning.
  ///
  /// In en, this message translates to:
  /// **'This will delete all associated reminders and history'**
  String get deleteMedicineWarning;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @app.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get app;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @snoozeDuration.
  ///
  /// In en, this message translates to:
  /// **'Snooze Duration'**
  String get snoozeDuration;

  /// No description provided for @snoozeDurationDesc.
  ///
  /// In en, this message translates to:
  /// **'Default snooze duration for reminders'**
  String get snoozeDurationDesc;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @medicineHistory.
  ///
  /// In en, this message translates to:
  /// **'Medicine History'**
  String get medicineHistory;

  /// No description provided for @viewHistory.
  ///
  /// In en, this message translates to:
  /// **'View complete medicine history'**
  String get viewHistory;

  /// No description provided for @resetAllSettings.
  ///
  /// In en, this message translates to:
  /// **'Reset All Settings'**
  String get resetAllSettings;

  /// No description provided for @resetSettings.
  ///
  /// In en, this message translates to:
  /// **'Reset Settings'**
  String get resetSettings;

  /// No description provided for @resetConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset all settings to default values?'**
  String get resetConfirmation;

  /// No description provided for @settingsResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Settings reset to default'**
  String get settingsResetSuccess;

  /// No description provided for @aboutDialogDesc.
  ///
  /// In en, this message translates to:
  /// **'A simple and accessible medicine reminder app designed for everyone, especially elderly users.'**
  String get aboutDialogDesc;

  /// No description provided for @copyrightNotice.
  ///
  /// In en, this message translates to:
  /// **'© 2025 Medify. All rights reserved.'**
  String get copyrightNotice;

  /// No description provided for @addMedicineInstruction.
  ///
  /// In en, this message translates to:
  /// **'Add a new medicine and set reminder times'**
  String get addMedicineInstruction;

  /// No description provided for @updateMedicineInstruction.
  ///
  /// In en, this message translates to:
  /// **'Update your medicine details'**
  String get updateMedicineInstruction;

  /// No description provided for @exampleName.
  ///
  /// In en, this message translates to:
  /// **'e.g., Aspirin'**
  String get exampleName;

  /// No description provided for @exampleDosage.
  ///
  /// In en, this message translates to:
  /// **'e.g., 500mg, 2 tablets'**
  String get exampleDosage;

  /// No description provided for @exampleNotes.
  ///
  /// In en, this message translates to:
  /// **'e.g., Take with food'**
  String get exampleNotes;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @adherence.
  ///
  /// In en, this message translates to:
  /// **'Adherence'**
  String get adherence;

  /// No description provided for @currentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get currentStreak;

  /// No description provided for @bestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best Streak'**
  String get bestStreak;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @medicinesTracked.
  ///
  /// In en, this message translates to:
  /// **'Medicines Tracked'**
  String get medicinesTracked;

  /// No description provided for @totalDoses.
  ///
  /// In en, this message translates to:
  /// **'Total Doses'**
  String get totalDoses;

  /// No description provided for @takenToday.
  ///
  /// In en, this message translates to:
  /// **'Taken Today'**
  String get takenToday;

  /// No description provided for @adherenceRate.
  ///
  /// In en, this message translates to:
  /// **'Adherence Rate'**
  String get adherenceRate;

  /// No description provided for @adherenceTrend.
  ///
  /// In en, this message translates to:
  /// **'Adherence Trend'**
  String get adherenceTrend;

  /// No description provided for @last30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get last30Days;

  /// No description provided for @last7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get last7Days;

  /// No description provided for @medicineBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Medicine Breakdown'**
  String get medicineBreakdown;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not enough data yet'**
  String get noDataAvailable;

  /// No description provided for @startTrackingMessage.
  ///
  /// In en, this message translates to:
  /// **'Start tracking your medicines to see statistics'**
  String get startTrackingMessage;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @medicineLog.
  ///
  /// In en, this message translates to:
  /// **'Medicine Log'**
  String get medicineLog;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @allMedicines.
  ///
  /// In en, this message translates to:
  /// **'All Medicines'**
  String get allMedicines;

  /// No description provided for @allStatuses.
  ///
  /// In en, this message translates to:
  /// **'All Statuses'**
  String get allStatuses;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// No description provided for @exportToCsv.
  ///
  /// In en, this message translates to:
  /// **'Export to CSV'**
  String get exportToCsv;

  /// No description provided for @dataExportedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data exported successfully'**
  String get dataExportedSuccess;

  /// No description provided for @noLogsFound.
  ///
  /// In en, this message translates to:
  /// **'No logs found for selected date'**
  String get noLogsFound;

  /// No description provided for @noLogsForFilter.
  ///
  /// In en, this message translates to:
  /// **'No logs found for this filter'**
  String get noLogsForFilter;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @medicineAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medicine added successfully'**
  String get medicineAddedSuccess;

  /// No description provided for @medicineUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medicine updated successfully'**
  String get medicineUpdatedSuccess;

  /// No description provided for @medicineDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medicine deleted successfully'**
  String get medicineDeletedSuccess;

  /// No description provided for @markedAsTaken.
  ///
  /// In en, this message translates to:
  /// **'Marked as taken'**
  String get markedAsTaken;

  /// No description provided for @markedAsSkipped.
  ///
  /// In en, this message translates to:
  /// **'Marked as skipped'**
  String get markedAsSkipped;

  /// Toast message for snooze
  ///
  /// In en, this message translates to:
  /// **'Snoozed for {minutes} minutes'**
  String snoozedFor(int minutes);

  /// No description provided for @progressToday.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Progress'**
  String get progressToday;

  /// Progress message
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} doses completed'**
  String dosesCompleted(int completed, int total);

  /// No description provided for @emptyMedicineList.
  ///
  /// In en, this message translates to:
  /// **'No medicines yet'**
  String get emptyMedicineList;

  /// No description provided for @emptyMedicineListDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first medicine'**
  String get emptyMedicineListDesc;

  /// No description provided for @emptySchedule.
  ///
  /// In en, this message translates to:
  /// **'All clear for today!'**
  String get emptySchedule;

  /// No description provided for @emptyScheduleDesc.
  ///
  /// In en, this message translates to:
  /// **'No pending reminders'**
  String get emptyScheduleDesc;

  /// No description provided for @emptyHistory.
  ///
  /// In en, this message translates to:
  /// **'No history yet'**
  String get emptyHistory;

  /// No description provided for @emptyHistoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Medicine logs will appear here'**
  String get emptyHistoryDesc;

  /// No description provided for @emptyStatistics.
  ///
  /// In en, this message translates to:
  /// **'No data yet'**
  String get emptyStatistics;

  /// No description provided for @emptyStatisticsDesc.
  ///
  /// In en, this message translates to:
  /// **'Start taking medicines to see your statistics'**
  String get emptyStatisticsDesc;

  /// No description provided for @morningPeriod.
  ///
  /// In en, this message translates to:
  /// **'5 AM - 12 PM'**
  String get morningPeriod;

  /// No description provided for @afternoonPeriod.
  ///
  /// In en, this message translates to:
  /// **'12 PM - 5 PM'**
  String get afternoonPeriod;

  /// No description provided for @eveningPeriod.
  ///
  /// In en, this message translates to:
  /// **'5 PM - 9 PM'**
  String get eveningPeriod;

  /// No description provided for @nightPeriod.
  ///
  /// In en, this message translates to:
  /// **'9 PM - 5 AM'**
  String get nightPeriod;

  /// Medicine count
  ///
  /// In en, this message translates to:
  /// **'{count} medicine'**
  String medicineCount(int count);

  /// Medicine count plural
  ///
  /// In en, this message translates to:
  /// **'{count} medicines'**
  String medicinesCount(int count);

  /// Taken count
  ///
  /// In en, this message translates to:
  /// **'{count} taken'**
  String takenCount(int count);

  /// Pending count
  ///
  /// In en, this message translates to:
  /// **'{count} pending'**
  String pendingCount(int count);

  /// Overdue count
  ///
  /// In en, this message translates to:
  /// **'{count} overdue'**
  String overdueCount(int count);

  /// Taken time message
  ///
  /// In en, this message translates to:
  /// **'Taken at {time}'**
  String takenAt(String time);

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language'**
  String get selectLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @hindi.
  ///
  /// In en, this message translates to:
  /// **'हिंदी'**
  String get hindi;

  /// No description provided for @bengali.
  ///
  /// In en, this message translates to:
  /// **'বাংলা'**
  String get bengali;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
