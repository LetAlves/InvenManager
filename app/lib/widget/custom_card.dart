import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class CustomCard extends StatelessWidget {
  final Widget content;
  final bool? isErrorStyle;

  const CustomCard({Key? key, required this.content, this.isErrorStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColor.gray_750,
            borderRadius: BorderRadius.circular(4.0),
            border: Border(
              bottom: BorderSide(
                  color:
                      isErrorStyle == true ? AppColor.red_500 : AppColor.yellow,
                  width: 2.0),
            ),
          ),
          child: content,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
