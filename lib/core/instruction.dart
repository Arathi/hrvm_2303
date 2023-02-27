import 'dart:ffi';
import 'dart:typed_data';

import 'package:logging/logging.dart';

import 'opcode.dart';

var log = Logger("Instruction");

class Instruction {
  Opcode opcode;
  int operand;
  String? operandName;
  List<String> labels = <String>[];
  int offset = 0;

  AddressingMode get addressingMode => opcode.addressingMode;

  Instruction(this.opcode, {
    this.operand = 0,
    this.operandName,
    String? label
  }) {
    if (label != null) {
      labels.add(label);
    }
  }

  Uint8List toBytes() {
    var bytes = Uint8List(opcode.length);
    bytes[0] = opcode.code;
    if (opcode.length == 2) {
      bytes[1] = operand;
    }
    return bytes;
  }

  @override
  String toString() {
    var buffer = StringBuffer();

    if (labels.isNotEmpty) {
      for (var label in labels) {
        buffer.writeln("$label:");
      }
    }

    buffer.write(opcode.mnemonic);

    String operand = (operandName != null) ? operandName! : "${this.operand}";
    if (addressingMode == AddressingMode.absolute) {
      buffer.write(" $operand");
    }
    else if (addressingMode == AddressingMode.indirect) {
      buffer.write(" [$operand]");
    }
    else if (addressingMode == AddressingMode.relative) {
      if (this.operand >= 0) operand = "+$operand";
      buffer.write(" $operand");
    }

    return buffer.toString();
  }

  static Instruction? disassembly(int code, int? operand) {
    var opcode = Opcode.getByCode(code);
    if (opcode == null) return null;

    if (opcode.length == 1) {
      return Instruction(opcode);
    }
    else if (opcode.length == 2) {
      if (operand != null) {
        var inst = Instruction(opcode, operand: operand);
        // 相对寻址的操作数有符号
        if (inst.addressingMode == AddressingMode.relative) {
          inst.operand = -(256-operand);
        }
        return inst;
      }
      log.warning("未获取到操作数，无法创建指令");
    }
    return null;
  }
}