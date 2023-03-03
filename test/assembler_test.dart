import 'package:flutter_test/flutter_test.dart';
import 'package:hrvm/core/assembler.dart';
import 'package:hrvm/core/program.dart';
import 'package:logger/logger.dart';

var log = Logger();

void main() {
  test("Assembly", () {
    Assembler assembler = Assembler();
    Program program = assembler.assembly("""
macros:
    .set a, 1
    .set b, 2

start:
    PLA
    STA a
    PLA
    STA b

sub_b_a:
    SUB a
    PHA

sub_a_b:
    LDA a
    SUB b
    PHA

restart:
    JMP start
""");
    log.i("汇编完成");
  });
}