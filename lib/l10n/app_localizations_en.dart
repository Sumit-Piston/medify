// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Medify';

  @override
  String get appTagline => 'Never Miss Your Medicine';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get done => 'Done';

  @override
  String get close => 'Close';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get reset => 'Reset';

  @override
  String get onboardingTitle1 => 'Welcome to Medify';

  @override
  String get onboardingDesc1 => 'Your personal medicine reminder and tracker';

  @override
  String get onboardingTitle2 => 'Never Miss a Dose';

  @override
  String get onboardingDesc2 => 'Get timely reminders for all your medications';

  @override
  String get onboardingTitle3 => 'Track Your Progress';

  @override
  String get onboardingDesc3 =>
      'Keep track of your medication history and adherence';

  @override
  String get getStarted => 'Get Started';

  @override
  String get medicines => 'Medicines';

  @override
  String get addMedicine => 'Add Medicine';

  @override
  String get editMedicine => 'Edit Medicine';

  @override
  String get deleteMedicine => 'Delete Medicine';

  @override
  String get medicineName => 'Medicine Name';

  @override
  String get dosage => 'Dosage';

  @override
  String get schedule => 'Schedule';

  @override
  String get notes => 'Notes';

  @override
  String get noMedicines => 'No medicines added yet';

  @override
  String get addYourFirstMedicine => 'Add your first medicine';

  @override
  String get intakeTiming => 'Intake Timing';

  @override
  String get beforeFood => 'Before Food';

  @override
  String get withFood => 'With Food';

  @override
  String get afterFood => 'After Food';

  @override
  String get anytime => 'Anytime';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get reminders => 'Reminders';

  @override
  String get todaysSchedule => 'Today\'s Schedule';

  @override
  String get upcomingReminders => 'Upcoming Reminders';

  @override
  String get noReminders => 'No reminders for today';

  @override
  String get allCaughtUp => 'You\'re all caught up!';

  @override
  String get reminderTimes => 'Reminder Times';

  @override
  String get addReminderTime => 'Add Reminder Time';

  @override
  String get selectTime => 'Select Time';

  @override
  String get timeAlreadyPassed => 'Time Already Passed';

  @override
  String timePassedMessage(String time) {
    return 'The time $time has already passed today.';
  }

  @override
  String firstReminderTomorrow(String time) {
    return 'First reminder will be scheduled for tomorrow at $time';
  }

  @override
  String get addAnyway => 'Add Anyway';

  @override
  String get markAsTaken => 'Mark as Taken';

  @override
  String get taken => 'Taken';

  @override
  String get snooze => 'Snooze';

  @override
  String get undo => 'Undo';

  @override
  String get snoozeFor => 'Snooze for:';

  @override
  String get markAsSkipped => 'Mark as Skipped';

  @override
  String get morning => 'Morning';

  @override
  String get afternoon => 'Afternoon';

  @override
  String get evening => 'Evening';

  @override
  String get night => 'Night';

  @override
  String get daily => 'Daily';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get pending => 'Pending';

  @override
  String get missed => 'Missed';

  @override
  String get completed => 'Completed';

  @override
  String get snoozed => 'Snoozed';

  @override
  String get skipped => 'Skipped';

  @override
  String get overdue => 'OVERDUE';

  @override
  String get notificationPermission => 'Notification Permission';

  @override
  String get notificationPermissionDesc =>
      'We need notification permission to remind you about your medicines';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get notificationTitle => 'Time to take your medicine';

  @override
  String notificationBody(String medicineName, String dosage) {
    return 'It\'s time to take $medicineName ($dosage). Don\'t forget your medicine!';
  }

  @override
  String get snoozeNotification => 'Reminder: Time to take your medicine';

  @override
  String get notificationsEnabled => 'Notifications Enabled';

  @override
  String get notificationsDisabled => 'Notifications Disabled';

  @override
  String get errorGeneric => 'Something went wrong';

  @override
  String get errorNoInternet => 'No internet connection';

  @override
  String get errorInvalidInput => 'Please check your input';

  @override
  String get errorMedicineNameRequired => 'Medicine name is required';

  @override
  String get errorDosageRequired => 'Dosage is required';

  @override
  String get errorScheduleRequired => 'At least one time is required';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get errorSavingData => 'Error saving data';

  @override
  String get errorDeletingData => 'Error deleting data';

  @override
  String get snooze15min => '15 minutes';

  @override
  String get snooze30min => '30 minutes';

  @override
  String get snooze1hour => '1 hour';

  @override
  String get snooze5min => 'Snooze (5 min)';

  @override
  String get deleteConfirmation => 'Delete Confirmation';

  @override
  String get deleteMedicineConfirmation =>
      'Are you sure you want to delete this medicine?';

  @override
  String get deleteMedicineWarning =>
      'This will delete all associated reminders and history';

  @override
  String get settings => 'Settings';

  @override
  String get app => 'App';

  @override
  String get theme => 'Theme';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get systemDefault => 'System Default';

  @override
  String get notifications => 'Notifications';

  @override
  String get snoozeDuration => 'Snooze Duration';

  @override
  String get snoozeDurationDesc => 'Default snooze duration for reminders';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get medicineHistory => 'Medicine History';

  @override
  String get viewHistory => 'View complete medicine history';

  @override
  String get resetAllSettings => 'Reset All Settings';

  @override
  String get resetSettings => 'Reset Settings';

  @override
  String get resetConfirmation =>
      'Are you sure you want to reset all settings to default values?';

  @override
  String get settingsResetSuccess => 'Settings reset to default';

  @override
  String get aboutDialogDesc =>
      'A simple and accessible medicine reminder app designed for everyone, especially elderly users.';

  @override
  String get copyrightNotice => '© 2025 Medify. All rights reserved.';

  @override
  String get addMedicineInstruction =>
      'Add a new medicine and set reminder times';

  @override
  String get updateMedicineInstruction => 'Update your medicine details';

  @override
  String get exampleName => 'e.g., Aspirin';

  @override
  String get exampleDosage => 'e.g., 500mg, 2 tablets';

  @override
  String get exampleNotes => 'e.g., Take with food';

  @override
  String get statistics => 'Statistics';

  @override
  String get overview => 'Overview';

  @override
  String get adherence => 'Adherence';

  @override
  String get currentStreak => 'Current Streak';

  @override
  String get bestStreak => 'Best Streak';

  @override
  String get days => 'days';

  @override
  String get medicinesTracked => 'Medicines Tracked';

  @override
  String get totalDoses => 'Total Doses';

  @override
  String get takenToday => 'Taken Today';

  @override
  String get adherenceRate => 'Adherence Rate';

  @override
  String get adherenceTrend => 'Adherence Trend';

  @override
  String get last30Days => 'Last 30 Days';

  @override
  String get last7Days => 'Last 7 Days';

  @override
  String get medicineBreakdown => 'Medicine Breakdown';

  @override
  String get noDataAvailable => 'Not enough data yet';

  @override
  String get startTrackingMessage =>
      'Start tracking your medicines to see statistics';

  @override
  String get history => 'History';

  @override
  String get medicineLog => 'Medicine Log';

  @override
  String get filter => 'Filter';

  @override
  String get allMedicines => 'All Medicines';

  @override
  String get allStatuses => 'All Statuses';

  @override
  String get exportData => 'Export Data';

  @override
  String get exportToCsv => 'Export to CSV';

  @override
  String get dataExportedSuccess => 'Data exported successfully';

  @override
  String get noLogsFound => 'No logs found for selected date';

  @override
  String get noLogsForFilter => 'No logs found for this filter';

  @override
  String get selectDate => 'Select Date';

  @override
  String get home => 'Home';

  @override
  String get medicineAddedSuccess => 'Medicine added successfully';

  @override
  String get medicineUpdatedSuccess => 'Medicine updated successfully';

  @override
  String get medicineDeletedSuccess => 'Medicine deleted successfully';

  @override
  String get markedAsTaken => 'Marked as taken';

  @override
  String get markedAsSkipped => 'Marked as skipped';

  @override
  String snoozedFor(int minutes) {
    return 'Snoozed for $minutes minutes';
  }

  @override
  String get progressToday => 'Today\'s Progress';

  @override
  String dosesCompleted(int completed, int total) {
    return '$completed of $total doses completed';
  }

  @override
  String get emptyMedicineList => 'No medicines yet';

  @override
  String get emptyMedicineListDesc => 'Tap + to add your first medicine';

  @override
  String get emptySchedule => 'All clear for today!';

  @override
  String get emptyScheduleDesc => 'No pending reminders';

  @override
  String get emptyHistory => 'No history yet';

  @override
  String get emptyHistoryDesc => 'Medicine logs will appear here';

  @override
  String get emptyStatistics => 'No data yet';

  @override
  String get emptyStatisticsDesc =>
      'Start taking medicines to see your statistics';

  @override
  String get morningPeriod => '5 AM - 12 PM';

  @override
  String get afternoonPeriod => '12 PM - 5 PM';

  @override
  String get eveningPeriod => '5 PM - 9 PM';

  @override
  String get nightPeriod => '9 PM - 5 AM';

  @override
  String medicineCount(int count) {
    return '$count medicine';
  }

  @override
  String medicinesCount(int count) {
    return '$count medicines';
  }

  @override
  String takenCount(int count) {
    return '$count taken';
  }

  @override
  String pendingCount(int count) {
    return '$count pending';
  }

  @override
  String overdueCount(int count) {
    return '$count overdue';
  }

  @override
  String takenAt(String time) {
    return 'Taken at $time';
  }
}
