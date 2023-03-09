import 'dart:async';
import 'package:get/get.dart';

class AgoraController extends GetxController {
  // Meeeting Timer Helper
  Timer? meetingTimer;
  int meetingDuration = 0;
  var meetingDurationTxt = "00:00".obs;

  void startMeetingTimer() async {
    meetingTimer = Timer.periodic(
      const Duration(seconds: 1),
      (meetingTimer) {
        int min = (meetingDuration ~/ 60);
        int sec = (meetingDuration % 60).toInt();

        meetingDurationTxt.value = "$min:$sec";

        if (checkNoSignalDigit(min)) {
          meetingDurationTxt.value = "0${min.toString()}:${sec.toString()}";
        }
        if (checkNoSignalDigit(sec)) {
          if (checkNoSignalDigit(min)) {
            meetingDurationTxt.value = "0${min.toString()}:0${sec.toString()}";
          } else {
            meetingDurationTxt.value = "${min.toString()}:0${sec.toString()}";
          }
        }
        meetingDuration = meetingDuration + 1;
      },
    );
  }

  checkNoSignalDigit(int no) {
    int len = no.toString().length;
    if (len == 1) {
      return true;
    }
    return false;
  }
}
