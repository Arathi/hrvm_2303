import 'dart:async';

import 'instruction.dart';

class RuntimeException implements Exception {
  Instruction? instruction;
  String? message;

  RuntimeException([this.instruction, this.message]);

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();

    if (instruction != null) {
      buffer.write("执行指令 ${instruction.toString()} 时发生异常");
    }

    if (message != null) {
      if (buffer.length > 0) buffer.write("：");
      buffer.write(message);
    }

    if (buffer.length == 0) {
      buffer.write("HumanResourceVM运行期间发生异常");
    }

    return buffer.toString();
  }
}