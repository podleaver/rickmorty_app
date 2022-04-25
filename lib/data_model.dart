class Info{
int? count;
int? pages;
int? next;
int? prev;
Info({
  required this.count,
  required this.prev,
  this.next,
  this.pages,

});
Info.fromJson(Map<String, dynamic> json) {
  count = json['count'];
  pages = json['pages'];
  next = json['next'];
  prev = json['prev'];
}
}

class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;

  Results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = Origin.fromJson(json['origin']);
    location = Location.fromJson(json['location']);
    image = json['image'];

  }
}
class DataModel{
  late Info info ;
  late List <Results> results;

  DataModel({
    required  this.info,
    required this.results,
});
  DataModel.fromJson(Map<String, dynamic> json){
    info = json['info'];
    results = json['results'];

  }
}

class Origin {
  String? name;
  String? url;

  Origin.fromJson(Map jsonMap) {
    name = (jsonMap['name']);
    url = (jsonMap['url']);
  }
}

class Location {
  String? name;
  String? url;

  Location.fromJson(Map jsonMap) {
    name = (jsonMap['name']);
    url = (jsonMap['url']);
  }
}
