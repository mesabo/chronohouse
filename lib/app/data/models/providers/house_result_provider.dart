import 'package:get/get.dart';

import '../../../modules/utils/app_url.dart';
import '../house_result_model.dart';

class HouseResultProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return HouseResult.fromJson(map);
      if (map is List) {
        return map.map((item) => HouseResult.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = AppUrl.BASE_URL;
  }

  Future<HouseResult> postHouseResult(House house) async {
    var response = await post(AppUrl.URL_MAKE_PREDICT, house.toJson());
    if (response.isOk) {
      return response.body;
    }
    return HouseResult(status: false, message: 'error', result: 0);
  }
}
