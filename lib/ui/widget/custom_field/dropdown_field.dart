part of 'custom_field.dart';

class CustomDropdownField extends StatelessWidget {
  final String? hint;
  final String title;
  final String formName;
  final String? Function(String? v)? validator;
  // final void Function(FormControl<dynamic>)? onTap;
  final void Function()? onTap;
  final String? initialValue;

  const CustomDropdownField(
    this.title, {
    super.key,
    this.hint,
    required this.formName,
    this.validator,
    this.onTap,
    this.initialValue,
  });

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
        DropdownButtonFormField(
          decoration: inputDecoration(hint),
          isDense: true,
          onChanged: (value) {},
          items: ["Male", "Female"]
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value, // add this property an pass the _value to it
                  child: Text(
                    value,
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
