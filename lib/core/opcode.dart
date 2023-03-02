import 'package:logger/logger.dart';

final log = Logger();

enum Opcode {
  BRK(0x00, "BRK", AddressingMode.implied, 1),
  NOP(0x04, "NOP", AddressingMode.implied, 1),
  PLA(0x10, "PLA", AddressingMode.implied, 1),
  PHA(0x14, "PHA", AddressingMode.implied, 1),
  LDA_ABS(0x01, "LDA", AddressingMode.absolute, 2),
  LDA_IND(0x02, "LDA", AddressingMode.indirect, 2),
  STA_ABS(0x05, "STA", AddressingMode.absolute, 2),
  STA_IND(0x06, "STA", AddressingMode.indirect, 2),
  ADD_ABS(0x11, "ADD", AddressingMode.absolute, 2),
  ADD_IND(0x12, "ADD", AddressingMode.indirect, 2),
  SUB_ABS(0x15, "SUB", AddressingMode.absolute, 2),
  SUB_IND(0x16, "SUB", AddressingMode.indirect, 2),
  INC_ABS(0x21, "INC", AddressingMode.absolute, 2),
  INC_IND(0x22, "INC", AddressingMode.indirect, 2),
  DEC_ABS(0x25, "DEC", AddressingMode.absolute, 2),
  DEC_IND(0x26, "DEC", AddressingMode.indirect, 2),
  JMP(0x31, "JMP", AddressingMode.absolute, 2),
  BEQ(0x33, "BEQ", AddressingMode.relative, 2),
  BMI(0x37, "BMI", AddressingMode.relative, 2);

  /* 机器码 */
  final int code;

  /* 助记符 */
  final String mnemonic;

  /* 寻址模式 */
  final AddressingMode addressingMode;

  /* 指令长度 */
  final int length;

  const Opcode(this.code, this.mnemonic, this.addressingMode, this.length);

  static Map<int, Opcode> opcodeMap = <int, Opcode>{};

  static Opcode? getByCode(int code) {
    if (opcodeMap.isEmpty) {
      for (var opcode in Opcode.values) {
        opcodeMap[opcode.code] = opcode;
      }
    }
    return opcodeMap[code];
  }

  static Opcode? getByMnemonic(String mnemonic, AddressingMode? addrMode) {
    var opcodes = <Opcode>[];
    for (var opcode in Opcode.values) {
      if (opcode.mnemonic == mnemonic) {
        opcodes.add(opcode);
      }
    }

    if (opcodes.isEmpty) {
      log.w("未找到助记符为 $mnemonic 的指令");
      return null;
    }

    if (addrMode == null) {
      if (opcodes.length == 1) {
        return opcodes[0];
      }
      log.w("找到 ${opcodes.length} 个助记符为 $mnemonic 的指令");
      return null;
    }

    for (var opcode in opcodes) {
      if (opcode.addressingMode == addrMode) {
        return opcode;
      }
    }

    log.w("未找到助记符为 $mnemonic 且 寻址方式为 ${addrMode.description} 指令");
    return null;
  }
}

enum AddressingMode {
  implied("隐含寻址"),
  absolute("绝对寻址"),
  indirect("间接寻址"),
  relative("相对寻址");

  final String description;

  const AddressingMode(this.description);
}
