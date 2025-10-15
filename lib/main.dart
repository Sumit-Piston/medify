import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/constants/app_strings.dart';
import 'core/di/injection_container.dart';
import 'core/services/navigation_service.dart';
import 'core/services/preferences_service.dart';
import 'core/services/theme_service.dart';
import 'core/themes/app_theme.dart';
import 'presentation/blocs/medicine/medicine_cubit.dart';
import 'presentation/blocs/medicine_log/medicine_log_cubit.dart';
import 'presentation/blocs/statistics/statistics_cubit.dart';
import 'presentation/blocs/history/history_cubit.dart';
import 'presentation/pages/main_navigation_page.dart';
import 'presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final PreferencesService _prefsService;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _prefsService = getIt<PreferencesService>();
    _themeMode = _prefsService.themeMode;

    // Register theme change callback
    ThemeService().registerThemeCallback((themeMode) {
      setState(() {
        _themeMode = themeMode;
      });
    });
  }

  /// Update theme mode
  void updateThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MedicineCubit>(
          create: (context) => getIt<MedicineCubit>(),
        ),
        BlocProvider<MedicineLogCubit>(
          create: (context) => getIt<MedicineLogCubit>(),
        ),
        BlocProvider<StatisticsCubit>(
          create: (context) => getIt<StatisticsCubit>(),
        ),
        BlocProvider<HistoryCubit>(create: (context) => getIt<HistoryCubit>()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService().navigatorKey,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeMode,
        // Localization support
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          // Future: Add more languages here
          // Locale('hi'), // Hindi
          // Locale('bn'), // Bengali
        ],
        home: _prefsService.isFirstLaunch
            ? const OnboardingPage()
            : const MainNavigationPage(),
      ),
    );
  }
}
