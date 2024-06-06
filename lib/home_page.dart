import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_1/second_page.dart';
import 'package:lesson_1/utils.dart';

class HomePage extends StatefulWidget {
  static final String id='home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "List View Builder",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return SecondPage(image: Utils().list);
            }));
              },
              child: Text("Keyingi oynaga ut"),
            ),
          ),
        )
    );
  }

}
