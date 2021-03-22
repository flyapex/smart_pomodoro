import 'package:get/get.dart';

class TimerAnimationCotroller extends GetxController {
  var isActiveTimerCoumdown = true;

  void onOf(val) {
    isActiveTimerCoumdown = val;
    update();
  }
}

class ProgressController extends GetxController {
  double persent = 2;

  void updatepersentage(val) {
    persent = val;
    update();
  }
}

class Todo {
  String text;
  bool done;
  Todo({this.text, this.done = false});
}

class TODOController extends GetxController {
  // ignore: deprecated_member_use
  var sublist0 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist1 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist2 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist3 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist4 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist5 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist6 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist7 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist8 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist9 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist10 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist11 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist12 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist13 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist14 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist15 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist16 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist17 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist18 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist19 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist20 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist21 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist22 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist23 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist24 = List<Todo>().obs;
  // ignore: deprecated_member_use
  var sublist25 = List<Todo>().obs;
}
