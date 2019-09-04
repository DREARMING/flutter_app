import 'package:flutter/services.dart';

class SystemInfoPlugin {

  static const _chanel = const MethodChannel('mvcoder/SystemInfoPlugin');

  static const METHOD_GET_BATTERY_LEVEL = "getBatteryLevel";

  static Future<int> getBatteryLevel() async {
    Map<String, dynamic> para = {};
    return await _chanel.invokeMethod(METHOD_GET_BATTERY_LEVEL, para);
  }
}