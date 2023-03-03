typedef InboxGenerator = List<int> Function();
typedef OutboxGenerator = List<int> Function(List<int> inbox);

class Task {
  int level;
  String? name;
  String? description;
  int memoryWidth;
  int memoryHeight;
  Map<int, int> memoryInitValues = <int, int>{};
  List<int> inboxInitValues = <int>[];
  List<int> outboxInitValues = <int>[];
  InboxGenerator? inboxGenerator;
  OutboxGenerator? outboxGenerator;

  Task(this.level, {
    this.name,
    this.description,
    this.memoryWidth = 1,
    this.memoryHeight = 1,
    Map<int, int>? memoryInitValues,
    List<int>? inboxInitValues,
    this.inboxGenerator,
    List<int>? outboxInitValues,
    this.outboxGenerator
  }) {
    if (memoryInitValues != null) {
      for (var entry in memoryInitValues.entries) {
        this.memoryInitValues[entry.key] = entry.value;
      }
    }

    if (inboxGenerator != null) {
      this.inboxInitValues.clear();
      var generated = inboxGenerator!.call();
      this.inboxInitValues.addAll(generated);
    }
    else if (inboxInitValues != null) {
      this.inboxInitValues.clear();
      this.inboxInitValues.addAll(inboxInitValues);
    }

    if (outboxGenerator != null) {
      this.outboxInitValues.clear();
      var generated = outboxGenerator!.call(this.inboxInitValues);
      this.inboxInitValues.addAll(generated);
    }
    else if (outboxInitValues != null) {
      this.outboxInitValues.clear();
      this.outboxInitValues.addAll(outboxInitValues);
    }
  }

  static final Map<int, Task> tasks = <int, Task>{};
  static createTasks() {
    tasks[13] = Task(
      13,
      name: "均衡之间",
      memoryWidth: 3,
      memoryHeight: 2,
      memoryInitValues: {
        5: 0
      },
      inboxInitValues: [1, 2, 3, 3, 5, 5, 5, 6],
      outboxGenerator: (inbox) {
        var outbox = <int>[];
        var inboxIndex = 0;
        while (inboxIndex < inbox.length) {
          var a = inbox[inboxIndex++];
          var b = inbox[inboxIndex++];
          if (a != b) {
            outbox.add(a);
          }
        }
        return outbox;
      }
    );
  }
  static Task? getTaskByLevel(int level) {
    if (tasks.isEmpty) {
      createTasks();
    }
    return tasks[level];
  }
}