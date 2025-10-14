import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/widgets/empty_state.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../domain/entities/medicine_log.dart';
import '../blocs/medicine/medicine_cubit.dart';
import '../blocs/medicine/medicine_state.dart';
import '../blocs/medicine_log/medicine_log_cubit.dart';
import '../blocs/medicine_log/medicine_log_state.dart';
import '../widgets/medicine_card.dart';
import '../widgets/todays_summary_card.dart';
import 'add_edit_medicine_page.dart';

/// Page to display list of all medicines
class MedicineListPage extends StatefulWidget {
  const MedicineListPage({super.key});

  @override
  State<MedicineListPage> createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  @override
  void initState() {
    super.initState();
    // Load medicines and today's logs when page opens
    _loadMedicines();
    _loadTodaysLogs();
  }

  void _loadMedicines() {
    context.read<MedicineCubit>().loadMedicines();
  }

  void _loadTodaysLogs() {
    final today = DateTime.now();
    context.read<MedicineLogCubit>().loadLogsByDate(today);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medify'), // Per spec: "Medify" (H2)
        centerTitle: false,
        actions: [
          // Refresh button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _loadMedicines();
              _loadTodaysLogs();
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: BlocConsumer<MedicineCubit, MedicineState>(
        listener: (context, state) {
          // Show snackbar on operations
          if (state is MedicineOperationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            // Reload medicines after successful operation
            _loadMedicines();
          }

          if (state is MedicineError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: AppStrings.retry,
                  textColor: Colors.white,
                  onPressed: _loadMedicines,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MedicineLoading) {
            return const LoadingIndicator(message: 'Loading medicines...');
          }

          if (state is MedicineLoaded) {
            if (state.medicines.isEmpty) {
              return EmptyState(
                icon: Icons.medication,
                title: AppStrings.noMedicines,
                message: AppStrings.addYourFirstMedicine,
                actionText: AppStrings.addMedicine,
                onAction: () => _navigateToAddMedicine(),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                _loadMedicines();
                _loadTodaysLogs();
              },
              child: CustomScrollView(
                slivers: [
                  // Today's Summary Card at top
                  SliverToBoxAdapter(
                    child: BlocBuilder<MedicineLogCubit, MedicineLogState>(
                      builder: (context, logState) {
                        final logs = logState is MedicineLogLoaded
                            ? logState.logs
                            : <MedicineLog>[];
                        return TodaysSummaryCard(
                          todaysLogs: logs,
                          onTap: () {
                            // Tapping takes user to Schedule page (index 0)
                            // This is handled by the main navigation page
                          },
                        );
                      },
                    ),
                  ),

                  // Medicines header
                  const SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      AppSizes.spacing16,
                      AppSizes.spacing8,
                      AppSizes.spacing16,
                      AppSizes.spacing8,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'My Medicines',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Medicine List
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spacing16,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final medicine = state.medicines[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppSizes.spacing8,
                          ),
                          child: Dismissible(
                            key: Key(medicine.id.toString()),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (direction) async {
                              return await _showDeleteConfirmation(
                                context,
                                medicine.name,
                              );
                            },
                            onDismissed: (direction) {
                              context.read<MedicineCubit>().deleteMedicine(
                                medicine.id!,
                              );
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(
                                right: AppSizes.paddingL,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusCard,
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: AppSizes.iconL,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            child: MedicineCard(
                              medicine: medicine,
                              onTap: () =>
                                  _navigateToEditMedicine(medicine.id!),
                              onToggleActive: () {
                                context
                                    .read<MedicineCubit>()
                                    .toggleMedicineStatus(medicine.id!);
                              },
                            ),
                          ),
                        );
                      }, childCount: state.medicines.length),
                    ),
                  ),

                  // Bottom padding
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: AppSizes.spacing16),
                  ),
                ],
              ),
            );
          }

          // Show empty state for initial/error states
          return EmptyState(
            icon: Icons.medication,
            title: AppStrings.noMedicines,
            message: AppStrings.addYourFirstMedicine,
            actionText: AppStrings.addMedicine,
            onAction: () => _navigateToAddMedicine(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddMedicine,
        icon: const Icon(Icons.add),
        label: const Text('Add Medicine'),
      ),
    );
  }

  /// Show delete confirmation dialog
  Future<bool?> _showDeleteConfirmation(
    BuildContext context,
    String medicineName,
  ) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.deleteConfirmation),
        content: Text('Are you sure you want to delete "$medicineName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
  }

  /// Navigate to add medicine page
  Future<void> _navigateToAddMedicine() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (context) => const AddEditMedicinePage()),
    );

    // Reload medicines if a medicine was added
    if (result == true && mounted) {
      _loadMedicines();
    }
  }

  /// Navigate to edit medicine page
  Future<void> _navigateToEditMedicine(int medicineId) async {
    // Find the medicine
    final state = context.read<MedicineCubit>().state;
    if (state is! MedicineLoaded) return;

    final medicine = state.medicines.firstWhere((m) => m.id == medicineId);

    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => AddEditMedicinePage(medicine: medicine),
      ),
    );

    // Reload medicines if a medicine was updated
    if (result == true && mounted) {
      _loadMedicines();
    }
  }
}
