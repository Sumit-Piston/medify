import 'package:get_it/get_it.dart';
import '../../data/datasources/objectbox_service.dart';
import '../../data/repositories/medicine_repository_impl.dart';
import '../../data/repositories/medicine_log_repository_impl.dart';
import '../../domain/repositories/medicine_repository.dart';
import '../../domain/repositories/medicine_log_repository.dart';
import '../../presentation/blocs/medicine/medicine_cubit.dart';
import '../../presentation/blocs/medicine_log/medicine_log_cubit.dart';
import '../../presentation/blocs/statistics/statistics_cubit.dart';
import '../../presentation/blocs/history/history_cubit.dart';
import '../services/notification_service.dart';
import '../services/preferences_service.dart';

/// Service locator instance
final getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> initializeDependencies() async {
  // Initialize preferences service
  final preferencesService = await PreferencesService.initialize();
  getIt.registerSingleton<PreferencesService>(preferencesService);

  // Initialize notification service
  final notificationService = NotificationService();
  await notificationService.initialize();
  getIt.registerSingleton<NotificationService>(notificationService);

  // Data sources
  final objectBoxService = ObjectBoxService();
  await objectBoxService.init();
  getIt.registerSingleton<ObjectBoxService>(objectBoxService);

  // Repositories
  getIt.registerLazySingleton<MedicineRepository>(
    () => MedicineRepositoryImpl(getIt<ObjectBoxService>()),
  );

  getIt.registerLazySingleton<MedicineLogRepository>(
    () => MedicineLogRepositoryImpl(getIt<ObjectBoxService>()),
  );

  // Cubits
  getIt.registerFactory<MedicineCubit>(
    () => MedicineCubit(getIt<MedicineRepository>()),
  );

  getIt.registerFactory<MedicineLogCubit>(
    () => MedicineLogCubit(getIt<MedicineLogRepository>()),
  );

  getIt.registerFactory<StatisticsCubit>(
    () => StatisticsCubit(getIt<MedicineLogRepository>()),
  );

  getIt.registerFactory<HistoryCubit>(
    () => HistoryCubit(
      getIt<MedicineLogRepository>(),
      getIt<MedicineRepository>(),
    ),
  );
}

/// Clean up dependencies
Future<void> disposeDependencies() async {
  final objectBoxService = getIt<ObjectBoxService>();
  objectBoxService.close();
  await getIt.reset();
}
