import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:movie/blocs/network_connection/network_connection_bloc.dart';
import 'package:movie/blocs/network_connection/network_connection_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import '../../common/const/preference_keys.dart';
import '../../common/services/toast_service.dart';
import '../../dependencies/dependency_manager.dart';
import '../../generated/l10n.dart';
import '../../routes/onboarding_router.dart';

/// A top level screen container holding every screens in the onboarding process.
/// Please check [OnboardingRouter].
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isInitialBuild = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = sl.get<OnboardingRouter>();
    final hasSeenOnBoarding =
        sl.get<SharedPreferences>().getBool(PreferenceKeys.hasSeenOnBoarding) ??
            false;

    return BlocConsumer<NetworkBloc, NetworkState>(
      listener: (context, state) {
        sl<Logger>().i("NetworkBloc: ${state.isConnected}");

        if (_isInitialBuild) {
          _isInitialBuild = false;
          return;
        }

        if (state.isConnected) {
          sl<ToastService>().showToast(
            context: context,
            title: S.current.networkReconnected,
            description: S.current.networkReconnectedDescription,
            type: ToastificationType.success,
            style: ToastificationStyle.flat,
          );
        }

        if (!state.isConnected) {
          sl<ToastService>().showToast(
            context: context,
            title: S.current.networkDisconnected,
            description: S.current.networkDisconnectedDescription,
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
          );
        }
      },
      builder: (context, state) {
        return Navigator(
          key: router.key,
          onGenerateRoute: router.getRoute,
          initialRoute: hasSeenOnBoarding
              ? OnboardingRouter.login
              : OnboardingRouter.welcomeScreen,
        );
      },
    );
  }
}
