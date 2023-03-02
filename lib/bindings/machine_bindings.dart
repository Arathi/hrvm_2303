import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../controllers/machine_controller.dart';

var log = Logger();

class MachineBindings extends Bindings {
  @override
  void dependencies() {
    log.i("绑定Machine的依赖");

    log.i("正在创建Machine控制器");
    Get.put(MachineController());
  }
}