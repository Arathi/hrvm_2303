import 'package:flutter_test/flutter_test.dart';
import 'package:hrvm/core/instruction.dart';
import 'package:hrvm/core/opcode.dart';

void main() {
  test("test-construct", () {
    Instruction pla = Instruction(Opcode.PLA);
    expect(pla.opcode, Opcode.PLA);
    expect(pla.addressingMode, AddressingMode.implied);
    expect(pla.operand, 0);

    Instruction lda = Instruction(Opcode.LDA_ABS, operand: 0);
    expect(lda.opcode, Opcode.LDA_ABS);
    expect(lda.addressingMode, AddressingMode.absolute);
    expect(lda.operand, 0);

    Instruction sta = Instruction(Opcode.STA_IND, operand: 1);
    expect(sta.opcode, Opcode.STA_IND);
    expect(sta.addressingMode, AddressingMode.indirect);
    expect(sta.operand, 1);

    Instruction add = Instruction(Opcode.ADD_ABS, operandName: "a");
    expect(add.opcode, Opcode.ADD_ABS);
    expect(add.operand, 0);
    expect(add.operandName, "a");

    Instruction jmp = Instruction(Opcode.JMP, operand: 10);
    expect(jmp.opcode, Opcode.JMP);
    expect(jmp.operand, 10);

    Instruction beq = Instruction(Opcode.BEQ, operand: -2);
    expect(beq.opcode, Opcode.BEQ);
    expect(beq.addressingMode, AddressingMode.relative);
    expect(beq.operand, -2);

    Instruction bmi = Instruction(Opcode.BMI, operandName: "line_10");
    expect(bmi.opcode, Opcode.BMI);
    expect(bmi.operand, 0);
    expect(bmi.operandName, "line_10");
  });

  test("test-disassembly", () {
    Instruction? pla = Instruction.disassembly(0x10, 0);
    expect(pla != null, true);
    expect(pla!.opcode, Opcode.PLA);
    expect(pla.addressingMode, AddressingMode.implied);
    expect(pla.operand, 0);
    
    Instruction? sta = Instruction.disassembly(0x06, 1);
    expect(sta != null, true);
    expect(sta!.opcode, Opcode.STA_IND);
    expect(sta.addressingMode, AddressingMode.indirect);
    expect(sta.operand, 1);

    Instruction? beq = Instruction.disassembly(0x33, 0xFE);
    expect(beq != null, true);
    expect(beq!.opcode, Opcode.BEQ);
    expect(beq.addressingMode, AddressingMode.relative);
    expect(beq.operand, -2);
  });
}