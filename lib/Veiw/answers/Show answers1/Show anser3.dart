import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers1/Show%20anser4.dart';
import 'package:restaurant_project/Ads/b.dart';
import 'package:restaurant_project/json/Lists/List%20of%20questions/Onelist.dart';
import 'package:restaurant_project/json/Lists/Lists%20of%20wrong%20answers/OneLists.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/widget/Sections/Contaner.dart';
import 'package:restaurant_project/widget/Sections/MaterialButton.dart';

class PageWithContainers3 extends StatefulWidget {
  @override
  _PageWithContainers3State createState() => _PageWithContainers3State();
}

class _PageWithContainers3State extends State<PageWithContainers3> {
  final Verifications controller = Get.find();
  String? selectedText;
  List<String> answersSubset = fakeAnswers[2];
  List<String> question = questions[2];
  String correct = "القرآن";

  @override
  Widget build(BuildContext context) {
    Verifications controller = Get.put(Verifications());
    return Scaffold(
      backgroundColor: const Color(0xFF503333),
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
              color: const Color(0xFFFFFFFF),
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
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 70),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButtoN(
                ontape: () {
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    Get.offAll(PageWithContainers4());
                  });
                  if (selectedText != null && correct == selectedText) {
                    controller.correctAnswer();
                  } else if (selectedText == null) {
                    controller.Null();
                  } else {
                    controller.wrongAnswer();
                  }
                },
                text: "موافق",
              ),
            ),
        ],
      ),
    );
  }
}
