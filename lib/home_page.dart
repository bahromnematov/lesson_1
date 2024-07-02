import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_1/details_page.dart';
import 'package:lesson_1/second_page.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tarixiy Shaxslar",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_box_outlined))
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            itemPost(
                image: "assets/tarixiy/alisher.jpg",
                name: "Alisher Navoiy",
                index: 0,
                age: "1441-yil 1501-yil"),
            itemPost(
                image: "assets/tarixiy/temur.jpg",
                name: "Amir Temur",
                index: 1,
                age: "1336-yil 1405-yil"),
            itemPost(
                image: "assets/tarixiy/bobur.jpg",
                name: "Z.M.Bobur",
                index: 2,
                age: "1483-yil 1530-yil"),
            itemPost(
                image: "assets/tarixiy/islom.png",
                name: "Islom Karimov",
                index: 3,
                age: "1938-yil 2016-yil"),
            itemPost(
                image: "assets/tarixiy/enshtyn.png",
                name: "Albert Enshtyn",
                index: 4,
                age: "1879-yil 1955-yil"),
            itemPost(
                image: "assets/tarixiy/nyuton.jpg",
                name: "Isaac Nyuton",
                index: 5,
                age: "1643-yil 1727-yil"),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }

  Widget itemPost({image, name, age,index}) {
    return Card(
      child: Container(
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailsPage(
                  image: image,
                  name: name,
                  index: index,
                );
              }));
            },
            leading: Container(
              height: MediaQuery.of(context).size.height / 11,
              width: MediaQuery.of(context).size.height / 11,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )),
            ),
            title: Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              age,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )),
    );
  }
}
