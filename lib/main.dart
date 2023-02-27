import 'package:flutter/material.dart';
import 'machine_app.dart';

void main(List<String> args) {
  if (args.isEmpty || (args.length == 1 && args[0] == "gui")) {
    runApp(MachineApp());
  }
}