part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {}

class AuthUnauthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final Map<String, dynamic> errorList;

  const AuthErrorState({required this.errorList});

  @override
  List<Object> get props => [errorList];
}

class AuthAuthenticatingState extends AuthState {}
