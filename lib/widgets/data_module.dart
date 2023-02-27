import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/processor.dart';

class DataModule extends StatelessWidget {
  int? data;

  static const Color colorIntegerUpper = Color(0xFFA0CB5F);
  static const Color colorIntegerLower = Color(0xFF4E6036);
  static const Color colorCharacterUpper = Color(0xFF8C8DC1);
  static const Color colorCharacterLower = Color(0xFF43445E);

  DataModule(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    Color colorUpper = Colors.grey;
    Color colorLower = Colors.grey;
    var value = "";
    if (data != null) {
      if (data! >= Processor.IntegerMin*2 && data! <= Processor.IntegerMax * 2) {
        colorUpper = colorIntegerUpper;
        colorLower = colorIntegerLower;
        value = "$data";
      }
      else if (data! >= Processor.CharacterPrefix + Processor.CodeA &&
          data! <= Processor.CharacterPrefix + Processor.CodeZ) {
        colorUpper = colorCharacterUpper;
        colorLower = colorCharacterLower;
        var code = data! - Processor.CharacterPrefix;
        value = String.fromCharCode(code);
      }
    }

    return Column(children: [
      SizedBox(
          width: 36,
          height: 36,
          child: Container(
            color: colorUpper,
            child: Center(child: Text(
              value,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),),
          )
      ),
      SizedBox(
          width: 36,
          height: 6,
          child: Container(
              color: colorLower
          )
      ),
      const SizedBox(
        width: 36,
        height: 10,
      )
    ]);
  }
}