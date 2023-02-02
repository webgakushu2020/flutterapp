import 'package:flutter/material.dart';

import '01_text.dart';
import '02_column.dart';
import '03_row.dart';
import '04_color_width.dart';
import '05_margin.dart';
import '06_border.dart';
import '07_image.dart';
import '08_image2.dart';
import '09_margin2.dart';
import '10_button.dart';
import '11_list.dart';
import '12_countup.dart';
import '13_link.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MyProfile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  //パラメータが決まっている　Scaffoldにパラメータが決まっている
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 255, 205),
      appBar: AppBar(
        title: Text('Widgetを使ってみよう'),
      ),
      body: Container(
        width: 300,
        height: 500,
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(20),
        // decoration: BoxDecoration(
        //   color: Color.fromARGB(255, 254, 255, 205),
        //   border: Border.all(color: Colors.blue, width: 2),
        //   borderRadius: BorderRadius.circular(50),
        // ),
        child: ListView(
          children: [
            // ignore: deprecated_member_use
            TextButton(
              child: Text('01-text'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_text()),
                );
              },
            ),
            // ignore: deprecated_member_use
            TextButton(
              child: Text('02-column'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_column()),
                );
              },
            ),
            // ignore: deprecated_member_use
            TextButton(
              child: Text('03-row'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_aaa()),
                );
              },
            ),
            TextButton(
              child: Text('04-color-width'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_color()),
                );
              },
            ),
            TextButton(
              child: Text('05-margin_padding'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_margin()),
                );
              },
            ),
            TextButton(
              child: Text('06-border'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_border()),
                );
              },
            ),
            TextButton(
              child: Text('07-image'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_image()),
                );
              },
            ),
            TextButton(
              child: Text('08-image2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_image2()),
                );
              },
            ),
            TextButton(
              child: Text('09-margin2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_margin2()),
                );
              },
            ),
            TextButton(
              child: Text('10-button'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_button()),
                );
              },
            ),
            TextButton(
              child: Text('11-list'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_list()),
                );
              },
            ),
            TextButton(
              child: Text('12-countup'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_countup()),
                );
              },
            ),
            TextButton(
              child: Text('13-link'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage_link()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  NextPage_row newMethod() => NextPage_row();
}

// ignore: camel_case_types
class NextPage_row {}
