import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:spomodoro/bar.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Color(0xFF1a1b26),
        color: Colors.white,
        child: Container(
          child: Column(
            children: [
              Container(
                color: Color(0xFF16161e),
                child: WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(child: MoveWindow()),
                      WindowButtons(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
