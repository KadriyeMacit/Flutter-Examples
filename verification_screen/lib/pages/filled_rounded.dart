import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class FilledRoundedPinPut extends StatefulWidget {
  const FilledRoundedPinPut({Key? key}) : super(key: key);

  @override
  State<FilledRoundedPinPut> createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool showError = false;
  final int length = 6;
  final Color borderColor = const Color.fromRGBO(114, 178, 238, 1);
  final Color errorColor = const Color.fromRGBO(255, 234, 238, 1);
  final Color fillColor = const Color.fromRGBO(222, 231, 240, .57);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(
                height: 68,
                child: Pinput(
                  length: length,
                  controller: controller,
                  focusNode: focusNode,
                  defaultPinTheme: _pinTheme(),
                  onCompleted: (pin) {
                    setState(() => showError = pin != '5555');
                  },
                  focusedPinTheme: _pinTheme().copyWith(
                    height: 68,
                    width: 64,
                    decoration: _pinTheme().decoration?.copyWith(
                          border: Border.all(color: borderColor),
                        ),
                  ),
                  errorPinTheme: _pinTheme().copyWith(
                    decoration: BoxDecoration(
                      color: errorColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
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
      width: 56,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
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
const String _appBarText = "Filled rounded";
