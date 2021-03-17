import 'package:flutter/material.dart';

class AutoAnimation extends StatefulWidget {
  final timerAnimationState;

  const AutoAnimation({Key key, this.timerAnimationState}) : super(key: key);
  @override
  _AutoAnimationState createState() => _AutoAnimationState();
}

class _AutoAnimationState extends State<AutoAnimation> {
  _AutoAnimationState({this.timerAnimationState});
  bool timerAnimationState;

  // void change() {
  //   Future.delayed(
  //     Duration(milliseconds: 300),
  //     () {

  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: ValueListenableBuilder<bool>(
        valueListenable: ValueNotifier<bool>(widget.timerAnimationState),
        builder: (context, timerAnimationState, _) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                if (timerAnimationState)
                  for (var i = 0; i < 5; i++)
                    BoxShadow(
                      spreadRadius: i * 50.0,
                      color: Colors.redAccent.withAlpha((255 ~/ 5)),
                    )
              ],
            ),
          );
        },
      ),
    );
  }
}
