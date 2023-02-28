import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'get_app.dart';
import 'machine_app.dart';

void main(List<String> args) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print("${event.time} [${event.level}] ${event.message}");
  });

  if (args.isEmpty || (args.length == 1 && args[0] == "--gui")) {
    runApp(const MachineApp());
    return;
  }

  if (args.isNotEmpty) {
    if (args[0] == "--test") {
      runApp(const GetTestApp());
    }
  }
}