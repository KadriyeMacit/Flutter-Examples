import 'package:flutter/material.dart';
import 'package:hook_example/pages/colorful_useEffect.dart';
import 'package:hook_example/pages/home_hook.dart';
import 'package:hook_example/pages/home_stateful.dart';
import 'package:hook_example/pages/tab_bar_hook.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomeStateful(title: "Stateful example"),
                  ),
                );
              },
              child: const Text("Stateful"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomeHook(title: "Hook useState example"),
                  ),
                );
              },
              child: const Text("Hook useState"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ColorfulHook(title: "Hook useEffect example"),
                  ),
                );
              },
              child: const Text("Hook useEffect"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TabbarHook(title: "Custom hook example"),
                  ),
                );
              },
              child: const Text("Custom hook"),
            ),
          ],
        ),
      ),
    );
  }
}
