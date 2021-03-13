import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:spomodoro/bar.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF1a1b26),
        child: Container(
          child: Column(
            children: [
              Container(
                color: Color(0xFF16161e),
                child: WindowTitleBarBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        child: Icon(
                          Icons.camera,
                          color: Color(0xFF39a7f2),
                          size: 20,
                        ),
                      ),
                      Expanded(child: MoveWindow()),
                      WindowButtons(),
                    ],
                  ),
                ),
              ),
              Container(height: 2, color: Color(0xFF16161e))
            ],
          ),
        ),
      ),
    );
  }
}
