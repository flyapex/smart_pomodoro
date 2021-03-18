import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spomodoro/bar.dart';

import 'Circle animation/circle.dart';
import 'Circle animation/perIndacator.dart';
import 'Circle animation/timer.dart';
import 'controller/timerController.dart';

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
                              _firstPage(context),
                              _secoundPage(context),
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

  Widget _firstPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // AutoAnimation(),
            RadialProgress(),
            Timer(timerAnimationState: timerAnimationState),
            Container(
              width: 475,
              height: 475,
              // color: Colors.purple,
              child: SizedBox.expand(
                  child: MainCircle(
                timerAnimationState: timerAnimationState,
                onChangedTab: onChangedTab,
              )),
              // child: Timer(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _secoundPage(BuildContext context) {
    double wid = MediaQuery.of(context).size.width / 3.5;
    double wid2 = wid;
    TimeOfDay _time = TimeOfDay.now().replacing(minute: 0);

    void onTimeChanged(TimeOfDay newTime) {
      setState(() {
        _time = newTime;
        print(_time);
      });
    }

    final hoursTimerController htimerController =
        Get.put(hoursTimerController());

    var hinttext = 'Add Task';

    var textController = TextEditingController();

    ScrollController _controller = ScrollController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 17),
          child: Row(
            children: [
              Container(
                color: Color(0xFF12202f),
                height: MediaQuery.of(context).size.height - 92,
                width: wid,
                child: ListView.builder(
                  itemCount: 24 - htimerController.ctime,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Container(
                            height: 50,
                            margin:
                                EdgeInsets.only(bottom: 3, left: 2, right: 3),
                            decoration: BoxDecoration(
                              color: Color(0xFF3f4256).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.wb_sunny,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Morning",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                // IconButton(
                                //   icon: Icon(Icons.date_range),
                                //   color: Colors.white,
                                //   onPressed: () {},
                                // )
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor:
                                        Color(0xFF3f4256).withOpacity(0.5),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            contentPadding: EdgeInsets.all(0.0),
                                            content: Container(
                                              height: 390,
                                              width: 500,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: createInlinePicker(
                                                borderRadius: 5.3,
                                                dialogInsetPadding:
                                                    EdgeInsets.all(0),
                                                elevation: 1,
                                                value: _time,
                                                onChange: onTimeChanged,
                                                minuteInterval:
                                                    MinuteInterval.FIVE,
                                                iosStylePicker: false,
                                                minMinute: 0,
                                                maxMinute: 59,
                                                onChangeDateTime:
                                                    (DateTime dateTime) {
                                                  htimerController.UpdateTime(
                                                      dateTime.hour);
                                                  print(dateTime);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 50,
                            margin:
                                EdgeInsets.only(bottom: 3, left: 2, right: 3),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.offline_bolt,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    htimerController.ctime + index - 1 <= 12
                                        ? Text(
                                            (htimerController.ctime + index - 1)
                                                .toString())
                                        : Text((htimerController.ctime +
                                                index -
                                                1 -
                                                12)
                                            .toString()),
                                    Text('-'),
                                    htimerController.ctime + index <= 12
                                        ? Text((htimerController.ctime + index)
                                            .toString())
                                        : Text((htimerController.ctime +
                                                index -
                                                12)
                                            .toString()),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.flash_on,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height - 92,
                  width: wid2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFFD500), Color(0xFFF6A00C)],
                        stops: [0.0, 1.0]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(bottom: 3, left: 2, right: 3),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: textController,
                          onSubmitted: (val) {
                            print(val);
                            textController.clear();
                          },
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: hinttext,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.only(left: 10),
                        //       child: Icon(
                        //         Icons.offline_bolt,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     Container(
                        //       height: 50,
                        //       width: 200,
                        //       color: Colors.pink,
                        //     ),
                        //     Padding(
                        //       padding: EdgeInsets.only(right: 10),
                        //       child: Icon(
                        //         Icons.access_alarm,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
