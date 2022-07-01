class Level {
  int? id;
  String? title;
  String? name;
  List<Quizzes>? quizzes;

  Level({this.id, this.title, this.name, this.quizzes});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    if (json['quizzes'] != null) {
      quizzes = <Quizzes>[];
      json['quizzes'].forEach((v) {
        quizzes!.add( Quizzes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['name'] = name;
    if (quizzes != null) {
      data['quizzes'] = quizzes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quizzes {
  String? question;
  String? p1;
  String? p2;
  String? p3;
  String? p4;
  String? answer;

  Quizzes({this.question, this.p1, this.p2, this.p3, this.p4, this.answer});

  Quizzes.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    p1 = json['p1'];
    p2 = json['p2'];
    p3 = json['p3'];
    p4 = json['p4'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['p1'] = p1;
    data['p2'] = p2;
    data['p3'] = p3;
    data['p4'] = p4;
    data['answer'] = answer;
    return data;
  }
}