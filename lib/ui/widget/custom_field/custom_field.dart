import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:morningstar_library/core/helper/helper.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

part 'text_field.dart';
part 'dropdown_field.dart';
// part 'number_field.dart';
// part 'phone_field.dart';
// part 'date_field.dart';

OutlineInputBorder outlineInputPrimary = OutlineInputBorder(
  borderSide: BorderSide(color: kPrimaryColor),
  borderRadius: BorderRadius.circular(10),
);

InputDecoration inputDecoration(hint, {bool borderAll = false, Color? color}) =>
    InputDecoration(
      filled: true,
      fillColor: kWhiteColor,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: outlineInputPrimary,
      hintText: hint,
      focusedBorder: outlineInputPrimary.copyWith(
          borderSide: BorderSide(color: color ?? kPrimaryColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: TW3Colors.neutral.shade300)),
      isDense: true,
      hintStyle: kSubtitleTextStyle.copyWith(
        fontSize: 14,
        overflow: TextOverflow.visible,
      ),
    );
