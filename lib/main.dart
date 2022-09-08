import 'dart:io';

import 'package:chronohouse/app/data/services/user_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init('mesabo_okohi_user_data');
  final userData = await UserLocalStorage().readUserData();

  runApp(
    Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
              title: "Chrono House",
              debugShowCheckedModeBanner: false,
              theme: AppTheme().lightThemeData,
              initialRoute:
                  (userData.email != null && userData.password!.isNotEmpty)
                      ? Routes.HOME
                      : AppPages.INITIAL,
              getPages: AppPages.routes,
            )),
  );
}
