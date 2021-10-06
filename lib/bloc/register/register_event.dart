part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitEvent extends RegisterEvent {
  final String name, username, password;

  const RegisterSubmitEvent({
    @required this.name,
    @required this.username,
    @required this.password,
  });
}
