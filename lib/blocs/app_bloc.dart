import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/const/preference_keys.dart';
import '../dependencies/dependency_manager.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppState());

  Future<void> initializeApp(DependencyManager dependencyManager) async {
    emit(state.copyWith(
      initialized: false,
      error: null,
      showSplashScreen: true,
    ));

    // Fake splash screen
    await Future.delayed(const Duration(seconds: 2));

    // to make sure dependencies were initialized well
    // before we proceed to the next screen
    // this is to avoid any errors that might occur
    if (dependencyManager.initialized == true) {
      await onColdStart();
      emit(state.copyWith(initialized: true, showSplashScreen: false));
      return;
    }

    try {
      await dependencyManager.init();
      await onColdStart();
      emit(state.copyWith(initialized: true, showSplashScreen: false));
    } catch (e, stackTrace) {
      sl<Logger>()
          .e("DEPENDENCY ERROR WENT HERE", error: e, stackTrace: stackTrace);
      emit(state.copyWith(error: e, showSplashScreen: false));
    }
  }

  Future<void> verifyFreshInstall() async {
    final sharedPreferences = sl<SharedPreferences>();

    final isFreshInstall =
        sharedPreferences.getBool(PreferenceKeys.isFreshInstall) ?? true;

    if (isFreshInstall) {
      await sharedPreferences.setBool(PreferenceKeys.isFreshInstall, false);
    }
  }

  Future<void> onColdStart() async {
    // Verify fresh install
    // If fresh install, sign out user
    await verifyFreshInstall();
  }

  Future<void> onAppForeground() async {
    // Fetch remote config or any other necessary actions here
  }
}

class AppState {
  final bool initialized;
  final dynamic error;
  final bool? showSplashScreen;

  AppState({
    this.initialized = false,
    this.showSplashScreen = false,
    this.error,
  });

  AppState copyWith({
    bool? initialized,
    dynamic error,
    bool? showSplashScreen,
    //app configuration
  }) {
    return AppState(
      initialized: initialized ?? this.initialized,
      error: error ?? this.error,
      showSplashScreen: showSplashScreen ?? this.showSplashScreen,
    );
  }
}
