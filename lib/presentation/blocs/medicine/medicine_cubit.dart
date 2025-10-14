import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/medicine.dart';
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
      await _medicineRepository.addMedicine(medicine);
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
      await _medicineRepository.updateMedicine(medicine);
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
      await _medicineRepository.toggleMedicineStatus(id);
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

