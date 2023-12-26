import 'package:flutter/material.dart';
import 'package:movie/themes/app_colors.dart';

import '../../common/models/app_environment.dart';
import '../../dependencies/dependency_manager.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kAccentLightColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sl<AppEnvironment>().appName),
          const Text("Onboarding Screen"),
        ],
      ),
    );
  }
}
