import 'package:avatar_glow/avatar_glow.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spomodoro/windows_widget/bar.dart';
import 'widget/animationCircleAndTimer.dart';
import 'widget/perIndacator.dart';
import 'widget/timerShadow.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    Key key,
  }) : super(key: key);
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> with SingleTickerProviderStateMixin {
  //? ---------part 1--------------------------------
  //!all controller here
  TabController _tabController;
  //!RadialProgress(% timer)
  void isTaskComplete() {
    setState(() {});
  }

  //!timer state
  bool timerAnimationState = true;
  void onChangedTab(bool index) {
    setState(() {
      timerAnimationState = index;
    });
  }

  //!db part
  var tempwidth;
  @override
  void initState() {
    tempwidth = smallBOXwidth;
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    _getsp();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

//!-------------------------------------------------------------------------------------------Part 2-------------------------------------------
  //!controller

  ScrollController _mycontroller1 = new ScrollController();
  ScrollController _mycontroller2 = new ScrollController();
  var textController = TextEditingController();
  //!Timer
  TimeOfDay _time2 = TimeOfDay.now().replacing(minute: 0);
  void onTimeChanged2(TimeOfDay newTime) {
    setState(() {
      _time2 = newTime;
    });
  }

  var ctime = 6;
  void updateTime(val) {
    setState(() {
      ctime = val;
    });
  }

  //!extra timer
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 0);
  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  //!textfield hover1
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

  //!------------------------------------------ add button
  Color boxColor = Color(0xFF343742);
  // ignore: unused_field
  int _enterCounter2 = 0;
  // ignore: unused_field
  int _exitCounter2 = 0;
  double x2 = 0.0;
  double y2 = 0.0;
  void _incrementEnter2(PointerEvent details2) {
    setState(() {
      _enterCounter2++;
      // FocusScope.of(context).requestFocus(focusNode);
      // addicon = Icons.panorama_fish_eye;
    });
  }

  void _incrementExit2(PointerEvent details2) {
    setState(() {
      boxColor = Color(0xFF343742);
      _exitCounter2++;
      // FocusScope.of(context).unfocus(); //ggg
      // addicon = Icons.add;
    });
  }

  void _updateLocation2(PointerEvent details2) {
    setState(() {
      boxColor = Color(0xFF494d5c);
      x2 = details2.position.dx;
      y2 = details2.position.dy;
    });
  }

  //!text field
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

//?------------------------------------------------------------------------------------------------------- DB

  List<String> mainlist0 = [];
  List<String> mainlist1 = [];
  List<String> mainlist2 = [];
  List<String> mainlist3 = [];
  List<String> mainlist4 = [];
  List<String> mainlist5 = [];
  List<String> mainlist6 = [];
  List<String> mainlist7 = [];
  List<String> mainlist8 = [];
  List<String> mainlist9 = [];
  List<String> mainlist10 = [];
  List<String> mainlist11 = [];
  List<String> mainlist12 = [];
  List<String> mainlist13 = [];
  List<String> mainlist14 = [];
  List<String> mainlist15 = [];
  List<String> mainlist16 = [];
  List<String> mainlist17 = [];
  List<String> mainlist18 = [];
  List<String> mainlist19 = [];
  List<String> mainlist20 = [];
  List<String> mainlist21 = [];
  List<String> mainlist22 = [];
  List<String> mainlist23 = [];
  List<String> mainlist24 = [];
  List<String> mainlist25 = [];

  var prefs;
  void _getsp() async {
    prefs = await SharedPreferences.getInstance();
    // mainlist = prefs.getStringList('1') == null ? [] : prefs.getStringList('1');
    // print(prefs.getStringList('1'));
    mainlist0 = prefs.getStringList('0') == null ? [] : prefs.getStringList('0');
    mainlist1 = prefs.getStringList('1') == null ? [] : prefs.getStringList('1');
    mainlist2 = prefs.getStringList('2') == null ? [] : prefs.getStringList('2');
    mainlist3 = prefs.getStringList('3') == null ? [] : prefs.getStringList('3');
    mainlist4 = prefs.getStringList('4') == null ? [] : prefs.getStringList('4');
    mainlist5 = prefs.getStringList('5') == null ? [] : prefs.getStringList('5');
    mainlist6 = prefs.getStringList('6') == null ? [] : prefs.getStringList('6');
    mainlist7 = prefs.getStringList('7') == null ? [] : prefs.getStringList('7');
    mainlist8 = prefs.getStringList('8') == null ? [] : prefs.getStringList('8');
    mainlist9 = prefs.getStringList('9') == null ? [] : prefs.getStringList('9');
    mainlist10 = prefs.getStringList('10') == null ? [] : prefs.getStringList('10');
    mainlist11 = prefs.getStringList('11') == null ? [] : prefs.getStringList('11');
    mainlist12 = prefs.getStringList('12') == null ? [] : prefs.getStringList('12');
    mainlist13 = prefs.getStringList('13') == null ? [] : prefs.getStringList('13');
    mainlist14 = prefs.getStringList('14') == null ? [] : prefs.getStringList('14');
    mainlist15 = prefs.getStringList('15') == null ? [] : prefs.getStringList('15');
    mainlist16 = prefs.getStringList('16') == null ? [] : prefs.getStringList('16');
    mainlist17 = prefs.getStringList('17') == null ? [] : prefs.getStringList('17');
    mainlist18 = prefs.getStringList('18') == null ? [] : prefs.getStringList('18');
    mainlist19 = prefs.getStringList('19') == null ? [] : prefs.getStringList('19');
    mainlist20 = prefs.getStringList('20') == null ? [] : prefs.getStringList('20');
    mainlist21 = prefs.getStringList('21') == null ? [] : prefs.getStringList('21');
    mainlist22 = prefs.getStringList('22') == null ? [] : prefs.getStringList('22');
    mainlist23 = prefs.getStringList('23') == null ? [] : prefs.getStringList('23');
    mainlist24 = prefs.getStringList('24') == null ? [] : prefs.getStringList('24');
    mainlist25 = prefs.getStringList('125') == null ? [] : prefs.getStringList('25');
  }

  //!--------------------------------------------------------------------------------------Task list

  // List<List<String>> mainlist = new List.generate(25, (i) => []);

  itemCountt() {
    if (colorindex == 0) {
      return mainlist0.length;
    } else if (colorindex == 1) {
      return mainlist1.length;
    } else if (colorindex == 2) {
      return mainlist2.length;
    } else if (colorindex == 3) {
      return mainlist3.length;
    } else if (colorindex == 4) {
      return mainlist4.length;
    } else if (colorindex == 5) {
      return mainlist5.length;
    } else if (colorindex == 6) {
      return mainlist6.length;
    } else if (colorindex == 7) {
      return mainlist7.length;
    } else if (colorindex == 8) {
      return mainlist8.length;
    } else if (colorindex == 9) {
      return mainlist9.length;
    } else if (colorindex == 10) {
      return mainlist10.length;
    } else if (colorindex == 11) {
      return mainlist11.length;
    } else if (colorindex == 12) {
      return mainlist12.length;
    } else if (colorindex == 13) {
      return mainlist13.length;
    } else if (colorindex == 14) {
      return mainlist14.length;
    } else if (colorindex == 15) {
      return mainlist15.length;
    } else if (colorindex == 16) {
      return mainlist16.length;
    } else if (colorindex == 17) {
      return mainlist17.length;
    } else if (colorindex == 18) {
      return mainlist18.length;
    } else if (colorindex == 19) {
      return mainlist19.length;
    } else if (colorindex == 20) {
      return mainlist20.length;
    } else if (colorindex == 21) {
      return mainlist21.length;
    } else if (colorindex == 22) {
      return mainlist22.length;
    } else if (colorindex == 23) {
      return mainlist23.length;
    } else if (colorindex == 24) {
      return mainlist24.length;
    } else if (colorindex == 25) {
      return mainlist25.length;
    }
  }

//? Delete* from DB
  _slidTodeleted(BuildContext context, index) {
    // mainlist.removeAt(index);
    if (colorindex == 0) {
      mainlist0.removeAt(index);
    } else if (colorindex == 1) {
      mainlist1.removeAt(index);
    } else if (colorindex == 2) {
      mainlist2.removeAt(index);
    } else if (colorindex == 3) {
      mainlist3.removeAt(index);
    } else if (colorindex == 4) {
      mainlist4.removeAt(index);
    } else if (colorindex == 5) {
      mainlist5.removeAt(index);
    } else if (colorindex == 6) {
      mainlist6.removeAt(index);
    } else if (colorindex == 7) {
      mainlist7.removeAt(index);
    } else if (colorindex == 8) {
      mainlist8.removeAt(index);
    } else if (colorindex == 9) {
      mainlist9.removeAt(index);
    } else if (colorindex == 10) {
      mainlist10.removeAt(index);
    } else if (colorindex == 11) {
      mainlist11.removeAt(index);
    } else if (colorindex == 12) {
      mainlist12.removeAt(index);
    } else if (colorindex == 13) {
      mainlist13.removeAt(index);
    } else if (colorindex == 14) {
      mainlist14.removeAt(index);
    } else if (colorindex == 15) {
      mainlist15.removeAt(index);
    } else if (colorindex == 16) {
      mainlist16.removeAt(index);
    } else if (colorindex == 17) {
      mainlist17.removeAt(index);
    } else if (colorindex == 18) {
      mainlist18.removeAt(index);
    } else if (colorindex == 19) {
      mainlist19.removeAt(index);
    } else if (colorindex == 20) {
      mainlist20.removeAt(index);
    } else if (colorindex == 21) {
      mainlist21.removeAt(index);
    } else if (colorindex == 22) {
      mainlist22.removeAt(index);
    } else if (colorindex == 23) {
      mainlist23.removeAt(index);
    } else if (colorindex == 24) {
      mainlist24.removeAt(index);
    } else if (colorindex == 25) {
      mainlist25.removeAt(index);
    }
  }

//? Display* from db
  _textDisplay(BuildContext context, index) {
    if (colorindex == 0) {
      return Text('- ' + mainlist0[index]);
    } else if (colorindex == 1) {
      return Text('- ' + mainlist1[index]);
    } else if (colorindex == 2) {
      return Text('- ' + mainlist2[index]);
    } else if (colorindex == 3) {
      return Text('- ' + mainlist3[index]);
    } else if (colorindex == 4) {
      return Text('- ' + mainlist4[index]);
    } else if (colorindex == 5) {
      return Text('- ' + mainlist5[index]);
    } else if (colorindex == 6) {
      return Text('- ' + mainlist6[index]);
    } else if (colorindex == 7) {
      return Text('- ' + mainlist7[index]);
    } else if (colorindex == 8) {
      return Text('- ' + mainlist8[index]);
    } else if (colorindex == 9) {
      return Text('- ' + mainlist9[index]);
    } else if (colorindex == 10) {
      return Text('- ' + mainlist10[index]);
    } else if (colorindex == 11) {
      return Text('- ' + mainlist11[index]);
    } else if (colorindex == 12) {
      return Text('- ' + mainlist12[index]);
    } else if (colorindex == 13) {
      return Text('- ' + mainlist13[index]);
    } else if (colorindex == 14) {
      return Text('- ' + mainlist14[index]);
    } else if (colorindex == 15) {
      return Text('- ' + mainlist15[index]);
    } else if (colorindex == 16) {
      return Text('- ' + mainlist16[index]);
    } else if (colorindex == 17) {
      return Text('- ' + mainlist17[index]);
    } else if (colorindex == 18) {
      return Text('- ' + mainlist18[index]);
    } else if (colorindex == 19) {
      return Text('- ' + mainlist19[index]);
    } else if (colorindex == 20) {
      return Text('- ' + mainlist20[index]);
    } else if (colorindex == 21) {
      return Text('- ' + mainlist21[index]);
    } else if (colorindex == 22) {
      return Text('- ' + mainlist22[index]);
    } else if (colorindex == 23) {
      return Text('- ' + mainlist23[index]);
    } else if (colorindex == 24) {
      return Text('- ' + mainlist24[index]);
    } else if (colorindex == 25) {
      return Text('- ' + mainlist25[index]);
    }
  }

//? insert* DB
  _inputTOdb() {
    if (colorindex == 0) {
      mainlist0.add(textController.text);
      prefs.setStringList("0", mainlist0);
    } else if (colorindex == 1) {
      mainlist1.add(textController.text);
      prefs.setStringList("1", mainlist1);
    } else if (colorindex == 2) {
      mainlist2.add(textController.text);
      prefs.setStringList("2", mainlist2);
    } else if (colorindex == 3) {
      mainlist3.add(textController.text);
      prefs.setStringList("3", mainlist3);
    } else if (colorindex == 4) {
      mainlist4.add(textController.text);
      prefs.setStringList("4", mainlist4);
    } else if (colorindex == 5) {
      mainlist5.add(textController.text);
      prefs.setStringList("5", mainlist5);
    } else if (colorindex == 6) {
      mainlist6.add(textController.text);
      prefs.setStringList("6", mainlist6);
    } else if (colorindex == 7) {
      mainlist7.add(textController.text);
      prefs.setStringList("7", mainlist7);
    } else if (colorindex == 8) {
      mainlist8.add(textController.text);
      prefs.setStringList("8", mainlist8);
    } else if (colorindex == 9) {
      mainlist9.add(textController.text);
      prefs.setStringList("9", mainlist9);
    } else if (colorindex == 10) {
      mainlist10.add(textController.text);
      prefs.setStringList("10", mainlist10);
    } else if (colorindex == 11) {
      mainlist11.add(textController.text);
      prefs.setStringList("11", mainlist11);
    } else if (colorindex == 12) {
      mainlist12.add(textController.text);
      prefs.setStringList("12", mainlist12);
    } else if (colorindex == 13) {
      mainlist13.add(textController.text);
      prefs.setStringList("13", mainlist13);
    } else if (colorindex == 14) {
      mainlist14.add(textController.text);
      prefs.setStringList("14", mainlist14);
    } else if (colorindex == 15) {
      mainlist15.add(textController.text);
      prefs.setStringList("15", mainlist15);
    } else if (colorindex == 16) {
      mainlist16.add(textController.text);
      prefs.setStringList("16", mainlist16);
    } else if (colorindex == 17) {
      mainlist17.add(textController.text);
      prefs.setStringList("17", mainlist17);
    } else if (colorindex == 18) {
      mainlist18.add(textController.text);
      prefs.setStringList("18", mainlist18);
    } else if (colorindex == 19) {
      mainlist19.add(textController.text);
      prefs.setStringList("19", mainlist19);
    } else if (colorindex == 20) {
      mainlist20.add(textController.text);
      prefs.setStringList("20", mainlist20);
    } else if (colorindex == 21) {
      mainlist21.add(textController.text);
      prefs.setStringList("21", mainlist21);
    } else if (colorindex == 22) {
      mainlist22.add(textController.text);
      prefs.setStringList("22", mainlist22);
    } else if (colorindex == 23) {
      mainlist23.add(textController.text);
      prefs.setStringList("23", mainlist23);
    } else if (colorindex == 24) {
      mainlist24.add(textController.text);
      prefs.setStringList("24", mainlist24);
    } else if (colorindex == 25) {
      mainlist25.add(textController.text);
      prefs.setStringList("25", mainlist25);
    }
  }

//?double tap Update*
  _updateToDb() {
    // if (colorindex == 4) {
    //   mainlist4[doubleTapedIndex] = textController.text;
    // } else if (colorindex == 5) {
    //   mainlist5[doubleTapedIndex] = textController.text;
    // }
    if (colorindex == 0) {
      mainlist0[doubleTapedIndex] = textController.text;
    } else if (colorindex == 1) {
      mainlist1[doubleTapedIndex] = textController.text;
    } else if (colorindex == 2) {
      mainlist2[doubleTapedIndex] = textController.text;
    } else if (colorindex == 3) {
      mainlist3[doubleTapedIndex] = textController.text;
    } else if (colorindex == 4) {
      mainlist4[doubleTapedIndex] = textController.text;
    } else if (colorindex == 5) {
      mainlist5[doubleTapedIndex] = textController.text;
    } else if (colorindex == 6) {
      mainlist6[doubleTapedIndex] = textController.text;
    } else if (colorindex == 7) {
      mainlist7[doubleTapedIndex] = textController.text;
    } else if (colorindex == 8) {
      mainlist8[doubleTapedIndex] = textController.text;
    } else if (colorindex == 9) {
      mainlist9[doubleTapedIndex] = textController.text;
    } else if (colorindex == 10) {
      mainlist10[doubleTapedIndex] = textController.text;
    } else if (colorindex == 11) {
      mainlist11[doubleTapedIndex] = textController.text;
    } else if (colorindex == 12) {
      mainlist12[doubleTapedIndex] = textController.text;
    } else if (colorindex == 13) {
      mainlist13[doubleTapedIndex] = textController.text;
    } else if (colorindex == 14) {
      mainlist14[doubleTapedIndex] = textController.text;
    } else if (colorindex == 15) {
      mainlist15[doubleTapedIndex] = textController.text;
    } else if (colorindex == 16) {
      mainlist16[doubleTapedIndex] = textController.text;
    } else if (colorindex == 17) {
      mainlist17[doubleTapedIndex] = textController.text;
    } else if (colorindex == 18) {
      mainlist18[doubleTapedIndex] = textController.text;
    } else if (colorindex == 19) {
      mainlist19[doubleTapedIndex] = textController.text;
    } else if (colorindex == 20) {
      mainlist20[doubleTapedIndex] = textController.text;
    } else if (colorindex == 21) {
      mainlist21[doubleTapedIndex] = textController.text;
    } else if (colorindex == 22) {
      mainlist22[doubleTapedIndex] = textController.text;
    } else if (colorindex == 23) {
      mainlist23[doubleTapedIndex] = textController.text;
    } else if (colorindex == 24) {
      mainlist24[doubleTapedIndex] = textController.text;
    } else if (colorindex == 25) {
      mainlist25[doubleTapedIndex] = textController.text;
    }
    setState(() {
      editModeActive = false;
    });
  }

  var doubleTapedIndex;
  bool editModeActive = false;
  void _onDoubletabEdit(val) {
    setState(() {
      doubleTapedIndex = val;
    });

    // if (colorindex == 4) {
    //   textController.text = mainlist4[doubleTapedIndex];
    // } else if (colorindex == 5) {
    //   textController.text = mainlist5[doubleTapedIndex];
    // }
    if (colorindex == 0) {
      textController.text = mainlist0[doubleTapedIndex];
    } else if (colorindex == 1) {
      textController.text = mainlist1[doubleTapedIndex];
    } else if (colorindex == 2) {
      textController.text = mainlist2[doubleTapedIndex];
    } else if (colorindex == 3) {
      textController.text = mainlist3[doubleTapedIndex];
    } else if (colorindex == 4) {
      textController.text = mainlist4[doubleTapedIndex];
    } else if (colorindex == 5) {
      textController.text = mainlist5[doubleTapedIndex];
    } else if (colorindex == 6) {
      textController.text = mainlist6[doubleTapedIndex];
    } else if (colorindex == 7) {
      textController.text = mainlist7[doubleTapedIndex];
    } else if (colorindex == 8) {
      textController.text = mainlist8[doubleTapedIndex];
    } else if (colorindex == 9) {
      textController.text = mainlist9[doubleTapedIndex];
    } else if (colorindex == 10) {
      textController.text = mainlist10[doubleTapedIndex];
    } else if (colorindex == 11) {
      textController.text = mainlist11[doubleTapedIndex];
    } else if (colorindex == 12) {
      textController.text = mainlist12[doubleTapedIndex];
    } else if (colorindex == 13) {
      textController.text = mainlist13[doubleTapedIndex];
    } else if (colorindex == 14) {
      textController.text = mainlist14[doubleTapedIndex];
    } else if (colorindex == 15) {
      textController.text = mainlist15[doubleTapedIndex];
    } else if (colorindex == 16) {
      textController.text = mainlist16[doubleTapedIndex];
    } else if (colorindex == 17) {
      textController.text = mainlist17[doubleTapedIndex];
    } else if (colorindex == 18) {
      textController.text = mainlist18[doubleTapedIndex];
    } else if (colorindex == 19) {
      textController.text = mainlist19[doubleTapedIndex];
    } else if (colorindex == 20) {
      textController.text = mainlist20[doubleTapedIndex];
    } else if (colorindex == 21) {
      textController.text = mainlist21[doubleTapedIndex];
    } else if (colorindex == 22) {
      textController.text = mainlist22[doubleTapedIndex];
    } else if (colorindex == 23) {
      textController.text = mainlist23[doubleTapedIndex];
    } else if (colorindex == 24) {
      textController.text = mainlist24[doubleTapedIndex];
    } else if (colorindex == 25) {
      textController.text = mainlist25[doubleTapedIndex];
    }
    setState(() {
      editModeActive = true;
    });
  }

  //!----------------------------------------------------------
  double smallBOXwidth = 303;
  bool isOpen = true;
  void onDrag() {
    setState(() {
      isOpen == true ? isOpen = false : isOpen = true;
      smallBOXwidth == tempwidth ? smallBOXwidth = tempwidth / 1.7 : smallBOXwidth = tempwidth;
    });
  }

  var focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width / 3.5;
    double wid2 = wid;

    ScrollController _controller = ScrollController();

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
                                        // width: MediaQuery.of(context).size.width,
                                        // height: ((MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2) - 40,

                                        width: 475,
                                        height: 475,
                                        // width: MediaQuery.of(context).size.width,
                                        // height: ((MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2) - 40,
                                        child: MainCircle(
                                          timerAnimationState: timerAnimationState,
                                          onChangedTab: onChangedTab,
                                          screenSizew: MediaQuery.of(context).size.height,
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
                                        GestureDetector(
                                          onDoubleTap: onDrag,
                                          child: isOpen
                                              ? Container(
                                                  //! part 1 bg
                                                  color: Color(0xFF1c1427),
                                                  // color: Color(0xFF12202f),
                                                  height: MediaQuery.of(context).size.height - 92,
                                                  // width: MediaQuery.of(context).size.height / 2 < MediaQuery.of(context).size.height ? 230 : 300,
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
                                                                        hoverHeight: 47,
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
                                                                            gradient: LinearGradient(
                                                                              begin: Alignment.topLeft,
                                                                              end: Alignment.bottomRight,
                                                                              colors:
                                                                                  colorindex == ctime + index - 1 ? [Color(0xFF69ff97), Colors.cyanAccent] : [Colors.transparent, Colors.transparent],
                                                                              stops: [0.0, 1.0],
                                                                            ),
                                                                            // color: colorindex == ctime + index - 1 ? Colors.cyan : Colors.transparent,
                                                                          ),
                                                                          //  Color.fromARGB(255, 31, 229, 146)

                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: 7, right: 7),
                                                                                child: ctime + index - 1 == _time.hour
                                                                                    ? Icon(
                                                                                        Icons.offline_bolt, color: colorindex == ctime + index - 1 ? Color(0xFF1c1427) : Colors.red,
                                                                                        // Color(0xFF673ab7)
                                                                                      )
                                                                                    : Icon(
                                                                                        Icons.offline_bolt,
                                                                                        color: colorindex == ctime + index - 1 ? Color(0xFF1c1427) : Colors.white,
                                                                                      ),
                                                                              ),
                                                                              DefaultTextStyle(
                                                                                style: TextStyle(
                                                                                  color: colorindex == ctime + index - 1 ? Color(0xFF00416a) : Colors.white, //gg
                                                                                  fontSize: 17,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontFamily: 'KeepCalm',
                                                                                ),
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
                                                                                  padding: EdgeInsets.only(right: 5),
                                                                                  child: ctime + index - 1 == _time.hour
                                                                                      ? AvatarGlow(
                                                                                          endRadius: 22,
                                                                                          duration: Duration(milliseconds: 2000),
                                                                                          repeat: true,
                                                                                          showTwoGlows: true,
                                                                                          repeatPauseDuration: Duration(milliseconds: 100),
                                                                                          glowColor: colorindex == ctime + index - 1 ? Colors.deepPurpleAccent : Colors.blue,
                                                                                          child: Icon(
                                                                                            Icons.flash_on,
                                                                                            color: colorindex == ctime + index - 1 ? Color(0xFF1e2936) : Colors.yellow,
                                                                                            size: 20,
                                                                                          ),
                                                                                        )
                                                                                      : AvatarGlow(
                                                                                          endRadius: 22,
                                                                                          duration: Duration(milliseconds: 0),
                                                                                          repeat: false,
                                                                                          showTwoGlows: false,
                                                                                          repeatPauseDuration: Duration(milliseconds: 100),
                                                                                          glowColor: Colors.blue,
                                                                                          child: Icon(
                                                                                            Icons.flash_on,
                                                                                            color: Colors.transparent,
                                                                                            size: 20,
                                                                                          ),
                                                                                        )),
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
                                                )
                                              : Container(
                                                  //! part 1 small box bg
                                                  color: Color(0xFF1c1427),
                                                  // color: Color(0xFF12202f),
                                                  height: MediaQuery.of(context).size.height - 92,
                                                  // width: MediaQuery.of(context).size.height / 2 < MediaQuery.of(context).size.height ? 230 : 300,
                                                  width: smallBOXwidth,
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
                                                                        hoverHeight: 47,
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
                                                                            gradient: LinearGradient(
                                                                              begin: Alignment.topLeft,
                                                                              end: Alignment.bottomRight,
                                                                              colors: colorindex == ctime + index - 1
                                                                                  ? [Color.fromARGB(255, 31, 229, 146), Colors.cyanAccent]
                                                                                  : [Colors.transparent, Colors.transparent],
                                                                              stops: [0.0, 1.0],
                                                                            ),
                                                                            // color: colorindex == ctime + index - 1 ? Colors.cyan : Colors.transparent,
                                                                          ),
                                                                          //  Color.fromARGB(255, 31, 229, 146)

                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.only(left: 5, right: 5),
                                                                                child: ctime + index - 1 == _time.hour
                                                                                    ? Icon(
                                                                                        Icons.offline_bolt, color: colorindex == ctime + index - 1 ? Color(0xFF1c1427) : Colors.red,
                                                                                        // Color(0xFF673ab7)
                                                                                      )
                                                                                    : Icon(
                                                                                        Icons.offline_bolt,
                                                                                        color: colorindex == ctime + index - 1 ? Color(0xFF1c1427) : Colors.white,
                                                                                      ),
                                                                              ),
                                                                              DefaultTextStyle(
                                                                                style: TextStyle(
                                                                                  color: colorindex == ctime + index - 1 ? Color(0xFF00416a) : Colors.white, //gg
                                                                                  fontSize: 17,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontFamily: 'KeepCalm',
                                                                                ),
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
                                                                                padding: EdgeInsets.only(right: 0),
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
                                                                                    : AvatarGlow(
                                                                                        endRadius: 22,
                                                                                        duration: Duration(milliseconds: 0),
                                                                                        repeat: false,
                                                                                        showTwoGlows: false,
                                                                                        repeatPauseDuration: Duration(milliseconds: 0),
                                                                                        glowColor: Colors.blue,
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
                                                                onDoubleTap: () {
                                                                  _onDoubletabEdit(index3);
                                                                },
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
                                                                        activeColor: Colors.greenAccent,
                                                                        value: true,
                                                                        onChanged: (v) {
                                                                          //text cut
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
                                                        // itemCount: 0,
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
                                                                    setState(() {
                                                                      editModeActive ? _updateToDb() : _inputTOdb();
                                                                    });
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
                                                        )
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
                                        )
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
