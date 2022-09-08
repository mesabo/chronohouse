import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:chronohouse/app/routes/app_pages.dart';
import 'package:chronohouse/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/login_controller.dart';
import 'login_header.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: <Widget>[
                HeaderContainer("Authentification"),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          width: 50.w,
                          child: Column(
                            children: [
                              _textInput(
                                  hint: "Adresse Email",
                                  icon: Icons.email,
                                  controller: ctlLogin.emailTF),
                              _textInput(
                                  hint: "Mot de passe",
                                  icon: Icons.vpn_key,
                                  controller: ctlLogin.passwordTF),
                              const SizedBox(height: 20),
                              CupertinoButton(
                                  onPressed: () {
                                    if (ctlLogin.emailTF.text.isNotEmpty &&
                                        ctlLogin.passwordTF.text.isNotEmpty) {
                                      ctlLogin.loginUser().then((value) =>
                                          value.id! > 0
                                              ? Get.offAllNamed(Routes.HOME)
                                              : null);
                                    } else {
                                      Get.snackbar("FORMULAIRE",
                                          "Veuillez saisir vos identifiants pour vous connecter");
                                    }
                                  },
                                  color: ctlLogin.isLoggining.value
                                      ? AppColor.PRIMARY1
                                      : AppColor.PRIMARY5,
                                  child: ctlLogin.isLoggining.value
                                      ? const CircularProgressIndicator()
                                      : const Text("CONNEXION")),
                            ],
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "Copyright 2022 ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "CHRONOSTEC24",
                                style: TextStyle(color: AppColor.ORANGE)),
                          ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
