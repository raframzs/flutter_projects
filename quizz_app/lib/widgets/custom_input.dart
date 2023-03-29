import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool? obscureText;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    super.key,
    this.hintText,
    this.helperText,
    this.labelText,
    this.icon,
    this.textInputType,
    this.obscureText,
    required this.formProperty,
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      initialValue: '',
      obscureText: obscureText ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) return "Field is Required";
        return value.length < 3 ? "Min lenght is 3" : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          hintText: hintText ?? 'Enter a value',
          helperText: helperText ?? '',
          labelText: labelText ?? ''),
    );
  }
}
