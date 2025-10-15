// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Medify';

  @override
  String get appTagline => 'আপনার স্বাস্থ্য যাত্রার সঙ্গী';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'বাতিল করুন';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get delete => 'মুছুন';

  @override
  String get edit => 'সম্পাদনা';

  @override
  String get done => 'Done';

  @override
  String get close => 'Close';

  @override
  String get retry => 'পুনরায় চেষ্টা করুন';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String get error => 'ত্রুটি';

  @override
  String get success => 'সফলতা';

  @override
  String get skip => 'এড়িয়ে যান';

  @override
  String get next => 'পরবর্তী';

  @override
  String get back => 'Back';

  @override
  String get reset => 'Reset';

  @override
  String get onboardingTitle1 => 'Medify তে স্বাগতম';

  @override
  String get onboardingDesc1 =>
      'আপনার ওষুধ ট্র্যাক করুন এবং কখনোই কোনো ডোজ মিস করবেন না';

  @override
  String get onboardingTitle2 => 'সময়মতো রিমাইন্ডার';

  @override
  String get onboardingDesc2 =>
      'আপনার প্রতিটি ওষুধের জন্য স্মার্ট নোটিফিকেশন পান';

  @override
  String get onboardingTitle3 => 'আপনার অগ্রগতি ট্র্যাক করুন';

  @override
  String get onboardingDesc3 =>
      'বিস্তারিত পরিসংখ্যান এবং ইতিহাস দিয়ে আপনার পালন পর্যবেক্ষণ করুন';

  @override
  String get getStarted => 'শুরু করুন';

  @override
  String get medicines => 'ওষুধ';

  @override
  String get addMedicine => 'ওষুধ যোগ করুন';

  @override
  String get editMedicine => 'ওষুধ সম্পাদনা করুন';

  @override
  String get deleteMedicine => 'Delete Medicine';

  @override
  String get medicineName => 'ওষুধের নাম';

  @override
  String get dosage => 'ডোজ';

  @override
  String get schedule => 'সময়সূচী';

  @override
  String get notes => 'নোট';

  @override
  String get noMedicines => 'কোনো ওষুধ নেই';

  @override
  String get addYourFirstMedicine => 'আপনার প্রথম ওষুধ যোগ করুন';

  @override
  String get intakeTiming => 'ওষুধ সেবনের সময়';

  @override
  String get beforeFood => 'খাবারের আগে';

  @override
  String get withFood => 'খাবারের সাথে';

  @override
  String get afterFood => 'খাবারের পরে';

  @override
  String get anytime => 'যেকোনো সময়';

  @override
  String get active => 'সক্রিয়';

  @override
  String get inactive => 'নিষ্ক্রিয়';

  @override
  String get reminders => 'Reminders';

  @override
  String get todaysSchedule => 'আজকের সময়সূচী';

  @override
  String get upcomingReminders => 'Upcoming Reminders';

  @override
  String get noReminders => 'কোনো রিমাইন্ডার নেই';

  @override
  String get allCaughtUp => 'সব শেষ! আজকের জন্য কোনো ওষুধ নেই।';

  @override
  String get reminderTimes => 'Reminder Times';

  @override
  String get addReminderTime => 'Add Reminder Time';

  @override
  String get selectTime => 'সময় নির্বাচন করুন';

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
  String get addAnyway => 'যাইহোক যোগ করুন';

  @override
  String get markAsTaken => 'নেওয়া হিসেবে চিহ্নিত করুন';

  @override
  String get taken => 'নেওয়া হয়েছে';

  @override
  String get snooze => 'স্নুজ';

  @override
  String get undo => 'পূর্বাবস্থায় ফিরুন';

  @override
  String get snoozeFor => 'Snooze for:';

  @override
  String get markAsSkipped => 'Mark as Skipped';

  @override
  String get morning => 'সকাল';

  @override
  String get afternoon => 'দুপুর';

  @override
  String get evening => 'সন্ধ্যা';

  @override
  String get night => 'রাত';

  @override
  String get daily => 'Daily';

  @override
  String get today => 'আজ';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get pending => 'অপেক্ষমাণ';

  @override
  String get missed => 'মিস হয়েছে';

  @override
  String get completed => 'Completed';

  @override
  String get snoozed => 'স্নুজ করা হয়েছে';

  @override
  String get skipped => 'এড়িয়ে গেছে';

  @override
  String get overdue => 'OVERDUE';

  @override
  String get notificationPermission => 'Notification Permission';

  @override
  String get notificationPermissionDesc =>
      'নিশ্চিত করতে যে আপনি কখনোই কোনো ডোজ মিস করবেন না, আমাদের নোটিফিকেশন পাঠানোর অনুমতি দিন।';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get notificationTitle => 'ওষুধের সময়!';

  @override
  String notificationBody(String medicineName, String dosage) {
    return '$medicineName নেওয়ার সময় - $dosage';
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
  String get errorMedicineNameRequired => 'অনুগ্রহ করে ওষুধের নাম লিখুন';

  @override
  String get errorDosageRequired => 'অনুগ্রহ করে ডোজ লিখুন';

  @override
  String get errorScheduleRequired => 'অনুগ্রহ করে কমপক্ষে একটি সময় যোগ করুন';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get errorSavingData => 'Error saving data';

  @override
  String get errorDeletingData => 'Error deleting data';

  @override
  String get snooze15min => '১৫ মিনিট';

  @override
  String get snooze30min => '৩০ মিনিট';

  @override
  String get snooze1hour => '১ ঘন্টা';

  @override
  String get snooze5min => 'Snooze (5 min)';

  @override
  String get deleteConfirmation => 'আপনি কি সত্যিই এই ওষুধটি মুছতে চান?';

  @override
  String get deleteMedicineConfirmation =>
      'Are you sure you want to delete this medicine?';

  @override
  String get deleteMedicineWarning =>
      'This will delete all associated reminders and history';

  @override
  String get settings => 'সেটিংস';

  @override
  String get app => 'App';

  @override
  String get theme => 'থিম';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get systemDefault => 'System Default';

  @override
  String get notifications => 'নোটিফিকেশন';

  @override
  String get snoozeDuration => 'Snooze Duration';

  @override
  String get snoozeDurationDesc => 'Default snooze duration for reminders';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get version => 'সংস্করণ';

  @override
  String get medicineHistory => 'ওষুধের ইতিহাস';

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
      'Medify একটি ব্যাপক ওষুধ রিমাইন্ডার এবং ট্র্যাকার অ্যাপ যা আপনাকে আপনার স্বাস্থ্যের শীর্ষে থাকতে সাহায্য করে।';

  @override
  String get copyrightNotice => '© ২০২৫ Medify। সমস্ত অধিকার সংরক্ষিত।';

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
  String get statistics => 'পরিসংখ্যান';

  @override
  String get overview => 'Overview';

  @override
  String get adherence => 'Adherence';

  @override
  String get currentStreak => 'বর্তমান স্ট্রিক';

  @override
  String get bestStreak => 'সেরা স্ট্রিক';

  @override
  String get days => 'দিন';

  @override
  String get medicinesTracked => 'Medicines Tracked';

  @override
  String get totalDoses => 'Total Doses';

  @override
  String get takenToday => 'Taken Today';

  @override
  String get adherenceRate => 'পালন হার';

  @override
  String get adherenceTrend => 'Adherence Trend';

  @override
  String get last30Days => 'শেষ ৩০ দিন';

  @override
  String get last7Days => 'শেষ ৭ দিন';

  @override
  String get medicineBreakdown => 'ওষুধ বিবরণ';

  @override
  String get noDataAvailable => 'কোনো ডেটা উপলব্ধ নেই';

  @override
  String get startTrackingMessage =>
      'Start tracking your medicines to see statistics';

  @override
  String get history => 'ইতিহাস';

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
  String get exportToCsv => 'CSV তে রপ্তানি করুন';

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

  @override
  String get language => 'ভাষা';

  @override
  String get selectLanguage => 'ভাষা নির্বাচন করুন';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get bengali => 'বাংলা';
}
