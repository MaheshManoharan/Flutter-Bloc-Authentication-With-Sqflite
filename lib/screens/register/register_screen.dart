import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctune_final/bloc/register/register_bloc.dart';
import 'package:flutter_doctune_final/screens/login/login_screen.dart';

import 'components/body.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterUserExists) {
              SnackBar snackBar = const SnackBar(
                content: Text('User already exists'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            if (state is RegisterSuccess) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
          },
          child: Body(),
        ),
      ),
    );
  }
}
