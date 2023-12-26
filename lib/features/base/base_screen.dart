import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movie/common/models/app_environment.dart';
import 'package:movie/themes/app_colors.dart';

import '../../core/local_database/database_classes.dart';
import '../../core/local_database/database_service.dart';
import '../../dependencies/dependency_manager.dart';
import '../../env/env_dev.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final databaseService = sl<DatabaseService>();
  @override
  void initState() {
    super.initState();
    initializeLocalDatabase();
  }

  initializeLocalDatabase() async {
    await databaseService.insertOrUpdate(
      AppEnvironmentDatabase().name,
      "AppEnvironment",
      AppEnvironment(
        env: EnvValuesDev.env,
        flavor: EnvValuesDev.flavor,
        appName: EnvValuesDev.appName,
        databaseName: EnvValuesDev.databaseName,
      ).toJson(),
    );

    final Map<String, dynamic>? appEnvironmentData = await databaseService.get(
      AppEnvironmentDatabase().name,
      "AppEnvironment",
    );

    if (appEnvironmentData != null) {
      AppEnvironment appEnvironment =
          AppEnvironment.fromJson(appEnvironmentData);
      sl<Logger>().i("Environment: ${appEnvironment.env}");
    } else {
      sl<Logger>().i("AppEnvironment data not found in the database.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.kAccentColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sl<AppEnvironment>().appName),
          const Text("Base Screen"),
        ],
      ),
    ));
  }
}
