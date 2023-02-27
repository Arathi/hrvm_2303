class Queue {
  QueueType type;
  List<int> initValues = <int>[];
  List<int> values = <int>[];

  Queue(this.type, [List<dynamic>? initValues]) {
    if (initValues != null) {
      for (dynamic data in initValues) {
        if (data is int) {
          this.initValues.add(data);
        }
        else if (data is String) {
          for (var code in data.codeUnits) {
            int value = code + 0x7F00;
            this.initValues.add(value);
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
