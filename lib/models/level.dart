class Level {
  int? id;
  String? name;
  String? title;

  Level({this.id, this.name, this.title});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    return data;
  }
}