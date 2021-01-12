/** Represents a possible answer
 */
class Choice {
  Choice(
      this.text,
      this.score
      );

  String text;
  int score;

  Map<String, Object> get asJson {
    return {
      'text': text,
      'score': score
    };
  }

  static Choice fromJson(Map<String, dynamic> json) {
    return Choice(
        json['text'],
        json['score']);
  }
}


class Kinds {
  static const String Text = "text";
  static const String Paragraph = "paragraph";
  static const String MultipleChoice = "multiple choice";
  static const String Checkbox = "checkbox";
  static const String Slider = "slider";
  static List<String> list() {
    return [Text, Paragraph, MultipleChoice, Checkbox, Slider];
  }
}
class Question {
  Question(
      this.text,
      this.values,
      this.kind,
      this.required,
      this.weight,
      this.labels
      );

  String text;
  List<Choice> values = [];
  String kind;
  bool required;
  double weight;
  Map<String, String> labels = {};

  Map<String, Object> get asJson {
    return {
      'text': text,
      'values': values,
      'kind': kind,
      'required': required,
      'weight': weight,
      'labels': labels
    };
  }

  static Question empty() {
    return Question(
        "",
        [],
        Kinds.Text,
        false,
        0,
        {});
  }
  static Question fromJson(Map<String, dynamic> json) {
    return Question(
        json['text'],
        json['values'],
        json['kind'],
        json['required'],
        json['weight'],
        json['labels']
    );
  }
}

class Form {
  Form(
      this.questions,
      this.text,
      this.values,
      this.kind,
      this.required,
      this.weight,
      this.score
      );

  List<Question> questions = [];
  String text;
  List<Choice> values = [];
  String kind;
  bool required;
  double weight;
  int score;

  Map<String, Object> get asJson {
    return {
      'questions': questions,
      'text': text,
      'values': values,
      'kind': kind,
      'required': required,
      'weight': weight,
      'score': score
    };
  }

  static Form fromJson(Map<String, dynamic> json) {
    return Form(
        json['questions'],
        json['text'],
        json['values'],
        json['kind'],
        json['required'],
        json['weight'],
        json['score']);
  }
}
