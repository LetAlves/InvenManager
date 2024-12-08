import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  final bool? enabled;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.helperText,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)));

  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              _helperText = null;
            });
          } else if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        controller: widget.controller,
        validator: widget.validator,
        style: widget.enabled!
            ? AppTextStyle.inputText.copyWith(color: AppColor.white)
            : AppTextStyle.inputText.copyWith(color: AppColor.gray_300),
        cursorColor: AppColor.yellow,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        obscureText: widget.obscureText ?? false,
        maxLength: widget.maxLength,
        enabled: widget.enabled,
        decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 3,
          suffixIcon: widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.label,
          labelStyle: const TextStyle(color: AppColor.gray_200),
          filled: true,
          fillColor: AppColor.gray_750,
          hintText: widget.hintText,
          hintStyle: AppTextStyle.hintText.copyWith(color: AppColor.gray_250),
          border: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.gray_600)),
          enabledBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.gray_600)),
          focusedBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.gray_250)),
          errorStyle: const TextStyle(color: AppColor.red),
          errorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.red)),
          focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.red)),
        ),
      ),
    );
  }
}
