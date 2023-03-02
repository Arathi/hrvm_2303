import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrvm/core/instruction.dart';
import 'package:hrvm/core/opcode.dart';
import 'package:hrvm/widgets/queue_module.dart';
import 'package:logger/logger.dart';

import 'widgets/data_module.dart';
import 'widgets/main_module.dart';
import 'core/queue.dart';
import 'core/machine.dart';
import 'core/memory.dart';
import 'core/program.dart';

var log = Logger();

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
  ).obs;

  get processor => machine.value.processor;
  get memory => machine.value.memory;
  get inbox => machine.value.inbox;
  get outbox => machine.value.outbox;
  get program => machine.value.program;

  void step() {
    machine.value.step();
    // update();
  }
}

class MachinePage extends StatelessWidget {
  MachinePage({super.key});

  final MachineAppController c = Get.find();

  Widget buildDebugger() {
    final MachineAppController controller = Get.find();
    return Container(
      color: const Color(0xFFBB9F8B),
      child: Column(children: [
        ElevatedButton(onPressed: () {
          controller.step();
        }, child: Text("单步"),)
      ],),
    );
  }

  Widget buildBody() {
    return Row(
      children: [
        Obx(() => QueueModule(c.inbox.type, c.inbox.values)),
        Expanded(flex: 4, child: MainModule()),
        Obx(() => QueueModule(c.outbox.type, c.outbox.values)),
        Expanded(flex: 3, child: buildDebugger()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildBody()
    );
  }
}

class MachineApp extends StatelessWidget {
  const MachineApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MachineAppController controller = Get.put(MachineAppController());
    return GetMaterialApp(
      home: MachinePage()
    );
  }
}