part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoadAuthenticationEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String confirmPassword;

  const AuthRegisterEvent(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.lastName,
      required this.firstName});

  @override
  List<Object> get props =>
      [email, password, confirmPassword, lastName, firstName];
}

class AuthLogoutEvent extends AuthEvent {}
