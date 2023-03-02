import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrvm/bindings/machine_bindings.dart';

import 'core/queue.dart';
import 'views/machine_view.dart';
import 'widgets/data_module.dart';
import 'widgets/queue_module.dart';

class GetXTestController extends GetxController {
  var counter = 0.obs;
  var list = <int>[].obs;

  var queue = Queue(QueueType.inbox, ["74HC161"]).obs;

  var queueValues = <int>[].obs;

  GetXTestController() {
    reset();
  }

  void reset() {
    queueValues.value = queue.value.values;
  }

  void count() => counter++;

  void add() {
    var i = Random().nextInt(1000) - 500;
    list.add(i);
  }

  void pop() {
    queue.value.pop();
    queueValues.value = queue.value.values;
    update();
  }
}

class GetXTestPage extends StatelessWidget {
  final GetXTestController c = Get.find();

  GetXTestPage({super.key});

  Widget buildLabels() {
    return Text("counter = ${c.counter}");
  }

  Widget buildList() {
    List<Widget> list = [];
    for (var data in c.list) {
      list.add(DataModule(data));
    }
    return Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Obx( () => buildLabels() ),
        Row(children: [
          ElevatedButton.icon(onPressed: (){
            c.count();
          }, icon: const Icon(Icons.countertops), label: const Text("x")),
          ElevatedButton.icon(onPressed: (){
            c.add();
          }, icon: const Icon(Icons.add), label: const Text("+")),
          ElevatedButton(onPressed: () {
            c.pop();
          }, child: const Text("PLA")),
        ],),
        Obx( () => QueueModule(c.queue.value.type, c.queueValues) )
      ],),
    );
  }
}

class GetXTestApp extends StatelessWidget {
  const GetXTestApp({super.key});

  List<GetPage<dynamic>> buildPages() {
    List<GetPage<dynamic>> pages = [
      GetPage(name: "/machine", page: () => MachineView(), binding: MachineBindings())
    ];
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/machine",
      getPages: buildPages(),
    );
  }
}