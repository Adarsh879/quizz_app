part of 'user_profile_cubit.dart';

class UserProfileState extends Equatable {
  const UserProfileState._(this.profile);

  UserProfileState.initial()
      : this._(UserProfile(
            mathsScore: 0, computerScienceScore: 0, generalKnowledgeScore: 0));

  UserProfileState.set(UserProfile profile) : this._(profile);

  final UserProfile profile;
  @override
  List<Object> get props => [profile];
}
