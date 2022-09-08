import 'package:chronohouse/app/modules/utils/app_url.dart';
import 'package:get/get.dart';

import '../../constants/http_response_message.dart';
import '../result_users_model.dart';

class ResultUsersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ResultUsers.fromJson(map);
      if (map is List) {
        return map.map((item) => ResultUsers.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = AppUrl.BASE_URL;
  }

  /// Se connecter ou créer un nouveau compte en tant
  /// que User
  /// params: [email, password]
  Future<ResultUsers> loginUser(Users user) async {
    assert(user.email != null && user.password != null);
    final response = await post(AppUrl.URL_LOGIN, user.toJson());
    if (!response.isOk) {
      return UserHttpResultError().error;
    }
    return response.body;
  }
}
