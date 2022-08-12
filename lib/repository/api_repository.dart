import 'package:quizz_app/models/answers.dart';
import 'package:quizz_app/models/question.dart';
import 'package:quizz_app/models/user_profile.dart';
import 'package:quizz_app/utils/api_client.dart';

class ApiRespository {
  final dio = Api().dio;

  Future<UserProfile> getById(String id) async {
    print(id);
    var response = await dio.get('/:${id}');
    return UserProfile.fromJson(response.data);
  }

  Future<List<Question>> getQuestion(String subject) async {
    var response = await dio.get('question/:${subject}');
    List<Question> questionList = response.data
        .map<Question>((question) => Question.fromJson(question))
        .toList();
    return questionList;
  }

  Future<void> postAnswers(Answers answers, String subject) async {
    var response =
        await dio.post('question/evaluate/:${subject}', data: answers.toJson());
    print(response.data);
  }
}
