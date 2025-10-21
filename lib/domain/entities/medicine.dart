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
  final int profileId; // User profile this medicine belongs to
  final String name;
  final String dosage;
  final List<int> reminderTimes; // Stored as seconds since midnight
  final MedicineIntakeTiming intakeTiming; // When to take the medicine
  final bool isActive;
  final String? notes;

  // Refill tracking fields
  final int? totalQuantity; // Total pills/doses in the bottle
  final int? currentQuantity; // Current remaining pills/doses
  final int? refillRemindDays; // Notify when X days of medicine left
  final DateTime? lastRefillDate; // Last time medicine was refilled

  final DateTime createdAt;
  final DateTime updatedAt;

  const Medicine({
    this.id,
    required this.profileId,
    required this.name,
    required this.dosage,
    required this.reminderTimes,
    this.intakeTiming = MedicineIntakeTiming.anytime,
    this.isActive = true,
    this.notes,
    this.totalQuantity,
    this.currentQuantity,
    this.refillRemindDays,
    this.lastRefillDate,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create a copy of Medicine with updated fields
  Medicine copyWith({
    int? id,
    int? profileId,
    String? name,
    String? dosage,
    List<int>? reminderTimes,
    MedicineIntakeTiming? intakeTiming,
    bool? isActive,
    String? notes,
    int? totalQuantity,
    int? currentQuantity,
    int? refillRemindDays,
    DateTime? lastRefillDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Medicine(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      reminderTimes: reminderTimes ?? this.reminderTimes,
      intakeTiming: intakeTiming ?? this.intakeTiming,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      currentQuantity: currentQuantity ?? this.currentQuantity,
      refillRemindDays: refillRemindDays ?? this.refillRemindDays,
      lastRefillDate: lastRefillDate ?? this.lastRefillDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Calculate days of medicine remaining based on daily usage
  int? get daysRemaining {
    if (currentQuantity == null || currentQuantity! <= 0) return null;
    if (reminderTimes.isEmpty) return null;

    // Calculate daily usage (number of doses per day)
    final dailyDoses = reminderTimes.length;
    return (currentQuantity! / dailyDoses).floor();
  }

  /// Check if medicine stock is low
  bool get isLowStock {
    if (currentQuantity == null || refillRemindDays == null) return false;
    final remaining = daysRemaining;
    if (remaining == null) return false;
    return remaining <= refillRemindDays!;
  }

  /// Check if medicine is out of stock
  bool get isOutOfStock {
    return currentQuantity != null && currentQuantity! <= 0;
  }

  @override
  List<Object?> get props => [
    id,
    profileId,
    name,
    dosage,
    reminderTimes,
    intakeTiming,
    isActive,
    notes,
    totalQuantity,
    currentQuantity,
    refillRemindDays,
    lastRefillDate,
    createdAt,
    updatedAt,
  ];
}
