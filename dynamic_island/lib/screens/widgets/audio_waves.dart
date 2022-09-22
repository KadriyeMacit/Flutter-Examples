import 'package:flutter/material.dart';

class AudioWaves extends StatelessWidget {
  const AudioWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/waves.png',
      fit: BoxFit.contain,
      width: 70,
    );
  }
}
