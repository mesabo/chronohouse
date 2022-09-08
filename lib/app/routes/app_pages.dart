import 'package:get/get.dart';

import '../modules/analyse/bindings/analyse_binding.dart';
import '../modules/analyse/views/analyse_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/historique/bindings/historique_binding.dart';
import '../modules/historique/views/historique_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/prediction/bindings/prediction_binding.dart';
import '../modules/prediction/views/prediction_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ANALYSE,
      page: () => const AnalyseView(),
      binding: AnalyseBinding(),
    ),
    GetPage(
      name: _Paths.PREDICTION,
      page: () => PredictionView(),
      binding: PredictionBinding(),
    ),
    GetPage(
      name: _Paths.HISTORIQUE,
      page: () => const HistoriqueView(),
      binding: HistoriqueBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
