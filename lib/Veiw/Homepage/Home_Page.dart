import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/Ads/c.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers1/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers10/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers2/Show%20answers%20page1%20in2.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers3/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers4/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers6/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers8/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/answers/Show%20answers9/Show%20answers%20page1.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/main.dart';
import 'package:restaurant_project/widget/Sections/%D9%90appbar.dart';
import '../answers/Show answers5/Show answers page1.dart';
import '../answers/Show answers7/Show answers page1.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

// ignore: camel_case_types
class _Home_PageState extends State<Home_Page>
    with SingleTickerProviderStateMixin {
  final Verifications verifications = Get.put(Verifications());
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemsPerRow = screenWidth >= 499.0 ? 3 : 2;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: const MyAppBar(
        text: "دروب الإيمان أسئلة دينية",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FadeTransition(
                    opacity: _fadeInAnimation,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: LiveGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: itemsPerRow,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 30.0,
                        ),
                        itemCount: 10,
                        itemBuilder: (context, index, animation) {
                          return FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1)
                                .animate(animation),
                            child: NumberContainer(
                              number: index + 1,
                              onPressed: () {
                                _redirectToPage(index + 1);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BannerAdWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _redirectToPage(int index) {
    ctToPage(index);
  }

  void ctToPage(int index) {
    switch (index) {
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageWithContainers()));
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS2()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS3()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS4()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS5()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS6()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS7()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS8()),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS9()),
        );
        break;
      case 10:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageWithContainersS10()),
        );
        break;
      default:
        break;
    }
  }
}

class NumberContainer extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;

  const NumberContainer({
    required this.number,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    double containerSize;
    containerSize = MediaQuery.of(context).size.width * 0.2;
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                "assets/level$number.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            number.toString(),
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
