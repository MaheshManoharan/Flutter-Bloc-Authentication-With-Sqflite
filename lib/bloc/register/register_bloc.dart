import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctune_final/database/database_helper.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
// reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  RegisterBloc(RegisterState initialState) : super(initialState);

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield RegisterLoading();
    if (event is RegisterSubmitEvent) {
      bool userExists = await dbHelper.userExists(event.username);

      if (userExists) {
        yield RegisterUserExists();
      }

      if (!userExists) {
        int id = await _insert(
          name: event.name,
          username: event.username,
          password: event.password,
        );

        if (id != 0) {
          yield RegisterSuccess();
        }
      }
    }
  }

  Future<int> _insert({
    @required String name,
    @required String username,
    @required String password,
  }) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnUserName: username,
      DatabaseHelper.columnPassWord: password,
    };
    final id = await dbHelper.insert(row);

    print('inserted row id: $id');
    return id;
  }
}
