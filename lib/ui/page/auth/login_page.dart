import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:morningstar_library/routes/routes.dart';
import 'package:morningstar_library/ui/widget/button/button.dart';
import 'package:morningstar_library/ui/widget/custom_field/custom_field.dart';
import 'package:morningstar_library/ui/widget/layouts/layouts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      showAppBar: false,
      showBottomNav: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 79,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withAlpha(76)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Image(
                  image: AssetImage('assets/images/logo-only.png'),
                  width: 85,
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Text("Login", style: kHeadline1TextStyle),
            Text(
              "Login an account to get started",
              style: kBaseTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 90,
            ),
            const CustomTextField(
              "Full Name",
              formName: "formName",
              icon: Icon(Icons.person),
            ),
            const CustomTextField(
              "Password",
              formName: "formName",
              icon: Icon(Icons.lock),
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonPrimary(
              title: "Login",
              callbackfunc: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: kSubtitleTextStyle,
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed(Routes.register);
                  },
                  child: Text(
                    "Sign Up",
                    style: kSubtitleTextStyle.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}