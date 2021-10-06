part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationSubmitEvent extends AuthenticationEvent {
  final String username, password;

  const AuthenticationSubmitEvent({@required this.username, @required this.password});
}

class AuthenticationLogOutEvent extends AuthenticationEvent {}
