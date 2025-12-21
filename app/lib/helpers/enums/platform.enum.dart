import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

enum Platform { iOS, android }

extension PlatformExtension on Platform {
  String get name {
    switch (this) {
      case Platform.iOS:
        return 'iOS';
      case Platform.android:
        return 'Android';
    }
  }

  Future<String?> get fcmToken async {
    final firebaseMessaging = FirebaseMessaging.instance;
    try {
      return await firebaseMessaging.getToken();
    } catch (e) {
      return null;
    }
  }

  Future<String> get deviceModel async {
    final deviceInfo = DeviceInfoPlugin();
    switch (this) {
      case Platform.iOS:
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.utsname.machine;
      case Platform.android:
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.model;
    }
  }

  Future<String> get osVersion async {
    final deviceInfo = DeviceInfoPlugin();
    switch (this) {
      case Platform.iOS:
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.systemVersion;
      case Platform.android:
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.version.release;
    }
  }
}
