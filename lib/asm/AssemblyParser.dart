// Generated from D:/Workspace/undsf/flutter-projects/hrvm_2303/hrvm/antlr\Assembly.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'AssemblyListener.dart';
import 'AssemblyBaseListener.dart';
const int RULE_program = 0, RULE_line = 1, RULE_label = 2, RULE_labelName = 3, 
          RULE_macroInstruction = 4, RULE_instruction = 5, RULE_org = 6, 
          RULE_set = 7, RULE_brk = 8, RULE_nop = 9, RULE_pla = 10, RULE_pha = 11, 
          RULE_lda = 12, RULE_sta = 13, RULE_add = 14, RULE_sub = 15, RULE_inc = 16, 
          RULE_dec = 17, RULE_jmp = 18, RULE_beq = 19, RULE_bmi = 20, RULE_absoluteAddressing = 21, 
          RULE_indirectAddressing = 22, RULE_relativeAddressing = 23, RULE_symbol = 24, 
          RULE_uinteger = 25, RULE_integer = 26;
class AssemblyParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.11.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_LBRACKET = 3, TOKEN_RBRACKET = 4, 
                   TOKEN_SET = 5, TOKEN_ORG = 6, TOKEN_BRK = 7, TOKEN_NOP = 8, 
                   TOKEN_PLA = 9, TOKEN_PHA = 10, TOKEN_LDA = 11, TOKEN_STA = 12, 
                   TOKEN_ADD = 13, TOKEN_SUB = 14, TOKEN_INC = 15, TOKEN_DEC = 16, 
                   TOKEN_JMP = 17, TOKEN_BEQ = 18, TOKEN_BMI = 19, TOKEN_NAME = 20, 
                   TOKEN_SIGN = 21, TOKEN_DECIMAL = 22, TOKEN_HEXADECIMAL = 23, 
                   TOKEN_EOL = 24, TOKEN_COMMENT = 25, TOKEN_SPACE = 26;

  @override
  final List<String> ruleNames = [
    'program', 'line', 'label', 'labelName', 'macroInstruction', 'instruction', 
    'org', 'set', 'brk', 'nop', 'pla', 'pha', 'lda', 'sta', 'add', 'sub', 
    'inc', 'dec', 'jmp', 'beq', 'bmi', 'absoluteAddressing', 'indirectAddressing', 
    'relativeAddressing', 'symbol', 'uinteger', 'integer'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "':'", "','", "'['", "']'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, "LBRACKET", "RBRACKET", "SET", "ORG", "BRK", "NOP", 
      "PLA", "PHA", "LDA", "STA", "ADD", "SUB", "INC", "DEC", "JMP", "BEQ", 
      "BMI", "NAME", "SIGN", "DECIMAL", "HEXADECIMAL", "EOL", "COMMENT", 
      "SPACE"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'Assembly.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  AssemblyParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  ProgramContext program() {
    dynamic _localctx = ProgramContext(context, state);
    enterRule(_localctx, 0, RULE_program);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 57;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (((_la) & ~0x3f) == 0 && ((1 << _la) & 18874336) != 0) {
        state = 54;
        line();
        state = 59;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 60;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LineContext line() {
    dynamic _localctx = LineContext(context, state);
    enterRule(_localctx, 2, RULE_line);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 63;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_NAME) {
        state = 62;
        label();
      }

      state = 67;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_SET:
      case TOKEN_ORG:
        state = 65;
        macroInstruction();
        break;
      case TOKEN_BRK:
      case TOKEN_NOP:
      case TOKEN_PLA:
      case TOKEN_PHA:
      case TOKEN_LDA:
      case TOKEN_STA:
      case TOKEN_ADD:
      case TOKEN_SUB:
      case TOKEN_INC:
      case TOKEN_DEC:
      case TOKEN_JMP:
      case TOKEN_BEQ:
      case TOKEN_BMI:
        state = 66;
        instruction();
        break;
      case TOKEN_EOL:
        break;
      default:
        break;
      }
      state = 69;
      match(TOKEN_EOL);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LabelContext label() {
    dynamic _localctx = LabelContext(context, state);
    enterRule(_localctx, 4, RULE_label);
    try {
      enterOuterAlt(_localctx, 1);
      state = 71;
      labelName();
      state = 72;
      match(TOKEN_T__0);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LabelNameContext labelName() {
    dynamic _localctx = LabelNameContext(context, state);
    enterRule(_localctx, 6, RULE_labelName);
    try {
      enterOuterAlt(_localctx, 1);
      state = 74;
      symbol();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MacroInstructionContext macroInstruction() {
    dynamic _localctx = MacroInstructionContext(context, state);
    enterRule(_localctx, 8, RULE_macroInstruction);
    try {
      state = 78;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_ORG:
        enterOuterAlt(_localctx, 1);
        state = 76;
        org();
        break;
      case TOKEN_SET:
        enterOuterAlt(_localctx, 2);
        state = 77;
        set_();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  InstructionContext instruction() {
    dynamic _localctx = InstructionContext(context, state);
    enterRule(_localctx, 10, RULE_instruction);
    try {
      state = 93;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_BRK:
        enterOuterAlt(_localctx, 1);
        state = 80;
        brk();
        break;
      case TOKEN_NOP:
        enterOuterAlt(_localctx, 2);
        state = 81;
        nop();
        break;
      case TOKEN_PLA:
        enterOuterAlt(_localctx, 3);
        state = 82;
        pla();
        break;
      case TOKEN_PHA:
        enterOuterAlt(_localctx, 4);
        state = 83;
        pha();
        break;
      case TOKEN_LDA:
        enterOuterAlt(_localctx, 5);
        state = 84;
        lda();
        break;
      case TOKEN_STA:
        enterOuterAlt(_localctx, 6);
        state = 85;
        sta();
        break;
      case TOKEN_ADD:
        enterOuterAlt(_localctx, 7);
        state = 86;
        add();
        break;
      case TOKEN_SUB:
        enterOuterAlt(_localctx, 8);
        state = 87;
        sub();
        break;
      case TOKEN_INC:
        enterOuterAlt(_localctx, 9);
        state = 88;
        inc();
        break;
      case TOKEN_DEC:
        enterOuterAlt(_localctx, 10);
        state = 89;
        dec();
        break;
      case TOKEN_JMP:
        enterOuterAlt(_localctx, 11);
        state = 90;
        jmp();
        break;
      case TOKEN_BEQ:
        enterOuterAlt(_localctx, 12);
        state = 91;
        beq();
        break;
      case TOKEN_BMI:
        enterOuterAlt(_localctx, 13);
        state = 92;
        bmi();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  OrgContext org() {
    dynamic _localctx = OrgContext(context, state);
    enterRule(_localctx, 12, RULE_org);
    try {
      enterOuterAlt(_localctx, 1);
      state = 95;
      match(TOKEN_ORG);
      state = 96;
      uinteger();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SetContext set_() {
    dynamic _localctx = SetContext(context, state);
    enterRule(_localctx, 14, RULE_set);
    try {
      enterOuterAlt(_localctx, 1);
      state = 98;
      match(TOKEN_SET);
      state = 99;
      symbol();
      state = 100;
      match(TOKEN_T__1);
      state = 101;
      uinteger();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BrkContext brk() {
    dynamic _localctx = BrkContext(context, state);
    enterRule(_localctx, 16, RULE_brk);
    try {
      enterOuterAlt(_localctx, 1);
      state = 103;
      match(TOKEN_BRK);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  NopContext nop() {
    dynamic _localctx = NopContext(context, state);
    enterRule(_localctx, 18, RULE_nop);
    try {
      enterOuterAlt(_localctx, 1);
      state = 105;
      match(TOKEN_NOP);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PlaContext pla() {
    dynamic _localctx = PlaContext(context, state);
    enterRule(_localctx, 20, RULE_pla);
    try {
      enterOuterAlt(_localctx, 1);
      state = 107;
      match(TOKEN_PLA);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PhaContext pha() {
    dynamic _localctx = PhaContext(context, state);
    enterRule(_localctx, 22, RULE_pha);
    try {
      enterOuterAlt(_localctx, 1);
      state = 109;
      match(TOKEN_PHA);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  LdaContext lda() {
    dynamic _localctx = LdaContext(context, state);
    enterRule(_localctx, 24, RULE_lda);
    try {
      state = 115;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 5, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 111;
        match(TOKEN_LDA);
        state = 112;
        absoluteAddressing();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 113;
        match(TOKEN_LDA);
        state = 114;
        indirectAddressing();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  StaContext sta() {
    dynamic _localctx = StaContext(context, state);
    enterRule(_localctx, 26, RULE_sta);
    try {
      state = 121;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 6, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 117;
        match(TOKEN_STA);
        state = 118;
        absoluteAddressing();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 119;
        match(TOKEN_STA);
        state = 120;
        indirectAddressing();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AddContext add() {
    dynamic _localctx = AddContext(context, state);
    enterRule(_localctx, 28, RULE_add);
    try {
      state = 127;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 7, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 123;
        match(TOKEN_ADD);
        state = 124;
        absoluteAddressing();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 125;
        match(TOKEN_ADD);
        state = 126;
        indirectAddressing();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SubContext sub() {
    dynamic _localctx = SubContext(context, state);
    enterRule(_localctx, 30, RULE_sub);
    try {
      state = 133;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 8, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 129;
        match(TOKEN_SUB);
        state = 130;
        absoluteAddressing();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 131;
        match(TOKEN_SUB);
        state = 132;
        indirectAddressing();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IncContext inc() {
    dynamic _localctx = IncContext(context, state);
    enterRule(_localctx, 32, RULE_inc);
    try {
      state = 139;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 9, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 135;
        match(TOKEN_INC);
        state = 136;
        absoluteAddressing();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 137;
        match(TOKEN_INC);
        state = 138;
        indirectAddressing();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  DecContext dec() {
    dynamic _localctx = DecContext(context, state);
    enterRule(_localctx, 34, RULE_dec);
    try {
      state = 145;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 10, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 141;
        match(TOKEN_DEC);
        state = 142;
        absoluteAddressing();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 143;
        match(TOKEN_DEC);
        state = 144;
        indirectAddressing();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  JmpContext jmp() {
    dynamic _localctx = JmpContext(context, state);
    enterRule(_localctx, 36, RULE_jmp);
    try {
      enterOuterAlt(_localctx, 1);
      state = 147;
      match(TOKEN_JMP);
      state = 148;
      absoluteAddressing();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BeqContext beq() {
    dynamic _localctx = BeqContext(context, state);
    enterRule(_localctx, 38, RULE_beq);
    try {
      enterOuterAlt(_localctx, 1);
      state = 150;
      match(TOKEN_BEQ);
      state = 151;
      relativeAddressing();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  BmiContext bmi() {
    dynamic _localctx = BmiContext(context, state);
    enterRule(_localctx, 40, RULE_bmi);
    try {
      enterOuterAlt(_localctx, 1);
      state = 153;
      match(TOKEN_BMI);
      state = 154;
      relativeAddressing();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AbsoluteAddressingContext absoluteAddressing() {
    dynamic _localctx = AbsoluteAddressingContext(context, state);
    enterRule(_localctx, 42, RULE_absoluteAddressing);
    try {
      state = 158;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_DECIMAL:
      case TOKEN_HEXADECIMAL:
        enterOuterAlt(_localctx, 1);
        state = 156;
        uinteger();
        break;
      case TOKEN_NAME:
        enterOuterAlt(_localctx, 2);
        state = 157;
        symbol();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IndirectAddressingContext indirectAddressing() {
    dynamic _localctx = IndirectAddressingContext(context, state);
    enterRule(_localctx, 44, RULE_indirectAddressing);
    try {
      state = 168;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 12, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 160;
        match(TOKEN_LBRACKET);
        state = 161;
        uinteger();
        state = 162;
        match(TOKEN_RBRACKET);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 164;
        match(TOKEN_LBRACKET);
        state = 165;
        symbol();
        state = 166;
        match(TOKEN_RBRACKET);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  RelativeAddressingContext relativeAddressing() {
    dynamic _localctx = RelativeAddressingContext(context, state);
    enterRule(_localctx, 46, RULE_relativeAddressing);
    try {
      state = 172;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_SIGN:
      case TOKEN_DECIMAL:
      case TOKEN_HEXADECIMAL:
        enterOuterAlt(_localctx, 1);
        state = 170;
        integer();
        break;
      case TOKEN_NAME:
        enterOuterAlt(_localctx, 2);
        state = 171;
        symbol();
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SymbolContext symbol() {
    dynamic _localctx = SymbolContext(context, state);
    enterRule(_localctx, 48, RULE_symbol);
    try {
      enterOuterAlt(_localctx, 1);
      state = 174;
      match(TOKEN_NAME);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  UintegerContext uinteger() {
    dynamic _localctx = UintegerContext(context, state);
    enterRule(_localctx, 50, RULE_uinteger);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 176;
      _la = tokenStream.LA(1)!;
      if (!(_la == TOKEN_DECIMAL || _la == TOKEN_HEXADECIMAL)) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  IntegerContext integer() {
    dynamic _localctx = IntegerContext(context, state);
    enterRule(_localctx, 52, RULE_integer);
    int _la;
    try {
      state = 183;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_SIGN:
      case TOKEN_DECIMAL:
        enterOuterAlt(_localctx, 1);
        state = 179;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_SIGN) {
          state = 178;
          match(TOKEN_SIGN);
        }

        state = 181;
        match(TOKEN_DECIMAL);
        break;
      case TOKEN_HEXADECIMAL:
        enterOuterAlt(_localctx, 2);
        state = 182;
        match(TOKEN_HEXADECIMAL);
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
      4,1,26,186,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,
      14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,
      2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,1,0,5,
      0,56,8,0,10,0,12,0,59,9,0,1,0,1,0,1,1,3,1,64,8,1,1,1,1,1,3,1,68,8,
      1,1,1,1,1,1,2,1,2,1,2,1,3,1,3,1,4,1,4,3,4,79,8,4,1,5,1,5,1,5,1,5,1,
      5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,3,5,94,8,5,1,6,1,6,1,6,1,7,1,7,1,
      7,1,7,1,7,1,8,1,8,1,9,1,9,1,10,1,10,1,11,1,11,1,12,1,12,1,12,1,12,
      3,12,116,8,12,1,13,1,13,1,13,1,13,3,13,122,8,13,1,14,1,14,1,14,1,14,
      3,14,128,8,14,1,15,1,15,1,15,1,15,3,15,134,8,15,1,16,1,16,1,16,1,16,
      3,16,140,8,16,1,17,1,17,1,17,1,17,3,17,146,8,17,1,18,1,18,1,18,1,19,
      1,19,1,19,1,20,1,20,1,20,1,21,1,21,3,21,159,8,21,1,22,1,22,1,22,1,
      22,1,22,1,22,1,22,1,22,3,22,169,8,22,1,23,1,23,3,23,173,8,23,1,24,
      1,24,1,25,1,25,1,26,3,26,180,8,26,1,26,1,26,3,26,184,8,26,1,26,0,0,
      27,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,
      46,48,50,52,0,1,1,0,22,23,186,0,57,1,0,0,0,2,63,1,0,0,0,4,71,1,0,0,
      0,6,74,1,0,0,0,8,78,1,0,0,0,10,93,1,0,0,0,12,95,1,0,0,0,14,98,1,0,
      0,0,16,103,1,0,0,0,18,105,1,0,0,0,20,107,1,0,0,0,22,109,1,0,0,0,24,
      115,1,0,0,0,26,121,1,0,0,0,28,127,1,0,0,0,30,133,1,0,0,0,32,139,1,
      0,0,0,34,145,1,0,0,0,36,147,1,0,0,0,38,150,1,0,0,0,40,153,1,0,0,0,
      42,158,1,0,0,0,44,168,1,0,0,0,46,172,1,0,0,0,48,174,1,0,0,0,50,176,
      1,0,0,0,52,183,1,0,0,0,54,56,3,2,1,0,55,54,1,0,0,0,56,59,1,0,0,0,57,
      55,1,0,0,0,57,58,1,0,0,0,58,60,1,0,0,0,59,57,1,0,0,0,60,61,5,0,0,1,
      61,1,1,0,0,0,62,64,3,4,2,0,63,62,1,0,0,0,63,64,1,0,0,0,64,67,1,0,0,
      0,65,68,3,8,4,0,66,68,3,10,5,0,67,65,1,0,0,0,67,66,1,0,0,0,67,68,1,
      0,0,0,68,69,1,0,0,0,69,70,5,24,0,0,70,3,1,0,0,0,71,72,3,6,3,0,72,73,
      5,1,0,0,73,5,1,0,0,0,74,75,3,48,24,0,75,7,1,0,0,0,76,79,3,12,6,0,77,
      79,3,14,7,0,78,76,1,0,0,0,78,77,1,0,0,0,79,9,1,0,0,0,80,94,3,16,8,
      0,81,94,3,18,9,0,82,94,3,20,10,0,83,94,3,22,11,0,84,94,3,24,12,0,85,
      94,3,26,13,0,86,94,3,28,14,0,87,94,3,30,15,0,88,94,3,32,16,0,89,94,
      3,34,17,0,90,94,3,36,18,0,91,94,3,38,19,0,92,94,3,40,20,0,93,80,1,
      0,0,0,93,81,1,0,0,0,93,82,1,0,0,0,93,83,1,0,0,0,93,84,1,0,0,0,93,85,
      1,0,0,0,93,86,1,0,0,0,93,87,1,0,0,0,93,88,1,0,0,0,93,89,1,0,0,0,93,
      90,1,0,0,0,93,91,1,0,0,0,93,92,1,0,0,0,94,11,1,0,0,0,95,96,5,6,0,0,
      96,97,3,50,25,0,97,13,1,0,0,0,98,99,5,5,0,0,99,100,3,48,24,0,100,101,
      5,2,0,0,101,102,3,50,25,0,102,15,1,0,0,0,103,104,5,7,0,0,104,17,1,
      0,0,0,105,106,5,8,0,0,106,19,1,0,0,0,107,108,5,9,0,0,108,21,1,0,0,
      0,109,110,5,10,0,0,110,23,1,0,0,0,111,112,5,11,0,0,112,116,3,42,21,
      0,113,114,5,11,0,0,114,116,3,44,22,0,115,111,1,0,0,0,115,113,1,0,0,
      0,116,25,1,0,0,0,117,118,5,12,0,0,118,122,3,42,21,0,119,120,5,12,0,
      0,120,122,3,44,22,0,121,117,1,0,0,0,121,119,1,0,0,0,122,27,1,0,0,0,
      123,124,5,13,0,0,124,128,3,42,21,0,125,126,5,13,0,0,126,128,3,44,22,
      0,127,123,1,0,0,0,127,125,1,0,0,0,128,29,1,0,0,0,129,130,5,14,0,0,
      130,134,3,42,21,0,131,132,5,14,0,0,132,134,3,44,22,0,133,129,1,0,0,
      0,133,131,1,0,0,0,134,31,1,0,0,0,135,136,5,15,0,0,136,140,3,42,21,
      0,137,138,5,15,0,0,138,140,3,44,22,0,139,135,1,0,0,0,139,137,1,0,0,
      0,140,33,1,0,0,0,141,142,5,16,0,0,142,146,3,42,21,0,143,144,5,16,0,
      0,144,146,3,44,22,0,145,141,1,0,0,0,145,143,1,0,0,0,146,35,1,0,0,0,
      147,148,5,17,0,0,148,149,3,42,21,0,149,37,1,0,0,0,150,151,5,18,0,0,
      151,152,3,46,23,0,152,39,1,0,0,0,153,154,5,19,0,0,154,155,3,46,23,
      0,155,41,1,0,0,0,156,159,3,50,25,0,157,159,3,48,24,0,158,156,1,0,0,
      0,158,157,1,0,0,0,159,43,1,0,0,0,160,161,5,3,0,0,161,162,3,50,25,0,
      162,163,5,4,0,0,163,169,1,0,0,0,164,165,5,3,0,0,165,166,3,48,24,0,
      166,167,5,4,0,0,167,169,1,0,0,0,168,160,1,0,0,0,168,164,1,0,0,0,169,
      45,1,0,0,0,170,173,3,52,26,0,171,173,3,48,24,0,172,170,1,0,0,0,172,
      171,1,0,0,0,173,47,1,0,0,0,174,175,5,20,0,0,175,49,1,0,0,0,176,177,
      7,0,0,0,177,51,1,0,0,0,178,180,5,21,0,0,179,178,1,0,0,0,179,180,1,
      0,0,0,180,181,1,0,0,0,181,184,5,22,0,0,182,184,5,23,0,0,183,179,1,
      0,0,0,183,182,1,0,0,0,184,53,1,0,0,0,16,57,63,67,78,93,115,121,127,
      133,139,145,158,168,172,179,183
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class ProgramContext extends ParserRuleContext {
  TerminalNode? EOF() => getToken(AssemblyParser.TOKEN_EOF, 0);
  List<LineContext> lines() => getRuleContexts<LineContext>();
  LineContext? line(int i) => getRuleContext<LineContext>(i);
  ProgramContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_program;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterProgram(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitProgram(this);
  }
}

class LineContext extends ParserRuleContext {
  TerminalNode? EOL() => getToken(AssemblyParser.TOKEN_EOL, 0);
  LabelContext? label() => getRuleContext<LabelContext>(0);
  MacroInstructionContext? macroInstruction() => getRuleContext<MacroInstructionContext>(0);
  InstructionContext? instruction() => getRuleContext<InstructionContext>(0);
  LineContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_line;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterLine(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitLine(this);
  }
}

class LabelContext extends ParserRuleContext {
  LabelNameContext? labelName() => getRuleContext<LabelNameContext>(0);
  LabelContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_label;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterLabel(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitLabel(this);
  }
}

class LabelNameContext extends ParserRuleContext {
  SymbolContext? symbol() => getRuleContext<SymbolContext>(0);
  LabelNameContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_labelName;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterLabelName(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitLabelName(this);
  }
}

class MacroInstructionContext extends ParserRuleContext {
  OrgContext? org() => getRuleContext<OrgContext>(0);
  SetContext? set_() => getRuleContext<SetContext>(0);
  MacroInstructionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_macroInstruction;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterMacroInstruction(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitMacroInstruction(this);
  }
}

class InstructionContext extends ParserRuleContext {
  BrkContext? brk() => getRuleContext<BrkContext>(0);
  NopContext? nop() => getRuleContext<NopContext>(0);
  PlaContext? pla() => getRuleContext<PlaContext>(0);
  PhaContext? pha() => getRuleContext<PhaContext>(0);
  LdaContext? lda() => getRuleContext<LdaContext>(0);
  StaContext? sta() => getRuleContext<StaContext>(0);
  AddContext? add() => getRuleContext<AddContext>(0);
  SubContext? sub() => getRuleContext<SubContext>(0);
  IncContext? inc() => getRuleContext<IncContext>(0);
  DecContext? dec() => getRuleContext<DecContext>(0);
  JmpContext? jmp() => getRuleContext<JmpContext>(0);
  BeqContext? beq() => getRuleContext<BeqContext>(0);
  BmiContext? bmi() => getRuleContext<BmiContext>(0);
  InstructionContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_instruction;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterInstruction(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitInstruction(this);
  }
}

class OrgContext extends ParserRuleContext {
  TerminalNode? ORG() => getToken(AssemblyParser.TOKEN_ORG, 0);
  UintegerContext? uinteger() => getRuleContext<UintegerContext>(0);
  OrgContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_org;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterOrg(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitOrg(this);
  }
}

class SetContext extends ParserRuleContext {
  TerminalNode? SET() => getToken(AssemblyParser.TOKEN_SET, 0);
  SymbolContext? symbol() => getRuleContext<SymbolContext>(0);
  UintegerContext? uinteger() => getRuleContext<UintegerContext>(0);
  SetContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_set;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterSet(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitSet(this);
  }
}

class BrkContext extends ParserRuleContext {
  TerminalNode? BRK() => getToken(AssemblyParser.TOKEN_BRK, 0);
  BrkContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_brk;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterBrk(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitBrk(this);
  }
}

class NopContext extends ParserRuleContext {
  TerminalNode? NOP() => getToken(AssemblyParser.TOKEN_NOP, 0);
  NopContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_nop;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterNop(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitNop(this);
  }
}

class PlaContext extends ParserRuleContext {
  TerminalNode? PLA() => getToken(AssemblyParser.TOKEN_PLA, 0);
  PlaContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_pla;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterPla(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitPla(this);
  }
}

class PhaContext extends ParserRuleContext {
  TerminalNode? PHA() => getToken(AssemblyParser.TOKEN_PHA, 0);
  PhaContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_pha;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterPha(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitPha(this);
  }
}

class LdaContext extends ParserRuleContext {
  TerminalNode? LDA() => getToken(AssemblyParser.TOKEN_LDA, 0);
  AbsoluteAddressingContext? absoluteAddressing() => getRuleContext<AbsoluteAddressingContext>(0);
  IndirectAddressingContext? indirectAddressing() => getRuleContext<IndirectAddressingContext>(0);
  LdaContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_lda;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterLda(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitLda(this);
  }
}

class StaContext extends ParserRuleContext {
  TerminalNode? STA() => getToken(AssemblyParser.TOKEN_STA, 0);
  AbsoluteAddressingContext? absoluteAddressing() => getRuleContext<AbsoluteAddressingContext>(0);
  IndirectAddressingContext? indirectAddressing() => getRuleContext<IndirectAddressingContext>(0);
  StaContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_sta;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterSta(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitSta(this);
  }
}

class AddContext extends ParserRuleContext {
  TerminalNode? ADD() => getToken(AssemblyParser.TOKEN_ADD, 0);
  AbsoluteAddressingContext? absoluteAddressing() => getRuleContext<AbsoluteAddressingContext>(0);
  IndirectAddressingContext? indirectAddressing() => getRuleContext<IndirectAddressingContext>(0);
  AddContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_add;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterAdd(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitAdd(this);
  }
}

class SubContext extends ParserRuleContext {
  TerminalNode? SUB() => getToken(AssemblyParser.TOKEN_SUB, 0);
  AbsoluteAddressingContext? absoluteAddressing() => getRuleContext<AbsoluteAddressingContext>(0);
  IndirectAddressingContext? indirectAddressing() => getRuleContext<IndirectAddressingContext>(0);
  SubContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_sub;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterSub(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitSub(this);
  }
}

class IncContext extends ParserRuleContext {
  TerminalNode? INC() => getToken(AssemblyParser.TOKEN_INC, 0);
  AbsoluteAddressingContext? absoluteAddressing() => getRuleContext<AbsoluteAddressingContext>(0);
  IndirectAddressingContext? indirectAddressing() => getRuleContext<IndirectAddressingContext>(0);
  IncContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_inc;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterInc(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitInc(this);
  }
}

class DecContext extends ParserRuleContext {
  TerminalNode? DEC() => getToken(AssemblyParser.TOKEN_DEC, 0);
  AbsoluteAddressingContext? absoluteAddressing() => getRuleContext<AbsoluteAddressingContext>(0);
  IndirectAddressingContext? indirectAddressing() => getRuleContext<IndirectAddressingContext>(0);
  DecContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_dec;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterDec(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitDec(this);
  }
}

class JmpContext extends ParserRuleContext {
  TerminalNode? JMP() => getToken(AssemblyParser.TOKEN_JMP, 0);
  AbsoluteAddressingContext? absoluteAddressing() => getRuleContext<AbsoluteAddressingContext>(0);
  JmpContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_jmp;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterJmp(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitJmp(this);
  }
}

class BeqContext extends ParserRuleContext {
  TerminalNode? BEQ() => getToken(AssemblyParser.TOKEN_BEQ, 0);
  RelativeAddressingContext? relativeAddressing() => getRuleContext<RelativeAddressingContext>(0);
  BeqContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_beq;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterBeq(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitBeq(this);
  }
}

class BmiContext extends ParserRuleContext {
  TerminalNode? BMI() => getToken(AssemblyParser.TOKEN_BMI, 0);
  RelativeAddressingContext? relativeAddressing() => getRuleContext<RelativeAddressingContext>(0);
  BmiContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_bmi;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterBmi(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitBmi(this);
  }
}

class AbsoluteAddressingContext extends ParserRuleContext {
  UintegerContext? uinteger() => getRuleContext<UintegerContext>(0);
  SymbolContext? symbol() => getRuleContext<SymbolContext>(0);
  AbsoluteAddressingContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_absoluteAddressing;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterAbsoluteAddressing(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitAbsoluteAddressing(this);
  }
}

class IndirectAddressingContext extends ParserRuleContext {
  TerminalNode? LBRACKET() => getToken(AssemblyParser.TOKEN_LBRACKET, 0);
  UintegerContext? uinteger() => getRuleContext<UintegerContext>(0);
  TerminalNode? RBRACKET() => getToken(AssemblyParser.TOKEN_RBRACKET, 0);
  SymbolContext? symbol() => getRuleContext<SymbolContext>(0);
  IndirectAddressingContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_indirectAddressing;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterIndirectAddressing(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitIndirectAddressing(this);
  }
}

class RelativeAddressingContext extends ParserRuleContext {
  IntegerContext? integer() => getRuleContext<IntegerContext>(0);
  SymbolContext? symbol() => getRuleContext<SymbolContext>(0);
  RelativeAddressingContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_relativeAddressing;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterRelativeAddressing(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitRelativeAddressing(this);
  }
}

class SymbolContext extends ParserRuleContext {
  TerminalNode? NAME() => getToken(AssemblyParser.TOKEN_NAME, 0);
  SymbolContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_symbol;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterSymbol(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitSymbol(this);
  }
}

class UintegerContext extends ParserRuleContext {
  TerminalNode? DECIMAL() => getToken(AssemblyParser.TOKEN_DECIMAL, 0);
  TerminalNode? HEXADECIMAL() => getToken(AssemblyParser.TOKEN_HEXADECIMAL, 0);
  UintegerContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_uinteger;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterUinteger(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitUinteger(this);
  }
}

class IntegerContext extends ParserRuleContext {
  TerminalNode? DECIMAL() => getToken(AssemblyParser.TOKEN_DECIMAL, 0);
  TerminalNode? SIGN() => getToken(AssemblyParser.TOKEN_SIGN, 0);
  TerminalNode? HEXADECIMAL() => getToken(AssemblyParser.TOKEN_HEXADECIMAL, 0);
  IntegerContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_integer;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.enterInteger(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is AssemblyListener) listener.exitInteger(this);
  }
}

