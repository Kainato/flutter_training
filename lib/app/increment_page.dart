import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/extension/build_context_extension.dart';
import 'package:flutter_training/widgets/standard_scaffold.dart';

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  ValueNotifier<int> count = ValueNotifier(0);
  ValueNotifier<Timer?> timer = ValueNotifier(null);
  ValueNotifier<List<int>> list = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      title: 'Increment Page',
      actions: [
        IconButton(
          onPressed: () => list.value = [],
          icon: const Icon(Icons.delete_sweep),
        ),
      ],
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 16,
          children: [
            SizedBox(height: 0),
            ValueListenableBuilder<int>(
              valueListenable: count,
              builder: (context, value, child) {
                return Text(value.toString(), style: context.displayLarge);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _elevatedButtonDefault(
                  context,
                  label: 'Resetar',
                  onPressed: onPressedReset,
                  icon: const Icon(Icons.refresh),
                  color: Colors.blue,
                ),
                ValueListenableBuilder(
                  valueListenable: timer,
                  builder: (BuildContext context, Timer? value, child) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: _elevatedButtonDefault(
                        context,
                        label: 'Parar',
                        onPressed: value != null ? onPressedStop : null,
                        icon: Icon(Icons.stop),
                        color: Colors.orange.shade700,
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _elevatedButtonDefault(
                  context,
                  label: 'Diminuir',
                  onPressed: onPressedDecrement,
                  onLongPressed: () {
                    onPressedDecrement(isLongPress: true);
                  },
                  icon: const Icon(Icons.remove),
                  color: Colors.red,
                ),
                _elevatedButtonDefault(
                  context,
                  label: 'Aumentar',
                  onPressed: onPressedIncrement,
                  onLongPressed: () {
                    onPressedIncrement(isLongPress: true);
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.green,
                ),
              ],
            ),
            Divider(),
            ListTile(
              title: Text('Marcadores', style: context.titleLarge),
              trailing: IconButton(
                onPressed: () => list.value = [count.value, ...list.value],
                icon: Icon(Icons.add_circle),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<List<int>>(
                valueListenable: list,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(value[index].toString()),
                          trailing: IconButton(
                            onPressed:
                                () =>
                                    list.value = [...list.value]
                                      ..removeAt(index),
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.red.shade700,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedIncrement({bool isLongPress = false}) {
    if (isLongPress) {
      timer.value = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
        count.value++;
      });
    } else {
      // Increment the count immediately
      count.value++;
    }
  }

  void onPressedDecrement({bool isLongPress = false}) {
    if (isLongPress) {
      timer.value = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
        count.value--;
      });
    } else {
      // Decrement the count immediately
      count.value--;
    }
  }

  void onPressedReset() {
    count.value = 0;
  }

  void onPressedStop() {
    timer.value?.cancel(); // Cancel the timer if it exists
    timer.value = null; // Set the timer to null
  }
}

ElevatedButton _elevatedButtonDefault(
  BuildContext context, {
  required String label,
  required VoidCallback? onPressed,
  VoidCallback? onLongPressed,
  required Icon icon,
  required Color color,
}) {
  return ElevatedButton.icon(
    onLongPress: onLongPressed,
    onPressed: onPressed,
    icon: icon,
    label: Text(label, style: context.titleMedium),
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(16),
    ),
  );
}
