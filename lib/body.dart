import 'package:avatar_glow/avatar_glow.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spomodoro/bar.dart';
import 'Circle animation/circle.dart';
import 'Circle animation/perIndacator.dart';
import 'Circle animation/timer.dart';

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> with SingleTickerProviderStateMixin {
//?----------------------------------------List
  bool timerAnimationState = true;
  void onChangedTab(bool index) {
    setState(() {
      timerAnimationState = index;
    });
  }

  TabController _tabController;
  var index = 0;

  ScrollController _mycontroller1 = new ScrollController();
  ScrollController _mycontroller2 = new ScrollController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: index);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//!-----------------------------------------------------shared preference
  TimeOfDay _time2 = TimeOfDay.now().replacing(minute: 0);
  void onTimeChanged2(TimeOfDay newTime) {
    setState(() {
      _time2 = newTime;
    });
  }

  var ctime = 4;
  void updateTime(val) {
    setState(() {
      ctime = val;
    });
  }

//?---------------------------------------------------

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
  Color boxColor = Color(0xFF494d5c);
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
      boxColor = Color(0xFF343742);
      _exitCounter2++;
    });
  }

  void _updateLocation2(PointerEvent details2) {
    setState(() {
      boxColor = Color(0xFF494d5c);
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

  //?-------------index of row1
  int totalindex = 0;
  int currentindex = 0;
  void currentIndex(val) {
    setState(() {
      currentindex = val;
    });
  }

  void totalIndex(val) {
    setState(() {
      totalindex = val;
    });
  }

  int colorindex = DateTime.now().hour;
  void colorIndex(val) {
    setState(() {
      colorindex = val;
    });
  }

  int activeindex = DateTime.now().hour;
  void activeIndex(val) {
    setState(() {
      activeindex = val;
    });
  }

//?-------------------------------------------------------------------------------------------------------

  // ignore: deprecated_member_use
  var list4 = List<String>();
  // ignore: deprecated_member_use
  var list5 = List<String>();
  // ignore: deprecated_member_use
  var list6 = List<String>();
  // ignore: deprecated_member_use
  var list7 = List<String>();
  itemCountt() {
    // if (activeindex == 4) {
    //   var temp = addGetSharedPref("4");
    //   return temp.toString().length;
    // } else if (activeindex == 5) {
    //   var temp = addGetSharedPref("5");
    //   return temp.toString().length;
    // } else if (activeindex == 6) {
    //   var temp = addGetSharedPref("6");
    //   return temp.toString().length;
    // } else if (activeindex == 7) {
    //   var temp = addGetSharedPref("7");
    //   return temp.toString().length;
    // }
  }

  _textDisplay(BuildContext context, index) {
    // if (activeindex == 4) {
    //   return Text('- ' + todoController.sublist4[index].text);
    // } else if (activeindex == 5) {
    //   return Text('- ' + todoController.sublist5[index].text);
    // } else if (activeindex == 6) {
    //   return Text('- ' + todoController.sublist6[index].text);
    // } else if (activeindex == 7) {
    //   return Text('- ' + todoController.sublist7[index].text);
    // }
  }

  // ignore: missing_return
  _slidTodeleted(BuildContext context, index) {
    // if (activeindex == 4) {
    //   return todoController.sublist4.removeAt(index);
    // } else if (activeindex == 5) {
    //   return todoController.sublist5.removeAt(index);
    // } else if (activeindex == 6) {
    //   return todoController.sublist6.removeAt(index);
    // } else if (activeindex == 7) {
    //   return todoController.sublist7.removeAt(index);
    // }
  }

//?------------------------------------------------------------------------------------------------------
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 0);
  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  //?---------------------------RadialProgress
  void isTaskComplete() {
    setState(() {});
  }

  Future<List<String>> addGetSharedPref(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getStringList(key);
  }

  addToSharedPref(String key, List<String> value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setStringList(key, value);
  }

  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width / 3.5;
    double wid2 = wid;

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
                child: WindowTitleBarBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        child: Icon(
                          Icons.explore_outlined,
                          color: Color(0xFF39a7f2),
                          size: 20,
                        ),
                      ),
                      InkWell(
                        onTap: () {
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
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      createInlinePicker(
                                        borderRadius: 5.3,
                                        dialogInsetPadding: EdgeInsets.all(0),
                                        elevation: 1,
                                        value: _time2,
                                        onChange: onTimeChanged2,
                                        minuteInterval: MinuteInterval.FIVE,
                                        iosStylePicker: false,
                                        minMinute: 0,
                                        maxMinute: 59,
                                        onChangeDateTime: (DateTime dateTime) {
                                          updateTime(dateTime.hour);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          // Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: Icon(
                            Icons.bookmark_outline_sharp,
                            color: Color(0xFF39a7f2),
                            size: 20,
                          ),
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
                    height: MediaQuery.of(context).size.height - 35,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Container(
                            height: 30,
                            width: 300,
                            decoration: BoxDecoration(
                              // color: Color.fromARGB(255, 56, 41, 51)
                              color: Color(0xFFf5f3f4),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Color(0xFFef233c),
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
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      RadialProgress(onTimerChnage: timerAnimationState),
                                      Timer(timerAnimationState: timerAnimationState),
                                      Container(
                                        width: 475,
                                        height: 475,
                                        child: SizedBox.expand(
                                          child: MainCircle(
                                            timerAnimationState: timerAnimationState,
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
                                    // color: Color(0xFF101014),
                                    padding: EdgeInsets.only(top: 7),
                                    child: Row(
                                      children: [
                                        Container(
                                          //! part 1 bg
                                          color: Color(0xFF1c1427),
                                          // color: Color(0xFF12202f),
                                          height: MediaQuery.of(context).size.height - 92,
                                          width: wid,
                                          child: RawScrollbar(
                                            thumbColor: Colors.redAccent,
                                            radius: Radius.circular(20),
                                            thickness: 5,
                                            child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              itemCount: 24 - ctime + 2,
                                              controller: _controller,
                                              itemBuilder: (context, index) {
                                                return index == 0
                                                    ? MouseRegion(
                                                        onEnter: _incrementEnter,
                                                        onHover: _updateLocation,
                                                        onExit: _incrementExit,
                                                        child: Container(
                                                          height: 45,
                                                          margin: EdgeInsets.only(bottom: 3, left: 2, right: 3),
                                                          decoration: BoxDecoration(
                                                            color: textColor,
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.only(left: 10),
                                                                child: Icon(
                                                                  Icons.wb_sunny,
                                                                  color: Colors.yellow,
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
                                                              Container(
                                                                height: 30,
                                                                width: 30,
                                                                child: FloatingActionButton(
                                                                  elevation: 0,
                                                                  backgroundColor: Color(0xFF3f4256),
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
                                                                              borderRadius: BorderRadius.circular(30),
                                                                            ),
                                                                            child: createInlinePicker(
                                                                              borderRadius: 5.3,
                                                                              dialogInsetPadding: EdgeInsets.all(0),
                                                                              elevation: 1,
                                                                              value: _time,
                                                                              onChange: onTimeChanged,
                                                                              minuteInterval: MinuteInterval.FIVE,
                                                                              iosStylePicker: false,
                                                                              minMinute: 0,
                                                                              maxMinute: 59,
                                                                              onChangeDateTime: (DateTime dateTime) {
                                                                                updateTime(dateTime.hour);
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
                                                        ),
                                                      )
                                                    : ClipRRect(
                                                        child: Column(
                                                          children: [
                                                            //!  1st row part
                                                            InkWell(
                                                              onTap: () {
                                                                colorIndex(ctime + index - 1);
                                                              },
                                                              onHover: (val) {
                                                                val ? activeIndex(ctime + index - 1) : activeIndex(colorindex);
                                                              },
                                                              child: HoverAnimatedContainer(
                                                                height: 45,
                                                                margin: EdgeInsets.only(
                                                                  left: 2,
                                                                  right: 3,
                                                                ),
                                                                hoverDecoration: BoxDecoration(
                                                                  color: Color(0xFF3f4256),
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(5),
                                                                    color: colorindex == ctime + index - 1 ? Colors.cyan : Colors.transparent,
                                                                  ),
                                                                  //  Color.fromARGB(255, 31, 229, 146)

                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.only(left: 5),
                                                                        child: ctime + index - 1 == _time.hour
                                                                            ? Icon(
                                                                                Icons.offline_bolt,
                                                                                color: colorindex == ctime + index - 1 ? Color(0xFF1c1427) : Colors.red,
                                                                              )
                                                                            : Icon(
                                                                                Icons.offline_bolt,
                                                                                color: colorindex == ctime + index - 1 ? Color(0xFF1c1427) : Colors.white,
                                                                              ),
                                                                      ),
                                                                      DefaultTextStyle(
                                                                        style: TextStyle(color: Colors.white, fontSize: 17),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ctime + index - 1 <= 12
                                                                                ? Text(
                                                                                    (ctime + index - 1).toString(),
                                                                                  )
                                                                                : Text(
                                                                                    (ctime + index - 1 - 12).toString(),
                                                                                  ),
                                                                            Text(
                                                                              ' - ',
                                                                            ),
                                                                            ctime + index <= 12
                                                                                ? Text(
                                                                                    (ctime + index).toString() + ' AM',
                                                                                  )
                                                                                : ctime + index == 25
                                                                                    ? Text(
                                                                                        (ctime + index - 24).toString() + ' AM',
                                                                                      )
                                                                                    : Text(
                                                                                        (ctime + index - 12).toString() + ' PM',
                                                                                      ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(left: 10),
                                                                        child: ctime + index - 1 == _time.hour
                                                                            ? AvatarGlow(
                                                                                endRadius: 22,
                                                                                duration: Duration(milliseconds: 2000),
                                                                                repeat: true,
                                                                                showTwoGlows: true,
                                                                                repeatPauseDuration: Duration(milliseconds: 100),
                                                                                glowColor: Colors.blue,
                                                                                child: Icon(
                                                                                  Icons.flash_on,
                                                                                  color: Colors.yellow,
                                                                                  size: 20,
                                                                                ),
                                                                              )
                                                                            : Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.flash_on,
                                                                                  color: Colors.transparent,
                                                                                  size: 20,
                                                                                ),
                                                                              ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 3,
                                                              margin: EdgeInsets.only(
                                                                left: 2,
                                                                right: 3,
                                                              ),
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height - 92,
                                            width: wid2,
                                            decoration: BoxDecoration(
                                              //! backgroun color
                                              color: Color(0xFF12202f),
                                              // gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF00416A), Color(0xFFE4E5E6)], stops: [0.0, 1.0]),
                                            ),
                                            child: NotificationListener<ScrollNotification>(
                                                child: Stack(
                                                  children: [
                                                    ListView.builder(
                                                      physics: BouncingScrollPhysics(),
                                                      controller: _mycontroller1,
                                                      itemBuilder: (context, index2) => Column(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                              // top: index2 == 0 ? 4 : 0,
                                                              left: 10,
                                                              right: 10,
                                                            ),
                                                            height: 35,
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                              // top: index2 == 0 ? 4 : 0,
                                                              left: 10,
                                                              right: 10,
                                                            ),
                                                            height: 2,
                                                            color: Color(0xFF181923),
                                                          )
                                                        ],
                                                      ),
                                                      itemCount: 100,
                                                    ),
                                                    RawScrollbar(
                                                      thumbColor: Colors.redAccent,
                                                      radius: Radius.circular(20),
                                                      thickness: 5,
                                                      child: ListView.builder(
                                                        // physics: BouncingScrollPhysics(),
                                                        controller: _mycontroller2,
                                                        itemBuilder: (context, index3) => Dismissible(
                                                          key: Key(UniqueKey().toString()),
                                                          onDismissed: (direction) async {
                                                            setState(() {
                                                              _slidTodeleted(context, index3);
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              InkWell(
                                                                // onDoubleTap: () {
                                                                //   // print(index3);
                                                                //   _onDoubletabEdit(index3);
                                                                //   // print(doubleTapedIndex);
                                                                // },
                                                                child: Container(
                                                                  margin: EdgeInsets.only(
                                                                    top: index3 == 0 ? 4 : 0,
                                                                    left: 10,
                                                                    right: 10,
                                                                  ),
                                                                  height: 35,
                                                                  decoration: BoxDecoration(
                                                                    //!color all
                                                                    color: Color(0xFF3f4256),
                                                                    borderRadius: BorderRadius.circular(3),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      //!  display here-----------------------------------------------------------------
                                                                      DefaultTextStyle(
                                                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                                                        child: Container(
                                                                          padding: EdgeInsets.only(left: 25),
                                                                          child: _textDisplay(context, index3),
                                                                        ),
                                                                      ),
                                                                      Checkbox(
                                                                        activeColor: Colors.grey,
                                                                        value: true,
                                                                        onChanged: (v) {
                                                                          // var changed = todoController.sublist[index2];
                                                                          // changed.done = v;
                                                                          // todoController.sublist[index2] = changed;
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(height: 2)
                                                            ],
                                                          ),
                                                        ),
                                                        // separatorBuilder: (_, index2) => Divider(),
                                                        itemCount: 0,
                                                        // itemCount: itemCountt(),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        // gg
                                                        MouseRegion(
                                                          onEnter: _incrementEnter2,
                                                          onHover: _updateLocation2,
                                                          onExit: _incrementExit2,
                                                          child: Container(
                                                            height: 40,
                                                            margin: EdgeInsets.only(
                                                              bottom: 8,
                                                              left: 10,
                                                              right: 10,
                                                            ),
                                                            decoration: BoxDecoration(
                                                              color: boxColor,
                                                              borderRadius: BorderRadius.circular(6),
                                                            ),
                                                            child: FocusScope(
                                                              child: Focus(
                                                                onFocusChange: (focus) => {
                                                                  hintTextChange(focus),
                                                                  addIcon(),
                                                                },
                                                                child: TextField(
                                                                  //!  inputHere-----------------------------------------------------------------
                                                                  focusNode: focusNode,
                                                                  controller: textController,
                                                                  onSubmitted: (val) {
                                                                    textController.clear();
                                                                    FocusScope.of(context).requestFocus(focusNode);
                                                                  },
                                                                  cursorColor: Colors.white,
                                                                  style: TextStyle(color: Colors.white),
                                                                  decoration: InputDecoration(
                                                                    hintText: hinttext,
                                                                    hintStyle: TextStyle(color: Colors.white),
                                                                    border: InputBorder.none,
                                                                    prefixIcon: Icon(
                                                                      addicon,
                                                                      color: Color(0xFFb9bbbe),
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
                                                    (ScrollNotification scrollInfo) {
                                                  _mycontroller1.jumpTo(_mycontroller2.offset);
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
