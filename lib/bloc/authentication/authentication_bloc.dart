import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctune_final/database/database_helper.dart';
import 'package:flutter_doctune_final/models/user.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final dbHelper = DatabaseHelper.instance;

  AuthenticationBloc(AuthenticationState initialState) : super(initialState);

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    yield AuthenticationLoadingState();

    if (event is AuthenticationSubmitEvent) 
    {
      print(event.username);
      print(event.password);

      User user = await getUser(
        username: event.username,
        password: event.password,
      );

      if (user.username.isEmpty) {
        yield AuthenticationFailState();
      } else {
        yield AuthenticationSuccessState(user: user);
      }
    }

    if (event is AuthenticationLogOutEvent) {
      yield AuthenticationLogOutState();
    }
  }

  Future<User> getUser({
    @required String username,
    @required String password,
  }) async {
    // row to insert
    //final id =
    User user = await dbHelper.getUser(username, password);
    return user;
    //print('inserted row id: $id');
  }
}
