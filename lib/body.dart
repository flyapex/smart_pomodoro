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
  ScrollController _controller = ScrollController();
  var focusNode = FocusNode();
  var textController = TextEditingController();
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
  Color boxColor = Colors.white.withOpacity(0.2);
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

  void _updateLocation2(PointerEvent details2) {
    setState(() {
      // boxColor = Colors.green;
      boxColor = Colors.blue[50].withOpacity(0.3);
      hintTextChange(true);
      FocusScope.of(context).requestFocus(focusNode);
      x2 = details2.position.dx;
      y2 = details2.position.dy;
    });
  }

  void _incrementExit2(PointerEvent details2) {
    setState(() {
      boxColor = Colors.white.withOpacity(0.2);
      FocusScope.of(context).requestFocus(new FocusNode());
      hintTextChange(false);
      // boxColor = Color(0xFF3b3e45);
      _exitCounter2++;
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

  var todoController = Get.put(TODOController());

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

  int itemCountt() {
    if (activeindex == 0) {
      return todoController.sublist0.length;
    } else if (activeindex == 1) {
      return todoController.sublist1.length;
    } else if (activeindex == 2) {
      return todoController.sublist2.length;
    } else if (activeindex == 3) {
      return todoController.sublist3.length;
    } else if (activeindex == 4) {
      return todoController.sublist4.length;
    } else if (activeindex == 5) {
      return todoController.sublist5.length;
    } else if (activeindex == 6) {
      return todoController.sublist6.length;
    } else if (activeindex == 7) {
      return todoController.sublist7.length;
    } else if (activeindex == 8) {
      return todoController.sublist8.length;
    } else if (activeindex == 9) {
      return todoController.sublist9.length;
    } else if (activeindex == 10) {
      return todoController.sublist10.length;
    } else if (activeindex == 11) {
      return todoController.sublist11.length;
    } else if (activeindex == 12) {
      return todoController.sublist12.length;
    } else if (activeindex == 13) {
      return todoController.sublist13.length;
    } else if (activeindex == 14) {
      return todoController.sublist14.length;
    } else if (activeindex == 15) {
      return todoController.sublist15.length;
    } else if (activeindex == 16) {
      return todoController.sublist16.length;
    } else if (activeindex == 17) {
      return todoController.sublist17.length;
    } else if (activeindex == 18) {
      return todoController.sublist18.length;
    } else if (activeindex == 19) {
      return todoController.sublist19.length;
    } else if (activeindex == 20) {
      return todoController.sublist20.length;
    } else if (activeindex == 21) {
      return todoController.sublist21.length;
    } else if (activeindex == 22) {
      return todoController.sublist22.length;
    } else if (activeindex == 23) {
      return todoController.sublist23.length;
    } else if (activeindex == 24) {
      return todoController.sublist24.length;
    } else if (activeindex == 25) {
      return todoController.sublist25.length;
    } else {
      return 0;
    }
  }

  Widget _textDisplay(BuildContext context, index) {
    if (activeindex == 0) {
      return Text('- ' + todoController.sublist0[index].text);
    } else if (activeindex == 1) {
      return Text('- ' + todoController.sublist1[index].text);
    } else if (activeindex == 2) {
      return Text('- ' + todoController.sublist2[index].text);
    } else if (activeindex == 3) {
      return Text('- ' + todoController.sublist3[index].text);
    } else if (activeindex == 4) {
      return Text('- ' + todoController.sublist4[index].text);
    } else if (activeindex == 5) {
      return Text('- ' + todoController.sublist5[index].text);
    } else if (activeindex == 6) {
      return Text('- ' + todoController.sublist6[index].text);
    } else if (activeindex == 7) {
      return Text('- ' + todoController.sublist7[index].text);
    } else if (activeindex == 8) {
      return Text('- ' + todoController.sublist8[index].text);
    } else if (activeindex == 9) {
      return Text('- ' + todoController.sublist9[index].text);
    } else if (activeindex == 10) {
      return Text('- ' + todoController.sublist10[index].text);
    } else if (activeindex == 11) {
      return Text('- ' + todoController.sublist11[index].text);
    } else if (activeindex == 12) {
      return Text('- ' + todoController.sublist12[index].text);
    } else if (activeindex == 13) {
      return Text('- ' + todoController.sublist13[index].text);
    } else if (activeindex == 14) {
      return Text('- ' + todoController.sublist14[index].text);
    } else if (activeindex == 15) {
      return Text('- ' + todoController.sublist15[index].text);
    } else if (activeindex == 16) {
      return Text('- ' + todoController.sublist16[index].text);
    } else if (activeindex == 17) {
      return Text('- ' + todoController.sublist17[index].text);
    } else if (activeindex == 18) {
      return Text('- ' + todoController.sublist18[index].text);
    } else if (activeindex == 19) {
      return Text('- ' + todoController.sublist19[index].text);
    } else if (activeindex == 20) {
      return Text('- ' + todoController.sublist20[index].text);
    } else if (activeindex == 21) {
      return Text('- ' + todoController.sublist21[index].text);
    } else if (activeindex == 22) {
      return Text('- ' + todoController.sublist22[index].text);
    } else if (activeindex == 23) {
      return Text('- ' + todoController.sublist23[index].text);
    } else if (activeindex == 24) {
      return Text('- ' + todoController.sublist24[index].text);
    } else if (activeindex == 25) {
      return Text('- ' + todoController.sublist25[index].text);
    } else {
      return Text('- ' + '');
    }
  }

  // ignore: missing_return
  Todo _slidTodeleted(BuildContext context, index) {
    if (activeindex == 0) {
      return todoController.sublist0.removeAt(index);
    } else if (activeindex == 1) {
      return todoController.sublist1.removeAt(index);
    } else if (activeindex == 2) {
      return todoController.sublist2.removeAt(index);
    } else if (activeindex == 3) {
      return todoController.sublist3.removeAt(index);
    } else if (activeindex == 4) {
      return todoController.sublist4.removeAt(index);
    } else if (activeindex == 5) {
      return todoController.sublist5.removeAt(index);
    } else if (activeindex == 6) {
      return todoController.sublist6.removeAt(index);
    } else if (activeindex == 7) {
      return todoController.sublist7.removeAt(index);
    } else if (activeindex == 8) {
      return todoController.sublist8.removeAt(index);
    } else if (activeindex == 9) {
      return todoController.sublist9.removeAt(index);
    } else if (activeindex == 10) {
      return todoController.sublist10.removeAt(index);
    } else if (activeindex == 11) {
      return todoController.sublist11.removeAt(index);
    } else if (activeindex == 12) {
      return todoController.sublist12.removeAt(index);
    } else if (activeindex == 13) {
      return todoController.sublist13.removeAt(index);
    } else if (activeindex == 14) {
      return todoController.sublist14.removeAt(index);
    } else if (activeindex == 15) {
      return todoController.sublist15.removeAt(index);
    } else if (activeindex == 16) {
      return todoController.sublist16.removeAt(index);
    } else if (activeindex == 17) {
      return todoController.sublist17.removeAt(index);
    } else if (activeindex == 18) {
      return todoController.sublist18.removeAt(index);
    } else if (activeindex == 19) {
      return todoController.sublist19.removeAt(index);
    } else if (activeindex == 20) {
      return todoController.sublist20.removeAt(index);
    } else if (activeindex == 21) {
      return todoController.sublist21.removeAt(index);
    } else if (activeindex == 22) {
      return todoController.sublist22.removeAt(index);
    } else if (activeindex == 23) {
      return todoController.sublist23.removeAt(index);
    } else if (activeindex == 24) {
      return todoController.sublist24.removeAt(index);
    } else if (activeindex == 25) {
      return todoController.sublist25.removeAt(index);
    }
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

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width / 3.5;
    double wid2 = wid;

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
                      Text(
                        "Smart Timer",
                        style: TextStyle(fontFamily: "Pixel", color: Colors.white),
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
                                                                        child: Icon(
                                                                          Icons.offline_bolt,
                                                                          color: Colors.white,
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
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  )
                                                                                : Text(
                                                                                    (ctime + index - 1 - 12).toString(),
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                            Text(
                                                                              ' - ',
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                            ctime + index <= 12
                                                                                ? Text(
                                                                                    (ctime + index).toString() + ' AM',
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  )
                                                                                : ctime + index == 25
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
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(left: 10),
                                                                        child: ctime + index - 1 == _time.hour
                                                                            ? Icon(
                                                                                Icons.flash_on,
                                                                                color: Colors.yellow,
                                                                              )
                                                                            : Icon(
                                                                                Icons.offline_bolt,
                                                                                color: Colors.transparent,
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
                                                              top: index2 == 0 ? 4 : 0,
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
                                                        physics: BouncingScrollPhysics(),
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
                                                              Container(
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
                                                                    // Checkbox(
                                                                    //   activeColor: Colors.grey,
                                                                    //   value: true,
                                                                    //   onChanged: (v) {
                                                                    //     // var changed = todoController.sublist[index2];
                                                                    //     // changed.done = v;
                                                                    //     // todoController.sublist[index2] = changed;
                                                                    //   },
                                                                    // ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(height: 2)
                                                            ],
                                                          ),
                                                        ),
                                                        // separatorBuilder: (_, index2) => Divider(),
                                                        itemCount: itemCountt(),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
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
                                                            child: TextField(
                                                              //!  inputHere-----------------------------------------------------------------
                                                              focusNode: focusNode,
                                                              controller: textController,
                                                              onSubmitted: (val) {
                                                                addIcon();
                                                                if (colorindex == 0) {
                                                                  todoController.sublist0.add(Todo(text: textController.text));
                                                                } else if (colorindex == 1) {
                                                                  todoController.sublist1.add(Todo(text: textController.text));
                                                                } else if (colorindex == 2) {
                                                                  todoController.sublist2.add(Todo(text: textController.text));
                                                                } else if (colorindex == 3) {
                                                                  todoController.sublist3.add(Todo(text: textController.text));
                                                                } else if (colorindex == 4) {
                                                                  todoController.sublist4.add(Todo(text: textController.text));
                                                                } else if (colorindex == 5) {
                                                                  todoController.sublist5.add(Todo(text: textController.text));
                                                                } else if (colorindex == 6) {
                                                                  todoController.sublist6.add(Todo(text: textController.text));
                                                                } else if (colorindex == 7) {
                                                                  todoController.sublist7.add(Todo(text: textController.text));
                                                                } else if (colorindex == 8) {
                                                                  todoController.sublist8.add(Todo(text: textController.text));
                                                                } else if (colorindex == 9) {
                                                                  todoController.sublist9.add(Todo(text: textController.text));
                                                                } else if (colorindex == 10) {
                                                                  todoController.sublist10.add(Todo(text: textController.text));
                                                                } else if (colorindex == 11) {
                                                                  todoController.sublist11.add(Todo(text: textController.text));
                                                                } else if (colorindex == 12) {
                                                                  todoController.sublist12.add(Todo(text: textController.text));
                                                                } else if (colorindex == 13) {
                                                                  todoController.sublist13.add(Todo(text: textController.text));
                                                                } else if (colorindex == 14) {
                                                                  todoController.sublist14.add(Todo(text: textController.text));
                                                                } else if (colorindex == 15) {
                                                                  todoController.sublist15.add(Todo(text: textController.text));
                                                                } else if (colorindex == 16) {
                                                                  todoController.sublist16.add(Todo(text: textController.text));
                                                                } else if (colorindex == 17) {
                                                                  todoController.sublist17.add(Todo(text: textController.text));
                                                                } else if (colorindex == 18) {
                                                                  todoController.sublist18.add(Todo(text: textController.text));
                                                                } else if (colorindex == 19) {
                                                                  todoController.sublist19.add(Todo(text: textController.text));
                                                                } else if (colorindex == 20) {
                                                                  todoController.sublist20.add(Todo(text: textController.text));
                                                                } else if (colorindex == 21) {
                                                                  todoController.sublist21.add(Todo(text: textController.text));
                                                                } else if (colorindex == 22) {
                                                                  todoController.sublist22.add(Todo(text: textController.text));
                                                                } else if (colorindex == 23) {
                                                                  todoController.sublist23.add(Todo(text: textController.text));
                                                                } else if (colorindex == 24) {
                                                                  todoController.sublist24.add(Todo(text: textController.text));
                                                                } else if (colorindex == 25) {
                                                                  todoController.sublist25.add(Todo(text: textController.text));
                                                                }
                                                                setState(() {
                                                                  textController.clear();
                                                                  FocusScope.of(context).requestFocus(focusNode);
                                                                });
                                                              },
                                                              cursorColor: Colors.white,
                                                              style: TextStyle(color: Colors.white),
                                                              keyboardType: TextInputType.text,
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
