part of 'helper.dart';

class FormName {
  static const String email = "email";
  static const String name = "name";
  static const String phone = "phone";
  static const String password = "password";
  static const String passwordConfirmation = "password_confirmation";
  // static const String otp = "otp";
  // static const String notes = "notes";
  // static const String seats = "seats";
  // static const String number = "number";
}

class CustomFormControl {
  static Map<String, AbstractControl<dynamic>> email = {
    FormName.email: FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ])
  };

  static Map<String, AbstractControl<dynamic>> name = {
    FormName.name: FormControl<String>(validators: [Validators.required])
  };

  static Map<String, AbstractControl<dynamic>> phone = {
    FormName.phone: FormControl<String>(
        validators: [Validators.required, Validators.number])
  };

  static Map<String, AbstractControl<dynamic>> password = {
    FormName.password: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
      ],
    )
  };

  static Map<String, AbstractControl<dynamic>> passwordConfirmation = {
    FormName.passwordConfirmation: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  };

  // static Map<String, AbstractControl<dynamic>> otp = {
  //   FormName.otp: FormControl<String>(validators: [
  //     Validators.required,
  //     Validators.minLength(6),
  //   ])
  // };
}
