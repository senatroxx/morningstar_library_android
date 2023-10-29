part of '../page.dart';

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
            Text("Sign Up", style: kHeadline1TextStyle),
            Text(
              "Access to your account",
              style: kBaseTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 90,
            ),
            const CustomTextField(
              "Email",
              formName: "formName",
              icon: Icon(Icons.email),
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
