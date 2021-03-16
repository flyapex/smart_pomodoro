// import 'package:flutter/material.dart';

// class Timer extends StatelessWidget {
//   final isOpen = ValueNotifier<bool>(false);
//   final isOpen2 = false;
//   void autochange(val) {}
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // InkWell(
//         //   onTap: () => {
//         //     isOpen2 ? isOpen2 == false : isOpen2 == true,
//         //   },
//         //   child: SizedBox(
//         //     width: 100,
//         //     child: ValueListenableBuilder<bool>(
//         //       valueListenable: isOpen,
//         //       builder: (context, isOpen, _) {
//         //         return AnimatedContainer(
//         //           duration: Duration(milliseconds: 800),
//         //           curve: Curves.easeOutQuad,
//         //           decoration: BoxDecoration(
//         //             shape: BoxShape.circle,
//         //             color: Colors.lightBlue,
//         //             boxShadow: [
//         //               if (isOpen)
//         //                 for (var i = 0; i < 5; i++)
//         //                   BoxShadow(
//         //                     spreadRadius: i * 40.0,
//         //                     color: Colors.lightBlue.withAlpha((255 ~/ 5)),
//         //                   )
//         //             ],
//         //           ),
//         //         );
//         //       },
//         //     ),
//         //   ),
//         // ),
//         InkWell(
//           onTap: () => isOpen.value = !isOpen.value,
//           child: SizedBox(
//             width: 60,
//             child: ValueListenableBuilder<bool>(
//               valueListenable: isOpen,
//               builder: (context, isOpen, _) {
//                 return AnimatedContainer(
//                   duration: Duration(milliseconds: 800),
//                   curve: Curves.easeOutQuad,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.lightBlue,
//                     boxShadow: [
//                       if (isOpen)
//                         for (var i = 0; i < 5; i++)
//                           BoxShadow(
//                             spreadRadius: i * 40.0,
//                             color: Colors.lightBlue.withAlpha((255 ~/ 5)),
//                           )
//                     ],
//                   ),
//                   child: Center(
//                     child: Text(
//                       "30",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 40,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
