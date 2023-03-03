import 'package:code_editor/code_editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:highlight/languages/x86asm.dart';

import '../core/assembler.dart';
import '../core/opcode.dart';
import '../core/program.dart';
import '../core/queue.dart';
import '../core/machine.dart';
import '../core/memory.dart';
import '../core/task.dart';
import '../core/instruction.dart';

var log = Logger();

class EditorModelEx extends EditorModel {
  EditorModelEx({required super.files, super.styleOptions});

  @override
  void toggleEditing() {
    super.toggleEditing();
    log.i("开启编辑模式");
    // super.notify();
  }
}

class MachineController extends GetxController {
  RxList<int> inboxValues = <int>[].obs;
  RxList<int> outboxValues = <int>[].obs;
  RxList<int?> memoryValues = <int?>[].obs;

  RxList<Instruction> instList = <Instruction>[].obs;
  RxMap<String, int> variables = <String, int>{}.obs;

  var operandController = TextEditingController(text: "0");
  var sourceController = TextEditingController(text: "");
  var editorController = CodeController(
    text: "",
    language: x86Asm
  );

  late RxInt pc;
  late Rx<int?> acc;
  RxBool useIndirectAddressing = false.obs;
  RxBool displaySourceCode = false.obs;
  RxString sourceCode = "".obs;

  AddressingMode addrMode = AddressingMode.absolute;

  late Machine machine;
  get processor => machine.processor;
  get program => machine.program;

  Assembler assembler = Assembler();

  EditorModel editorModel = EditorModelEx(
      files: [],
      styleOptions: EditorModelStyleOptions(
          heightOfContainer: Get.height - 50,
          editButtonName: "编辑",
          fontSize: 13
      )
  );

  MachineController([Task? task]) {
    var inbox = (task != null) ?
      Queue(QueueType.inbox, task.inboxInitValues) :
      Queue(QueueType.inbox) ;

    var outbox = (task != null) ?
      Queue(QueueType.inbox, task.outboxInitValues) :
      Queue(QueueType.outbox) ;

    var memory = (task != null) ?
      Memory(task.memoryWidth, task.memoryHeight, task.memoryInitValues) :
      Memory(4, 4);

    var program = Program();

    machine = Machine(
      inbox,
      outbox,
      memory,
      program
    );

    acc = machine.processor.acc.obs;
    pc = machine.processor.pc.obs;
    updateObservers();
  }

  MachineController.level(int level) : this(Task.getTaskByLevel(level));

  void updateObservers() {
    inboxValues.clear();
    inboxValues.addAll(machine.inbox.values);

    outboxValues.clear();
    outboxValues.addAll(machine.outbox.values);

    memoryValues.clear();
    memoryValues.addAll(machine.memory.values);

    acc.value = processor.acc;
    pc.value = processor.pc;
  }

  void addrModeChanged(bool value) {
    log.i("寻址模式改动：相对寻址=$value");
    useIndirectAddressing.value = value;
    if (useIndirectAddressing.value) {
      addrMode = AddressingMode.indirect;
    }
    else {
      addrMode = AddressingMode.absolute;
    }
  }

  void displaySrcChanged(bool value) {
    displaySourceCode.value = value;
    var mode = value ? "源码模式" : "可视化模式";
    log.i("切换为：$mode");
    if (value) {
      editorModel.toggleEditing();
    }
  }

  void submitSourceCode(String? language, String? value) {
    if (value != null) {
      sourceCode.value = value;
    }
    displaySrcChanged(false);
  }

  void reloadProgram() {
    instList.clear();
    instList.addAll(program.disassembly());
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
    var opcode = (addrMode == AddressingMode.absolute) ?
        Opcode.LDA_ABS :
        Opcode.LDA_IND ;
    var inst = Instruction(opcode, operand: addr);
    execute(inst);
  }

  void sta() {
    var addr = getOperandAsInt();
    var opcode = (addrMode == AddressingMode.absolute) ?
        Opcode.STA_ABS :
        Opcode.STA_IND ;
    var inst = Instruction(opcode, operand: addr);
    execute(inst);
  }

  void add() {
    var addr = getOperandAsInt();
    var opcode = (addrMode == AddressingMode.absolute) ?
        Opcode.ADD_ABS :
        Opcode.ADD_IND ;
    var inst = Instruction(opcode, operand: addr);
    execute(inst);
  }

  void sub() {
    var addr = getOperandAsInt();
    var opcode = (addrMode == AddressingMode.absolute) ?
        Opcode.SUB_ABS :
        Opcode.SUB_IND ;
    var inst = Instruction(opcode, operand: addr);
    execute(inst);
  }

  void inc() {
    var addr = getOperandAsInt();
    var opcode = (addrMode == AddressingMode.absolute) ?
        Opcode.INC_ABS :
        Opcode.INC_IND ;
    var inst = Instruction(opcode, operand: addr);
    execute(inst);
  }

  void dec() {
    var addr = getOperandAsInt();
    var opcode = (addrMode == AddressingMode.absolute) ?
        Opcode.DEC_ABS :
        Opcode.DEC_IND ;
    var inst = Instruction(opcode, operand: addr);
    execute(inst);
  }

  void execute(Instruction inst) {
    log.i("执行指令：$inst");
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
    sourceController.dispose();
  }
}

