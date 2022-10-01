part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class NameAuthEvent extends AuthEvent {
  final String name;

  const NameAuthEvent(this.name);
}
