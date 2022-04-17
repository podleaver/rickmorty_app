import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_model.dart';

class DataFromRickMortyState {
  static List<DataModel> model = [];

  static Future<List<DataModel>?> getData() async {
    print(1);
    print(model);
    var url = Uri.parse('https://rickandmortyapi.com/api/character/1,3,2,5,6');
    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    model.clear();
    for (var p in data) {
      print('a');
      var dataModel = DataModel.fromJson(p);
      if (!model.contains(dataModel)) {
        model.add(dataModel);
      }
    }
    print(model.length);
    for (var k in model) {
      print(k.name);
    }
    return model;
  }
}
