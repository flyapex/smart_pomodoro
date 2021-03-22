import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:spomodoro/body.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(800, 550);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.topCenter;
    win.title = "Smart Pmodoro Timer";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: Color(0xFF101014),
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
