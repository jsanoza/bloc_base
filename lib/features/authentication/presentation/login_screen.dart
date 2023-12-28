import 'package:flutter/material.dart';
import 'package:movie/common/services/device_info_service.dart';

import '../../../common/models/app_environment.dart';
import '../../../dependencies/dependency_manager.dart';
import '../../../themes/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _deviceId = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadDeviceId();
  }

  Future<void> _loadDeviceId() async {
    try {
      _deviceId = await sl<DeviceInfoService>().getDeviceIdSync();
    } catch (e) {
      _deviceId = "Error: $e";
    } finally {
      if (mounted) {
        setState(() {});
      }
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
          Text(_deviceId),
          const Text("Login Screen"),
        ],
      ),
    ));
  }
}
