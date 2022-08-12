part of 'app_auth_bloc.dart';

abstract class AppAuthEvent extends Equatable {
  const AppAuthEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppAuthEvent {}

class AppUserChanged extends AppAuthEvent {
  @visibleForTesting
  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
