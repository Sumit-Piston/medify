import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/constants/app_strings.dart';
import '../../core/di/injection_container.dart';
import '../../gen/assets.gen.dart';
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
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Assets.icons.medifyIcon.image(
            width: 32,
            height: 32,
          ),
        ),
        title: Text('Version', style: theme.textTheme.titleMedium),
        subtitle: Text('1.0.0', style: theme.textTheme.bodySmall),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppStrings.appName,
      applicationVersion: '1.0.0',
      applicationIcon: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Assets.icons.medifyIcon.image(
          width: 64,
          height: 64,
        ),
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
