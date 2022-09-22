import 'package:dynamic_island/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dynamic Island',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  onErrorIgnoreOverflowErrors(
    FlutterErrorDetails details, {
    bool forceReport = false,
  }) {
    // ---

    bool ifIsOverflowError = false;

    // Detect overflow error.
    var exception = details.exception;
    if (exception is FlutterError) {
      ifIsOverflowError = !exception.diagnostics.any(
          (e) => e.value.toString().startsWith("A RenderFlex overflowed by"));
    }

    // Ignore if is overflow error.
    if (ifIsOverflowError) {
      debugPrint('Overflowed.');
    } else {
      FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
    }
  }

  @override
  void initState() {
    FlutterError.onError = onErrorIgnoreOverflowErrors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
