import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/prediction_controller.dart';

class PredictionView extends GetView<PredictionController> {
  PredictionView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // appBar: AppBar(title: Text("House Price Prediction")),
        body: Form(
          key: _formKey,
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: Center(
                          child: Text(
                        "Remplir les champs pour effectuer une prédiction",
                        style: TextStyle(fontSize: 18.sp),
                      )),
                    ),
                    myTextField(
                        control: ctlPrediction.incomeTF,
                        action: TextInputAction.next,
                        title: "Revenu moyen",
                        hint: '61907',
                        helper:
                            "Le revenu moyen des résidents de la de zone  où est situé maison"),
                    myTextField(
                        control: ctlPrediction.ageTF,
                        action: TextInputAction.next,
                        title: "Âge moyen",
                        hint: '7',
                        helper: "Âge moyen des maisons dans la même zone"),
                    myTextField(
                        control: ctlPrediction.roomsTF,
                        action: TextInputAction.next,
                        title: "Nombre moyen de pièces",
                        hint: '6',
                        helper:
                            "Nombre moyen de pièces pour les maisons dans la même zone"),
                    myTextField(
                        control: ctlPrediction.bedroomsTF,
                        action: TextInputAction.next,
                        title: "Nombre moyen de chambres",
                        hint: '3',
                        helper:
                            "Nombre moyen de chambres pour les maisons dans la même zone"),
                    myTextField(
                        control: ctlPrediction.populationTF,
                        action: TextInputAction.done,
                        title: "Nombre moyen de résidents",
                        hint: '43828',
                        helper:
                            "Le nombre moyen de résidents de la zone  où est situé maison."),
                    CupertinoButton.filled(
                        child: const Text("PRÉDIRE"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.predictPrice();
                          } else {
                            Get.snackbar("Attention",
                                "Veuillez s'il vous plait saisir des valeurs valides pour effectuer une prédiction",
                                backgroundColor: Colors.black,
                                colorText: Colors.white);
                          }
                        }),
                    SizedBox(height: 5.h),
                    controller.isPrediciting.value
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            width: 90.w,
                            child: Card(
                              color: Colors.black,
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      title: const Text(
                                          "Le prix de cet appartement avec une précision de 92%, est estimé à",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      subtitle: Text(
                                          "${ctlHome.currencyFormatter.format(controller.housePrice.value.price ?? 0, ctlHome.unitSettings)}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp)),
                                    )),
                              ),
                            ),
                          ),
                    (controller.housePrice.value.price != null &&
                            controller.housePrice.value.price! > 0)
                        ? CupertinoButton(
                            color: AppColor.GREEN1,
                            child: const Text("Sauvegarder"),
                            onPressed: () {
                              _openDialogForm(context);
                            })
                        : const SizedBox(),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Padding myTextField(
      {required control,
      String title = 'title',
      String hint = 'example',
      String helper = 'Saisir des valeur valides',
      action = TextInputAction.done}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        controller: control,
        textInputAction: action,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
        ],
        validator: (value) => value!.isNotEmpty ? null : 'Saisie invalide',
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: control.text != ''
              ? IconButton(
                  onPressed: () => control.text = "",
                  icon: const Icon(CupertinoIcons.clear_thick_circled))
              : const SizedBox(),
          helperText: helper,
          labelText: title,
          hintText: hint,
        ),
      ),
    );
  }

  void _openDialogForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text("Adresse connue"),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: ctlPrediction.addressTF,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Saisir une adresse",
                        hintText: 'ex: Rue C99, Avenue 17, Ontario',
                        icon: Icon(CupertinoIcons.location_solid),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  child: Text("Annuler"),
                  onPressed: () {
                    Get.back();
                  }),
              ElevatedButton(
                  child: const Text("Enregistrer"),
                  onPressed: () async {
                    if (ctlPrediction.addressTF.text.isNotEmpty &&
                        ctlPrediction.addressTF.text.isNotEmpty) {
                      await ctlPrediction.savePrediction().then((value) {
                        Get.back();
                        if (value.resultat!.status == true) {
                          Get.snackbar("SAUVEGARDE",
                              "Les données de prédictions ont été enregistré avec succès !",
                              backgroundColor: AppColor.GREEN4,
                              colorText: Colors.white);
                        } else {
                          Get.snackbar("SAUVEGARDE",
                              "Oups !!\nDOnnées non sauvegardées !",
                              backgroundColor: AppColor.ORANGE,
                              colorText: Colors.black);
                        }
                      });
                    } else {
                      Get.snackbar(
                          "Sauvegarde de Données", "Donner une adresse svp.",
                          backgroundColor: AppColor.GREEN0);
                    }
                  })
            ],
          );
        });
  }
}
