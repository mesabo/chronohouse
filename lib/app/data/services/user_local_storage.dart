import 'package:get_storage/get_storage.dart';

import '../models/result_users_model.dart';

class UserLocalStorage {
  static const String table = "mesabo_okohi_user_data";
  final box = GetStorage('mesabo_okohi_user_data');

  /// `Lires les informations de l'utilisateur `
  /// `archivées sur la mémoire du téléphone`
  Future<Users> readUserData() async {
    var currentUser = Users(id: 0);
    if (box.read(table) != null) {
      final data = box.read(table) as Map<String, dynamic>;
      currentUser = Users.fromJson(data);
    }
    print("CURRENT USER: ${currentUser.toJson()}");
    return currentUser;
  }

  /// `Archiver les informations de l'utilisateur`
  /// `sur la méémoire du téléphone`
  Future<Users> saveUserData(Users model) async {
    await box.write(table, model.toJson());
    return await readUserData();
  }

  ///`Nétoyer les informations de l'utilisateur`
  Future clearUserData() async {
    box.erase();
    readUserData();
  }
}
