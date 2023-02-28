import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetTestController extends GetxController {
  var counter = 0.obs;
  var list = [].obs;

  void count() => counter++;

  void add() {
    var i = Random().nextInt(100);
    list.add(i);
  }
}

class GetTestPage extends StatelessWidget {
  final GetTestController c = Get.find();

  Widget buildLabels() {
    return Text("counter = ${c.counter}");
  }

  Widget buildList() {
    List<Widget> list = [];
    for (var i in c.list) {
      list.add(Text("[$i]"));
    }
    return Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Obx( () => buildLabels() ),
        ElevatedButton.icon(onPressed: (){
          c.count();
        }, icon: const Icon(Icons.countertops), label: const Text("x")),
        ElevatedButton.icon(onPressed: (){
          c.add();
        }, icon: const Icon(Icons.add), label: const Text("+")),
        Obx( () => buildList() )
      ],),
    );
  }
}

class GetTestApp extends StatelessWidget {
  const GetTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GetTestController c = Get.put(GetTestController());
    return GetMaterialApp(
      home: GetTestPage()
    );
  }
}