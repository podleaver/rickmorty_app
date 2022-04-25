import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rickmorty_app/char_cards.dart';
import 'package:rickmorty_app/data_from_api.dart';

import 'data_model.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  MyMainPageState createState() => MyMainPageState();
}

class MyMainPageState extends State<MyMainPage> {
  static late Future<List<Results>> future;
  static late ScrollController controller;
  String rick = 'assets/images/rickandmorty.svg';
  String morty = 'assets/images/morty.svg';
  String logo = 'assets/images/logo.svg';
  String solar = 'assets/images/solar.svg';

  @override
  void initState() {
    future = DataFromRickMortyState.getData();
    controller = ScrollController();

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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Align(
                        child: SvgPicture.asset(
                          logo,
                          color: Colors.white,
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Align(
                        child: SvgPicture.asset(
                          solar,
                          color: Colors.white,
                        ),
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        rick,
                        color: Color(0xFF181818),
                      ),
                    ),
                      Text(
                        'The Rick and Morty App',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 428,
            height: MediaQuery.of(context).size.height * .65,
            color: const Color(0xff21222a),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12, left: 21, right: 21, bottom: 12),
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
