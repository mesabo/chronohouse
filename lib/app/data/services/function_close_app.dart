import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_app_minimizer/flutter_app_minimizer.dart';

void closeOkohi() {
  if (Platform.isAndroid) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  } else {
    FlutterAppMinimizer.minimize();
  }
}
