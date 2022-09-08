import 'package:get/get.dart';

import '../controllers/analyse_controller.dart';

class AnalyseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnalyseController>(
      () => AnalyseController(),
    );
  }
}
