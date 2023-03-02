import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

class MachineApp extends StatelessWidget {
  const MachineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.machine,
      getPages: Routes.buildRouter(),
    );
  }
}