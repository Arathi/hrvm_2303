import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'processor.dart';

class Queue {
  QueueType type;
  List<int> initValues = <int>[];
  List<int> values = <int>[];

  static const int Code0 = 0x30;
  static const int Code9 = 0x39;

  Queue(this.type, [List<dynamic>? initValues]) {
    if (initValues != null) {
      for (dynamic data in initValues) {
        if (data is int) {
          this.initValues.add(data);
        }
        else if (data is String) {
          for (var code in data.codeUnits) {
            if (code >= Processor.CodeA && code <= Processor.CodeZ) {
              int value = Processor.CharacterPrefix + code;
              this.initValues.add(value);
            }
            else if (code >= Code0 && code <= Code9) {
              int value = code - Code0;
              this.initValues.add(value);
            }
          }
        }
      }
    }
    reset();
  }

  void reset() {
    values.clear();
    if (type == QueueType.inbox) {
      for (var data in initValues) {
        values.add(data);
      }
    }
  }

  int? pop() {
    if (values.isEmpty) return null;
    return values.removeAt(0);
  }

  int push(int data) {
    values.add(data);
    return values.length;
  }
}

enum QueueType {
  inbox,
  outbox
}
