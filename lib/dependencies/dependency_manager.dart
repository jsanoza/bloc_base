import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:movie/common/app_printer.dart';
import 'package:movie/common/models/app_environment.dart';
import 'package:movie/common/services/file_picker_service.dart';
import 'package:movie/common/services/media_naming_service.dart';
import 'package:movie/routes/main_router.dart';
import 'package:movie/routes/onboarding_router.dart';
import 'package:movie/routes/root_router.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import '../common/services/busy_indicator_helper.dart';
import '../common/services/device_info_service.dart';
import '../common/services/image_picker_service.dart';
import '../common/services/modal_service.dart';
import '../common/services/permission_service.dart';
import '../common/services/platform_service.dart';
import '../common/services/toast_service.dart';
import '../core/helpers/network_service.dart';
import '../core/local_database/database_service.dart';
import '../env/env.dart';
import '../env/env_dev.dart';
import '../env/env_staging.dart';
import '../flavors.dart';
import '../routes/route_helper.dart';

GetIt sl = GetIt.I;

extension GetItExtension on GetIt {
  Future<void> ensureReady<T extends Object>() async {
    try {
      await isReady<T>();
    } on Exception catch (e) {
      debugPrint("ensureReady caught exception $e");
    }
  }
}

class DependencyManager {
  bool initialized = false;

  DependencyManager() {
    provideEnvironment();

    provideLogger();

    provideMainRouter();
    provideRootRouter();
    provideOnboardingRouter();
    provideRouteHelper();

    provideBusyIndicatorHelper();
    provideModalService();
    providePlatformService();

    providePermissionService();

    provideFilePickerService();
    provideImagePickerService();
    provideMediaNameService();

    // Databases
    provideSharedPreferences();
    provideLocalDatabase();
    provideDatabaseService();

    provideToastService();

    provideNetworkService();
    provideDeviceInfoService();
  }

  /// Ensures async dependencies are loaded before the initial screens are shown
  Future<void> init() async {
    await sl.allReady();
    initialized = true;
  }

  Future<void> dispose() async {
    await sl.reset();
  }

  void provideEnvironment() {
    switch (F.appFlavor) {
      case Flavor.dev:
        sl.registerLazySingleton<AppEnvironment>(() {
          return AppEnvironment(
            env: EnvValuesDev.env,
            flavor: EnvValuesDev.flavor,
            appName: EnvValuesDev.appName,
            databaseName: EnvValuesDev.databaseName,
          );
        });
        break;
      case Flavor.staging:
        sl.registerLazySingleton<AppEnvironment>(() {
          return AppEnvironment(
            env: EnvValuesStaging.env,
            flavor: EnvValuesStaging.flavor,
            appName: EnvValuesStaging.appName,
            databaseName: EnvValuesStaging.databaseName,
          );
        });
        break;
      case Flavor.prod:
        sl.registerLazySingleton<AppEnvironment>(() {
          return AppEnvironment(
            env: EnvValues.env,
            flavor: EnvValues.flavor,
            appName: EnvValues.appName,
            databaseName: EnvValues.databaseName,
          );
        });
        break;
      default:
    }
  }

  void provideLogger() {
    sl.registerLazySingleton<Logger>(
      () => Logger(
        printer: AppLogPrinter(),
      ),
    );
  }

  void provideRootRouter() {
    sl.registerSingleton<RootRouter>(RootRouter());
  }

  void provideMainRouter() {
    sl.registerSingleton<MainRouter>(MainRouter());
  }

  void provideRouteHelper() {
    sl.registerSingleton<RouteHelper>(RouteHelper());
  }

  void provideOnboardingRouter() {
    sl.registerSingleton<OnboardingRouter>(OnboardingRouter());
  }

  void provideBusyIndicatorHelper() {
    sl.registerLazySingleton<BusyIndicatorHelper>(BusyIndicatorHelper.new);
  }

  void provideModalService() {
    sl.registerLazySingleton<ModalService>(ModalService.new);
  }

  void providePlatformService() {
    sl.registerLazySingleton<PlatformService>(PlatformService.new);
  }

  void providePermissionService() {
    sl.registerLazySingleton<PermissionService>(() => PermissionService());
  }

  void provideFilePickerService() {
    sl.registerLazySingleton(() => FilePickerService(sl()));
  }

  void provideMediaNameService() {
    sl.registerLazySingleton(() => MediaNamingService());
  }

  void provideImagePickerService() {
    sl.registerLazySingleton(() => ImagePickerService(sl()));
  }

  void provideSharedPreferences() {
    sl.registerSingletonAsync<SharedPreferences>(() async {
      final sharedPreferences = await SharedPreferences.getInstance();

      return sharedPreferences;
    });
  }

  void provideToastService() {
    sl.registerLazySingleton<ToastService>(() => ToastService());
  }

  Future<void> provideLocalDatabase() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    sl<Logger>().i({"Creating ${sl<AppEnvironment>().databaseName} database"});
    final databasePath = p.join(
      appDir.path,
      sl<AppEnvironment>().databaseName,
    );
    final database = await databaseFactoryIo.openDatabase(
      databasePath,
      version: 1,
    );

    sl.registerSingleton<Database>(database);
  }

  void provideDatabaseService() {
    sl.registerLazySingleton(
      () => DatabaseService(
        db: sl.get<Database>(),
        logger: sl.get<Logger>(),
      ),
    );
  }

  void provideNetworkService() {
    sl.registerLazySingleton<NetworkService>(() => NetworkService());
  }

  void provideDeviceInfoService() {
    sl.registerLazySingleton<DeviceInfoService>(() => DeviceInfoService());
  }
}
