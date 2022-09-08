import 'dart:io';

import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:chronohouse/app/modules/utils/app_images.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          // appBar: AppBar(
          //   title: const Text('Dashboard'),
          //   centerTitle: true,
          // ),
          body: SizedBox.expand(
            // -> 01
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImage.house),
                    fit: BoxFit.cover, // -> 02
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Historique des opérations",
                        style:
                            TextStyle(fontSize: 20.sp, color: AppColor.BLACK),
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 50.h,
                        width: 90.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: AppColor.PRIMARY1,
                                          child: ListTile(
                                            title: Text(
                                              "${ctlDashboard.dashboard.value.total ?? 0}",
                                              style: TextStyle(fontSize: 28.sp),
                                            ),
                                            subtitle: Text(
                                              "Total Données",
                                              style: TextStyle(fontSize: 13.sp),
                                            ),
                                            trailing: const Icon(
                                              CupertinoIcons.waveform_circle,
                                              size: 48,
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: AppColor.GREEN1,
                                          child: ListTile(
                                            title: Text(
                                              "${ctlDashboard.dashboard.value.today ?? 0}",
                                              style: TextStyle(fontSize: 28.sp),
                                            ),
                                            subtitle: Text(
                                              "Aujourd'hui",
                                              style: TextStyle(fontSize: 13.sp),
                                            ),
                                            trailing: const Icon(
                                              CupertinoIcons.calendar_today,
                                              size: 48,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            color: AppColor.ORANGE0,
                                            child: ListTile(
                                              title: Text(
                                                "${ctlDashboard.dashboard.value.score ?? 0}%",
                                                style:
                                                    TextStyle(fontSize: 28.sp),
                                              ),
                                              subtitle: Text(
                                                "Score",
                                                style:
                                                    TextStyle(fontSize: 13.sp),
                                              ),
                                              trailing: const Icon(
                                                CupertinoIcons.calendar_today,
                                                size: 48,
                                              ),
                                            ),
                                          ))),
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: AppColor.GREEN00,
                                          child: ListTile(
                                            title: Text(
                                              "${ctlDashboard.dashboard.value.newsdata ?? 0}",
                                              style: TextStyle(fontSize: 28.sp),
                                            ),
                                            subtitle: Text(
                                              "Nouvelles données",
                                              style: TextStyle(fontSize: 13.sp),
                                            ),
                                            trailing: const Icon(
                                              CupertinoIcons
                                                  .list_bullet_below_rectangle,
                                              size: 48,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
