// Generated from D:/Workspace/undsf/flutter-projects/hrvm_2303/hrvm/antlr\Assembly.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'AssemblyParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [AssemblyParser].
abstract class AssemblyListener extends ParseTreeListener {
  /// Enter a parse tree produced by [AssemblyParser.program].
  /// [ctx] the parse tree
  void enterProgram(ProgramContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.program].
  /// [ctx] the parse tree
  void exitProgram(ProgramContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.line].
  /// [ctx] the parse tree
  void enterLine(LineContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.line].
  /// [ctx] the parse tree
  void exitLine(LineContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.label].
  /// [ctx] the parse tree
  void enterLabel(LabelContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.label].
  /// [ctx] the parse tree
  void exitLabel(LabelContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.labelName].
  /// [ctx] the parse tree
  void enterLabelName(LabelNameContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.labelName].
  /// [ctx] the parse tree
  void exitLabelName(LabelNameContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.macroInstruction].
  /// [ctx] the parse tree
  void enterMacroInstruction(MacroInstructionContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.macroInstruction].
  /// [ctx] the parse tree
  void exitMacroInstruction(MacroInstructionContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.instruction].
  /// [ctx] the parse tree
  void enterInstruction(InstructionContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.instruction].
  /// [ctx] the parse tree
  void exitInstruction(InstructionContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.org].
  /// [ctx] the parse tree
  void enterOrg(OrgContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.org].
  /// [ctx] the parse tree
  void exitOrg(OrgContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.set].
  /// [ctx] the parse tree
  void enterSet(SetContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.set].
  /// [ctx] the parse tree
  void exitSet(SetContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.brk].
  /// [ctx] the parse tree
  void enterBrk(BrkContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.brk].
  /// [ctx] the parse tree
  void exitBrk(BrkContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.nop].
  /// [ctx] the parse tree
  void enterNop(NopContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.nop].
  /// [ctx] the parse tree
  void exitNop(NopContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.pla].
  /// [ctx] the parse tree
  void enterPla(PlaContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.pla].
  /// [ctx] the parse tree
  void exitPla(PlaContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.pha].
  /// [ctx] the parse tree
  void enterPha(PhaContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.pha].
  /// [ctx] the parse tree
  void exitPha(PhaContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.lda].
  /// [ctx] the parse tree
  void enterLda(LdaContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.lda].
  /// [ctx] the parse tree
  void exitLda(LdaContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.sta].
  /// [ctx] the parse tree
  void enterSta(StaContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.sta].
  /// [ctx] the parse tree
  void exitSta(StaContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.add].
  /// [ctx] the parse tree
  void enterAdd(AddContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.add].
  /// [ctx] the parse tree
  void exitAdd(AddContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.sub].
  /// [ctx] the parse tree
  void enterSub(SubContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.sub].
  /// [ctx] the parse tree
  void exitSub(SubContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.inc].
  /// [ctx] the parse tree
  void enterInc(IncContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.inc].
  /// [ctx] the parse tree
  void exitInc(IncContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.dec].
  /// [ctx] the parse tree
  void enterDec(DecContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.dec].
  /// [ctx] the parse tree
  void exitDec(DecContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.jmp].
  /// [ctx] the parse tree
  void enterJmp(JmpContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.jmp].
  /// [ctx] the parse tree
  void exitJmp(JmpContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.beq].
  /// [ctx] the parse tree
  void enterBeq(BeqContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.beq].
  /// [ctx] the parse tree
  void exitBeq(BeqContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.bmi].
  /// [ctx] the parse tree
  void enterBmi(BmiContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.bmi].
  /// [ctx] the parse tree
  void exitBmi(BmiContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.absoluteAddressing].
  /// [ctx] the parse tree
  void enterAbsoluteAddressing(AbsoluteAddressingContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.absoluteAddressing].
  /// [ctx] the parse tree
  void exitAbsoluteAddressing(AbsoluteAddressingContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.indirectAddressing].
  /// [ctx] the parse tree
  void enterIndirectAddressing(IndirectAddressingContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.indirectAddressing].
  /// [ctx] the parse tree
  void exitIndirectAddressing(IndirectAddressingContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.relativeAddressing].
  /// [ctx] the parse tree
  void enterRelativeAddressing(RelativeAddressingContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.relativeAddressing].
  /// [ctx] the parse tree
  void exitRelativeAddressing(RelativeAddressingContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.symbol].
  /// [ctx] the parse tree
  void enterSymbol(SymbolContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.symbol].
  /// [ctx] the parse tree
  void exitSymbol(SymbolContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.uinteger].
  /// [ctx] the parse tree
  void enterUinteger(UintegerContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.uinteger].
  /// [ctx] the parse tree
  void exitUinteger(UintegerContext ctx);

  /// Enter a parse tree produced by [AssemblyParser.integer].
  /// [ctx] the parse tree
  void enterInteger(IntegerContext ctx);
  /// Exit a parse tree produced by [AssemblyParser.integer].
  /// [ctx] the parse tree
  void exitInteger(IntegerContext ctx);
}