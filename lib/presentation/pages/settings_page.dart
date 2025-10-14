import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/di/injection_container.dart';
import '../../core/services/notification_service.dart';
import '../blocs/settings/settings_cubit.dart';
import '../blocs/settings/settings_state.dart';

/// Settings page for app preferences
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(getIt()),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: false),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoaded) {
            return ListView(
              padding: const EdgeInsets.all(AppSizes.spacing16),
              children: [
                // App Section
                _buildSectionHeader('App', theme),
                _buildThemeSetting(context, state, theme),
                const SizedBox(height: AppSizes.spacing8),

                const SizedBox(height: AppSizes.spacing24),

                // Notifications Section
                _buildSectionHeader('Notifications', theme),
                _buildNotificationsSetting(context, state, theme),
                const SizedBox(height: AppSizes.spacing8),
                _buildSnoozeDurationSetting(context, state, theme),

                const SizedBox(height: AppSizes.spacing24),

                // About Section
                _buildSectionHeader('About', theme),
                _buildAboutCard(context, theme),
                const SizedBox(height: AppSizes.spacing8),
                _buildVersionCard(theme),

                const SizedBox(height: AppSizes.spacing24),

                // Debug Section (only in debug mode)
                _buildSectionHeader('Debug & Testing', theme),
                _buildTestNotificationCard(context, theme),

                const SizedBox(height: AppSizes.spacing24),

                // Reset Button
                Center(
                  child: TextButton.icon(
                    onPressed: () => _showResetDialog(context),
                    icon: const Icon(Icons.restore, color: AppColors.error),
                    label: const Text(
                      'Reset All Settings',
                      style: TextStyle(color: AppColors.error),
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.spacing8,
        bottom: AppSizes.spacing8,
      ),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildThemeSetting(
    BuildContext context,
    SettingsLoaded state,
    ThemeData theme,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.palette_outlined,
                  color: AppColors.primary,
                  size: AppSizes.iconM,
                ),
                const SizedBox(width: AppSizes.spacing16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Theme', style: theme.textTheme.titleMedium),
                      const SizedBox(height: AppSizes.spacing4),
                      Text(
                        'Choose your preferred theme',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spacing16),
            SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.light,
                  label: Text('Light'),
                  icon: Icon(Icons.light_mode),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  label: Text('Dark'),
                  icon: Icon(Icons.dark_mode),
                ),
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text('System'),
                  icon: Icon(Icons.settings_brightness),
                ),
              ],
              selected: {state.themeMode},
              onSelectionChanged: (Set<ThemeMode> newSelection) {
                context.read<SettingsCubit>().updateThemeMode(
                  newSelection.first,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationsSetting(
    BuildContext context,
    SettingsLoaded state,
    ThemeData theme,
  ) {
    return Card(
      child: SwitchListTile(
        value: state.notificationsEnabled,
        onChanged: (value) {
          context.read<SettingsCubit>().updateNotificationsEnabled(value);
        },
        title: Text('Enable Notifications', style: theme.textTheme.titleMedium),
        subtitle: Text(
          'Receive reminders for your medicines',
          style: theme.textTheme.bodySmall,
        ),
        secondary: const Icon(
          Icons.notifications_active,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildSnoozeDurationSetting(
    BuildContext context,
    SettingsLoaded state,
    ThemeData theme,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.snooze,
                  color: AppColors.primary,
                  size: AppSizes.iconM,
                ),
                const SizedBox(width: AppSizes.spacing16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Snooze Duration',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppSizes.spacing4),
                      Text(
                        'Default snooze time for reminders',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spacing16),
            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 15, label: Text('15 min')),
                ButtonSegment(value: 30, label: Text('30 min')),
                ButtonSegment(value: 60, label: Text('1 hour')),
              ],
              selected: {state.snoozeDuration},
              onSelectionChanged: (Set<int> newSelection) {
                context.read<SettingsCubit>().updateSnoozeDuration(
                  newSelection.first,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutCard(BuildContext context, ThemeData theme) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.info_outline, color: AppColors.info),
        title: Text(
          'About ${AppStrings.appName}',
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Text(AppStrings.appTagline, style: theme.textTheme.bodySmall),
        onTap: () => _showAboutDialog(context),
      ),
    );
  }

  Widget _buildVersionCard(ThemeData theme) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.info_outline, color: AppColors.primary),
        title: Text('Version', style: theme.textTheme.titleMedium),
        subtitle: Text('1.0.0-mvp', style: theme.textTheme.bodySmall),
      ),
    );
  }

  Widget _buildTestNotificationCard(BuildContext context, ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.bug_report,
                  color: AppColors.warning,
                  size: AppSizes.iconM,
                ),
                const SizedBox(width: AppSizes.spacing16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Test Notifications',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppSizes.spacing4),
                      Text(
                        'Test if notifications work in foreground & background',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spacing16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _testNotification(context),
                    icon: const Icon(Icons.notifications_active, size: 18),
                    label: const Text('Test Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.spacing8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showNotificationStats(context),
                    icon: const Icon(Icons.info_outline, size: 18),
                    label: const Text('Stats'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _testNotification(BuildContext context) async {
    try {
      final notificationService = getIt<NotificationService>();

      // Show loading
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sending test notification...'),
          duration: Duration(seconds: 1),
        ),
      );

      await notificationService.showImmediateNotification(
        title: '💊 Test Notification',
        body: 'If you see this, notifications are working! 🎉',
        payload: 'test',
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Test notification sent! Check your notification tray.',
            ),
            backgroundColor: AppColors.success,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _showNotificationStats(BuildContext context) async {
    try {
      final notificationService = getIt<NotificationService>();
      final stats = await notificationService.getNotificationStats();
      final pending = await notificationService.getPendingNotifications();

      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Notification Statistics'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Initialized: ${stats['isInitialized']}'),
                const SizedBox(height: 8),
                Text('Timezone: ${stats['timezone']}'),
                const SizedBox(height: 8),
                Text('Pending: ${stats['pendingCount']}'),
                const SizedBox(height: 16),
                const Text(
                  'Scheduled Notifications:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (pending.isEmpty)
                  const Text('No pending notifications')
                else
                  ...pending
                      .take(5)
                      .map(
                        (n) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '• ID ${n.id}: ${n.title}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                if (pending.length > 5)
                  Text('... and ${pending.length - 5} more'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppStrings.appName,
      applicationVersion: '1.0.0-mvp',
      applicationIcon: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.medication, color: Colors.white, size: 32),
      ),
      children: [
        const SizedBox(height: 16),
        const Text(AppStrings.appTagline, style: TextStyle(fontSize: 16)),
        const SizedBox(height: 16),
        const Text(
          'A simple and accessible medicine reminder app designed for everyone, especially elderly users.',
        ),
        const SizedBox(height: 16),
        const Text('© 2025 Medify. All rights reserved.'),
      ],
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset Settings'),
        content: const Text(
          'Are you sure you want to reset all settings to default values?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(AppStrings.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SettingsCubit>().resetSettings();
              Navigator.of(dialogContext).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings reset to default')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
