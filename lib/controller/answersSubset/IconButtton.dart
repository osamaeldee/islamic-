import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart'; // استيراد مكتبة flutter_vibrate

abstract class Controller extends GetxController {
  void correctAnswer();
  void wrongAnswer();
  void Null();
  void list();
}

class Verifications extends Controller {
  int correctCount = 0;
  int wrongCount = 0;
  List<int> o = [];
  int t = 10;

  @override
  void correctAnswer() {
    correctCount++;
    update();
    Fluttertoast.showToast(
      msg: 'تم الإجابة بشكل صحيح!',
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  void wrongAnswer() {
    wrongCount++;
    update();
    Fluttertoast.showToast(
      msg: 'تم الإجابة بشكل خاطئ!',
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
    );
    Vibrate.feedback(FeedbackType.error);
  }

  @override
  void Null() {
    wrongCount++;
    update();
    Fluttertoast.showToast(
      msg: '!لأن الحقل فارغ',
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  void list() {
    o.add(t);
    update();
  }
}
