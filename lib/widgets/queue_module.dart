import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hrvm/machine_app.dart';

import '../core/queue.dart';
import 'data_module.dart';

class QueueModule extends StatelessWidget {
  final QueueType type;
  List<int> values = <int>[];

  QueueModule(this.type, this.values, {super.key});

  @override
  Widget build(BuildContext context) {
    var title = (type == QueueType.inbox) ? "INBOX" : "OUTBOX";
    var widgets = <Widget>[];
    widgets.add(const SizedBox(width: 64, height: 10));
    widgets.add(Text(title));
    widgets.add(const SizedBox(width: 64, height: 10));

    var list = <int>[];
    list.addAll((type == QueueType.inbox) ? values : values.reversed);
    for (var value in list) {
      widgets.add(DataModule(value));
    }

    return Container(
        color: const Color(0xFF4C392E),
        child: Column(
          children: widgets,
        )
    );
  }
}