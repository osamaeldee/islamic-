import 'package:get/get.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers1/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers10/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers2/Show%20answers%20page1%20in2.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers3/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers4/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers5/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers6/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers7/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers8/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers9/Show%20answers%20page1.dart';

abstract class Rote extends GetxController {
  void rote1();
  void rote2();
  void rote3();
  void rote4();
  void rote5();
  void rote6();
  void rote7();
  void rote8();
  void rote9();
  void rote10();
}

class RoteImp extends Rote {
  @override
  rote1() {
    Get.to(PageWithContainers());
  }

  @override
  rote2() {
    Get.to(PageWithContainersS2());
  }

  @override
  rote3() {
    Get.to(PageWithContainersS3());
  }

  @override
  rote4() {
    Get.to(PageWithContainersS4());
  }

  @override
  rote5() {
    Get.to(PageWithContainersS5());
  }

  @override
  rote6() {
    Get.to(PageWithContainersS6());
  }

  @override
  rote7() {
    Get.to(PageWithContainersS7());
  }

  @override
  rote8() {
    Get.to(PageWithContainersS8());
  }

  @override
  rote9() {
    Get.to(PageWithContainersS9());
  }

  @override
  rote10() {
    Get.to(PageWithContainersS10());
  }
}
