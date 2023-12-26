import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/const/preference_keys.dart';
import '../../dependencies/dependency_manager.dart';
import '../../routes/onboarding_router.dart';

/// A top level screen container holding every screens in the onboarding process.
/// Please check [OnboardingRouter].
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = sl.get<OnboardingRouter>();
    final hasSeenOnBoarding =
        sl.get<SharedPreferences>().getBool(PreferenceKeys.hasSeenOnBoarding) ??
            false;

    return Navigator(
      key: router.key,
      observers: [
        HeroController(),
      ],
      onGenerateRoute: router.getRoute,
      initialRoute: hasSeenOnBoarding
          ? OnboardingRouter.login
          : OnboardingRouter.welcomeScreen,
    );
  }
}
