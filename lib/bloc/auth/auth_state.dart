part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final Object? error;

  const AuthError({this.error});

  @override
  List<Object?> get props => [error];
}

class AuthSuccessLogin extends AuthState {}

class AuthUnSuccessLogin extends AuthState {}

class AuthLogOutSuccess extends AuthState {}