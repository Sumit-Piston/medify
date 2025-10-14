import '../entities/medicine_log.dart';

/// Repository interface for MedicineLog operations
abstract class MedicineLogRepository {
  /// Get all logs
  Future<List<MedicineLog>> getAllLogs();

  /// Get logs for a specific medicine
  Future<List<MedicineLog>> getLogsByMedicineId(int medicineId);

  /// Get logs for today
  Future<List<MedicineLog>> getTodayLogs();

  /// Get logs for a specific date
  Future<List<MedicineLog>> getLogsByDate(DateTime date);

  /// Get log by ID
  Future<MedicineLog?> getLogById(int id);

  /// Add a new log
  Future<MedicineLog> addLog(MedicineLog log);

  /// Update an existing log
  Future<MedicineLog> updateLog(MedicineLog log);

  /// Delete a log
  Future<void> deleteLog(int id);

  /// Mark log as taken
  Future<MedicineLog> markAsTaken(int id);

  /// Mark log as skipped
  Future<MedicineLog> markAsSkipped(int id);

  /// Mark log as missed
  Future<MedicineLog> markAsMissed(int id);

  /// Snooze log by specified minutes
  Future<MedicineLog> snoozeLog(int id, int minutes);

  /// Get overdue logs
  Future<List<MedicineLog>> getOverdueLogs();

  /// Get pending logs
  Future<List<MedicineLog>> getPendingLogs();

  /// Stream of today's logs
  Stream<List<MedicineLog>> watchTodayLogs();

  /// Stream of logs for a specific medicine
  Stream<List<MedicineLog>> watchLogsByMedicineId(int medicineId);
}

