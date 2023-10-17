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
  // final void Function(FormControl<dynamic>)? onTap;
  final void Function()? onTap;
  final bool borderAll;
  final String? initialValue;

  const CustomTextField(this.title,
      {Key? key,
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
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: kSmallTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          // height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: kWhiteColor,
          ),
          alignment: Alignment.center,
          child: TextFormField(
            // formControlName: formName,
            // validationMessages: (control) => {
            //   ValidationMessage.required: 'Tidak boleh kosong',
            //   ValidationMessage.email: 'Format email tidak valid',
            //   ValidationMessage.mustMatch: 'Password tidak sama',
            //   ValidationMessage.minLength: 'Minimal 8 karakter'
            // },
            initialValue: initialValue,
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
            decoration: inputDecoration(hint, borderAll: borderAll).copyWith(
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
      ],
    );
  }
}
