import 'package:flutter/material.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const PasswordFormField({
    Key? key,
    this.controller,
    required this.label,
    required this.hintText,
    this.validator,
    this.helperText,
  }) : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validator,
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      helperText: widget.helperText,
      //maxLength: 25,
      obscureText: isHidden,
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        borderRadius: BorderRadius.circular(23.0),
        child: Icon(isHidden == true ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
