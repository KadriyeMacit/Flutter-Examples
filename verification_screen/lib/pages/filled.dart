import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class Filled extends StatefulWidget {
  const Filled({Key? key}) : super(key: key);

  @override
  State<Filled> createState() => _FilledState();

  @override
  String toStringShort() => 'Filled';
}

class _FilledState extends State<Filled> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(_appBarText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 243,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Pinput(
                  length: 4,
                  controller: controller,
                  focusNode: focusNode,
                  separator: Container(
                    height: 64,
                    width: 1,
                    color: Colors.white,
                  ),
                  defaultPinTheme: _pinTheme(),
                  showCursor: true,
                  focusedPinTheme: _pinTheme().copyWith(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(124, 102, 152, 1)),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(_buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PinTheme _pinTheme() {
    return PinTheme(
      width: 60,
      height: 64,
      textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
      decoration:
          const BoxDecoration(color: Color.fromRGBO(159, 132, 193, 0.8)),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
}

const String _buttonText = "Next";
const String _appBarText = "Filled";
