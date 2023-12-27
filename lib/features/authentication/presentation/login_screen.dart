import 'package:flutter/material.dart';

import '../../../common/models/app_environment.dart';
import '../../../dependencies/dependency_manager.dart';
import '../../../themes/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          const Text("Login Screen"),
        ],
      ),
    ));
  }
}
