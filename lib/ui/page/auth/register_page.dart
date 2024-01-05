part of '../page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final form = FormGroup({
    ...CustomFormControl.email,
    ...CustomFormControl.name,
    ...CustomFormControl.phone,
    ...CustomFormControl.password,
    ...CustomFormControl.passwordConfirmation,
  }, validators: [
    Validators.mustMatch(FormName.password, FormName.passwordConfirmation)
  ]);

  String get email => form.control(FormName.email).value;
  String get name => form.control(FormName.name).value;
  String get phone => form.control(FormName.phone).value;
  String get password => form.control(FormName.password).value;
  String get passwordConfirmation =>
      form.control(FormName.passwordConfirmation).value;

  late RequestRegister data;

  @override
  void initState() {
    super.initState();
    form.reset();
  }

  void _register() {
    form.markAllAsTouched();
    if (form.valid) {
      FocusScope.of(context).unfocus();
      data = RequestRegister(
          email: email.trim(),
          name: name.trim(),
          phone: phone.trim(),
          password: password.trim(),
          passwordConfirmation: passwordConfirmation.trim());
      context.read<AuthenticationCubit>().register(data: data);
    }
  }

  Widget _form() {
    return ReactiveForm(
      formGroup: form,
      child: const Column(
        children: [
          CustomTextField(
            "Full Name",
            formName: FormName.name,
            icon: Icon(Icons.person),
          ),
          CustomTextField(
            "Email",
            formName: FormName.email,
            icon: Icon(Icons.email),
          ),
          CustomTextField(
            "Phone Number (0812XXXX)",
            formName: FormName.phone,
            icon: Icon(Icons.phone),
          ),
          CustomTextField(
            "Password",
            formName: FormName.password,
            hideText: true,
            icon: Icon(Icons.lock),
          ),
          CustomTextField(
            "Repeat Password",
            formName: FormName.passwordConfirmation,
            hideText: true,
            icon: Icon(Icons.lock),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) async {
        if (state is AuthenticationLoadDialog) {
          return showLoad(context);
        } else {
          hideLoad(context);
        }

        if (state is AuthenticationFailure) {
          return Future.delayed(Duration.zero, () {
            return SnackBar(content: Text(state.error));
          });
        }

        if (state is AuthenticationHasRegistered) {
          Modular.to.navigate(Routes.login);
        }
      },
      child: MyScaffold(
        showAppBar: false,
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
              "Create an account to get started",
              style: kBaseTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 90,
            ),
            _form(),
            const SizedBox(
              height: 50,
            ),
            ButtonPrimary(
              title: "Sign Up",
              callbackfunc: () {
                _register();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: kSubtitleTextStyle,
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed(Routes.login);
                  },
                  child: Text(
                    "Sign In",
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
