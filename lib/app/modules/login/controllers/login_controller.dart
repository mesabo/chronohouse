import 'package:chronohouse/app/data/models/providers/providers.dart';
import 'package:chronohouse/app/data/models/result_users_model.dart';
import 'package:chronohouse/app/data/services/user_local_storage.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailTF = TextEditingController();
  final passwordTF = TextEditingController();

  final isLoggining = false.obs;

  /// `Données de l'utilisateur`
  Rx<Users> userData = Users(id: 0).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// `Initialiser les données utilisateurs`
  Future<Users> initializeUserDatas() async {
    await UserLocalStorage()
        .readUserData()
        .then((value) => print("BONJOUR==>${value.toJson()}"));

    return userData.value;
  }

  /// `Charger les informations de l'utilisateur en local`
  Future<Users> readUserData() async =>
      userData.value = await UserLocalStorage().readUserData();

  /// `Connexion ou Inscription`
  Future<Users> loginUser() async {
    isLoggining.value = true;
    userData.value.email = emailTF.text;
    userData.value.password = passwordTF.text;

    provUser.onInit();
    ResultUsers result = await provUser.loginUser(userData.value);
    if (result.resultat!.status == true) {
      if (result.users != null && result.users!.isNotEmpty) {
        userData.value =
            await UserLocalStorage().saveUserData(result.users!.first);
      } else {
        Get.snackbar("Authentification",
            "Échec: ${result.resultat!.message.toString()} !",
            backgroundColor: AppColor.SECONDARY1);
      }
    } else {
      Get.snackbar(
          "Authentification", "Échec: ${result.resultat!.message.toString()} !",
          backgroundColor: AppColor.ORANGE);
    }
    await UserLocalStorage().readUserData();

    isLoggining.value = false;
    return userData.value;
  }
}
