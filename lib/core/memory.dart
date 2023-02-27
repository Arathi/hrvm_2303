import 'package:hrvm/core/opcode.dart';
import 'package:logging/logging.dart';

import 'instruction.dart';

var log = Logger("Memory");

class Memory {
  int width;
  int height;
  Map<int, int> initValues = {};
  List<int?> values = [];

  int get size {
    return width * height;
  }

  Memory([this.width = 1, this.height = 1, Map<int, int>? initValues]) {
    if (initValues != null) {
      this.initValues.clear();
      for (var entry in initValues.entries) {
        this.initValues[entry.key] = entry.value;
      }
    }
    reset();
  }

  int? read(int index) {
    if (index >= 0 && index < size) {
      return values[index];
    }
    log.warning("内存越界：size=$size index=$index");
    return null;
  }

  bool write(int index, int data) {
    if (index >= 0 && index < size) {
      values[index] = data;
      return true;
    }
    log.warning("内存越界：size=$size index=$index");
    return false;
  }

  int? operator[](int index) {
    return read(index);
  }

  void operator[]=(int index, int data) {
    write(index, data);
  }

  void reset() {
    values.clear();
    for (int index = 0; index < size; index++) {
      values.add(null);
    }
    for (var entry in initValues.entries) {
      values[entry.key] = entry.value;
    }
  }
}