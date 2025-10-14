import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../domain/entities/medicine.dart';
import '../blocs/medicine/medicine_cubit.dart';
import '../blocs/medicine/medicine_state.dart';

/// Page for adding or editing a medicine
class AddEditMedicinePage extends StatefulWidget {
  final Medicine? medicine; // null for add, non-null for edit

  const AddEditMedicinePage({
    super.key,
    this.medicine,
  });

  @override
  State<AddEditMedicinePage> createState() => _AddEditMedicinePageState();
}

class _AddEditMedicinePageState extends State<AddEditMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _notesController = TextEditingController();

  // List to store selected reminder times (as seconds since midnight)
  final List<int> _reminderTimes = [];

  bool get _isEditMode => widget.medicine != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      _loadMedicineData();
    }
  }

  void _loadMedicineData() {
    final medicine = widget.medicine!;
    _nameController.text = medicine.name;
    _dosageController.text = medicine.dosage;
    _notesController.text = medicine.notes ?? '';
    _reminderTimes.addAll(medicine.reminderTimes);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditMode ? AppStrings.editMedicine : AppStrings.addMedicine,
        ),
      ),
      body: BlocListener<MedicineCubit, MedicineState>(
        listener: (context, state) {
          if (state is MedicineOperationSuccess) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            // Go back to previous screen
            Navigator.of(context).pop(true);
          }

          if (state is MedicineError) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSizes.paddingM),
            children: [
              // Instructions
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingM),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: AppSizes.paddingM),
                      Expanded(
                        child: Text(
                          _isEditMode
                              ? 'Update your medicine details'
                              : 'Add a new medicine and set reminder times',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.paddingL),

              // Medicine Name
              CustomTextField(
                label: AppStrings.medicineName,
                hint: 'e.g., Aspirin',
                controller: _nameController,
                validator: Validators.medicineName,
                prefixIcon: const Icon(Icons.medication),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.paddingM),

              // Dosage
              CustomTextField(
                label: AppStrings.dosage,
                hint: 'e.g., 500mg, 2 tablets',
                controller: _dosageController,
                validator: Validators.dosage,
                prefixIcon: const Icon(Icons.medical_information),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: AppSizes.paddingM),

              // Notes (Optional)
              CustomTextField(
                label: '${AppStrings.notes} (Optional)',
                hint: 'e.g., Take with food',
                controller: _notesController,
                prefixIcon: const Icon(Icons.note),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: AppSizes.paddingL),

              // Reminder Times Section
              Text(
                'Reminder Times',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSizes.paddingS),
              Text(
                'Set times when you need to take this medicine',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                    ),
              ),
              const SizedBox(height: AppSizes.paddingM),

              // Display reminder times
              if (_reminderTimes.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.paddingL),
                    child: Column(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: AppSizes.iconXL,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.3),
                        ),
                        const SizedBox(height: AppSizes.paddingS),
                        Text(
                          'No reminder times set',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tap the button below to add',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Wrap(
                  spacing: AppSizes.paddingS,
                  runSpacing: AppSizes.paddingS,
                  children: _reminderTimes.map((seconds) {
                    final time = DateTimeUtils.secondsToDateTime(seconds);
                    final timeString = DateTimeUtils.formatTime(time);
                    final timeOfDay = DateTimeUtils.getTimeOfDayString(time);

                    return Chip(
                      avatar: Icon(
                        _getTimeOfDayIcon(timeOfDay),
                        size: 18,
                      ),
                      label: Text(
                        timeString,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () {
                        setState(() {
                          _reminderTimes.remove(seconds);
                        });
                      },
                    );
                  }).toList(),
                ),
              const SizedBox(height: AppSizes.paddingM),

              // Add reminder time button
              OutlinedButton.icon(
                onPressed: _addReminderTime,
                icon: const Icon(Icons.add_alarm),
                label: const Text('Add Reminder Time'),
              ),
              const SizedBox(height: AppSizes.paddingXL),

              // Save button
              BlocBuilder<MedicineCubit, MedicineState>(
                builder: (context, state) {
                  final isLoading = state is MedicineLoading;
                  return CustomButton(
                    text: _isEditMode ? 'Update Medicine' : 'Save Medicine',
                    icon: Icons.check,
                    isLoading: isLoading,
                    onPressed: isLoading ? null : _saveMedicine,
                  );
                },
              ),
              const SizedBox(height: AppSizes.paddingM),

              // Cancel button
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(AppStrings.cancel),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Show time picker and add selected time
  Future<void> _addReminderTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Convert TimeOfDay to seconds since midnight
      final seconds = (picked.hour * 3600) + (picked.minute * 60);

      // Check if time already exists
      if (_reminderTimes.contains(seconds)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('This time is already added'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
        return;
      }

      setState(() {
        _reminderTimes.add(seconds);
        // Sort times chronologically
        _reminderTimes.sort();
      });
    }
  }

  /// Validate and save medicine
  void _saveMedicine() {
    // Validate form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Check if at least one reminder time is set
    if (_reminderTimes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.errorScheduleRequired),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Create medicine object
    final medicine = Medicine(
      id: _isEditMode ? widget.medicine!.id : null,
      name: _nameController.text.trim(),
      dosage: _dosageController.text.trim(),
      reminderTimes: _reminderTimes,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
      isActive: _isEditMode ? widget.medicine!.isActive : true,
      createdAt: _isEditMode ? widget.medicine!.createdAt : DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Save using cubit
    if (_isEditMode) {
      context.read<MedicineCubit>().updateMedicine(medicine);
    } else {
      context.read<MedicineCubit>().addMedicine(medicine);
    }
  }

  /// Get icon based on time of day
  IconData _getTimeOfDayIcon(String timeOfDay) {
    switch (timeOfDay) {
      case 'Morning':
        return Icons.wb_sunny;
      case 'Afternoon':
        return Icons.wb_sunny_outlined;
      case 'Evening':
        return Icons.nights_stay;
      case 'Night':
        return Icons.bedtime;
      default:
        return Icons.access_time;
    }
  }
}

