part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final bool isAuth;

  const SuccessAuthState(this.isAuth);
}

class ErrorAuthState extends AuthState {
  final String message;

  const ErrorAuthState(this.message);
}
