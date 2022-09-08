import 'package:chronohouse/app/data/constants/http_response_message.dart';
import 'package:get/get.dart';

import '../../../modules/utils/app_url.dart';
import '../result_dashboards_model.dart';

class ResultDashboardsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ResultDashboards.fromJson(map);
      if (map is List) {
        return map.map((item) => ResultDashboards.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = AppUrl.BASE_URL;
  }

  Future<ResultDashboards> listDashboard() async {
    final response = await get(AppUrl.URL_LIST_DASHBOARD);
    if (!response.isOk) {
      return DashboardHttpResultError().error;
    }
    return response.body;
  }
}
