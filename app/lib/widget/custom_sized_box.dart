import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class CustomSizedBox extends StatefulWidget {
  final String value;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? enabled;

  const CustomSizedBox(
      {Key? key,
      required this.value,
      this.controller,
      this.validator,
      this.enabled = true})
      : super(key: key);

  @override
  State<CustomSizedBox> createState() => _CustomSizedBoxState();
}

class _CustomSizedBoxState extends State<CustomSizedBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        enabled: widget.enabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.gray_900,
          hintText: widget.value,
          hintStyle: const TextStyle(color: AppColor.gray_250),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: AppColor.gray_600),
          ),
        ),
        style: const TextStyle(color: AppColor.white),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
      ),
    );
  }
}
