import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrvm/widgets/data_module.dart';
import 'package:logger/logger.dart';

import '../controllers/machine_controller.dart';

var log = Logger();

class MachineView extends GetView<MachineController> {
  const MachineView({super.key});

  static const cellSize = 80.0;

  Widget buildQueue(String title, RxList<int> values, [reversed = false]) {
    // return ObxValue((list) {
    //   var dataModules = <Widget>[];
    //   for (var data in list) {
    //     dataModules.add(DataModule(data));
    //   }
    //   if (reversed) {
    //     dataModules = dataModules.reversed.toList();
    //   }
    //   return Container(
    //     color: const Color(0xFF4C392E),
    //       child: Column(children: [
    //         SizedBox(width: 80, height: 40, child: Center(child: Text(title))),
    //         Column(children: dataModules)
    //   ],)
    //   );
    // }, values);
    // return Obx(() {
    //
    // });
    return Container(
        color: const Color(0xFF4C392E),
        child: Column(children: [
          SizedBox(width: 80, height: 40, child: Center(child: Text(title))),
          Column(
              children: values.map(
                      (data) => DataModule(data)
              ).toList()
          )
        ])
    );
  }

  Widget buildMemoryCell(int index, {Color? bgColor, int? value, String? name}) {
    var widgets = <Widget>[];
    widgets.add(
        Container(
          color: bgColor,
          child: const SizedBox(width: cellSize, height: cellSize)
        )
    );
    if (value != null) {
      widgets.add(
        Positioned(
          left: cellSize / 2 - DataModule.width / 2,
          top: 10,
          child: DataModule(value)
        )
      );
    }
    if (name != null) {
      widgets.add(
        Positioned(
          left: 3,
          bottom: 1,
          child: Text(name),
        )
      );
    }
    widgets.add(
        Positioned(
          right: 3,
          bottom: 1,
          child: Text("$index")
        )
    );
    return Stack(children: widgets);
  }

  Widget buildMemoryCells(
      int width,
      int height,
      RxList<int?> values,
      RxMap<String, int> variables) {
    var indexToNameMap = <int, String>{};
    for (var entry in variables.entries) {
      indexToNameMap[entry.value] = entry.key;
    }

    return ObxValue((values) {
      List<Row> rows = [];
      for (int y = 0; y < height; y++) {
        var cells = <Widget>[];
        for (int x = 0; x < width; x++) {
          var index = x + y * width;
          Color? bgColor = (x % 2 == y % 2) ? const Color(0xFF8D8894) : null;
          String? name;
          if (indexToNameMap.containsKey(index)) {
            name = indexToNameMap[index];
          }
          cells.add(buildMemoryCell(
              index,
              bgColor: bgColor,
              value: values[index],
              name: name
          ));
        }
        Row row = Row(children: cells);
        rows.add(row);
      }

      return Container(
        padding: const EdgeInsets.all(10),
        color: const Color(0xFF988D97),
        child: SizedBox(width: width * cellSize, height: height * cellSize,
          child: Column(children: rows)
        ),
      );
    }, values);
  }

  Widget buildDebugger() {
    return Column(children: [
      TextField(
        autofocus: true,
        decoration: const InputDecoration(
          label: Text("operand"),
          hintText: "操作数"
        ),
        controller: controller.operandController
      ),
      const SizedBox(height: 25,),

      ElevatedButton(onPressed: () {
        log.i("Reset!");
        controller.reset();
      }, child: const Text("RST")),
      const SizedBox(height: 25,),

      ElevatedButton(onPressed: () {
        log.i("PLA");
        controller.pla();
      }, child: const Text("PLA")),
      const SizedBox(height: 10,),

      ElevatedButton(onPressed: () {
        log.i("PHA");
        controller.pha();
      }, child: const Text("PHA")),
      const SizedBox(height: 25,),

      ElevatedButton(onPressed: () {
        log.i("LDA");
        controller.lda();
      }, child: const Text("LDA")),
      const SizedBox(height: 10,),

      ElevatedButton(onPressed: () {
        log.i("STA");
        controller.sta();
      }, child: const Text("STA")),
      const SizedBox(height: 25,),

      ElevatedButton(onPressed: () {
        log.i("ADD");
        controller.add();
      }, child: const Text("ADD")),
      const SizedBox(height: 10,),

      ElevatedButton(onPressed: () {
        log.i("SUB");
        controller.sub();
      }, child: const Text("SUB")),
      const SizedBox(height: 10,),

      ElevatedButton(onPressed: () {
        log.i("INC");
        controller.inc();
      }, child: const Text("INC")),
      const SizedBox(height: 10,),

      ElevatedButton(onPressed: () {
        log.i("DEC");
        controller.dec();
      }, child: const Text("DEC")),
      const SizedBox(height: 25,),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Obx(() => buildQueue("INBOX", controller.inboxValues, false)),
        Expanded(flex: 14, child: Column(children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ObxValue((acc) => DataModule(acc.value), controller.acc)
          ),
          buildMemoryCells(
            controller.machine.memory.width,
            controller.machine.memory.height,
            controller.memoryValues,
            <String, int>{
              "zero": 15
            }.obs
          )
        ])),
        Obx(() => buildQueue("OUTBOX", controller.outboxValues, true)),
        // buildQueue("OUTBOX", controller.outboxValues, true),
        Expanded(
          flex: 10,
            child: buildDebugger()
        )
      ],)
    );
  }


}