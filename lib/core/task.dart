class Task {
  int level;
  String? name;
  String? description;
  int memoryWidth;
  int memoryHeight;
  Map<int, int> memoryInitValues = <int, int>{};
  List<int> inboxInitValues = <int>[];
  List<int> outboxInitValues = <int>[];

  Task(this.level, {
    this.name,
    this.description,
    this.memoryWidth = 1,
    this.memoryHeight = 1,
    Map<int, int>? memoryInitValues,
    List<int>? inboxInitValues,
    List<int>? outboxInitValues,
  }) {
    if (memoryInitValues != null) {
      for (var entry in memoryInitValues.entries) {
        this.memoryInitValues[entry.key] = entry.value;
      }
    }

    if (inboxInitValues == null) {
      generateInboxInitValues();
    } else {
      this.inboxInitValues.addAll(inboxInitValues);
    }

    if (outboxInitValues == null) {
      generateOutboxInitValues();
    } else {
      this.outboxInitValues.addAll(outboxInitValues);
    }
  }

  void generateInboxInitValues() {}
  void generateOutboxInitValues() {}

  static final Map<int, Task> tasks = <int, Task>{};
  static createTasks() {
    tasks[1] = Task(
        13,
        name: "均衡之间",
    );
  }
}