import 'dart:typed_data';

import 'package:logging/logging.dart';

import 'instruction.dart';
import 'opcode.dart';

var log = Logger("Program");

class Program {
  late Uint8List bytes;
  int get size => bytes.length;

  Map<String, int> labels = <String, int>{};
  Map<String, int> variables = <String, int>{};

  Program(int size) {
    bytes = Uint8List(size);
  }

  int? read(int index) {
    if (index >= 0 && index < size) {
      return bytes[index];
    }
    log.warning("内存越界：size=$size index=$index");
    return null;
  }

  bool write(int index, int data) {
    if (index >= 0 && index < size) {
      bytes[index] = data;
      return true;
    }
    log.warning("内存越界：size=$size index=$index");
    return false;
  }

  void addLabels(Map<String, int> labels) {
    this.labels.addAll(labels);
  }

  void addLabel(String label, int offset) {
    labels[label] = offset;
  }

  void addVariables(Map<String, int> variables) {
    this.variables.addAll(variables);
  }

  void addVariable(String name, int index) {
    variables[name] = index;
  }

  String? findVariable(int index) {
    for (var entry in variables.entries) {
      if (entry.value == index) {
        return entry.key;
      }
    }
    return null;
  }

  List<Instruction> disassembly() {
    var instList = <Instruction>[];
    for (int index = 0; index < bytes.length;) {
      var code = bytes[index];
      var operand = (index < bytes.length - 1) ? bytes[index + 1] : null;

      var inst = Instruction.disassembly(code, operand);
      if (inst == null) return instList;

      instList.add(inst);
      index += inst.opcode.length;
    }
    return instList;
  }

  static Program assembly(List<Instruction> instList, Map<String, int> variables) {
    // 生成符号表
    Map<String, int> symbols = <String, int>{};
    symbols.addAll(variables);

    // 生成偏移
    Map<String, int> labels = <String, int>{};
    int offset = 0;
    for (var inst in instList) {
      inst.offset = offset;
      if (inst.labels.isNotEmpty) {
        for (var label in inst.labels) {
          labels[label] = offset;
        }
      }
      offset += inst.opcode.length;
    }
    symbols.addAll(labels);

    // 解析符号
    for (var inst in instList) {
      if (inst.operandName != null) {
        var symbol = inst.operandName;
        if (!symbols.containsKey(symbol)) {
          log.warning("未找到符号：$symbol");
          continue;
        }
        var value = symbols[symbol] as int;

        switch (inst.opcode) {
          case Opcode.LDA_ABS:
          case Opcode.LDA_IND:
          case Opcode.STA_ABS:
          case Opcode.STA_IND:
          case Opcode.ADD_ABS:
          case Opcode.ADD_IND:
          case Opcode.SUB_ABS:
          case Opcode.SUB_IND:
          case Opcode.INC_ABS:
          case Opcode.INC_IND:
          case Opcode.DEC_ABS:
          case Opcode.DEC_IND:
            inst.operand = value;
            break;
          case Opcode.JMP:
            inst.operand = value;
            break;
          case Opcode.BEQ:
          case Opcode.BMI:
            inst.operand = inst.offset + inst.opcode.length - value;
            break;
          default:
            break;
        }
      }
    }

    Program program = Program(offset);

    for (var inst in instList) {
      program.write(inst.offset, inst.opcode.code);
      if (inst.opcode.length == 2) {
        program.write(inst.offset + 1, inst.operand);
      }
    }

    return program;
  }
}