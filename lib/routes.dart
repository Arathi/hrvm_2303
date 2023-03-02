import 'package:get/get_navigation/src/routes/get_route.dart';

import 'views/machine_view.dart';
import 'bindings/machine_bindings.dart';

class Routes {
  static const String machine = "/machine";

  static List<GetPage<dynamic>> buildRouter() {
    List<GetPage<dynamic>> pages = [
      GetPage(name: machine, page: () => const MachineView(), binding: MachineBindings())
    ];
    return pages;
  }
}