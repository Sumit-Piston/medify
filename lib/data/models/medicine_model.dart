import 'package:objectbox/objectbox.dart';
import '../../domain/entities/medicine.dart';

/// ObjectBox model for Medicine entity
@Entity()
class MedicineModel {
  @Id()
  int id;

  String name;
  String dosage;
  List<int> reminderTimes; // Stored as seconds since midnight
  int intakeTiming; // Store as int (enum index)
  bool isActive;
  String? notes;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  MedicineModel({
    this.id = 0,
    required this.name,
    required this.dosage,
    required this.reminderTimes,
    this.intakeTiming = 4, // Default to anytime (index 4)
    this.isActive = true,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Convert Medicine entity to MedicineModel
  factory MedicineModel.fromEntity(Medicine medicine) {
    return MedicineModel(
      id: medicine.id ?? 0,
      name: medicine.name,
      dosage: medicine.dosage,
      reminderTimes: medicine.reminderTimes,
      intakeTiming: medicine.intakeTiming.index,
      isActive: medicine.isActive,
      notes: medicine.notes,
      createdAt: medicine.createdAt,
      updatedAt: medicine.updatedAt,
    );
  }

  /// Convert MedicineModel to Medicine entity
  Medicine toEntity() {
    return Medicine(
      id: id == 0 ? null : id,
      name: name,
      dosage: dosage,
      reminderTimes: reminderTimes,
      intakeTiming: MedicineIntakeTiming.values[intakeTiming],
      isActive: isActive,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
