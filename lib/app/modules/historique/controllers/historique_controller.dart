import 'package:chronohouse/app/data/models/providers/providers.dart';
import 'package:chronohouse/app/data/models/result_predictions_model.dart';
import 'package:chronohouse/app/data/models/resultat_model.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoriqueController extends GetxController {
  final searchTF = TextEditingController();

  /// `status`
  final isListing = false.obs;
  final isSaving = false.obs;

  Rx<Predictions> currentPrediction = Predictions(id: 0, address: "").obs;

  /// `Historique des prédictions`
  RxList<Predictions> historiquesList = <Predictions>[].obs;
  RxList<Predictions> permanentHistoriquesList = <Predictions>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    listerPredictions();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// `Rechercher un client`
  Future<List<Predictions>> rechercherPrediction(String text) async {
    historiquesList.value = permanentHistoriquesList
        .where((p0) => p0.address!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    return historiquesList;
  }

  /// `Lister les agences visitées`
  Future<List<Predictions>> listerPredictions() async {
    isListing.value = true;
    provPrediction.onInit();
    final result = await provPrediction.listPrediction();
    if (result.resultat!.status == true) {
      if (result.predictions!.isNotEmpty) {
        historiquesList.value = result.predictions ?? [];
        permanentHistoriquesList.value = result.predictions ?? [];
      }
    }
    // for (var element in historiquesList) {
    //   printInfo(info: '${element.promo!.toJson()}');
    // }
    isListing.value = false;
    return historiquesList;
  }

  /// `Enregistrer une nouvelle prediction`
  Future<Resultat> savePrediction() async {
    isSaving.value = true;
    var msg = Resultat();
    provPrediction.onInit();
    ResultPredictions result =
        await provPrediction.savePrediction(currentPrediction.value);

    if (result.resultat!.status == true) {
      msg = Resultat(
        status: result.resultat!.status,
        exists: result.resultat!.exists,
        message: result.resultat!.message,
      );

      await listerPredictions();
    } else {
      Get.snackbar("Échec Enregistrement", "${result.resultat!.message}",
          backgroundColor: AppColor.SECONDARY1);
    }

    isSaving.value = false;
    return msg;
  }
}
