import 'package:flutter/material.dart';
import 'package:verification_screen/pages/filled.dart';
import 'package:verification_screen/pages/filled_rounded.dart';
import 'package:verification_screen/pages/only_bottom_cursor.dart';
import 'package:verification_screen/pages/rounded_with_cursor.dart';
import 'package:verification_screen/pages/rounded_with_shadow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            height: 400,
            child: ListView(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoundedWithShadow(),
                      ),
                    );
                  },
                  child: const Text(_roundedWithShadow),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoundedWithCustomCursor(),
                      ),
                    );
                  },
                  child: const Text(_roundedWithCursor),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnlyBottomCursor(),
                      ),
                    );
                  },
                  child: const Text(_onlyBottomCursor),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilledRoundedPinPut(),
                      ),
                    );
                  },
                  child: const Text(_filledRounded),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Filled(),
                      ),
                    );
                  },
                  child: const Text(_filled),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String _appBarText = "Verification Screens Example";
const String _roundedWithShadow = "Rounded with shadow";
const String _roundedWithCursor = "Rounded with cursor";
const String _onlyBottomCursor = "Only bottom cursor";
const String _filledRounded = "Filled rounded";
const String _filled = "Filled";
