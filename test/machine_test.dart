import 'package:flutter_test/flutter_test.dart';
import 'package:hrvm/core/instruction.dart';
import 'package:hrvm/core/machine.dart';
import 'package:hrvm/core/memory.dart';
import 'package:hrvm/core/program.dart';
import 'package:hrvm/core/queue.dart';
import 'package:hrvm/core/opcode.dart';
import 'package:logger/logger.dart';

var log = Logger();

void main() {
  test("test-run", () {
    Machine machine = Machine(
        Queue(QueueType.inbox, [1, 2, 4, 8]),
        Queue(QueueType.outbox, [1, -1, 4, -4]),
        Memory(2, 2),
        Program.assembly([
          Instruction(Opcode.PLA, label: "start"),
          Instruction(Opcode.STA_ABS, operandName: "a"),
          Instruction(Opcode.PLA),
          Instruction(Opcode.STA_ABS, operandName: "b"),
          Instruction(Opcode.SUB_ABS, operandName: "a"),
          Instruction(Opcode.PHA),
          Instruction(Opcode.LDA_ABS, operandName: "a"),
          Instruction(Opcode.SUB_ABS, operandName: "b"),
          Instruction(Opcode.PHA),
          Instruction(Opcode.JMP, operandName: "start"),
        ], {
          "a": 0,
          "b": 1
        }),
    );
    log.i("machine created.");

    log.i("machine startup.");
    machine.execute();
    log.i("machine stopped.");
  });
}