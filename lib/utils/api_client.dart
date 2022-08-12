import 'package:dio/dio.dart';
import 'package:quizz_app/models/answers.dart';
import 'package:quizz_app/models/question.dart';
import 'package:quizz_app/models/user_profile.dart';

Future<void> main() async {
  // UserProfile responseData;
  // responseData = await Api().getById(33);
  // print(responseData.toJson());

  // List<Question> responseData = await Api().getQuestion("computerScience");
  // responseData.forEach((element) {
  //   print(element.toJson());
  // });
  // var json = {
  //   "uid": 31,
  //   "answer1": "Cherry MX Blue",
  //   "answer2": "ALU",
  //   "answer3": "Shamir",
  //   "answer4": "IMKO-1",
  //   "answer5": "Routing Information Protocol",
  //   "answer6": "1024",
  //   "answer7": "Local Area Network",
  //   "answer8": "Musical Instrument Digital Interface",
  //   "answer9": "Redundant Array of Independent Disks",
  //   "answer10": "Overloading"
  // };

  // Answers answer = Answers.fromJson(json);
  // Api().postAnswers(answer, "computerScience");
}

class Api {
  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  final dio = createDio();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: "http://localhost:3000/quiz/",
        receiveTimeout: 10000,
        connectTimeout: 10000,
        sendTimeout: 10000));

    dio.interceptors.addAll({
      AppInterceptor(dio),
    });
    return dio;
  }
}

class AppInterceptor extends Interceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet or server offline, please try again.';
  }
}
