import 'package:flutter/material.dart';

import 'about.dart';

class DetailsPage extends StatefulWidget {
  String image;
  String name;
  int index;

  DetailsPage(
      {super.key,
      required this.image,
      required this.name,
      required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  AboutList about = new AboutList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.blue,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                expandedHeight: 240.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text(widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    background: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    )),
              )
            ];
          },
          body: Container(
            padding: EdgeInsets.all(8),
            child: ListView(
              children: [
                Text(
                  "Ma'lumot:",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  about.getinformation(widget.index).about,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Rasmlar:",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 350,
                  child: PageView(
                    children: [
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        color: Colors.grey,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}
