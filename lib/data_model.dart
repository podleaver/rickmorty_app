class DataModel {
  int? id;
  String? name;
  String? status;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;

  DataModel({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    type = json['type'];
    gender = json['gender'];
    origin = Origin.fromJson(json['origin']);
    location = Location.fromJson(json['location']);
    image = json['image'];

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
