import 'package:chronohouse/app/data/constants/http_response_message.dart';
import 'package:get/get.dart';

import '../../../modules/utils/app_url.dart';
import '../result_predictions_model.dart';

class ResultPredictionsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ResultPredictions.fromJson(map);
      if (map is List) {
        return map.map((item) => ResultPredictions.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = AppUrl.BASE_URL;
  }

  Future<ResultPredictions> savePrediction(Predictions prediction) async {
    assert(prediction.id != null &&
        prediction.userId != null &&
        prediction.income != null &&
        prediction.age != null &&
        prediction.rooms != null &&
        prediction.bedrooms != null &&
        prediction.population != null &&
        prediction.address != null &&
        prediction.price != null);
    final response =
        await post(AppUrl.URL_POST_PREDICTION, prediction.toJson());
    if (!response.isOk) {
      return PredictionHttpResultError().error;
    }
    return response.body;
  }

  Future<ResultPredictions> listPrediction() async {
    final response = await get(AppUrl.URL_LIST_PREDICTION);
    if (!response.isOk) {
      return PredictionHttpResultError().error;
    }
    return response.body;
  }
}
