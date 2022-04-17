import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty_app/char_cards.dart';
import 'package:rickmorty_app/data_from_api.dart';
class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  MyMainPageState createState() => MyMainPageState();
}

class MyMainPageState extends State<MyMainPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(9);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * .35,
            color: Colors.black,
          ),
          Container(
            width: 428,
            height: MediaQuery.of(context).size.height * .65,
            color: const Color(0xff21222a),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12, left: 21, right: 21, bottom: 12),
                  child: Container(
                    child: TextFormField(),
                    width: 386,
                    height: 52,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                CharacterBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



