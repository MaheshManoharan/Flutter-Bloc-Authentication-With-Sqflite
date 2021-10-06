import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctune_final/constants.dart';
import 'package:flutter_doctune_final/screens/welcome/welcome_screen.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/register/register_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(
            RegisterInitial(),
          ),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            AuthenticationInitial(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Doctune App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
