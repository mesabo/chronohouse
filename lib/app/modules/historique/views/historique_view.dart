import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:chronohouse/app/modules/historique/views/historique_recherche.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/historique_controller.dart';

class HistoriqueView extends GetView<HistoriqueController> {
  const HistoriqueView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text('Historique Opérations'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: AppColor.PRIMARY3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${ctlHistorique.historiquesList.where((element) => DateTime.now().toString().substring(0, 10) == DateTime.parse(element.cat.toString()).toString().substring(0, 10)).toList().length}",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text("Aujourd'hui"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Container(
                        height: 10.h,
                        // width: 100.w,
                        decoration: BoxDecoration(
                          color: AppColor.PRIMARY3,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${ctlHistorique.historiquesList.length}",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text("Total"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                HistoriqueRecherche(),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(ctlHome.currencyFormatter.format(
                              ctlHistorique.historiquesList[index].price,
                              ctlHome.unitSettings)),
                          subtitle: Text(
                              "${ctlHistorique.historiquesList[index].address}"),
                          trailing: OutlinedButton(
                              onPressed: () {
                                ctlPrediction.currentId.value =
                                    ctlHistorique.historiquesList[index].id ??
                                        0;
                                ctlPrediction.incomeTF.text = ctlHistorique
                                    .historiquesList[index].income
                                    .toString();
                                ctlPrediction.ageTF.text = ctlHistorique
                                    .historiquesList[index].age
                                    .toString();
                                ctlPrediction.roomsTF.text = ctlHistorique
                                    .historiquesList[index].rooms
                                    .toString();
                                ctlPrediction.bedroomsTF.text = ctlHistorique
                                    .historiquesList[index].bedrooms
                                    .toString();
                                ctlPrediction.populationTF.text = ctlHistorique
                                    .historiquesList[index].population
                                    .toString();
                                ctlPrediction.addressTF.text = ctlHistorique
                                        .historiquesList[index].address ??
                                    '0';
                                ctlPrediction.housePrice.value.price =
                                    ctlHistorique.historiquesList[index].price;
                                ctlHome.selectedIndex.value = 1;
                              },
                              child: Text("Prédire")),
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: ctlHistorique.historiquesList.length)
              ],
            ),
          ),
        )));
  }
}
