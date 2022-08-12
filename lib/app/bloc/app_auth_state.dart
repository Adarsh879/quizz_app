part of 'app_auth_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppAuthState extends Equatable {
  const AppAuthState._({
    required this.status,
    this.user = User.empty,
  });

  const AppAuthState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppAuthState.unauthenticated()
      : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
