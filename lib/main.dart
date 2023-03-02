import 'package:flutter/material.dart';
import 'getx_test_app.dart';
import 'machine_app.dart';

void main(List<String> args) {
  if (args.isEmpty || (args.length == 1 && args[0] == "--gui")) {
    runApp(const GetXTestApp());  // GetTestApp
    return;
  }

  if (args.isNotEmpty) {
    if (args[0] == "--test") {
      runApp(const GetXTestApp());
    }
  }
}