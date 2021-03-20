import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:spomodoro/bar.dart';
import 'Circle animation/circle.dart';
import 'Circle animation/perIndacator.dart';
import 'Circle animation/timer.dart';
import 'controller/timerAnimaionController.dart';

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
  ScrollController _mycontroller1 = new ScrollController();
  ScrollController _mycontroller2 = new ScrollController();

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

//-----------------------------------------------------
  var ctime = 0;
  void updateTime(val) {
    setState(() {
      ctime = val;
    });
  }

//?---------------------------------------------------

//------------------------------------------

  Color textColor = Color(0xFF3f4256);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;
  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      textColor = Color(0xFF3f4256);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      textColor = Color(0xFF3f4256).withOpacity(0.5);
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  //?------------------------------------------ add button
  Color boxColor = Color(0xFF1f1f20);
  // ignore: unused_field
  int _enterCounter2 = 0;
  // ignore: unused_field
  int _exitCounter2 = 0;
  double x2 = 0.0;
  double y2 = 0.0;
  void _incrementEnter2(PointerEvent details2) {
    setState(() {
      _enterCounter2++;
    });
  }

  void _incrementExit2(PointerEvent details2) {
    setState(() {
      boxColor = Color(0xFF1f1f20);
      _exitCounter2++;
    });
  }

  void _updateLocation2(PointerEvent details2) {
    setState(() {
      boxColor = Color(0xFF282829);
      x2 = details2.position.dx;
      y2 = details2.position.dy;
    });
  }

//?------------------------------------------
  var hinttext = 'Add Task';
  void hintTextChange(val) {
    setState(() {
      val ? hinttext = '' : hinttext = 'Add Task';
    });
  }

  IconData addicon = Icons.add;
  void addIcon() {
    setState(() {
      if (addicon == Icons.add) {
        addicon = Icons.panorama_fish_eye;
      } else {
        addicon = Icons.add;
      }
    });
  }

  var textController = TextEditingController();
  var todoController = Get.put(TODOController());

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width / 3.5;
    double wid2 = wid;
    TimeOfDay _time = TimeOfDay.now().replacing(minute: 0);

    void onTimeChanged(TimeOfDay newTime) {
      setState(() {
        _time = newTime;
        print(_time);
      });
    }

    ScrollController _controller = ScrollController();
    var focusNode = FocusNode();
    return Expanded(
      child: Container(
        color: Color(0xFF1a1b26),
        child: Container(
          child: Column(
            children: [
              Container(
                color: Color(0xFF16161e),
                // color: Color(0xFF16161e),
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
                  Container(
                    // color: Colors.white.withOpacity(0.1),
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
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Color(0xFFe5383b).withOpacity(0.9),
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
                                      RadialProgress(),
                                      Timer(
                                          timerAnimationState:
                                              timerAnimationState),
                                      Container(
                                        width: 475,
                                        height: 475,
                                        child: SizedBox.expand(
                                          child: MainCircle(
                                            timerAnimationState:
                                                timerAnimationState,
                                            onChangedTab: onChangedTab,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 17),
                                    child: Row(
                                      children: [
                                        Container(
                                          color: Color(0xFF12202f),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              92,
                                          width: wid,
                                          child: ListView.builder(
                                            itemCount: 24 - ctime + 2,
                                            controller: _controller,
                                            itemBuilder: (context, index) {
                                              return index == 0
                                                  ? MouseRegion(
                                                      onEnter: _incrementEnter,
                                                      onHover: _updateLocation,
                                                      onExit: _incrementExit,
                                                      child: Container(
                                                        height: 50,
                                                        margin: EdgeInsets.only(
                                                            bottom: 3,
                                                            left: 2,
                                                            right: 3),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: textColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              child: Icon(
                                                                Icons.wb_sunny,
                                                                color: Colors
                                                                    .yellow,
                                                              ),
                                                            ),
                                                            Text(
                                                              "Morning",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 30,
                                                              width: 30,
                                                              child:
                                                                  FloatingActionButton(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF3f4256),
                                                                onPressed: () {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        contentPadding:
                                                                            EdgeInsets.all(0.0),
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              390,
                                                                          width:
                                                                              500,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                          ),
                                                                          child:
                                                                              createInlinePicker(
                                                                            borderRadius:
                                                                                5.3,
                                                                            dialogInsetPadding:
                                                                                EdgeInsets.all(0),
                                                                            elevation:
                                                                                1,
                                                                            value:
                                                                                _time,
                                                                            onChange:
                                                                                onTimeChanged,
                                                                            minuteInterval:
                                                                                MinuteInterval.FIVE,
                                                                            iosStylePicker:
                                                                                false,
                                                                            minMinute:
                                                                                0,
                                                                            maxMinute:
                                                                                59,
                                                                            onChangeDateTime:
                                                                                (DateTime dateTime) {
                                                                              updateTime(dateTime.hour);
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
                                                                  Icons
                                                                      .date_range,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            // print(ctime +
                                                            //     index -
                                                            //     1);
                                                            // print(
                                                            //     _time.hour + 4);
                                                            print(index);
                                                          },
                                                          child:
                                                              HoverAnimatedContainer(
                                                            height: 50,
                                                            margin:
                                                                EdgeInsets.only(
                                                              left: 2,
                                                              right: 3,
                                                            ),
                                                            hoverDecoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF3f4256),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                                  child: Icon(
                                                                    Icons
                                                                        .offline_bolt,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    ctime + index - 1 <=
                                                                            12
                                                                        ? Text(
                                                                            (ctime + index - 1).toString(),
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          )
                                                                        : Text(
                                                                            (ctime + index - 1 - 12).toString(),
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                    Text(
                                                                      ' - ',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    ctime + index <=
                                                                            12
                                                                        ? Text(
                                                                            (ctime + index).toString() +
                                                                                ' AM',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          )
                                                                        : ctime + index ==
                                                                                25
                                                                            ? Text(
                                                                                (ctime + index - 24).toString() + ' AM',
                                                                                style: TextStyle(color: Colors.white),
                                                                              )
                                                                            : Text(
                                                                                (ctime + index - 12).toString() + ' PM',
                                                                                style: TextStyle(color: Colors.white),
                                                                              ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child: ctime +
                                                                              index -
                                                                              1 ==
                                                                          _time
                                                                              .hour
                                                                      ? Icon(
                                                                          Icons
                                                                              .flash_on,
                                                                          color:
                                                                              Colors.yellow,
                                                                        )
                                                                      : Icon(
                                                                          Icons
                                                                              .offline_bolt,
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 3,
                                                          margin:
                                                              EdgeInsets.only(
                                                            left: 2,
                                                            right: 3,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                92,
                                            width: wid2,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF00416A),
                                                    Color(0xFFE4E5E6)
                                                  ],
                                                  stops: [
                                                    0.0,
                                                    1.0
                                                  ]),
                                            ),
                                            child: NotificationListener<
                                                    ScrollNotification>(
                                                child: Stack(
                                                  children: [
                                                    Obx(
                                                      () => ListView.separated(
                                                        controller:
                                                            _mycontroller1,
                                                        itemBuilder:
                                                            (context, index2) =>
                                                                Column(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                left: 10,
                                                                right: 10,
                                                              ),
                                                              height: 45,
                                                              // color:
                                                              //     Colors.red,
                                                            ),
                                                          ],
                                                        ),
                                                        itemCount: todoController
                                                                    .alltodoslist
                                                                    .length <
                                                                8
                                                            ? 10
                                                            : todoController
                                                                    .alltodoslist
                                                                    .length +
                                                                3,
                                                        separatorBuilder:
                                                            (_, index2) =>
                                                                Divider(),
                                                      ),
                                                    ),
                                                    Obx(
                                                      () => ListView.separated(
                                                        controller:
                                                            _mycontroller2,
                                                        itemBuilder:
                                                            (context, index2) =>
                                                                Column(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                left: 10,
                                                                right: 10,
                                                              ),
                                                              height: 45,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    todoController
                                                                        .alltodoslist[
                                                                            index2]
                                                                        .text,
                                                                  ),
                                                                  Checkbox(
                                                                    value: todoController
                                                                        .alltodoslist[
                                                                            index2]
                                                                        .done,
                                                                    onChanged:
                                                                        (v) {
                                                                      var changed =
                                                                          todoController
                                                                              .alltodoslist[index2];
                                                                      changed.done =
                                                                          v;
                                                                      todoController
                                                                              .alltodoslist[index2] =
                                                                          changed;
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        separatorBuilder:
                                                            (_, index2) =>
                                                                Divider(),
                                                        itemCount:
                                                            todoController
                                                                .alltodoslist
                                                                .length,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        MouseRegion(
                                                          onEnter:
                                                              _incrementEnter2,
                                                          onHover:
                                                              _updateLocation2,
                                                          onExit:
                                                              _incrementExit2,
                                                          child: Container(
                                                            height: 50,
                                                            margin:
                                                                EdgeInsets.only(
                                                              bottom: 8,
                                                              left: 2,
                                                              right: 3,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: boxColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                10,
                                                              ),
                                                            ),
                                                            child: FocusScope(
                                                              child: Focus(
                                                                onFocusChange:
                                                                    (focus) => {
                                                                  hintTextChange(
                                                                      focus),
                                                                  addIcon(),
                                                                },
                                                                child:
                                                                    TextField(
                                                                  focusNode:
                                                                      focusNode,
                                                                  controller:
                                                                      textController,
                                                                  onSubmitted:
                                                                      (val) {
                                                                    print(_time
                                                                        .hour);
                                                                    todoController
                                                                        .alltodoslist
                                                                        .add(
                                                                      Todo(
                                                                          text:
                                                                              textController.text),
                                                                    );
                                                                    textController
                                                                        .clear();
                                                                    FocusScope.of(
                                                                            context)
                                                                        .requestFocus(
                                                                            focusNode);
                                                                    // todoController
                                                                    //     .mainList
                                                                    //     .add(
                                                                    //   MainList(
                                                                    //     time:
                                                                    //         _time.hour,
                                                                    //   ),
                                                                    // );
                                                                    // print(val);
                                                                    // textController
                                                                    //     .clear();
                                                                  },
                                                                  cursorColor:
                                                                      Colors
                                                                          .white,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        hinttext,
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    prefixIcon:
                                                                        Icon(
                                                                      addicon,
                                                                      color: Color(
                                                                          0xFF686869),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                onNotification:
                                                    // ignore: missing_return
                                                    (ScrollNotification
                                                        scrollInfo) {
                                                  _mycontroller1.jumpTo(
                                                      _mycontroller2.offset);
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
