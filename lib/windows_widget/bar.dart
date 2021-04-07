import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          MinimizeWindowButton(colors: buttonColors),
          MaximizeWindowButton(colors: buttonColors),
          CloseWindowButton(colors: closeButtonColors),
        ],
      ),
    );
  }
}

const buttonColors = WindowButtonColors(
  iconNormal: Color(0xFF787c99),
  mouseOver: Color(0xFF2e2e35),
  // mouseDown: Color(0xFF805306),
  // iconMouseOver: Color(0xFF805306),
  // iconMouseDown: Color(0xFFFFD500),
);

const closeButtonColors = WindowButtonColors(
  iconNormal: Color(0xFF787c99),
  mouseOver: Color(0xFFd31123),
  // mouseDown: Colors.white,
  iconMouseOver: Colors.white,
);
