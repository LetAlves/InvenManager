import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/widget/custom_button.dart';

Future<void> CustomBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColor.gray_750,
          border: Border.all(color: AppColor.red),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Ops. Algo deu errado.',
                  style: AppTextStyle.cardHeaderText
                      .copyWith(color: AppColor.red)),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                label: "Tentar novamente",
                backgroundColor: AppColor.red,
                labelColor: AppColor.white,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      );
    },
  );
}
