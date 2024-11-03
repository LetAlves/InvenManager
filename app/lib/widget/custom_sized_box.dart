import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class CustomSizedBox extends StatelessWidget {
  final String value;

  const CustomSizedBox({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.gray_900,
          hintText: value,
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
