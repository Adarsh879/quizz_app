import 'package:json_annotation/json_annotation.dart';
part 'answers.g.dart';

@JsonSerializable()
class Answers {
  int uid;

  String? answer1;

  String? answer2;

  String? answer3;

  String? answer4;

  String? answer5;

  String? answer6;

  String? answer7;

  String? answer8;

  String? answer9;

  String? answer10;

  Answers(this.uid);

  factory Answers.fromJson(Map<String, dynamic> json) =>
      _$AnswersFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersToJson(this);

  @override
  String toString() {
    var message = toJson();
    return message.toString();
  }

  void setAnswer(int index, String answer) {
    switch (index) {
      case 1:
        answer1 = answer;
        break;
      case 2:
        answer2 = answer;
        break;
      case 3:
        answer3 = answer;
        break;
      case 4:
        answer4 = answer;
        break;
      case 5:
        answer5 = answer;
        break;
      case 6:
        answer6 = answer;
        break;
      case 7:
        answer7 = answer;
        break;
      case 8:
        answer8 = answer;
        break;
      case 9:
        answer9 = answer;
        break;
      case 10:
        answer10 = answer;
        break;
      default:
        throw Exception("Index out of bound");
    }
  }
}
