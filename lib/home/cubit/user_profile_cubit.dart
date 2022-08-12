import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizz_app/models/user.dart';
import 'package:quizz_app/models/user_profile.dart';
import 'package:quizz_app/repository/api_repository.dart';
import 'package:quizz_app/repository/authentication_repository.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit({required ApiRespository apiRepository, required User user})
      : _apiRepository = apiRepository,
        _user = user,
        super(UserProfileState.initial()) {
    getProfile();
  }

  final ApiRespository _apiRepository;

  final User _user;

  Future<void> getProfile() async {
    final id = _user.name;
    final userProfile = await _apiRepository.getById(id!);
    emit(UserProfileState.set(userProfile));
  }
}
