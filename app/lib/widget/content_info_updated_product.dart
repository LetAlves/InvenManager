import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/widget/custom_card.dart';
import 'package:invenmanager/widget/custom_sized_box.dart';

class ContentInfoUpdatedProduct extends StatelessWidget {
  const ContentInfoUpdatedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      content: Center(
        child: Column(
          children: [
            Text(
              'Estoque Atualizado',
              style:
                  AppTextStyle.cardHeaderText.copyWith(color: AppColor.white),
            ),
            Text(
              '03 de Novembro de 2024, as 01:36',
              style: AppTextStyle.smallText.copyWith(color: AppColor.gray_200),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'De:',
                  style:
                      AppTextStyle.smallText.copyWith(color: AppColor.gray_200),
                ),
                const SizedBox(width: 10),

                const CustomSizedBox(
                    value: '10'), // Aqui vai receber o valor antigo de estoque
                const SizedBox(width: 30),
                Text(
                  'Para:',
                  style:
                      AppTextStyle.smallText.copyWith(color: AppColor.gray_200),
                ),
                const SizedBox(width: 10),
                const CustomSizedBox(
                    value: '50'), // Aqui vai receber o novo valor de estoque
              ],
            )
          ],
        ),
      ),
    );
  }
}
