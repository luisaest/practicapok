class ListRover {
  final List<ListRover> rover;

  ListRover(this.rover);
}


class Rover {
  int? id;
  String? name;
  String? landingDate;
  String? launchDate;
  String? status;

  Rover({this.id, this.name, this.landingDate, this.launchDate, this.status});

  factory Rover.fromJson(Map<String, dynamic> json) {
    if(json == null){
      return Rover();
    }
    return Rover(
      id: json['id'],
      name: json['name']  ?? "",
      landingDate: json['landing_date'] ?? "",
      launchDate: json['launch_date'] ?? "",
      status: json['status'] ?? ""
    );
  }

  factory Rover.fromMap(Map<String,dynamic> map){
    return Rover(
      id:                 map['id'],
      name:                map['name'] ?? "",
      landingDate:             map['landing_date'] ?? "",
      launchDate:             map['launch_date'] ?? "",
    );
  }
  
}