import 'package:flutter/material.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers1/Show_anser2.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/Ads/b.dart';
import 'package:restaurant_project/json/Lists/Lists%20of%20wrong%20answers/OneLists.dart';
import 'package:restaurant_project/json/Lists/List%20of%20questions/Onelist.dart';
import 'package:restaurant_project/widget/Sections/Contaner.dart';
import 'package:restaurant_project/widget/Sections/MaterialButton.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class PageWithContainers extends StatefulWidget {
  @override
  _PageWithContainersState createState() => _PageWithContainersState();
}

class _PageWithContainersState extends State<PageWithContainers> {
  String? selectedText;
  List<String> answersSubset = fakeAnswers[0];
  List<String> question = questions[0];
  String correct = "رمضان";

  @override
  Widget build(BuildContext context) {
    Verifications controller = Get.put(Verifications());
    return Scaffold(
      backgroundColor: Colors.brown,
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
              color: Colors.white,
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
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
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
                if (selectedText != null && correct == selectedText) {
                  controller.correctAnswer();
                } else if (selectedText == null) {
                  controller.Null();
                } else {
                  controller.wrongAnswer();
                }
                Future.delayed(const Duration(milliseconds: 1000), () {
                  Get.offAll(PageWithContainers2());
                });
              },
              text: "موافق",
            ),
        ],
      ),
    );
  }
}
