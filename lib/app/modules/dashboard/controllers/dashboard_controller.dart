import 'package:chronohouse/app/data/models/providers/providers.dart';
import 'package:chronohouse/app/data/models/result_dashboards_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  /// `status`
  final isReading = false.obs;

  /// `dashboard`
  Rx<Dashboards> dashboard = Dashboards().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    listerDashboard();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// `Lister les agences visitées`
  Future<Dashboards> listerDashboard() async {
    isReading.value = true;
    provDashboard.onInit();
    final result = await provDashboard.listDashboard();
    if (result.resultat!.status == true) {
      if (result.dashboards!.isNotEmpty) {
        dashboard.value = result.dashboards!.first;
      }
    }
    // for (var element in dashboard.value) {
    printInfo(info: '${dashboard.value.toJson()}');
    // }
    isReading.value = false;
    return dashboard.value;
  }
}
