import 'package:chronohouse/app/modules/utils/app_images.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderContainer extends StatelessWidget {
  var text = "Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColor.PRIMARY1, AppColor.PRIMARY5],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: SizedBox(
              height: 50.h,
              width: 40.w,
              child: const CircleAvatar(
                backgroundImage: AssetImage(AppImage.house),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
