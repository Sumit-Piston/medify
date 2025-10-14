import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../domain/entities/medicine.dart';
import '../utils/date_time_utils.dart';

/// Service for managing local notifications
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  /// Initialize notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone database
    tz.initializeTimeZones();
    tz.setLocalLocation(
      tz.getLocation('America/New_York'),
    ); // Set your timezone

    // Android initialization settings
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // iOS initialization settings
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    // Initialize plugin
    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    _isInitialized = true;
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    // TODO: Navigate to specific medicine or log screen
    // Can parse payload to determine action
    // Silently handle for now - will implement navigation later
  }

  /// Request notification permissions
  Future<bool> requestPermissions() async {
    if (await Permission.notification.isGranted) {
      return true;
    }

    final status = await Permission.notification.request();
    return status.isGranted;
  }

  /// Check if notifications are enabled
  Future<bool> areNotificationsEnabled() async {
    return await Permission.notification.isGranted;
  }

  /// Schedule daily notifications for a medicine
  Future<void> scheduleMedicineReminders(Medicine medicine) async {
    if (!medicine.isActive) {
      // Don't schedule for inactive medicines
      return;
    }

    // Cancel existing notifications for this medicine
    await cancelMedicineReminders(medicine.id!);

    // Schedule notification for each reminder time
    for (int i = 0; i < medicine.reminderTimes.length; i++) {
      final seconds = medicine.reminderTimes[i];
      await _scheduleDailyNotification(
        medicineId: medicine.id!,
        timeIndex: i,
        seconds: seconds,
        medicineName: medicine.name,
        dosage: medicine.dosage,
      );
    }
  }

  /// Schedule a single daily notification
  Future<void> _scheduleDailyNotification({
    required int medicineId,
    required int timeIndex,
    required int seconds,
    required String medicineName,
    required String dosage,
  }) async {
    // Generate unique notification ID
    final notificationId = _generateNotificationId(medicineId, timeIndex);

    // Convert seconds to DateTime
    final now = DateTime.now();
    final scheduledTime = DateTimeUtils.secondsToDateTime(seconds);

    // If time has passed today, schedule for tomorrow
    final scheduledDateTime = scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 1))
        : scheduledTime;

    // Convert to TZDateTime
    final tzDateTime = tz.TZDateTime.from(scheduledDateTime, tz.local);

    // Android notification details
    const androidDetails = AndroidNotificationDetails(
      'medicine_reminders', // channel ID
      'Medicine Reminders', // channel name
      channelDescription: 'Notifications for medicine reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      sound: RawResourceAndroidNotificationSound('notification_sound'),
      enableVibration: true,
      playSound: true,
      styleInformation: BigTextStyleInformation(''),
    );

    // iOS notification details
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'notification_sound.aiff',
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Schedule the notification
    await _notifications.zonedSchedule(
      notificationId,
      'Time to take your medicine',
      '$medicineName - $dosage',
      tzDateTime,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily
      payload: 'medicine_$medicineId',
    );
  }

  /// Cancel all reminders for a medicine
  Future<void> cancelMedicineReminders(int medicineId) async {
    // Cancel all possible notification IDs for this medicine
    // Assuming max 10 reminder times per medicine
    for (int i = 0; i < 10; i++) {
      final notificationId = _generateNotificationId(medicineId, i);
      await _notifications.cancel(notificationId);
    }
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  /// Show immediate notification (for testing)
  Future<void> showImmediateNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'medicine_reminders',
      'Medicine Reminders',
      channelDescription: 'Notifications for medicine reminders',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch % 100000, // Random ID
      title,
      body,
      details,
      payload: payload,
    );
  }

  /// Generate unique notification ID from medicine ID and time index
  int _generateNotificationId(int medicineId, int timeIndex) {
    // Combine medicine ID and time index to create unique ID
    // Format: medicineId * 100 + timeIndex
    // This allows up to 100 reminder times per medicine
    return (medicineId * 100) + timeIndex;
  }

  /// Get notification ID for a specific medicine and time
  int getNotificationId(int medicineId, int timeIndex) {
    return _generateNotificationId(medicineId, timeIndex);
  }

  /// Reschedule all active medicine reminders
  Future<void> rescheduleAllReminders(List<Medicine> medicines) async {
    await cancelAllNotifications();

    for (final medicine in medicines) {
      if (medicine.isActive) {
        await scheduleMedicineReminders(medicine);
      }
    }
  }
}
