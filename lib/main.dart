import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:spomodoro/bar.dart';
import 'package:spomodoro/body.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.show();
  });
}

const borderColor = Color(0xFF1a1b26);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: borderColor,
          width: 1,
          child: Row(
            children: [
              MainBody(),
            ],
          ),
        ),
      ),
    );
  }
}
