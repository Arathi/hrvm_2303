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
  static const int CodeA = 0x41;
  static const int CodeZ = 0x5A;

  int? acc;
  int pc = 0;
  ProcessorStatus status = ProcessorStatus.pending;
  Machine machine;

  Processor(this.machine);

  bool step([bool pause = false]) {
    if (status == ProcessorStatus.stop || status == ProcessorStatus.exception) {
      return false;
    }

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
          log.info("A = inbox() // A = $acc");
          break;

        case Opcode.PHA:
          if (acc == null) {
            status = ProcessorStatus.exception;
            // exception = "空值！你不能两手空空的去执行OUTBOX！";
            throw RuntimeException(inst, "累加器中没有值，无法执行PHA");
          }
          machine.pushToOutbox(acc!);
          log.info("outbox(A); A = null // A = $acc");
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
          log.info("goto offset_${inst.operand}");
          pc = inst.operand;
          break;

        case Opcode.BEQ:
          if (acc == null) {
            // exception = "空值！你不能两手空空的去执行JUMP IF ZERO！";
            throw RuntimeException(inst, "累加器中没有值，无法执行BEQ");
          }
          log.info("if (A == 0) goto offset_${pc+inst.operand} // A = $acc");
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
          log.info("if (A < 0) goto offset_${pc+inst.operand} // A = $acc");
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
    log.info("A = memory[$operand, $indirect] // A = $acc");
  }

  void sta(int operand, bool indirect) {
    if (acc == null) throw RuntimeException(null, "累加器中没有值，无法执行STA");
    writeMemory(operand, acc!, indirect);
    log.info("memory[$operand, $indirect] = A // A = $acc");
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
    log.info("A += memory[$operand, $indirect] // A = $acc");
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
    log.info("A -= memory[$operand, $indirect] // A = $acc");
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
    log.info("A = ++memory[$operand, $indirect] // A = $acc");
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
    log.info("A = --memory[$operand, $indirect] // A = $acc");
  }
}

enum ProcessorStatus {
  pending,
  stop,
  running,
  paused,
  exception
}

enum DataType {
  integer,
  character,
  invalid;

  static DataType parse(int? data) {
    if (data == null) return invalid;

    if (data >= Processor.CharacterPrefix + Processor.CodeA &&
        data <= Processor.CharacterPrefix + Processor.CodeZ) {
      return character;
    }
    if (data >= Processor.IntegerMin && data <= Processor.IntegerMax) {
      return integer;
    }
    return invalid;
  }
}
