import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spomodoro/controller/timerAnimaionController.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'animation.dart';

class MainCircle extends StatefulWidget {
  final bool timerAnimationState;
  final ValueChanged<bool> onChangedTab;

  const MainCircle({Key key, this.timerAnimationState, this.onChangedTab}) : super(key: key);

  @override
  _MainCircleState createState() => _MainCircleState(this.timerAnimationState);
}

class _MainCircleState extends State<MainCircle> with SingleTickerProviderStateMixin {
  @override
  _MainCircleState(this.timerAnimationState);
  final timerAnimationState;
  AnimationController controller;
  double finalAngle = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanUpdate: (details) {
            Offset centerOfGestureDetector = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
            final touchPositionFromCenter = details.localPosition - centerOfGestureDetector;
            // print(touchPositionFromCenter.direction * 180 / pi);
            setState(
              () {
                finalAngle = touchPositionFromCenter.direction;
              },
            );
          },
          child: Transform.rotate(
            angle: finalAngle,
            child: RadialAnimation(
              controller: controller,
              finalAngle: finalAngle,
              onChangedTab: widget.onChangedTab,
              timerAnimationState: timerAnimationState,
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class RadialAnimation extends StatefulWidget {
  final timerAnimationState;
  final ValueChanged<bool> onChangedTab;
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;
  final double finalAngle;
  RadialAnimation({Key key, this.controller, this.finalAngle, this.onChangedTab, this.timerAnimationState})
      : scale = Tween<double>(
          begin: 2,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 175.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);
  double finalAngle2 = 0.0;

  @override
  _RadialAnimationState createState() => _RadialAnimationState();
}

class _RadialAnimationState extends State<RadialAnimation> with AutomaticKeepAliveClientMixin<RadialAnimation> {
  @override
  bool get wantKeepAlive => true;
  final ProgressController progressController = Get.put(ProgressController());
  // String get timerText =>
  //     '${timerMaxMINUT < 0 ? ((timerMaxMINUT).toString().padLeft(2, '0')) : ((timerMaxMINUT - currentMINUTE) - 1).toString().padLeft(2, '0')}:${((timerMaxSec - currentSec) % 60).toString().padLeft(2, '0')}';

  Timer _timer;
  int timeText = 0;
  void startTimer(_start) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timeText = 0;
            widget.onChangedTab(true);
            _open();
            timer.cancel();
          });
        } else {
          progressController.updatepersentage(1 / timeText);
          setState(() {
            timeText = _start;
            print(_start);
            // print(progressController.persent);
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(context) {
    bool timerAnimationState = false;

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, builder) {
        return Transform.rotate(
          angle: radians(widget.rotation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _autoAnimation(timerAnimationState),
              _buildButton(25, widget.finalAngle, 0, color: Colors.black, icon: FontAwesomeIcons.thumbtack),
              _buildButton(30, widget.finalAngle, 30, color: Colors.green, icon: FontAwesomeIcons.sprayCan),
              _buildButton(35, widget.finalAngle, 60, color: Colors.orange, icon: FontAwesomeIcons.fire),
              _buildButton(40, widget.finalAngle, 90, color: Colors.blue, icon: FontAwesomeIcons.kiwiBird),
              _buildButton(45, widget.finalAngle, 120, color: Colors.black, icon: FontAwesomeIcons.cat),
              _buildButton(50, widget.finalAngle, 150, color: Colors.indigo, icon: FontAwesomeIcons.paw),
              _buildButton(55, widget.finalAngle, 180, color: Colors.pink, icon: FontAwesomeIcons.bong),
              _buildButton(60, widget.finalAngle, 210, color: Colors.yellow, icon: FontAwesomeIcons.bolt),
              _buildButton(1, widget.finalAngle, 240, color: Colors.red, icon: FontAwesomeIcons.thumbtack),
              _buildButton(10, widget.finalAngle, 270, color: Colors.green, icon: FontAwesomeIcons.sprayCan),
              _buildButton(15, widget.finalAngle, 300, color: Colors.orange, icon: FontAwesomeIcons.fire),
              _buildButton(20, widget.finalAngle, 330, color: Colors.blue, icon: FontAwesomeIcons.kiwiBird),
              _buildButton(25, widget.finalAngle, 360, color: Colors.pink, icon: FontAwesomeIcons.bong),
              Transform.scale(
                scale: widget.scale.value - 0.9,
                child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.timesCircle),
                  onPressed: () {
                    widget.onChangedTab(false);
                    _close();
                  },
                  backgroundColor: Colors.red,
                ),
              ),
              Transform.scale(
                scale: widget.scale.value,
                child: FloatingActionButton(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          '${((timeText / 60).truncate() % 60).toString().padLeft(2, '0') + ':' + (timeText % 60).toString().padLeft(2, '0')}',
                        ),
                      ],
                    ),
                  ),
                  // child: Icon(Icons.play_arrow),
                  onPressed: () {
                    widget.onChangedTab(true);
                    _open();
                    _timer.cancel();
                    startTimer(0);
                  },
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _autoAnimation(val) {
    return AutoAnimation(timerAnimationState: val);
  }

  _buildButton(time, finalAngle, double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()..translate((widget.translation.value) * cos(rad), (widget.translation.value) * sin(rad)),
      child: Container(
        height: 38,
        child: FloatingActionButton(
          child: Text(time.toString()),
          // child: Icon(
          //   icon,
          // ),
          backgroundColor: color,
          onPressed: () {
            widget.onChangedTab(false);
            startTimer(time * 60);
            _close();
          },
          elevation: 1,
        ),
      ),
    );
  }

  _open() {
    widget.controller.forward();
  }

  _close() {
    widget.controller.reverse();
  }
}
