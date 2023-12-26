import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'app.dart';
import 'dependencies/dependency_manager.dart';

FutureOr<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize depedency injection

      final DependencyManager dependencyManager;

      dependencyManager = DependencyManager();

      await dependencyManager.init().onError((error, stackTrace) {
        debugPrint("DEPENDENCY MANAGEMENT ERROR: $error $stackTrace");
      });

      runApp(App(dependencyManager: dependencyManager));
    },
    (error, stack) async {
      Logger().e(error.toString());
    },
  );
}
