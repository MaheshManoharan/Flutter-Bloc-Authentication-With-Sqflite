import 'package:flutter/material.dart';
import 'package:flutter_doctune_final/bloc/register/register_bloc.dart';
import 'package:flutter_doctune_final/components/already_have_account.dart';
import 'package:flutter_doctune_final/components/rounded_button.dart';
import 'package:flutter_doctune_final/components/rounded_input_field.dart';
import 'package:flutter_doctune_final/components/rounded_name_field.dart';
import 'package:flutter_doctune_final/components/rounded_password_field.dart';
import 'package:flutter_doctune_final/screens/login/login_screen.dart';
import 'package:flutter_doctune_final/screens/register/components/or_divider.dart';
import 'package:flutter_doctune_final/screens/register/components/social_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';

import 'background.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController nameController = TextEditingController();

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
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.25,
              ),
              RoundedNameField(
                hintText: "Your Name",
                textEditingController: nameController,
                vaildator: (value) {
                  if (value.length < 4) {
                    return 'Name should be more than 4 characters';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Username",
                textEditingController: usernameController,
                validator: (value) {
                  if (value.length < 4) {
                    return 'Username should be more than 4 characters';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                textEditingController: passwordController,
                validator: (value) {
                  if (value.length < 4) {
                    return 'Password should be more than 4 characters';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  if (_formKey.currentState.validate()) {
                    context.read<RegisterBloc>().add(
                          RegisterSubmitEvent(
                            name: nameController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
