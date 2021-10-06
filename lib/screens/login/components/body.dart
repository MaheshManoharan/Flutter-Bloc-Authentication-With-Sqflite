import 'package:flutter/material.dart';
import 'package:flutter_doctune_final/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_doctune_final/components/already_have_account.dart';
import 'package:flutter_doctune_final/components/rounded_button.dart';
import 'package:flutter_doctune_final/components/rounded_input_field.dart';
import 'package:flutter_doctune_final/components/rounded_password_field.dart';
import 'package:flutter_doctune_final/screens/login/components/background.dart';
import 'package:flutter_doctune_final/screens/register/register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                textEditingController: usernameController,
                hintText: "Username",
                onChanged: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Username should not be empty';
                  }
                  return null;
                },
                icon: Icons.person,
              ),
              RoundedPasswordField(
                textEditingController: passwordController,
                onChanged: (value) {},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password should not be empty';
                  }
                  return null;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  if (_formKey.currentState.validate()) {
                    print(passwordController.text);
                    context.read<AuthenticationBloc>().add(
                          AuthenticationSubmitEvent(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
