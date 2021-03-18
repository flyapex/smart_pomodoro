import 'package:get/get.dart';

class hoursTimerController extends GetxController {
  var ctime = 5;

  void UpdateTime(val) {
    ctime = val;
    update();
  }
}
