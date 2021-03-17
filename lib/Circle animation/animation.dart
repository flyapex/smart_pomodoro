// import 'package:flutter/material.dart';

// class AutoAnimation extends StatefulWidget {
//   @override
//   _AutoAnimationState createState() => _AutoAnimationState();
// }

// class _AutoAnimationState extends State<AutoAnimation> {
//   void change() {
//     Future.delayed(
//       Duration(milliseconds: 300),
//       () {
//         setState(() {
//           isOpen2.value = !isOpen2.value;
//         });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 100,
//       child: ValueListenableBuilder<bool>(
//         valueListenable: ValueNotifier<bool>(widget.timerAnimationState),
//         builder: (context, timerAnimationState, _) {
//           return AnimatedContainer(
//             duration: Duration(milliseconds: 500),
//             curve: Curves.easeOutQuad,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.lightBlue,
//               boxShadow: [
//                 if (timerAnimationState)
//                   for (var i = 0; i < 5; i++)
//                     BoxShadow(
//                       spreadRadius: i * 50.0,
//                       color: Colors.lightBlue.withAlpha((255 ~/ 5)),
//                     )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
