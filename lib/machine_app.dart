import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrvm/core/instruction.dart';
import 'package:hrvm/core/opcode.dart';
import 'package:logging/logging.dart';

import 'widgets/data_module.dart';
import 'widgets/main_module.dart';
import 'core/queue.dart';
import 'core/machine.dart';
import 'core/memory.dart';
import 'core/program.dart';

var log = Logger("MachineApp");

class MachineAppController extends GetxController {
  var machine = Machine(
    Queue(QueueType.inbox, ["13AAFC22"]),
    Queue(QueueType.outbox, ["A2"]),
    Memory(4, 4, {
      15: 0
    }),
    Program.assembly([
      Instruction(Opcode.PLA, label: "start"),
      Instruction(Opcode.STA_ABS, operandName: "a"),
      Instruction(Opcode.PLA),
      Instruction(Opcode.SUB_ABS, operandName: "a"),
      Instruction(Opcode.BEQ, operandName: "output"),
      Instruction(Opcode.JMP, operandName: "start"),
      Instruction(Opcode.LDA_ABS, operandName: "a", label: "output"),
      Instruction(Opcode.PHA),
      Instruction(Opcode.JMP, operandName: "start"),
    ], {
      "a": 0
    })
  ).obs();
}

class MachinePage extends StatelessWidget {
  const MachinePage({super.key});

  Widget buildQueue(Queue queue) {
    var title = (queue.type == QueueType.inbox) ? "INBOX" : "OUTBOX";
    var widgets = <Widget>[];
    widgets.add(const SizedBox(width: 64, height: 10));
    widgets.add(Text(title));
    widgets.add(const SizedBox(width: 64, height: 10));
    var values = (queue.type == QueueType.inbox) ? queue.values : queue.values.reversed;
    for (var value in values) {
      widgets.add(DataModule(value));
    }
    return Container(
      color: const Color(0xFF4C392E),
      child: Column(
        children: widgets,
      )
    );
  }

  Widget buildDebugger() {
    final MachineAppController controller = Get.find();
    return Container(
      color: const Color(0xFFBB9F8B),
      child: Column(children: [
        ElevatedButton(onPressed: () {
          log.info("按下单步按钮");
          controller.machine.step();
        }, child: Text("单步"),)
      ],),
    );
  }

  Widget buildBody() {
    final MachineAppController controller = Get.find();
    return Row(
      children: [
        buildQueue(controller.machine.inbox),
        Expanded(flex: 4, child: MainModule()),
        buildQueue(controller.machine.outbox),
        Expanded(flex: 3, child: buildDebugger()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final MachineAppController controller = Get.put(MachineAppController());
    return Scaffold(
        body: buildBody()
    );
  }
}

class MachineApp extends StatelessWidget {
  const MachineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MachinePage()
    );
  }
}