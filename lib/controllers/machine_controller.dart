import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrvm/core/instruction.dart';

import '../core/opcode.dart';
import '../core/program.dart';
import '../core/queue.dart';
import '../core/machine.dart';
import '../core/memory.dart';

class MachineController extends GetxController {
  RxList<int> inboxValues = <int>[].obs;
  RxList<int> outboxValues = <int>[].obs;
  RxList<int?> memoryValues = <int?>[].obs;
  // late Rx<Program> programInst;
  var operandController = TextEditingController(text: "0");

  late Rx<int?> acc;

  late Machine machine;

  get processor => machine.processor;

  MachineController() {
    var inbox = Queue(QueueType.inbox, ["74HC161"]);
    var outbox = Queue(QueueType.outbox);
    var memory = Memory(4, 4, {
      15: 0
    });
    var program = Program();

    machine = Machine(
      inbox,
      outbox,
      memory,
      program
    );

    acc = machine.processor.acc.obs;
    updateObservers();
  }

  void bindingObservers() {
    inboxValues = machine.inbox.values.obs;
    outboxValues = machine.outbox.values.obs;
    memoryValues = machine.memory.values.obs;
    acc = machine.processor.acc.obs;
  }

  void updateObservers() {
    inboxValues.clear();
    inboxValues.addAll(machine.inbox.values);

    outboxValues.clear();
    outboxValues.addAll(machine.outbox.values);

    memoryValues.clear();
    memoryValues.addAll(machine.memory.values);

    acc.value = machine.processor.acc;
    // update();
  }

  void pla() {
    var inst = Instruction(Opcode.PLA);
    execute(inst);
  }

  void pha() {
    var inst = Instruction(Opcode.PHA);
    execute(inst);
  }

  int getOperandAsInt() {
    int? operand = int.tryParse(operandController.text);
    if (operand == null) return 0;
    return operand;
  }

  void lda() {
    var addr = getOperandAsInt();
    var inst = Instruction(Opcode.LDA_ABS, operand: addr);
    execute(inst);
  }

  void sta() {
    var addr = getOperandAsInt();
    var inst = Instruction(Opcode.STA_ABS, operand: addr);
    execute(inst);
  }

  void add() {
    var addr = getOperandAsInt();
    var inst = Instruction(Opcode.ADD_ABS, operand: addr);
    execute(inst);
  }

  void sub() {
    var addr = getOperandAsInt();
    var inst = Instruction(Opcode.SUB_ABS, operand: addr);
    execute(inst);
  }

  void inc() {
    var addr = getOperandAsInt();
    var inst = Instruction(Opcode.INC_ABS, operand: addr);
    execute(inst);
  }

  void dec() {
    var addr = getOperandAsInt();
    var inst = Instruction(Opcode.DEC_ABS, operand: addr);
    execute(inst);
  }

  void execute(Instruction inst) {
    processor.executeInstruction(inst);
    updateObservers();
  }

  void reset() {
    machine.reset();
    updateObservers();
  }

  @override
  void onClose() {
    operandController.dispose();
  }
}
