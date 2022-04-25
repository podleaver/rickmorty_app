import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_model.dart';

class DataFromRickMortyState {
  static int page = 0;
  static List<Results> model = [];
  static Future<List<Results>> getData() async {
    page++;
    print(1);
    print(model);
    var url = Uri.parse('https://rickandmortyapi.com/api/character/?page=$page');
    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    print(data['info']['next']);
    print(data['results'][1]['name']);
    for(var p in data['results']){
      print('a');
      var dataModel = Results.fromJson(p);
      if (!model.contains(dataModel)){model.add(dataModel);}
    }

    return model;
  }
 static Future<List<Results>> updateGrid() async{
    page++;
    var url = Uri.parse('https://rickandmortyapi.com/api/character/?page = $page');
    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    for(var p in data['results']){
      print('b');
      var dataModel = Results.fromJson(p);
      if (!model.contains(dataModel)){model.add(dataModel);}
    }
    return model;
  }
}
