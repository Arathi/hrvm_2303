import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/memory.dart';
import '../core/program.dart';
import 'data_module.dart';

abstract class MainModule extends StatelessWidget {
  const MainModule({super.key});

  Widget buildMemoryCell(int x, int y, int index, int? data, String? variableName) {
    var stacks = <Widget>[];
    Color? bgColor;
    if (x % 2 == y % 2) {
      bgColor = const Color(0xFF8D8894);
    }

    stacks.add(
      SizedBox(
        width: 80,
        height: 80,
        child: Container(color: bgColor),
      ),
    );

    if (data != null) {
      stacks.add(Positioned(
          top: 10,
          left: 40 - 36/2,
          child: DataModule(data)
      ));
    }

    if (variableName != null) {
      stacks.add(Positioned(
          bottom: 10,
          left: 10,
          child: Text(variableName)
      ));
    }

    stacks.add(Positioned(
        bottom: 1,
        right: 3,
        child: Text("$index")
    ));

    return Stack(
      children: stacks,
    );
  }

  Widget buildMemory(Memory memory, Program program) {
    List<Row> rows = [];
    for (int y = 0; y < memory.height; y++) {
      List<Widget> widgets = [];
      for (int x = 0; x < memory.width; x++) {
        int index = x + y * memory.width;
        var data = memory.read(index);
        var variableName = program.findVariable(index);
        widgets.add(buildMemoryCell(x, y, index, data, variableName));
      }
      rows.add(Row(children: widgets));
    }

    return Container(
      color: const Color(0xFF988D97),
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: memory.width * 80,
        height: memory.height * 80,
        child: Column(children: rows,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAA977),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Center(
              child: Obx( () => DataModule(null) )
          ),
          const SizedBox(height: 16),
          // Expanded(
          //     child: Center(child: buildMemory())
          // )
        ],
      ),
    );
  }
}