class ListNextEvolution {
  final List<ListNextEvolution> next;
  ListNextEvolution(this.next);
}


class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  factory NextEvolution.fromJson(Map<String, dynamic> json) {
    if(json == null){
      return NextEvolution();
    }
    return NextEvolution(
      num: json['num'] ,
      name: json['name'] ?? ""
    );
  }

  factory NextEvolution.fromMap(Map<String,dynamic> map){
    return NextEvolution(
      num:                 map['num'],
      name:                map['name'] ?? ""
    );
  }
}
