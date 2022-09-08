import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  var lightThemeData = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColor.BACKGROUND,
    // primaryColor: AppColor.PRIMARY5,
    primaryColor: AppColor.PRIMARY8,
    bottomAppBarColor: AppColor.LIGHT,
    dividerColor: AppColor.SECONDARY1,
    textTheme: GoogleFonts.commissionerTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.PRIMARY8,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.WHITE),
    ),
  );
}
