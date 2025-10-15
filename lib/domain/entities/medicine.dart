import 'package:equatable/equatable.dart';

/// Enum for medicine intake timing
enum MedicineIntakeTiming {
  beforeFood('Before Food'),
  afterFood('After Food'),
  withFood('With Food'),
  empty('Empty Stomach'),
  anytime('Anytime'),
  beforeSleep('Before Sleep');

  final String label;
  const MedicineIntakeTiming(this.label);
}

/// Medicine entity representing a medication to be tracked
class Medicine extends Equatable {
  final int? id;
  final String name;
  final String dosage;
  final List<int> reminderTimes; // Stored as seconds since midnight
  final MedicineIntakeTiming intakeTiming; // When to take the medicine
  final bool isActive;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Medicine({
    this.id,
    required this.name,
    required this.dosage,
    required this.reminderTimes,
    this.intakeTiming = MedicineIntakeTiming.anytime,
    this.isActive = true,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create a copy of Medicine with updated fields
  Medicine copyWith({
    int? id,
    String? name,
    String? dosage,
    List<int>? reminderTimes,
    MedicineIntakeTiming? intakeTiming,
    bool? isActive,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Medicine(
      id: id ?? this.id,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      reminderTimes: reminderTimes ?? this.reminderTimes,
      intakeTiming: intakeTiming ?? this.intakeTiming,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    dosage,
    reminderTimes,
    intakeTiming,
    isActive,
    notes,
    createdAt,
    updatedAt,
  ];
}
