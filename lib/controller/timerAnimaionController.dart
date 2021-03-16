import 'package:get/get_state_manager/get_state_manager.dart';

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
