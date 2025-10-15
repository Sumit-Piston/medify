// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Medify';

  @override
  String get appTagline => 'आपकी स्वास्थ्य यात्रा का साथी';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सहेजें';

  @override
  String get delete => 'हटाएं';

  @override
  String get edit => 'संपादित करें';

  @override
  String get done => 'Done';

  @override
  String get close => 'Close';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get error => 'त्रुटि';

  @override
  String get success => 'सफलता';

  @override
  String get skip => 'छोड़ें';

  @override
  String get next => 'अगला';

  @override
  String get back => 'Back';

  @override
  String get reset => 'Reset';

  @override
  String get onboardingTitle1 => 'Medify में आपका स्वागत है';

  @override
  String get onboardingDesc1 =>
      'अपनी दवाई का ट्रैक रखें और कभी कोई खुराक न भूलें';

  @override
  String get onboardingTitle2 => 'समय पर रिमाइंडर';

  @override
  String get onboardingDesc2 =>
      'आपकी हर दवाई के लिए स्मार्ट नोटिफिकेशन प्राप्त करें';

  @override
  String get onboardingTitle3 => 'अपनी प्रगति ट्रैक करें';

  @override
  String get onboardingDesc3 =>
      'विस्तृत आँकड़ों और इतिहास के साथ अपने पालन की निगरानी करें';

  @override
  String get getStarted => 'शुरू करें';

  @override
  String get medicines => 'दवाइयाँ';

  @override
  String get addMedicine => 'दवाई जोड़ें';

  @override
  String get editMedicine => 'दवाई संपादित करें';

  @override
  String get deleteMedicine => 'Delete Medicine';

  @override
  String get medicineName => 'दवाई का नाम';

  @override
  String get dosage => 'खुराक';

  @override
  String get schedule => 'समय सारणी';

  @override
  String get notes => 'नोट्स';

  @override
  String get noMedicines => 'कोई दवाई नहीं';

  @override
  String get addYourFirstMedicine => 'अपनी पहली दवाई जोड़ें';

  @override
  String get intakeTiming => 'दवाई लेने का समय';

  @override
  String get beforeFood => 'खाना खाने से पहले';

  @override
  String get withFood => 'खाना खाने के साथ';

  @override
  String get afterFood => 'खाना खाने के बाद';

  @override
  String get anytime => 'कभी भी';

  @override
  String get active => 'सक्रिय';

  @override
  String get inactive => 'निष्क्रिय';

  @override
  String get reminders => 'Reminders';

  @override
  String get todaysSchedule => 'आज की समय सारणी';

  @override
  String get upcomingReminders => 'Upcoming Reminders';

  @override
  String get noReminders => 'कोई रिमाइंडर नहीं';

  @override
  String get allCaughtUp => 'सब पूरा हो गया! आज के लिए कोई दवाई नहीं।';

  @override
  String get reminderTimes => 'Reminder Times';

  @override
  String get addReminderTime => 'Add Reminder Time';

  @override
  String get selectTime => 'समय चुनें';

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
  String get addAnyway => 'वैसे भी जोड़ें';

  @override
  String get markAsTaken => 'लिया हुआ चिह्नित करें';

  @override
  String get taken => 'लिया';

  @override
  String get snooze => 'स्नूज़';

  @override
  String get undo => 'पूर्ववत करें';

  @override
  String get snoozeFor => 'Snooze for:';

  @override
  String get markAsSkipped => 'Mark as Skipped';

  @override
  String get morning => 'सुबह';

  @override
  String get afternoon => 'दोपहर';

  @override
  String get evening => 'शाम';

  @override
  String get night => 'रात';

  @override
  String get daily => 'Daily';

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get pending => 'लंबित';

  @override
  String get missed => 'छूटा';

  @override
  String get completed => 'Completed';

  @override
  String get snoozed => 'स्नूज़ किया';

  @override
  String get skipped => 'छोड़ा';

  @override
  String get overdue => 'OVERDUE';

  @override
  String get notificationPermission => 'Notification Permission';

  @override
  String get notificationPermissionDesc =>
      'यह सुनिश्चित करने के लिए कि आप कभी कोई खुराक न भूलें, हमें नोटिफिकेशन भेजने की अनुमति दें।';

  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get notificationTitle => 'दवाई का समय!';

  @override
  String notificationBody(String medicineName, String dosage) {
    return '$medicineName लेने का समय - $dosage';
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
  String get errorMedicineNameRequired => 'कृपया दवाई का नाम दर्ज करें';

  @override
  String get errorDosageRequired => 'कृपया खुराक दर्ज करें';

  @override
  String get errorScheduleRequired => 'कृपया कम से कम एक समय जोड़ें';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get errorSavingData => 'Error saving data';

  @override
  String get errorDeletingData => 'Error deleting data';

  @override
  String get snooze15min => '15 मिनट';

  @override
  String get snooze30min => '30 मिनट';

  @override
  String get snooze1hour => '1 घंटा';

  @override
  String get snooze5min => 'Snooze (5 min)';

  @override
  String get deleteConfirmation => 'क्या आप वाकई इस दवाई को हटाना चाहते हैं?';

  @override
  String get deleteMedicineConfirmation =>
      'Are you sure you want to delete this medicine?';

  @override
  String get deleteMedicineWarning =>
      'This will delete all associated reminders and history';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get app => 'App';

  @override
  String get theme => 'थीम';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get systemDefault => 'System Default';

  @override
  String get notifications => 'नोटिफिकेशन';

  @override
  String get snoozeDuration => 'Snooze Duration';

  @override
  String get snoozeDurationDesc => 'Default snooze duration for reminders';

  @override
  String get about => 'के बारे में';

  @override
  String get version => 'संस्करण';

  @override
  String get medicineHistory => 'दवाई इतिहास';

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
      'Medify एक व्यापक दवाई रिमाइंडर और ट्रैकर ऐप है जो आपको अपने स्वास्थ्य के शीर्ष पर रहने में मदद करता है।';

  @override
  String get copyrightNotice => '© 2025 Medify. सर्वाधिकार सुरक्षित।';

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
  String get statistics => 'आँकड़े';

  @override
  String get overview => 'Overview';

  @override
  String get adherence => 'Adherence';

  @override
  String get currentStreak => 'वर्तमान स्ट्रीक';

  @override
  String get bestStreak => 'सर्वश्रेष्ठ स्ट्रीक';

  @override
  String get days => 'दिन';

  @override
  String get medicinesTracked => 'Medicines Tracked';

  @override
  String get totalDoses => 'Total Doses';

  @override
  String get takenToday => 'Taken Today';

  @override
  String get adherenceRate => 'पालन दर';

  @override
  String get adherenceTrend => 'Adherence Trend';

  @override
  String get last30Days => 'पिछले 30 दिन';

  @override
  String get last7Days => 'पिछले 7 दिन';

  @override
  String get medicineBreakdown => 'दवाई विवरण';

  @override
  String get noDataAvailable => 'कोई डेटा उपलब्ध नहीं है';

  @override
  String get startTrackingMessage =>
      'Start tracking your medicines to see statistics';

  @override
  String get history => 'इतिहास';

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
  String get exportToCsv => 'CSV में निर्यात करें';

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
  String get language => 'भाषा';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिंदी';

  @override
  String get bengali => 'বাংলা';
}
