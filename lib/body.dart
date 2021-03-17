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

class _MainBodyState extends State<MainBody>
    with SingleTickerProviderStateMixin {
  bool timerAnimationState = true;
  void onChangedTab(bool index) {
    setState(() {
      timerAnimationState = index;
    });
  }

  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
              // Column(
              //   children: [
              //     Stack(
              //       alignment: AlignmentDirectional.center,
              //       children: [
              //         // AutoAnimation(),
              //         RadialProgress(),
              //         Timer(timerAnimationState: timerAnimationState),
              //         Container(
              //           width: 500,
              //           height: 500,
              //           // color: Colors.purple,
              //           child: SizedBox.expand(
              //               child: MainCircle(
              //             timerAnimationState: timerAnimationState,
              //             onChangedTab: onChangedTab,
              //           )),
              //           // child: Timer(),
              //         ),
              //       ],
              //     ),
              //   ],
              // )

              Column(
                children: [
                  Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height - 35,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            height: 30,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Colors.green,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(
                                  text: 'Smart Timer',
                                ),
                                Tab(
                                  text: 'Daily Schidule',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 75,
                          // color: Colors.white,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      // AutoAnimation(),
                                      RadialProgress(),
                                      Timer(
                                          timerAnimationState:
                                              timerAnimationState),
                                      Container(
                                        width: 475,
                                        height: 475,
                                        // color: Colors.purple,
                                        child: SizedBox.expand(
                                            child: MainCircle(
                                          timerAnimationState:
                                              timerAnimationState,
                                          onChangedTab: onChangedTab,
                                        )),
                                        // child: Timer(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Center(
                                child: Text(
                                  'Place Bid',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
