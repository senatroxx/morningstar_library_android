part of '../page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final form = FormGroup({
    ...CustomFormControl.email,
    ...CustomFormControl.password,
  });

  String get email => form.control(FormName.email).value;
  String get password => form.control(FormName.password).value;

  @override
  void initState() {
    super.initState();
    hideLoad(context);
    form.reset();
  }

  void _login() {
    form.markAllAsTouched();
    if (form.valid) {
      log("email: $email, password: $password");
      FocusScope.of(context).unfocus();
      context.read<AuthenticationCubit>().login(
            email: email.trim(),
            password: password.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoadDialog) {
          return showLoad(context);
        } else {
          hideLoad(context);
        }

        if (state is AuthenticationLoggedIn) {
          Modular.to.navigate(Routes.home);
        }

        if (state is AuthenticationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: kDangerColor,
            ),
          );
        }
      },
      child: MyScaffold(
        showAppBar: false,
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 79,
              ),
              const Image(
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
                formName: FormName.email,
                icon: Icon(Icons.email),
              ),
              const CustomTextField(
                "Password",
                formName: FormName.password,
                hideText: true,
                icon: Icon(Icons.lock),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonPrimary(
                title: "Login",
                fullWidth: true,
                callbackfunc: () {
                  _login();
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
        ),
      ),
    );
  }
}
