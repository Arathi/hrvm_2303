import 'package:hrvm/core/opcode.dart';
import 'package:hrvm/core/runtime_exception.dart';
import 'package:logging/logging.dart';

import 'instruction.dart';
import 'machine.dart';

var log = Logger("Processor");

class Processor {
  static const int IntegerMin = -999;
  static const int IntegerMax = 999;
  static const int CharacterPrefix = 0x7F00;
  static const int CharacterMin = CharacterPrefix + 0x41;
  static const int CharacterMax = CharacterPrefix + 0x5A;

  int? acc = 0;
  int pc = 0;
  ProcessorStatus status = ProcessorStatus.stop;
  Machine machine;

  Processor(this.machine);

  bool step([bool pause = false]) {
    var inst = machine.getInstruction(pc);

    try {
      if (inst == null) {
        status = ProcessorStatus.stop;
        return false;
      }
      pc += inst.opcode.length;
      status = ProcessorStatus.running;

      switch (inst.opcode) {
        case Opcode.BRK:
          throw RuntimeException(inst, "BRK指令未实现");

        case Opcode.NOP:
          break;

        case Opcode.PLA:
          acc = machine.popFromInbox();
          if (acc == null) {
            status = ProcessorStatus.stop;
            log.info("输入队列已清空，程序运行结束");
            return false;
          }
          break;

        case Opcode.PHA:
          if (acc == null) {
            status = ProcessorStatus.exception;
            // exception = "空值！你不能两手空空的去执行OUTBOX！";
            throw RuntimeException(inst, "累加器中没有值，无法执行PHA");
          }
          machine.pushToOutbox(acc!);
          acc = null;
          break;

        case Opcode.LDA_ABS:
        case Opcode.LDA_IND:
          lda(inst.operand, inst.addressingMode == AddressingMode.indirect);
          break;

        case Opcode.STA_ABS:
        case Opcode.STA_IND:
          sta(inst.operand, inst.addressingMode == AddressingMode.indirect);
          break;

        case Opcode.ADD_ABS:
        case Opcode.ADD_IND:
          add(inst.operand, inst.addressingMode == AddressingMode.indirect);
          break;

        case Opcode.SUB_ABS:
        case Opcode.SUB_IND:
          sub(inst.operand, inst.addressingMode == AddressingMode.indirect);
          break;

        case Opcode.INC_ABS:
        case Opcode.INC_IND:
          inc(inst.operand, inst.addressingMode == AddressingMode.indirect);
          break;

        case Opcode.DEC_ABS:
        case Opcode.DEC_IND:
          dec(inst.operand, inst.addressingMode == AddressingMode.indirect);
          break;

        case Opcode.JMP:
          pc = inst.operand;
          break;

        case Opcode.BEQ:
          if (acc == null) {
            // exception = "空值！你不能两手空空的去执行JUMP IF ZERO！";
            throw RuntimeException(inst, "累加器中没有值，无法执行BEQ");
          }
          if (acc == 0) {
            pc += inst.operand;
          }
          break;

        case Opcode.BMI:
          if (acc == null) {
            status = ProcessorStatus.exception;
            // exception = "空值！你不能两手空空的去执行JUMP IF NEGATIVE！";
            throw RuntimeException(inst, "累加器中没有值，无法执行BMI");
          }
          if (acc! < 0) {
            pc += inst.operand;
          }
          break;
      }
    }
    on RuntimeException {
      status = ProcessorStatus.exception;
      rethrow;
    }
    on Exception catch (ex) {
      status = ProcessorStatus.exception;
      throw RuntimeException(inst);
    }

    if (pause) {
      status = ProcessorStatus.paused;
    }

    return status != ProcessorStatus.stop && status != ProcessorStatus.exception;
  }

  int readMemory(int operand, [bool indirect = false]) {
    var address = (indirect) ? readMemory(operand) : operand;
    var data = machine.read(address);
    if (data == null) {
      throw RuntimeException(null, "memory[$address]中没有值");
    }
    return data;
  }

  bool writeMemory(int operand, int data, [bool indirect = false]) {
    var address = (indirect) ? readMemory(operand) : operand;
    return machine.write(address, data);
  }

  void lda(int operand, bool indirect) {
    var data = readMemory(operand, indirect);
    acc = data;
  }

  void sta(int operand, bool indirect) {
    if (acc == null) throw RuntimeException(null, "累加器中没有值，无法执行STA");
    writeMemory(operand, acc!, indirect);
  }

  void add(int operand, bool indirect) {
    if (acc == null) throw RuntimeException(null, "累加器中没有值，无法执行ADD");
    var data = readMemory(operand, indirect);

    var accType = DataType.parse(acc!);
    if (accType != DataType.integer) {
      throw RuntimeException(null, "累加器中的值不为整型，无法进行加法运算");
    }

    var dataType = DataType.parse(data);
    if (dataType != DataType.integer) {
      throw RuntimeException(null, "内存中的值不为整型，无法进行加法运算");
    }

    acc = acc! + data;
  }

  void sub(int operand, bool indirect) {
    if (acc == null) throw RuntimeException(null, "累加器中没有值，无法执行SUB");
    var data = readMemory(operand, indirect);

    var accType = DataType.parse(acc!);
    var dataType = DataType.parse(data);
    if (accType != dataType) {
      throw RuntimeException(null, "累加器与内存中的数据类型不一致，无法进行减法运算");
    }

    acc = acc! - data;
  }

  void inc(int operand, bool indirect) {
    var data = readMemory(operand, indirect);
    var dataType = DataType.parse(data);
    if (dataType != DataType.integer) {
      throw RuntimeException(null, "内存中的值不为整型，无法进行自增运算");
    }

    data++;
    writeMemory(operand, data, indirect);
    acc = data;
  }

  void dec(int operand, bool indirect) {
    var data = readMemory(operand, indirect);
    var dataType = DataType.parse(data);
    if (dataType != DataType.integer) {
      throw RuntimeException(null, "内存中的值不为整型，无法进行自减运算");
    }

    data--;
    writeMemory(operand, data, indirect);
    acc = data;
  }
}

enum ProcessorStatus {
  stop,
  running,
  paused,
  exception
}

enum DataType {
  integer,
  character,
  invalid;

  static DataType parse(int data) {
    if (data >= Processor.CharacterMin && data <= Processor.CharacterMax) {
      return character;
    }
    if (data >= Processor.IntegerMin && data <= Processor.IntegerMax) {
      return integer;
    }
    return invalid;
  }
}
