import 'package:antlr4/antlr4.dart';
import 'package:hrvm/asm/AssemblyLexer.dart';
import 'package:hrvm/asm/AssemblyParser.dart';
import 'package:hrvm/core/program.dart';
import 'package:logger/logger.dart';

import '../asm/AssemblyBaseListener.dart';
import 'instruction.dart';
import 'opcode.dart';

var log = Logger();

class AssemblyListenerImpl extends AssemblyBaseListener {
  var instructions = <Instruction>[];
  var variables = <String, int>{};
  var labels = <String, int>{};

  var lineNo = 0;
  var offset = 0;

  Instruction? currentInstruction;
  var currentLabels = <String>[];
  AddressingMode? addressingMode;
  String? operandName;
  int operand = 0;

  void reset() {
    currentInstruction = null;
    currentLabels.clear();
    addressingMode = null;
    operandName = null;
    operand = 0;
  }

  @override
  void exitProgram(ProgramContext ctx) {}

  @override
  void enterLine(LineContext ctx) {
    lineNo++;
  }

  @override
  void exitLabel(LabelContext ctx) {
    var labelNameCtx = ctx.labelName();
    if (labelNameCtx != null) {
      var labelName = labelNameCtx.text;
      log.i("第 $lineNo 行获取到标签：$labelName");
      currentLabels.add(labelName);
    }
  }

  @override
  void exitSet(SetContext ctx) {
    var labelNameCtx = ctx.symbol();
    var addressCtx = ctx.uinteger();
    var labelName = "";
    var address = 0;

    if (labelNameCtx != null) {
      labelName = labelNameCtx.text;
    }

    if (addressCtx != null) {
      var decimal = addressCtx.DECIMAL();
      var hexadecimal = addressCtx.HEXADECIMAL();
      if (decimal != null) {
        address = int.parse(decimal.toString());
      }
      else if (hexadecimal != null) {
        // TODO 实现十六进制数读取
      }
    }

    log.i("$labelName = $address");
    variables[labelName] = address;
  }

  @override
  void exitAbsoluteAddressing(AbsoluteAddressingContext ctx) {
    addressingMode = AddressingMode.absolute;
    var uintCtx = ctx.uinteger();
    var symbolCtx = ctx.symbol();
    parseAddressOperand(uintCtx, symbolCtx);
  }

  @override
  void exitIndirectAddressing(IndirectAddressingContext ctx) {
    addressingMode = AddressingMode.indirect;
    var uintCtx = ctx.uinteger();
    var symbolCtx = ctx.symbol();
    parseAddressOperand(uintCtx, symbolCtx);
  }

  void parseAddressOperand(
      UintegerContext? uintCtx,
      SymbolContext? symbolCtx) {
    if (uintCtx != null) {
      operand = int.parse(uintCtx.text);
    }
    else if (symbolCtx != null) {
      operandName = symbolCtx.text;
    }
  }

  @override
  void exitPla(PlaContext ctx) {
    currentInstruction = Instruction(Opcode.PLA);
  }

  @override
  void exitPha(PhaContext ctx) {
    currentInstruction = Instruction(Opcode.PHA);
  }

  @override
  void exitLda(LdaContext ctx) {
    Opcode opcode = addressingMode == AddressingMode.absolute ?
        Opcode.LDA_ABS :
        Opcode.LDA_IND;
    currentInstruction = Instruction(
        opcode,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitSta(StaContext ctx) {
    Opcode opcode = addressingMode == AddressingMode.absolute ?
        Opcode.STA_ABS :
        Opcode.STA_IND;
    currentInstruction = Instruction(
        opcode,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitAdd(AddContext ctx) {
    Opcode opcode = addressingMode == AddressingMode.absolute ?
        Opcode.ADD_ABS :
        Opcode.ADD_IND;
    currentInstruction = Instruction(
        opcode,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitSub(SubContext ctx) {
    Opcode opcode = addressingMode == AddressingMode.absolute ?
        Opcode.SUB_ABS :
        Opcode.SUB_IND;
    currentInstruction = Instruction(
        opcode,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitInc(IncContext ctx) {
    Opcode opcode = addressingMode == AddressingMode.absolute ?
        Opcode.INC_ABS :
        Opcode.INC_IND;
    currentInstruction = Instruction(
        opcode,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitDec(DecContext ctx) {
    Opcode opcode = addressingMode == AddressingMode.absolute ?
        Opcode.DEC_ABS :
        Opcode.DEC_IND;
    currentInstruction = Instruction(
        opcode,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitJmp(JmpContext ctx) {
    currentInstruction = Instruction(
        Opcode.JMP,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitBeq(BeqContext ctx) {
    currentInstruction = Instruction(
        Opcode.BEQ,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitBmi(BmiContext ctx) {
    currentInstruction = Instruction(
        Opcode.BMI,
        operand: operand,
        operandName: operandName
    );
  }

  @override
  void exitInstruction(InstructionContext ctx) {
    if (currentInstruction != null) {
      currentInstruction!.labels.addAll(currentLabels);
      currentInstruction!.offset = offset;
      instructions.add(currentInstruction!);
      offset += currentInstruction!.opcode.length;
      reset();
    }
  }
}

class Assembler {
  Program? assemblyFile(String path) {
    return null;
  }

  Program assembly(String source) {
    var listener = AssemblyListenerImpl();

    var input = InputStream.fromString(source);
    var lexer = AssemblyLexer(input);
    var tokens = CommonTokenStream(lexer);
    var parser = AssemblyParser(tokens);

    parser.addParseListener(listener);
    parser.program();

    return Program.assembly(listener.instructions, listener.variables);
  }
}