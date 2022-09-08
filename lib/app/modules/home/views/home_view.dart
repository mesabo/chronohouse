import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:chronohouse/app/modules/analyse/views/analyse_view.dart';
import 'package:chronohouse/app/modules/dashboard/views/dashboard_view.dart';
import 'package:chronohouse/app/modules/historique/views/historique_view.dart';
import 'package:chronohouse/app/modules/prediction/views/prediction_view.dart';
import 'package:chronohouse/app/modules/profile/views/profile_view.dart';
import 'package:chronohouse/app/modules/utils/app_images.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  /// Views to display
  List<Widget> views = [
    DashboardView(),
    // AnalyseView(),
    PredictionView(),
    HistoriqueView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Row(
            children: [
              SideNavigationBar(
                selectedIndex: ctlHome.selectedIndex.value,
                theme: SideNavigationBarTheme(
                  itemTheme: SideNavigationBarItemTheme.standard(),
                  togglerTheme: SideNavigationBarTogglerTheme.standard(),
                  backgroundColor: AppColor.BACKGROUND,
                  dividerTheme: SideNavigationBarDividerTheme.standard(),
                ),
                items: const [
                  SideNavigationBarItem(
                    icon: Icons.dashboard,
                    label: 'DASHBOARD',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.travel_explore_outlined,
                    label: 'PREDICTION',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.history,
                    label: 'HISTORIQUE',
                  ),
                  SideNavigationBarItem(
                    icon: Icons.person,
                    label: 'PROFILE',
                  ),
                ],
                header: const SideNavigationBarHeader(
                    image: CircleAvatar(
                        radius: 50, backgroundImage: AssetImage(AppImage.c24)),
                    title: Text("Chronostec24"),
                    subtitle: Text("chronoHouse")),
                footer: const SideNavigationBarFooter(
                    label: Text("copyright Chronostec24")),
                onTap: (index) {
                  refreshPage(index);
                  ctlHome.selectedIndex.value = index;
                },
              ),

              /// Make it take the rest of the available width
              Expanded(
                child: views.elementAt(ctlHome.selectedIndex.value),
              )
            ],
          ),
        ));
  }

  void refreshPage(int index) {
    switch (index) {
      case 0:
        ctlDashboard.listerDashboard();
        break;
      case 1:
        ctlPrediction.currentId.value = 0;
        ctlPrediction.housePrice.value.price = 0;
        break;
      case 2:
        ctlHistorique.listerPredictions();
        break;
      default:
    }
  }
}
