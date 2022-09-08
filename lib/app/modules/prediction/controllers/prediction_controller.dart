import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:chronohouse/app/data/models/house_result_model.dart';
import 'package:chronohouse/app/data/models/providers/house_result_provider.dart';
import 'package:chronohouse/app/data/models/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/result_predictions_model.dart';

class PredictionController extends GetxController {
  final isPrediciting = false.obs;
  final isSaving = false.obs;
  final incomeTF = TextEditingController();
  final ageTF = TextEditingController();
  final roomsTF = TextEditingController();
  final bedroomsTF = TextEditingController();
  final populationTF = TextEditingController();
  final addressTF = TextEditingController();

  Rx<House> housePrice = House().obs;
  Rx<Predictions> prediction = Predictions(id: 0, address: '').obs;
  RxInt currentId = 0.obs;
  HouseResultProvider provHouse = HouseResultProvider();
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

  Future predictPrice() async {
    isPrediciting.value = true;
    provHouse.onInit();
    var house = convertInputs();
    HouseResult result = await provHouse.postHouseResult(house);
    if (result.status == true) {
      housePrice.value = result.house!;
    }
    isPrediciting.value = false;
    return result;
  }

  House convertInputs() {
    var income, age, rooms, bedrooms, pop;
    income = double.parse(incomeTF.text);
    age = double.parse(ageTF.text);
    rooms = double.parse(roomsTF.text);
    bedrooms = double.parse(bedroomsTF.text);
    pop = double.parse(populationTF.text);

    return House(
        avgAreaIncome: income,
        avgAreaHouseAge: age,
        avgAreaNumberofRooms: rooms,
        avgAreaNumberofBedrooms: bedrooms,
        areaPopulation: pop);
  }

  Future<ResultPredictions> savePrediction() async {
    isSaving.value = true;
    prediction.value = Predictions(
      id: currentId.value,
      userId: ctlLogin.userData.value.id,
      age: housePrice.value.avgAreaHouseAge,
      income: housePrice.value.avgAreaIncome,
      bedrooms: housePrice.value.avgAreaNumberofBedrooms,
      rooms: housePrice.value.avgAreaNumberofRooms,
      population: housePrice.value.areaPopulation,
      price: housePrice.value.price,
      address: addressTF.text.trim(),
    );
    provPrediction.onInit();

    var result = await provPrediction.savePrediction(prediction.value);

    isSaving.value = false;
    return result;
  }
}
