import 'package:chronohouse/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:chronohouse/app/modules/historique/bindings/historique_binding.dart';
import 'package:chronohouse/app/modules/historique/controllers/historique_controller.dart';
import 'package:chronohouse/app/modules/home/controllers/home_controller.dart';
import 'package:chronohouse/app/modules/login/controllers/login_controller.dart';
import 'package:chronohouse/app/modules/prediction/controllers/prediction_controller.dart';
import 'package:get/get.dart';

HomeController ctlHome = Get.put(HomeController());
PredictionController ctlPrediction = Get.put(PredictionController());
LoginController ctlLogin = Get.put(LoginController());
HistoriqueController ctlHistorique = Get.put(HistoriqueController());
DashboardController ctlDashboard = Get.put(DashboardController());
