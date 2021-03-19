import 'package:get/get.dart';

class TimerAnimationCotroller extends GetxController {
  var isActiveTimerCoumdown = true;

  void onOf(val) {
    isActiveTimerCoumdown = val;
    update();
  }
}

class ProgressController extends GetxController {
  double persent = 1;

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

// class MainList {
//   List<Todo> alltodos;
//   bool done;
//   int time;
//   MainList({this.alltodos, this.time, this.done = false});
// }

class TODOController extends GetxController {
  var alltodoslist = List<Todo>().obs;
  // var mainList = List<mainList>().obs;
  // int index = -1;
  // void updatepersentage(val) {
  //   // numbers[index += 1] = val;
  // }
}
