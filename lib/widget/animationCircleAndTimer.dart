import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainCircle extends StatefulWidget {
  final bool timerAnimationState;
  final ValueChanged<bool> onChangedTab;
  final double screenSizew;

  const MainCircle({Key key, this.timerAnimationState, this.onChangedTab, this.screenSizew}) : super(key: key);

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
              screenSizew: widget.screenSizew,
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class RadialAnimation extends StatefulWidget {
  final double screenSizew;
  final timerAnimationState;
  final ValueChanged<bool> onChangedTab;
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;
  final double finalAngle;
  RadialAnimation({Key key, this.controller, this.finalAngle, this.onChangedTab, this.timerAnimationState, this.screenSizew})
      : scale = Tween<double>(
          begin: 2,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0,
          end: 202,
          // end: screenSizew / 3 > screenSizew ? (4 * screenSizew / 12) : (4 * screenSizew / 11) - 10, //gg
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
  _RadialAnimationState createState() => _RadialAnimationState(this.screenSizew);
}

class _RadialAnimationState extends State<RadialAnimation> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<RadialAnimation> {
  _RadialAnimationState(this.screenSizew);
  var screenSizew;
  AnimationController _controller2;
  Tween<double> _tween = Tween(begin: 0.9, end: 1);
  AnimationController _controller3;
  // Tween<double> _tween3 = Tween(begin: 0.23, end: 0.40);
  AnimationController _controller4;
  // Tween<double> _tween4 = Tween(begin: 0.23, end: 0.40);
  // //!-----------Audio

  @override
  void initState() {
    _controller2 = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller2.repeat(reverse: true);
    _controller3 = AnimationController(duration: const Duration(milliseconds: 1700), vsync: this);
    Timer(Duration(milliseconds: 300), () {
      _controller3.repeat(reverse: true);
    });
    //?-------------------------------------------------------
    _controller4 = AnimationController(duration: const Duration(milliseconds: 2200), vsync: this);
    _controller4.repeat(reverse: true);
    super.initState();
  }

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play("a.mp3");
  }

  @override
  bool get wantKeepAlive => true;
  Timer _timer;
  int timeText = 0;
  void startTimer(_start) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() async {
            timeText = 0;
            await playLocalAsset();
            widget.onChangedTab(true);
            _open();
            timer.cancel();
          });
        } else {
          setState(() {
            timeText = _start;
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
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(context) {
    double wid = 0.76;
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, builder) {
        return Transform.rotate(
          angle: radians(widget.rotation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
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
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    ScaleTransition(
                      scale: Tween(begin: 0.23, end: wid).animate(CurvedAnimation(parent: _controller4, curve: Curves.decelerate)),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 30,
                              color: Colors.lightBlue.withAlpha((255 ~/ 5)),
                            ),
                            BoxShadow(
                              spreadRadius: 50,
                              color: Colors.lightBlue.withAlpha((255 ~/ 5)),
                            ),
                            BoxShadow(
                              spreadRadius: 70,
                              color: Colors.lightBlue.withAlpha((255 ~/ 5)),
                            ),
                            BoxShadow(
                              spreadRadius: 90,
                              color: Colors.lightBlue.withAlpha((255 ~/ 5)),
                            )
                          ],
                        ),
                      ),
                    ),
                    ScaleTransition(
                      scale: Tween(begin: 0.23, end: wid).animate(CurvedAnimation(parent: _controller3, curve: Curves.easeInOutCirc)),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 30,
                              color: Colors.transparent,
                            ),
                            BoxShadow(
                              spreadRadius: 50,
                              color: Colors.transparent,
                            ),
                            BoxShadow(
                              spreadRadius: 70,
                              color: Colors.transparent,
                            ),
                            BoxShadow(
                              spreadRadius: 90,
                              color: Colors.lightBlue.withAlpha((255 ~/ 5)),
                            )
                          ],
                        ),
                      ),
                    ),
                    ScaleTransition(
                      scale: _tween.animate(CurvedAnimation(parent: _controller2, curve: Curves.fastOutSlowIn)),
                      child: InkWell(
                        onTap: () {
                          widget.onChangedTab(true);
                          _open();
                          _timer.cancel();
                          // progressController.updatepersentage(timeText.toDouble());
                          startTimer(0);
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer,
                                size: 19,
                                color: Colors.white,
                              ),
                              Text(
                                '${((timeText / 60).truncate() % 60).toString().padLeft(2, '0') + ':' + (timeText % 60).toString().padLeft(2, '0')}',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ScaleTransition(
                    //   scale: _tween.animate(CurvedAnimation(parent: _controller2, curve: Curves.fastOutSlowIn)),
                    //   child: Container(
                    //     height: 80,
                    //     width: 80,
                    //     child: FloatingActionButton(
                    //       elevation: 4,
                    //       backgroundColor: Colors.red,
                    //       child: Container(
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    // Icon(
                    //   Icons.timer,
                    //   size: 19,
                    //   color: Colors.white,
                    // ),
                    // Text(
                    //   '${((timeText / 60).truncate() % 60).toString().padLeft(2, '0') + ':' + (timeText % 60).toString().padLeft(2, '0')}',
                    //   style: TextStyle(color: Colors.white, fontSize: 18),
                    // ),
                    //           ],
                    //         ),
                    //       ),
                    //       // child: Icon(Icons.play_arrow),
                    // onPressed: () {
                    //   widget.onChangedTab(true);
                    //   _open();
                    //   _timer.cancel();
                    //   // progressController.updatepersentage(timeText.toDouble());
                    //   startTimer(0);
                    // },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildButton(time, finalAngle, double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()..translate((widget.translation.value) * cos(rad), (widget.translation.value) * sin(rad)),
      child: Container(
        height: 40,
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
