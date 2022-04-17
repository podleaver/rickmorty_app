import 'package:flutter/material.dart';
import 'data_from_api.dart';
import 'data_model.dart';

class CharacterBox extends StatelessWidget {
  CharacterBox({Key? key}) : super(key: key);

  Future<List?> data = DataFromRickMortyState.getData();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List?>(
        future: data,
        builder: (context, snapshot) {
          print(8);
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else{
          return GridView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              scrollDirection: Axis.vertical,
              itemCount: DataFromRickMortyState.model.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 21,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text(
                        snapshot.data![index].name,
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xff3c3e43),
                  ),
                );
              });
        }}
      ),
    );
  }
}
