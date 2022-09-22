import 'package:dynamic_island/screens/widgets/audio_waves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallShrinked extends StatelessWidget {
  const CallShrinked({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: const [
            Icon(
              CupertinoIcons.phone_fill,
              color: Colors.greenAccent,
              size: 16,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "0:00",
              style: TextStyle(color: Colors.greenAccent),
            )
          ],
        ),
        const Spacer(),
        const AudioWaves()
      ],
    );
  }
}
