import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/utils/log_generator.dart';
import '../../../domain/entities/medicine.dart';
import '../../../domain/repositories/medicine_log_repository.dart';
import '../../../domain/repositories/medicine_repository.dart';
import 'medicine_state.dart';

/// Cubit for managing medicine state
class MedicineCubit extends Cubit<MedicineState> {
  final MedicineRepository _medicineRepository;

  MedicineCubit(this._medicineRepository) : super(MedicineInitial());

  /// Load all medicines
  Future<void> loadMedicines() async {
    try {
      emit(MedicineLoading());
      final medicines = await _medicineRepository.getAllMedicines();
      emit(MedicineLoaded(medicines));
    } catch (e) {
      emit(MedicineError('Failed to load medicines: ${e.toString()}'));
    }
  }

  /// Load active medicines only
  Future<void> loadActiveMedicines() async {
    try {
      emit(MedicineLoading());
      final medicines = await _medicineRepository.getActiveMedicines();
      emit(MedicineLoaded(medicines));
    } catch (e) {
      emit(MedicineError('Failed to load medicines: ${e.toString()}'));
    }
  }

  /// Add a new medicine
  Future<void> addMedicine(Medicine medicine) async {
    try {
      emit(MedicineLoading());
      final savedMedicine = await _medicineRepository.addMedicine(medicine);
      
      // Generate today's logs for the medicine
      try {
        final logRepository = getIt<MedicineLogRepository>();
        final logs = LogGenerator.generateTodayLogs(savedMedicine);
        for (final log in logs) {
          await logRepository.addLog(log);
        }
      } catch (e) {
        // Silently handle log generation errors
      }
      
      // Schedule notifications for the medicine
      try {
        final notificationService = getIt<NotificationService>();
        await notificationService.scheduleMedicineReminders(savedMedicine);
      } catch (e) {
        // Silently handle notification errors - don't fail the whole operation
        // In production, log to error tracking service
      }
      
      emit(const MedicineOperationSuccess('Medicine added successfully'));
      await loadMedicines();
    } catch (e) {
      emit(MedicineError('Failed to add medicine: ${e.toString()}'));
    }
  }

  /// Update an existing medicine
  Future<void> updateMedicine(Medicine medicine) async {
    try {
      emit(MedicineLoading());
      final updatedMedicine = await _medicineRepository.updateMedicine(medicine);
      
      // Reschedule notifications for the updated medicine
      try {
        final notificationService = getIt<NotificationService>();
        await notificationService.scheduleMedicineReminders(updatedMedicine);
      } catch (e) {
        // Silently handle notification errors
      }
      
      emit(const MedicineOperationSuccess('Medicine updated successfully'));
      await loadMedicines();
    } catch (e) {
      emit(MedicineError('Failed to update medicine: ${e.toString()}'));
    }
  }

  /// Delete a medicine
  Future<void> deleteMedicine(int id) async {
    try {
      emit(MedicineLoading());
      
      // Cancel notifications for this medicine before deleting
      try {
        final notificationService = getIt<NotificationService>();
        await notificationService.cancelMedicineReminders(id);
      } catch (e) {
        // Silently handle notification errors
      }
      
      await _medicineRepository.deleteMedicine(id);
      emit(const MedicineOperationSuccess('Medicine deleted successfully'));
      await loadMedicines();
    } catch (e) {
      emit(MedicineError('Failed to delete medicine: ${e.toString()}'));
    }
  }

  /// Toggle medicine active status
  Future<void> toggleMedicineStatus(int id) async {
    try {
      final medicine = await _medicineRepository.toggleMedicineStatus(id);
      
      // Update notifications based on active status
      try {
        final notificationService = getIt<NotificationService>();
        if (medicine.isActive) {
          // Schedule notifications when activated
          await notificationService.scheduleMedicineReminders(medicine);
        } else {
          // Cancel notifications when deactivated
          await notificationService.cancelMedicineReminders(id);
        }
      } catch (e) {
        // Silently handle notification errors
      }
      
      await loadMedicines();
    } catch (e) {
      emit(MedicineError('Failed to toggle medicine status: ${e.toString()}'));
    }
  }

  /// Watch medicines stream
  void watchMedicines() {
    _medicineRepository.watchAllMedicines().listen(
      (medicines) {
        emit(MedicineLoaded(medicines));
      },
      onError: (error) {
        emit(MedicineError('Failed to watch medicines: ${error.toString()}'));
      },
    );
  }
}

