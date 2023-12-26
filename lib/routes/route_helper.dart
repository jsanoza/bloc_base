import 'package:flutter/material.dart';

import '../dependencies/dependency_manager.dart';
import 'main_router.dart';
import 'onboarding_router.dart';
import 'root_router.dart';

typedef RouteBuilder = Route<dynamic> Function({RouteSettings? settings});

abstract class AppRouter {
  String get name;
}

/// The class which oversees every route states and it serves as helper to any
/// UI components that need it.
class RouteHelper {
  @protected
  RootRouter get rootRouter => sl<RootRouter>();

  @protected
  MainRouter get mainRouter => sl<MainRouter>();

  @protected
  OnboardingRouter get onboardingRouter => sl<OnboardingRouter>();

  /// ROOT routes
  /// ************************************************************

  /// ONBOARDING routes
  /// ************************************************************
  void popAllAndPushToLoginScreen() {
    onboardingRouter.key.currentState?.pushReplacementNamed(
      OnboardingRouter.login,
    );
  }

  /// MAIN routes
  /// ************************************************************
  void navigateToBaseScreen() {
    mainRouter.key.currentState?.pushReplacementNamed(
      MainRouter.base,
    );
  }

  void navigateToSettingsScreen() {
    mainRouter.key.currentState?.pushReplacementNamed(
      MainRouter.settings,
    );
  }

  void popToPreviousPage() {
    mainRouter.key.currentState?.pop();
  }

  void pop2StepsOfCurrentPage() {
    if (Navigator.canPop(mainRouter.key.currentContext!)) {
      Navigator.pop(mainRouter.key.currentContext!);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Navigator.canPop(mainRouter.key.currentContext!)) {
          Navigator.pop(mainRouter.key.currentContext!);
        }
      });
    }
  }

  // defaults
  void popMainToRoot() {
    mainRouter.key.currentState?.popUntil((route) => route.isFirst);
  }
}
