import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io' show Platform;

class DeviceInfo {
  var deviceData = <String, dynamic>{};
  late String version;
  DeviceInfo() {
    getDeviceInfo();
    getPackageInfo();
  }

  void getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.androidInfo;
    setDeviceData(deviceInfo);
  }

  Map get getDeviceData {
    return deviceData;
  }

  void setDeviceData(AndroidDeviceInfo deviceInfo) {
    deviceData = _readAndroidBuildData(deviceInfo);
  }

  void getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'sdk': build.version.sdkInt,
      'release': build.version.release,
      'brand': build.brand,
      'device': build.device,
      'hardware': build.hardware,
      'model': build.model,
      'imei_id': build.androidId,
      'app_version': version,
      'appType': "QR Code Scanner App",
      'deviceType': Platform.isAndroid ? "Android" : "iOS",
    };
  }
}
