import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:spomodoro/bar.dart';

import 'Circle animation/circle.dart';
import 'Circle animation/perIndacator.dart';
import 'Circle animation/timer.dart';

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  bool timerAnimationState = true;
  void onChangedTab(bool index) {
    setState(() {
      timerAnimationState = index;
    });
  }

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
              Container(height: 2, color: Color(0xFF16161e)),
              Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      // AutoAnimation(),
                      RadialProgress(),
                      Timer(timerAnimationState: timerAnimationState),
                      Container(
                        width: 500,
                        height: 500,
                        // color: Colors.purple,
                        child: SizedBox.expand(
                            child: MainCircle(
                          onChangedTab: onChangedTab,
                        )),
                        // child: Timer(),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
