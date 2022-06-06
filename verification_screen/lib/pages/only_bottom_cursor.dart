import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OnlyBottomCursor extends StatefulWidget {
  const OnlyBottomCursor({Key? key}) : super(key: key);

  @override
  State<OnlyBottomCursor> createState() => _OnlyBottomCursorState();

  @override
  String toStringShort() => 'With Bottom Cursor';
}

class _OnlyBottomCursorState extends State<OnlyBottomCursor> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final Color borderColor = const Color.fromRGBO(30, 60, 87, 1);

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
              Pinput(
                length: 6,
                pinAnimationType: PinAnimationType.slide,
                controller: controller,
                focusNode: focusNode,
                defaultPinTheme: _pinTheme(),
                showCursor: true,
                cursor: _cursor(),
                preFilledWidget: _preFilledWidget(),
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

  Widget _cursor() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  Widget _preFilledWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  PinTheme _pinTheme() {
    return PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: const BoxDecoration(),
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
const String _appBarText = "Only bottom cursor";
