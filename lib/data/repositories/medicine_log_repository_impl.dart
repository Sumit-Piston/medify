import 'dart:async';
import '../../domain/entities/medicine_log.dart';
import '../../domain/repositories/medicine_log_repository.dart';
import '../datasources/objectbox_service.dart';
import '../models/medicine_log_model.dart';
import '../../objectbox.g.dart';

/// Implementation of MedicineLogRepository using ObjectBox
class MedicineLogRepositoryImpl implements MedicineLogRepository {
  final ObjectBoxService _objectBoxService;
  final _logStreamController = StreamController<List<MedicineLog>>.broadcast();

  MedicineLogRepositoryImpl(this._objectBoxService);

  @override
  Future<List<MedicineLog>> getAllLogs() async {
    final models = _objectBoxService.medicineLogBox.getAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MedicineLog>> getLogsByMedicineId(int medicineId) async {
    final query = _objectBoxService.medicineLogBox
        .query(MedicineLogModel_.medicineId.equals(medicineId))
        .order(MedicineLogModel_.scheduledTime, flags: Order.descending)
        .build();
    final models = query.find();
    query.close();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MedicineLog>> getTodayLogs() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final query = _objectBoxService.medicineLogBox
        .query(
            MedicineLogModel_.scheduledTime.betweenDate(startOfDay, endOfDay))
        .order(MedicineLogModel_.scheduledTime)
        .build();
    final models = query.find();
    query.close();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MedicineLog>> getLogsByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final query = _objectBoxService.medicineLogBox
        .query(
            MedicineLogModel_.scheduledTime.betweenDate(startOfDay, endOfDay))
        .order(MedicineLogModel_.scheduledTime)
        .build();
    final models = query.find();
    query.close();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<MedicineLog?> getLogById(int id) async {
    final model = _objectBoxService.medicineLogBox.get(id);
    return model?.toEntity();
  }

  @override
  Future<MedicineLog> addLog(MedicineLog log) async {
    final model = MedicineLogModel.fromEntity(log);
    final id = _objectBoxService.medicineLogBox.put(model);
    model.id = id;
    _notifyListeners();
    return model.toEntity();
  }

  @override
  Future<MedicineLog> updateLog(MedicineLog log) async {
    if (log.id == null) {
      throw Exception('Log ID cannot be null for update');
    }
    final model = MedicineLogModel.fromEntity(log);
    _objectBoxService.medicineLogBox.put(model);
    _notifyListeners();
    return model.toEntity();
  }

  @override
  Future<void> deleteLog(int id) async {
    _objectBoxService.medicineLogBox.remove(id);
    _notifyListeners();
  }

  @override
  Future<MedicineLog> markAsTaken(int id) async {
    final model = _objectBoxService.medicineLogBox.get(id);
    if (model == null) {
      throw Exception('Log not found');
    }
    model.status = MedicineLogStatus.taken.index;
    model.takenTime = DateTime.now();
    model.updatedAt = DateTime.now();
    _objectBoxService.medicineLogBox.put(model);
    _notifyListeners();
    return model.toEntity();
  }

  @override
  Future<MedicineLog> markAsSkipped(int id) async {
    final model = _objectBoxService.medicineLogBox.get(id);
    if (model == null) {
      throw Exception('Log not found');
    }
    model.status = MedicineLogStatus.skipped.index;
    model.updatedAt = DateTime.now();
    _objectBoxService.medicineLogBox.put(model);
    _notifyListeners();
    return model.toEntity();
  }

  @override
  Future<MedicineLog> markAsMissed(int id) async {
    final model = _objectBoxService.medicineLogBox.get(id);
    if (model == null) {
      throw Exception('Log not found');
    }
    model.status = MedicineLogStatus.missed.index;
    model.updatedAt = DateTime.now();
    _objectBoxService.medicineLogBox.put(model);
    _notifyListeners();
    return model.toEntity();
  }

  @override
  Future<MedicineLog> snoozeLog(int id, int minutes) async {
    final model = _objectBoxService.medicineLogBox.get(id);
    if (model == null) {
      throw Exception('Log not found');
    }
    model.status = MedicineLogStatus.snoozed.index;
    model.scheduledTime = model.scheduledTime.add(Duration(minutes: minutes));
    model.updatedAt = DateTime.now();
    _objectBoxService.medicineLogBox.put(model);
    _notifyListeners();
    return model.toEntity();
  }

  @override
  Future<List<MedicineLog>> getOverdueLogs() async {
    final now = DateTime.now();
    final query = _objectBoxService.medicineLogBox
        .query(MedicineLogModel_.scheduledTime
            .lessThan(now.millisecondsSinceEpoch))
        .build();

    final models = query.find();
    query.close();

    // Filter out taken and skipped logs
    final overdueLogs = models
        .where((model) =>
            model.status != MedicineLogStatus.taken.index &&
            model.status != MedicineLogStatus.skipped.index)
        .map((model) => model.toEntity())
        .toList();

    return overdueLogs;
  }

  @override
  Future<List<MedicineLog>> getPendingLogs() async {
    final query = _objectBoxService.medicineLogBox
        .query(MedicineLogModel_.status.equals(MedicineLogStatus.pending.index))
        .order(MedicineLogModel_.scheduledTime)
        .build();
    final models = query.find();
    query.close();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Stream<List<MedicineLog>> watchTodayLogs() {
    // Initial data
    getTodayLogs().then((logs) {
      if (!_logStreamController.isClosed) {
        _logStreamController.add(logs);
      }
    });
    return _logStreamController.stream;
  }

  @override
  Stream<List<MedicineLog>> watchLogsByMedicineId(int medicineId) {
    return watchTodayLogs().map(
        (logs) => logs.where((log) => log.medicineId == medicineId).toList());
  }

  void _notifyListeners() {
    getTodayLogs().then((logs) {
      if (!_logStreamController.isClosed) {
        _logStreamController.add(logs);
      }
    });
  }

  void dispose() {
    _logStreamController.close();
  }
}
