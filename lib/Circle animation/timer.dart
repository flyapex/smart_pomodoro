import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spomodoro/controller/timerAnimaionController.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with SingleTickerProviderStateMixin {
  final TimerAnimationCotroller timerAnimationCotroller =
      Get.put(TimerAnimationCotroller());

  // var isOpen = ValueNotifier<bool>(false);

  bool isOpen = Get.find<TimerAnimationCotroller>().isActiveTimerCoumdown;

  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        setState(() {
          isOpen = true;
          print("$isOpen");
        });
      },
    );
  }

  // void change() {
  //   Future.delayed(
  //     Duration(milliseconds: 300),
  //     () {
  //       setState(() {
  //         isOpen2.value = !isOpen2.value;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ValueListenableBuilder<bool>(
        valueListenable:
            ValueNotifier<bool>(timerAnimationCotroller.isActiveTimerCoumdown),
        builder: (context, isOpen, _) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lightBlue,
              boxShadow: [
                if (isOpen)
                  for (var i = 0; i < 5; i++)
                    BoxShadow(
                      spreadRadius: i * 50.0,
                      color: Colors.lightBlue.withAlpha((255 ~/ 5)),
                    )
              ],
            ),
          );
        },
      ),
    );
  }

  // //!---------------big circleS
  // InkWell customeanimation() {
  //   return InkWell(
  //     // onTap: () {
  //     //   isOpen2.value = !isOpen2.value;
  //     // },
  //     child: SizedBox(
  //       width: 60,
  //       child: ValueListenableBuilder<bool>(
  //         valueListenable: isOpen2,
  //         builder: (context, isOpen2, _) {
  //           return AnimatedContainer(
  //             duration: Duration(milliseconds: 500),
  //             curve: Curves.easeOutQuad,
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: Colors.tealAccent,
  //               boxShadow: [
  //                 if (isOpen2)
  //                   for (var i = 0; i < 6; i++)
  //                     BoxShadow(
  //                       spreadRadius: i * 40.0,
  //                       color: Colors.tealAccent.withAlpha((255 ~/ 5)),
  //                     )
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}
