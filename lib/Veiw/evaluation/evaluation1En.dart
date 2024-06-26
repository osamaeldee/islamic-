import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/Veiw/Homepage/Home_Page.dart';
import 'package:restaurant_project/controller/Rote.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:confetti/confetti.dart';
import 'package:restaurant_project/main.dart';

// ignore: must_be_immutable
class ResultsPage extends StatelessWidget {
  final Verifications verifications = Get.put(Verifications());
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));
  final String previousPage;
  // ignore: unused_field
  final RoteImp _rote = Get.put(RoteImp());

  ResultsPage({required this.previousPage});

  @override
  Widget build(BuildContext context) {

    Color starColor1;
    Color starColor2;
    Color starColor3;
    final _audioPlayer = AudioPlayer();
    int rots = 0;
    if (previousPage == "PageWithContainers10") {
      rots = 1;
    }
    if (previousPage == "PageWithContainers10S2") {
      rots = 2;
    }
    if (previousPage == "PageWithContainers10S3") {
      rots = 3;
    }
    if (previousPage == "PageWithContainers10S4") {
      rots = 4;
    }
    if (previousPage == "PageWithContainers10S5") {
      rots = 5;
    }
    if (previousPage == "PageWithContainers10S6") {
      rots = 6;
    }
    if (previousPage == "PageWithContainers10S7") {
      rots = 7;
    }
    if (previousPage == "PageWithContainers10S8") {
      rots = 8;
    }
    if (previousPage == "PageWithContainers10S9") {
      rots = 9;
    }
    if (previousPage == "PageWithContainers10S10") {
      rots = 10;
    }
    // 10
    if (previousPage == "PageWithContainers10" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S2" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S3" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S4" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S5" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S6" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S7" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S8" &&
        verifications.correctCount == 10) {
    }
    if (previousPage == "PageWithContainers10S9" &&
        verifications.correctCount == 10) {
    }

    if (verifications.correctCount >= 0 && verifications.correctCount <= 3) {
      starColor1 = Colors.grey;
      starColor2 = Colors.grey;
      starColor3 = Colors.grey;
    } else if (verifications.correctCount >= 4 &&
        verifications.correctCount <= 5) {
      starColor1 = Colors.yellow;
      starColor2 = Colors.grey;
      starColor3 = Colors.grey;
    } else if (verifications.correctCount >= 6 &&
        verifications.correctCount <= 8) {
      starColor1 = Colors.yellow;
      starColor2 = Colors.yellow;
      starColor3 = Colors.grey;
    } else {
      starColor1 = Colors.yellow;
      starColor2 = Colors.yellow;
      starColor3 = Colors.yellow;
    }

    if (verifications.correctCount >= 9 && verifications.correctCount <= 10) {
      _confettiController.play();
    }
    if (verifications.correctCount >= 0 && verifications.correctCount <= 6) {
      _audioPlayer.setPlaybackRate(0.5);
      _audioPlayer.play(
        AssetSource("Lose sound effects.mp3"),
      );
    }
    if (verifications.correctCount == 10) {
      verifications.list();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "صفحه النتاتج",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 100,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                        Text(
                          '${verifications.correctCount}',
                          style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.cancel,
                          size: 100,
                          color: Colors.red,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                        Text(
                          '${verifications.wrongCount}',
                          style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: starColor1,
                      size: 100,
                      shadows: const [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.star,
                      color: starColor2,
                      size: 100,
                      shadows: const [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.star,
                      color: starColor3,
                      size: 100,
                      shadows: const [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    verifications.correctCount = 0;
                    verifications.wrongCount = 0;
                    if (rots == 1 ) {
                      _rote.rote2;
                    }
                    if (rots == 2 ) {
                      _rote.rote3;
                    }
                    if (rots == 3 ) {
                      _rote.rote4;
                    }
                    if (rots == 4) {
                      _rote.rote5;
                    }
                    if (rots == 5 ) {
                      _rote.rote6;
                    }
                    if (rots == 6 ) {
                      _rote.rote7;
                    }
                    if (rots == 7 ) {
                      _rote.rote8;
                    }
                    if (rots == 8 ){
                      _rote.rote9;

                    }
                    if (rots == 9 ) {
                      _rote.rote10;
                    }
                    if (rots == 10) {
                      _rote.rote1;
                    } else {
                      Get.to(const Home_Page());
                    }
                  },
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    'المستوى التالي',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    verifications.correctCount = 0;
                    verifications.wrongCount = 0;
                    if (rots == 1) {
                      _rote.rote1;
                    }
                    if (rots == 2) {
                      _rote.rote2;
                    }
                    if (rots == 3) {
                      _rote.rote3;
                    }
                    if (rots == 4) {
                      _rote.rote4;
                    }
                    if (rots == 5) {
                      _rote.rote5;
                    }
                    if (rots == 6) {
                      _rote.rote6;
                    }
                    if (rots == 7) {
                      _rote.rote7;
                    }
                    if (rots == 8) {
                      _rote.rote8;
                    }
                    if (rots == 9) {
                      _rote.rote9;
                    }
                    if (rots == 10) {
                      _rote.rote10;
                    } else {
                      Get.to(const Home_Page());
                    }
                  },
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text(
                    'محاولة مرة أخرى؟',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  emissionFrequency: 0.05,
                  numberOfParticles: 50,
                  gravity: 0.5,
                  colors: const [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.purple,
                    Colors.orange,
                    Colors.pink,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
