import 'package:flutter/material.dart';

import 'package:lesson_1/apple_ui.dart';

import 'String2.dart';

class Intro2Page extends StatefulWidget {
  const Intro2Page({super.key});

  @override
  State<Intro2Page> createState() => _Intro2PageState();
}

class _Intro2PageState extends State<Intro2Page> {
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AppleUi();
                }));
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ))
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              itemIntro(
                  image: "assets/intro1.jpg",
                  title: String2.stepOneTitle,
                  description: String2.stepOneContent),
              itemIntro(
                  image: "assets/intro2.jpg",
                  title: String2.stepTwoTitle,
                  description: String2.stepTwoContent),
              itemIntro(
                  image: "assets/intro3.jpg",
                  title: String2.stepThreeTitle,
                  description: String2.stepThreeContent)
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: Row(
                    children: _buildIndecator(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (currentIndex != 2) {
                      _pageController!.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return AppleUi();
                      }));
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (currentIndex != 2) {
      //       _pageController!.nextPage(
      //           duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      //     } else {
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      //         return AppleUi();
      //       }));
      //     }
      //   },
      //   child: Icon(Icons.skip_next),
      // ),
    );
  }

  Widget itemIntro({image, title, description}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              image,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _indecator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 20,
      width: 20,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? Colors.blue : Colors.grey),
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
