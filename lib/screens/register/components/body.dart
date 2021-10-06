import 'package:flutter/material.dart';
import 'package:flutter_doctune_final/components/already_have_account.dart';
import 'package:flutter_doctune_final/components/rounded_button.dart';
import 'package:flutter_doctune_final/components/rounded_input_field.dart';
import 'package:flutter_doctune_final/components/rounded_name_field.dart';
import 'package:flutter_doctune_final/components/rounded_password_field.dart';
import 'package:flutter_doctune_final/screens/register/components/or_divider.dart';
import 'package:flutter_doctune_final/screens/register/components/social_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'background.dart';

class Body extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Body({Key key}) : super(key: key);

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
                height: size.height * 0.35,
              ),
              RoundedNameField(
                hintText: "Your Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),

              // AlreadyHaveAnAccountCheck(
              //   login: false,
              //   press: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //        //   return LoginScreen();
              //         },
              //       ),
              //     );
              //   },
              // ),
              // OrDivider(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     SocalIcon(
              //       iconSrc: "assets/icons/facebook.svg",
              //       press: () {},
              //     ),
              //     SocalIcon(
              //       iconSrc: "assets/icons/twitter.svg",
              //       press: () {},
              //     ),
              //     SocalIcon(
              //       iconSrc: "assets/icons/google-plus.svg",
              //       press: () {},
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
