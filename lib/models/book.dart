class Book {
  int? id;
  String? title;
  int? level;
  String? authorName;

  Book({this.id, this.title, this.level, this.authorName});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    level = json['level'];
    authorName = json['author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['level'] = level;
    data['author_name'] = authorName;
    return data;
  }
}
