import 'package:flutter/material.dart';

class OverlayAnimatedGridElement extends StatefulWidget {
  OverlayAnimatedGridElement(this.imagepath);
  final String imagepath;

  @override
  _OverlayAnimatedGridElementState createState() =>
      _OverlayAnimatedGridElementState();
}

class _OverlayAnimatedGridElementState extends State<OverlayAnimatedGridElement>
    with TickerProviderStateMixin {
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  hoverActivation(hoverState) {
    setState(() {
      isHovered = hoverState;
    });
    print("activated -> " + hoverState.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey.shade100,
        height: 200,
        width: 300,
        child: Stack(
          children: [
            Image.network(widget.imagepath),
            MouseRegion(
              onEnter: (event) {
                hoverActivation(true);
              },
              onExit: (event) {
                hoverActivation(false);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                color: Colors.black.withOpacity(isHovered ? 0.5 : 0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
