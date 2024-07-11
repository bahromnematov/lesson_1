import 'package:flutter/material.dart';
import 'package:lesson_1/apple_ui.dart';
import 'package:lesson_1/strings.dart';

class IntroUi extends StatefulWidget {
  const IntroUi({super.key});

  @override
  State<IntroUi> createState() => _IntroUiState();
}

class _IntroUiState extends State<IntroUi> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AppleUi();
              }));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Text(
                "Skip",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: "assets/intro/intro_1.jpg",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: "assets/intro/intro_2.jpg",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: "assets/intro/intro_3.jpg",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndecator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                content,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _indecator(bool isActive) {
    return AnimatedContainer(
      curve: Curves.easeInOutCirc,
      duration:const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin:const  EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.black),
    );
  }

  List<Widget> _buildIndecator() {
    List<Widget> indecators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indecators.add(_indecator(true));
      } else {
        indecators.add(_indecator(false));
      }
    }
    return indecators;
  }
}
