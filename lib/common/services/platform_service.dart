import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

/// Responsible for providing platform specific values and self-developed
/// platform plugin implementations.
class PlatformService {
  bool get isIOS => Platform.isIOS;

  bool get isAndroid => Platform.isAndroid;

  bool get isWeb => kIsWeb;

  String get operatingSystem => Platform.operatingSystem;

  Future<int?> get androidSdkNumber async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.version.sdkInt;
  }
}
