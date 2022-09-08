import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:chronohouse/app/data/services/user_local_storage.dart';
import 'package:chronohouse/app/modules/utils/app_images.dart';
import 'package:chronohouse/app/routes/app_pages.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${ctlLogin.userData.value.nom ?? 'Nom'} ${ctlLogin.userData.value.prenom ?? ''}",
                                    // style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: Text(ctlLogin.userData.value.email ??
                                        'infos@chronostec24.com'),
                                    subtitle: const Text("Chronostec24"),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            /*  Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("285"),
                                      Text("Aujourd'hui")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("325"),
                                      Text("Mois")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text("650"),
                                      Text("Total")
                                    ],
                                  ),
                                ),
                              ],
                            ), */
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                                image: AssetImage(AppImage.house),
                                fit: BoxFit.cover)),
                        margin: const EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text("Informations Personnelles"),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text("Email"),
                          subtitle: Text(ctlLogin.userData.value.email ??
                              '------------------'),
                          leading: const Icon(Icons.email),
                        ),
                        ListTile(
                          title: const Text("Phone"),
                          subtitle: Text(ctlLogin.userData.value.telephone ??
                              '------------------'),
                          leading: const Icon(Icons.phone),
                        ),
                        ListTile(
                          title: const Text("Inscrit le"),
                          subtitle: Text(ctlLogin.userData.value.cat ??
                              '------------------'),
                          leading: const Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                      onPressed: () {
                        UserLocalStorage().clearUserData();
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        "Déconnexion",
                        style: TextStyle(color: AppColor.ORANGE),
                      ))
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          ],
        ),
      ),
    );
  }
}
