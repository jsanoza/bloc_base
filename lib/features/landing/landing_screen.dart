// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/blocs/app_bloc.dart';
import 'package:movie/features/onboarding/onboarding_screen.dart';

import '../../common/models/app_environment.dart';
import '../../common/services/busy_indicator_helper.dart';
import '../../dependencies/authenticated_dependency_provider.dart';
import '../../dependencies/dependency_manager.dart';
import '../../routes/main_router.dart';
import '../../routes/onboarding_router.dart';
import '../../themes/app_colors.dart';
import '../main/main_screen.dart';

class LandingScreen extends StatefulWidget {
  final DependencyManager dependencyManager;
  const LandingScreen({super.key, required this.dependencyManager});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    context.read<AppBloc>().initializeApp(widget.dependencyManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (sl<BusyIndicatorHelper>().isShown()) {
            return false;
          }

          final handledOnboardingPop =
              !(await sl<OnboardingRouter>().key.currentState?.maybePop() ??
                  false);

          final handledMainPop =
              !(await sl<MainRouter>().key.currentState?.maybePop() ?? false);

          return handledOnboardingPop && handledMainPop;
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 275),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.fastOutSlowIn,
              child: _buildLandingScreen(),
            ),
          ],
        ),
      ),
    );
  }

  _buildLandingScreen() {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.showSplashScreen ?? false) {
          //show Splash Screen
          return Container(
            width: MediaQuery.sizeOf(context).width,
            color: AppColors.kBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sl<AppEnvironment>().appName),
                const Text("Splash Screen"),
              ],
            ),
          );
        }

        /// do custom logic here
        ///
        // return const OnboardingScreen();

        /// if we need to show onboarding screen
        /// return onboarding screen
        return const OnboardingScreen();

        /// for now lets show main screen and switching the routes to authenticated routes

        // return const AuthenticatedDependencyProvider(
        //   child: MainScreen(),
        // );
      },
    );
  }
}
