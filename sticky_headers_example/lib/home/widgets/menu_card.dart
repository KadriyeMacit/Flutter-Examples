import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
