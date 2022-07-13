part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthRun extends AuthEvent {
  final String login;
  final String password;

  const AuthRun({
    required this.login,
    required this.password,
  });

  @override
  List<Object?> get props => [login, password];
}

class AuthLogOut extends AuthEvent {}