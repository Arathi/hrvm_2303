import 'package:logging/logging.dart';

import 'queue.dart';
import 'memory.dart';
import 'program.dart';
import 'processor.dart';
import 'instruction.dart';

var log = Logger("Machine");

class Machine {
  Queue inbox;
  Queue outbox;
  Memory memory;
  Program program;
  late Processor processor;

  int counter = 0;

  Machine(this.inbox, this.outbox, this.memory, this.program) {
    processor = Processor(this);
  }

  int? read(int address) {
    return memory.read(address);
  }

  bool write(int address, int data) {
    return memory.write(address, data);
  }

  int? popFromInbox() {
    return inbox.pop();
  }

  int pushToOutbox(int acc) {
    return outbox.push(acc);
  }

  int execute() {
    counter = 0;
    bool next = true;
    do {
      next = processor.step();
      counter++;
    }
    while (next);
    return counter;
  }

  bool step() {
    return processor.step(true);
  }

  Instruction? getInstruction(int pc) {
    int? code = program.read(pc);
    if (code == null) {
      return null;
    }

    int? operand = program.read(pc+1);
    var inst = Instruction.disassembly(code, operand);
    if (inst == null) {
      return null;
    }

    return inst;
  }

  bool checkAnswer() {
    return false;
  }
}