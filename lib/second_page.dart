import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  List image;
  static final String id='second_page';
   SecondPage({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Image.asset(image[0]),
          Image.asset(image[1]),
        ],
      )

    );
  }
}
