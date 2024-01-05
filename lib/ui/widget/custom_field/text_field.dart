part of 'custom_field.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final String title;
  final String formName;
  final String? Function(String? v)? validator;
  final Widget? icon;
  final bool hideText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool readOnly;
  final bool showArrow;
  final void Function(FormControl<dynamic>)? onTap;
  // final void Function()? onTap;
  final bool borderAll;
  final String? initialValue;

  const CustomTextField(
    this.title, {
    Key? key,
    this.validator,
    required this.formName,
    this.initialValue,
    this.hint,
    this.onTap,
    this.hideText = false,
    this.textInputType = TextInputType.text,
    this.icon,
    this.showArrow = false,
    this.borderAll = false,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          // height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: kWhiteColor,
          ),
          alignment: Alignment.center,
          child: ReactiveTextField(
            formControlName: formName,
            validationMessages: {
              ValidationMessage.required: (Object error) =>
                  'Tidak boleh kosong',
              ValidationMessage.email: (Object error) =>
                  'Format email tidak valid',
              ValidationMessage.mustMatch: (Object error) =>
                  'Password tidak sama',
              ValidationMessage.minLength: (Object error) =>
                  'Minimal 8 karakter',
            },
            style: kSmallTextStyle,
            onTap: onTap,
            readOnly: readOnly,
            textInputAction: textInputAction,
            keyboardType: title.toLowerCase().contains("email")
                ? TextInputType.emailAddress
                : textInputType,
            obscureText: hideText,
            minLines: 1,
            maxLines: title.contains("Alamat Lengkap") ? 3 : 1,
            decoration: inputDecoration(title, borderAll: borderAll).copyWith(
              prefixIcon: icon,
              suffixIcon: showArrow
                  ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kSubtitleColor,
                      size: 18,
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
