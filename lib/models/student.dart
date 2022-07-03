class Student {
  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  int? score;
  List<int>? level;
  List<int>? course;

  Student(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.score,
      this.level,
      this.course});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    score = json['score'];
    level = json['level'].cast<int>();
    course = json['course'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['score'] = score;
    data['level'] = level;
    data['course'] = course;
    return data;
  }
}
