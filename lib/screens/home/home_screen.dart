import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doctune_final/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_doctune_final/components/rounded_button.dart';
import 'package:flutter_doctune_final/constants.dart';
import 'package:flutter_doctune_final/models/user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_doctune_final/config/config.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String str = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLogOutState) {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(
                  15.0,
                  110.0,
                  0.0,
                  0.0,
                ),
                child: const Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 0.0, 0.0),
                child: Text(
                  '${widget.user.name},',
                  style: const TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RoundedButton(
                press: () async {
                  final position = await Config().determinePosition();

                  setState(() {
                    str =
                        'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
                  });
                },
                text: 'Get Location',
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                str,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<AuthenticationBloc>().add(
                  AuthenticationLogOutEvent(),
                );
          },
          label: const Text('Log Out'),
        ),
      ),
    );
  }
}
