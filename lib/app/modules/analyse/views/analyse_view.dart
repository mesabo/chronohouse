import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/analyse_controller.dart';

class AnalyseView extends GetView<AnalyseController> {
  const AnalyseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnalyseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AnalyseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
