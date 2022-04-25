import 'package:flutter/material.dart';
import 'package:rickmorty_app/main_screen.dart';
import 'data_from_api.dart';


class CharacterBox extends StatefulWidget {
  const CharacterBox({Key? key}) : super(key: key);

  @override
  State<CharacterBox> createState() => _CharacterBoxState();
}

class _CharacterBoxState extends State<CharacterBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List>(
          future: DataFromRickMortyState.getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: NotificationListener(
                  onNotification: (notification) {
                    if (MyMainPageState.controller.offset >=
                            MyMainPageState
                                    .controller.position.maxScrollExtent -
                                MediaQuery.of(context).size.height * .3 &&
                        !MyMainPageState.controller.position.outOfRange) {
                      print('123');
                      if (snapshot.connectionState == ConnectionState.done) {
                        setState(() {});
                      }
                    }
                    return true;
                  },
                  child: GridView.builder(
                    controller: MyMainPageState.controller,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    scrollDirection: Axis.vertical,
                    itemCount: DataFromRickMortyState.model.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 21,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Image.network(
                                    snapshot.data![index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 4,
                                  bottom: 3,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 155,
                                        child: Text(
                                          snapshot.data![index].name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Play',
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor:
                                        snapshot.data![index].status == 'Alive'
                                            ? Colors.green
                                            : Colors.red,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.data![index].status +
                                          ' - ' +
                                          snapshot.data![index].species,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Play'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          color: const Color(0xff3c3e43),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          }),
    );
  }
}
