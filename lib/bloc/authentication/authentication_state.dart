part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  final User user;

  AuthenticationSuccessState({@required this.user});
}

class AuthenticationFailState extends AuthenticationState {}

class AuthenticationLogOutState extends AuthenticationState {}
