import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers2/Show%20anser6%20in2.dart';
import 'package:restaurant_project/Ads/b.dart';
import 'package:restaurant_project/json/Lists/List%20of%20questions/Twolist.dart';
import 'package:restaurant_project/json/Lists/Lists%20of%20wrong%20answers/Twolist.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/widget/Sections/Contaner.dart';
import 'package:restaurant_project/widget/Sections/MaterialButton.dart';

class PageWithContainers5S2 extends StatefulWidget {
  @override
  _PageWithContainers5S2State createState() => _PageWithContainers5S2State();
}

class _PageWithContainers5S2State extends State<PageWithContainers5S2> {
  String? selectedText;
  List<String> answersSubset = fakeAnswers1[4];
  List<String> question = questions1[4];
  String correct = "15";

  @override
  Widget build(BuildContext context) {
    Verifications controller = Get.put(Verifications());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 80, 51, 51),
      appBar: AppBar(
        title: const Text(
          "أجِبْ على الأسئِلة الآتِيَة",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  question[0],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: answersSubset.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      horizontalOffset: 50.0,
                      curve: Curves.easeInOutBack,
                      child: FadeInAnimation(
                        child: MyContainer(
                          text: answersSubset[index],
                          selectedItems: [selectedText ?? ''],
                          onSelect: (selectedItem) {
                            setState(() {
                              selectedText = selectedItem;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          RewardAdButton(buttonText: "HQ", rewardText: correct),
          if (selectedText != null)
            MaterialButtoN(
              ontape: () {
                if (selectedText != null && correct.contains(selectedText!)) {
                  controller.correctAnswer();
                } else if (selectedText == null) {
                  controller.Null();
                } else {
                  controller.wrongAnswer();
                }
                Future.delayed(Duration(milliseconds: 1000), () {
                  Get.offAll(PageWithContainers6S2());
                });
              },
              text: "موافق",
            ),
        ],
      ),
    );
  }
}
