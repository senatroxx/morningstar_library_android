part of '../page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      showAppBar: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 79,
          ),
          Image(
            image: AssetImage('assets/images/logo-only.png'),
            width: 85,
          ),
          const SizedBox(
            height: 55,
          ),
          Text("Sign In", style: kHeadline1TextStyle),
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
            fullWidth: true,
            callbackfunc: () {
              Modular.to.pushNamed(Routes.home);
            },
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
    );
  }
}
