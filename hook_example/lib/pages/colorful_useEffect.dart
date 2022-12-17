import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ColorfulHook extends HookWidget {
  const ColorfulHook({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final timeView = useState(0);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (time) {
        timeView.value = time.tick;
      });
      return timer.cancel;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          color: timeView.value == 1 ? Colors.pinkAccent : Colors.cyan,
        ),
      ),
    );
  }
}
