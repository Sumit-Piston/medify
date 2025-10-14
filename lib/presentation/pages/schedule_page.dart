import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/widgets/empty_state.dart';
import '../../core/widgets/loading_indicator.dart';
import '../../domain/entities/medicine.dart';
import '../../domain/entities/medicine_log.dart';
import '../blocs/medicine/medicine_cubit.dart';
import '../blocs/medicine/medicine_state.dart';
import '../blocs/medicine_log/medicine_log_cubit.dart';
import '../blocs/medicine_log/medicine_log_state.dart';
import '../widgets/medicine_log_card.dart';
import 'settings_page.dart';

/// Page to display today's medicine schedule
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<Medicine> _medicines = [];
  List<MedicineLog> _logs = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<MedicineCubit>().loadActiveMedicines();
    context.read<MedicineLogCubit>().loadTodayLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'), // Per spec: "Today" + calendar icon
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // Future: Show date picker for viewing other days
            },
            tooltip: 'Select date',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
            tooltip: 'Refresh',
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            tooltip: 'Settings',
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<MedicineLogCubit, MedicineLogState>(
            listener: (context, state) {
              if (state is MedicineLogOperationSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.success,
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 2),
                  ),
                );
                _loadData();
              }
            },
          ),
        ],
        child: RefreshIndicator(
          onRefresh: () async {
            _loadData();
          },
          child: BlocBuilder<MedicineCubit, MedicineState>(
            builder: (context, medicineState) {
              if (medicineState is MedicineLoaded) {
                _medicines = medicineState.medicines;
              }

              return BlocBuilder<MedicineLogCubit, MedicineLogState>(
                builder: (context, logState) {
                  if (logState is MedicineLogLoading ||
                      medicineState is MedicineLoading) {
                    return const LoadingIndicator(
                      message: 'Loading schedule...',
                    );
                  }

                  if (logState is MedicineLogLoaded) {
                    _logs = logState.logs;

                    if (_logs.isEmpty) {
                      return EmptyState(
                        icon: Icons.calendar_today,
                        title: AppStrings.noReminders,
                        message: AppStrings.allCaughtUp,
                      );
                    }

                    // Calculate stats
                    final takenCount = _logs
                        .where((log) => log.status == MedicineLogStatus.taken)
                        .length;
                    final totalCount = _logs.length;
                    final adherencePercent = totalCount > 0
                        ? (takenCount / totalCount * 100).round()
                        : 0;

                    return ListView(
                      padding: const EdgeInsets.all(AppSizes.paddingM),
                      children: [
                        // Progress Card
                        _buildProgressCard(
                          context,
                          takenCount,
                          totalCount,
                          adherencePercent,
                        ),
                        const SizedBox(height: AppSizes.paddingL),

                        // Section: Overdue
                        ..._buildSection(
                          context,
                          'Overdue',
                          _logs
                              .where(
                                (log) =>
                                    log.isOverdue &&
                                    log.status == MedicineLogStatus.pending,
                              )
                              .toList(),
                          Icons.warning,
                          AppColors.error,
                        ),

                        // Section: Upcoming
                        ..._buildSection(
                          context,
                          'Upcoming',
                          _logs
                              .where(
                                (log) =>
                                    !log.isOverdue &&
                                    log.status == MedicineLogStatus.pending,
                              )
                              .toList(),
                          Icons.schedule,
                          AppColors.warning,
                        ),

                        // Section: Completed
                        ..._buildSection(
                          context,
                          'Completed',
                          _logs
                              .where(
                                (log) => log.status == MedicineLogStatus.taken,
                              )
                              .toList(),
                          Icons.check_circle,
                          AppColors.success,
                        ),

                        // Section: Skipped/Missed
                        ..._buildSection(
                          context,
                          'Skipped/Missed',
                          _logs
                              .where(
                                (log) =>
                                    log.status == MedicineLogStatus.skipped ||
                                    log.status == MedicineLogStatus.missed,
                              )
                              .toList(),
                          Icons.cancel,
                          AppColors.textDisabledLight,
                        ),
                      ],
                    );
                  }

                  return EmptyState(
                    icon: Icons.calendar_today,
                    title: AppStrings.noReminders,
                    message: 'Add some medicines to see your schedule',
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  /// Build progress card
  Widget _buildProgressCard(
    BuildContext context,
    int taken,
    int total,
    int percent,
  ) {
    final theme = Theme.of(context);
    final progress = total > 0 ? taken / total : 0.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.emoji_events,
                  color: theme.colorScheme.primary,
                  size: AppSizes.iconL,
                ),
                const SizedBox(width: AppSizes.paddingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Progress",
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$taken of $total medicines taken',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingM,
                    vertical: AppSizes.paddingS,
                  ),
                  decoration: BoxDecoration(
                    color: _getProgressColor(percent).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                  ),
                  child: Text(
                    '$percent%',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: _getProgressColor(percent),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.paddingM),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusS),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: theme.colorScheme.onSurface.withValues(
                  alpha: 0.1,
                ),
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getProgressColor(percent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build a section of logs
  List<Widget> _buildSection(
    BuildContext context,
    String title,
    List<MedicineLog> logs,
    IconData icon,
    Color color,
  ) {
    if (logs.isEmpty) return [];

    return [
      Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: AppSizes.paddingS),
          Text(
            '$title (${logs.length})',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: AppSizes.paddingM),
      ...logs.map((log) {
        final medicine = _getMedicineForLog(log);
        if (medicine == null) return const SizedBox.shrink();

        return MedicineLogCard(
          medicine: medicine,
          log: log,
          onTaken: () => _markAsTaken(log.id!),
          onSkip: () => _markAsSkipped(log.id!),
          onSnooze: (minutes) => _snoozeLog(log.id!, minutes),
        );
      }),
      const SizedBox(height: AppSizes.paddingM),
    ];
  }

  /// Get medicine for a log
  Medicine? _getMedicineForLog(MedicineLog log) {
    try {
      return _medicines.firstWhere((m) => m.id == log.medicineId);
    } catch (e) {
      return null;
    }
  }

  /// Get progress color based on percentage
  Color _getProgressColor(int percent) {
    if (percent >= 80) return AppColors.success;
    if (percent >= 50) return AppColors.warning;
    return AppColors.error;
  }

  /// Mark log as taken
  void _markAsTaken(int logId) {
    context.read<MedicineLogCubit>().markAsTaken(logId);
  }

  /// Mark log as skipped
  void _markAsSkipped(int logId) {
    context.read<MedicineLogCubit>().markAsSkipped(logId);
  }

  /// Snooze log
  void _snoozeLog(int logId, int minutes) {
    context.read<MedicineLogCubit>().snoozeLog(logId, minutes);
  }
}
