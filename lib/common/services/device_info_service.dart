// device_info_service.dart
import 'package:device_info_plus/device_info_plus.dart';
import 'package:logger/logger.dart';
import 'package:movie/common/services/platform_service.dart';
import 'package:movie/dependencies/dependency_manager.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<String> getDeviceIdSync() async {
    try {
      if (sl<PlatformService>().isAndroid) {
        AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        sl<Logger>().i(androidInfo);
        return androidInfo.product;
      } else if (sl<PlatformService>().isIOS) {
        IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        sl<Logger>().i(iosInfo);
        return iosInfo.identifierForVendor ?? "Unknown Device";
      }
    } catch (e) {
      sl<Logger>().e("Error getting device ID: $e");
      return "Unknown Device";
    }
    return "Unknown Device";
  }
}
