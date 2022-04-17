import 'package:flutter/material.dart';
import 'package:rickmorty_app/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyMainPage(),
    );
  }
}


/*
* Container(
height: MediaQuery.of(context).size.height * .33,
width: MediaQuery.of(context).size.width * 45,
decoration: BoxDecoration(
color: Color(0xff3c3e43),
),
//height: *.33,
//width: *.45,
);
* */
