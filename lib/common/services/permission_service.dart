import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> checkMicrophonePermission() async {
    var microphoneStatus = await Permission.microphone.status;
    if (!microphoneStatus.isGranted) {
      await Permission.microphone.request();
    }
  }

  Future<void> checkSpeechPermission() async {
    if (Platform.isIOS) {
      var speechStatus = await Permission.speech.status;
      if (!speechStatus.isGranted) {
        await Permission.speech.request();
      }
    }
  }

  Future<void> checkAllPermissions() async {
    await checkMicrophonePermission();
    await checkSpeechPermission();
  }
}
